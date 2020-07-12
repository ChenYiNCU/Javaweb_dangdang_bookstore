package action;

import model.Book;
import model.CartItem;
import util.DBLink;
import util.Pager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取请求路径
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		String uri = req.getRequestURI();
		// 判断是否是要跳转到购物车列表
		if (null == uri || !uri.contains("/cart")) {
			return;
		}
		try {
			if (uri.endsWith("listItem.do"))
			/* 展示购物车 */
			{
				String user =(String) req.getSession().getAttribute("sname");

				Pager<CartItem> pv = new Pager<CartItem>();


					// 计算数量和金额
					calTotalAmountAndMoney(req,user);
					String currentPage = req.getParameter("currentPage");
					if (currentPage == null) {
						currentPage = "1";
					}
					int i = Integer.parseInt(currentPage);

					// 获取购物车中有多少商品
					pv.setCountPa(getCartAmount(user));
					if (getCartAmount(user)==0)
					{
						i=0;
					}
					// 获取购物车中的总数量
					pv.setPa(5); // 每一页显示的几条数据
					pv.setCurrentPage(i);// 当前页的页码
					pv.setList(getCurList(i, 5,user));// 获取当前页的数据

				req.setAttribute("ps", pv);
				req.getRequestDispatcher("/shoppingcart.jsp").forward(req, resp);
			} else if (uri.endsWith("deleteItem.do"))
			/* 删除当前的购物栏 */
			{
				String itemIdStr = req.getParameter("itemId");
				String user = req.getParameter("user");
				if(null == itemIdStr) {
					return;
				}
				int itemId = Integer.parseInt(itemIdStr);
				// 根据ID 删除数据
				deleteCartItemById(itemId,user);
				// 删除成功则跳转至listItem.do


				resp.sendRedirect("listItem.do");
			} else if (uri.endsWith("clear.do"))
			/* 清空购物车 */
			{
				String user = req.getParameter("user");
				clearCartItem(user);

				resp.sendRedirect("listItem.do");
			} else if (uri.endsWith("addItem.do"))
			/* 添加到购物车 */
			{
				String bookId = req.getParameter("bookId");
				String user = req.getParameter("user");
				CartItem item = new CartItem();
				item.setGoodsId(Integer.parseInt(bookId));
				addToCart(item,user);
			} else if (uri.endsWith("toShopping.do"))
			/* 去购物 */
			{

				resp.sendRedirect("listItem.do");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	private void calTotalAmountAndMoney(HttpServletRequest req,String user) throws ClassNotFoundException, SQLException {
		// 计算总数量和综合的SQL
		String calcSQL = "SELECT sum(amount) allAmount,sum(sum_money) sumMoney FROM cart_item where username=?";
		Connection conn = DBLink.getCon();
		PreparedStatement statement = conn.prepareStatement(calcSQL);
		statement.setString(1, user);
		ResultSet rs = statement.executeQuery();
		while(rs.next()) {
			req.setAttribute("allAmount", rs.getInt("allAmount"));
			req.setAttribute("sumMoney", rs.getDouble("sumMoney"));
		}
		// 关闭资源
		if(null != rs) rs.close();
		if(null != statement) statement.close();
		if(null != conn) conn.close();
	}

	/**将商品添加到购物栏*/
	private void addToCart(CartItem item,String user) throws ClassNotFoundException, SQLException {
		// 1 获取商品的最新信息
		String bookSQL = "select * from bookinfo where bookId = ?";
		Connection conn = DBLink.getCon();
		PreparedStatement statement = conn.prepareStatement(bookSQL);
		statement.setInt(1, item.getGoodsId());
		ResultSet rs = statement.executeQuery();
		Book book = new Book();
		book.setBookId(item.getGoodsId());
		while(rs.next()) {
			book.setBookMoney(rs.getFloat("bookMoney"));
			book.setBookName(rs.getString("bookName"));
			book.setWriter(rs.getString("writer"));
			book.setBooknum(rs.getInt("booknum"));
		}
		// 关闭资源
		if(null != rs) rs.close();
		if(null != statement) statement.close();
		// 将bookMoney转换成double
		float bookMoney = book.getBookMoney();
		item.setUsername(user);
		item.setPrice(Math.round(bookMoney));
		item.setGoodsName(book.getBookName());
		// 2. 先查询购物车中是否已经添加了这件商品
		String sql = "select * from cart_item where goods_id = ? and username=?";
		statement = conn.prepareStatement(sql);
		statement.setInt(1, item.getGoodsId());
		statement.setString(2, user);
		ResultSet res = statement.executeQuery();
		double price = item.getPrice();
		System.out.println(item);
		if(res.next()) 
		// 购物车中已存在这件商品
		{
			// 获取购物栏的数量信息
			int amount  = res.getInt("amount");
			int cartItemId = res.getInt("cart_item_id"); 
			// 重新计算总额
			double sum = Math.round(price *(amount+1)*100)/100;
			// 更改购物栏的商品数量、单价、总额
			String updateSQL = "update cart_item set price = ?,amount=?, sum_money = ? where cart_item_id = ?";
			statement = conn.prepareStatement(updateSQL);
			statement.setDouble(1, price);
			statement.setInt(2, amount+1);
			statement.setDouble(3, sum);
			statement.setInt(4, cartItemId);
			statement.executeUpdate();
		}else 
		// 购物车中不存在这件商品
		{
			int amount = 1;
			double sum = Math.round(price * amount*100)/100;
			// 添加商品
			String addSQL = "insert into cart_item(username,cart_item_id,goods_id,goods_name,price,amount,sum_money) values(?,seq_cart_item.nextval,?,?,?,?,?)";
			PreparedStatement statement1 = conn.prepareStatement(addSQL);
			statement1.setString(1, user);
			statement1.setInt(2, item.getGoodsId());
			statement1.setString(3, item.getGoodsName());
			statement1.setDouble(4, item.getPrice());
			statement1.setInt(5, amount);
			statement1.setDouble(6, sum);
			statement1.executeUpdate();
			if(null != statement1) statement.close();
		}
		if(null != statement) statement.close();
		if(null != res) res.close();
		if(null != conn) conn.close();
	}

	/**清空数据*/
	private void clearCartItem(String user) throws ClassNotFoundException, SQLException {
		// 创建SQL
		String sql = "delete from cart_item where username=?";
		// 创建连接及预编译的对象
		Connection conn = DBLink.getCon();
		PreparedStatement statement = conn.prepareStatement(sql);
		statement .setString(1, user);
		// 执行SQL
		statement.executeUpdate();
		conn.commit();
	}

	private boolean deleteCartItemById(int itemId,String user) throws ClassNotFoundException, SQLException {
		// 创建删除语句
		String sql = "update cart_item item set item.amount=item.amount-1,sum_money=(amount-1)*price where item.cart_item_id = ? and username=?";
		// 获取数据库连接
		Connection conn = DBLink.getCon();
		// 创建预编译对象
		PreparedStatement statement = conn.prepareStatement(sql);
		// 给占位符设置值
		statement.setInt(1, itemId);
		statement.setString(2, user);
		// 执行获取结果
		int number = statement.executeUpdate();
		String sql0 = "delete from cart_item where amount=0";
		PreparedStatement statement0 = conn.prepareStatement(sql0);

		// 执行获取结果
		int number0 = statement0.executeUpdate();
		return number > 0;
	}

	/**分页获取当前页的数据信息*/
	private ArrayList<CartItem> getCurList(int currentPage, int pa,String user) throws SQLException, ClassNotFoundException {
		// TODO 需要更改查询语句
		String sql = "select * from (select a.*,rownum rn from (select * from cart_item where username=? ) a where rownum<=?) where rn>?";
		int i = currentPage * pa;
		int j = (currentPage - 1) * pa;
		Connection con = DBLink.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, user);
		ps.setInt(2, i);
		ps.setInt(3, j);
		ResultSet rs = ps.executeQuery();
		ArrayList<CartItem> items = new ArrayList<CartItem>();
		while(rs.next()) {

			CartItem item = new CartItem();
			if(rs.getInt("amount")>0){

				item.setCartItemId(rs.getInt("cart_item_id"));
				item.setGoodsId(rs.getInt("goods_id"));
				item.setGoodsName(rs.getString("goods_name"));
				item.setPrice(rs.getDouble("price"));
				item.setAmount(rs.getInt("amount"));
				item.setSum(rs.getDouble("sum_money"));
				items.add(item);
			}

		}
		return items;
	}

	/** 查询购物车，获取数量 */
	private int getCartAmount(String user) throws ClassNotFoundException, SQLException {

		String sql = "select count(*) amount from cart_item where username=?";
		Connection con = DBLink.getCon();
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, user);
		ResultSet rs = ps.executeQuery();
		int amount = 0;
		while (rs.next()) {
			amount = rs.getInt("amount");
		}
		return amount;
	}

}
