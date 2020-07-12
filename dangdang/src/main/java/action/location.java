package action;

import model.Book;
import model.City;
import net.sf.json.JSONArray;
import util.DBLink;
import util.Page;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class location extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/html;charset=UTF-8");
        String uri=req.getRequestURI();
        uri=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
        if (uri.equals("/reg")) {         //注册
            String name=req.getParameter("name");
            String pass=req.getParameter("pass");
            String repass=req.getParameter("repass");
            try {
                boolean ex=Exname(name);

                if (ex||!(pass.equals(repass))){
                    res.sendRedirect("reg.jsp");
                }
                else {
                   int i= reg(name,pass);
                   if (i>0){
                       res.sendRedirect("login.jsp");
                   }
                   else {
                       res.sendRedirect("reg.jsp");
                   }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        else if (uri.equals("/login")){    //登录
            String name=req.getParameter("name");
            String pass=req.getParameter("pass");
            try {
                boolean lo=login(name,pass);
                if (lo){
                    HttpSession se=req.getSession();
                    se.setAttribute("sname",name);

                    req.getRequestDispatcher("dangdang.jsp").forward(req,res);
                }
                else {
                    res.sendRedirect("login.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }


        }else if (uri.equals("/getAr")){
            String cname = req.getParameter("cname");
            PrintWriter w = res.getWriter();
            if (cname.equals("jx"))
            {
                try {
                    String str= null;
                    str = getop1(cname);
                    w.println(str);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
            else if (cname.equals("cq"))
            {
                try {
                    String str= null;
                    str = getop2(cname);
                    w.println(str);
                } catch (SQLException e) {
                    e.printStackTrace();
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }else if (uri.equals("/getName")){
            String uname = req.getParameter("Rname");
            PrintWriter w = res.getWriter();
            try {
                boolean ex=Exname(uname);
                if (ex){
                    w.println("用户名已存在");
                    System.out.println("用户名已存在");
                }
                else {
                    w.println("用户名可用");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }else if (uri.equals("/list")){
            String currentPage=req.getParameter("currentPage");
            if (currentPage==null)
            {
                currentPage="1";
            }
            int i=Integer.parseInt(currentPage);
            Page pv=new Page();
            try {
                pv.setCountPa(getA());   //设置总记录数
                pv.setPa(5);            //设置每页的记录数
                pv.setCurrentPage(i);   //设置当前页
                pv.setList(getEmps(i,5));
                req.setAttribute("ps",pv);
                req.getRequestDispatcher("list.jsp").forward(req,res);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (ServletException e) {
                e.printStackTrace();
            }


        }

    }
    //检查名字是否重复
    public boolean Exname(String name) throws SQLException, ClassNotFoundException {
        Connection con= DBLink.getCon();
        String sql="select * from D_USERS where name=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,name);
        ResultSet rs=ps.executeQuery();
        return rs.next();
    }

    //注册
    public int reg(String name,String password) throws SQLException, ClassNotFoundException {
        Connection con= DBLink.getCon();
        String sql="insert into D_USERS values(users_id_seq1.nextval,?,?,null)";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,name);
        ps.setString(2,password);
        int i=ps.executeUpdate();
        return i;
    }
    public boolean login(String name,String pass) throws SQLException, ClassNotFoundException {
        Connection con=DBLink.getCon();
        String sql="select * from D_USERS where name=? and pass=?";
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setString(1,name);
        ps.setString(2,pass);
        System.out.println(name+pass);
        ResultSet rs=ps.executeQuery();
        return rs.next();

    }
    public String getop1(String cname) throws SQLException, ClassNotFoundException {
        Connection con= DBLink.getCon();
        String sql="select * from jx_t";
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<City> arr=new ArrayList<>();
        while (rs.next())
        {
            City c=new City();
            String zname=rs.getString("zname");
            String ename=rs.getString("ename");
            c.setEname(ename);
            c.setZname(zname);
            arr.add(c);
        }
        JSONArray jarr= JSONArray.fromObject(arr);
        String str=jarr.toString();
        return str;
    }
    public String getop2(String cname) throws SQLException, ClassNotFoundException {
        Connection con= DBLink.getCon();
        String sql="select * from cq_t";
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<City> arr=new ArrayList<>();
        while (rs.next())
        {
            City c=new City();
            String zname=rs.getString("zname");
            String ename=rs.getString("ename");
            c.setEname(ename);
            c.setZname(zname);
            arr.add(c);
        }
        JSONArray jarr= JSONArray.fromObject(arr);
        String str=jarr.toString();
        return str;
    }
    //获得总记录数
    public static int getA() throws SQLException, ClassNotFoundException {
        String sql="select count(*) c from bookinfo";
        Connection con= DBLink.getCon();
        PreparedStatement ps=con.prepareStatement(sql);
        ResultSet rs=ps.executeQuery();
        int co=0;
        while (rs.next()){
            co=rs.getInt("c");
        }
        return co;
    }
    //获得当前页的数据
    public static ArrayList<Book> getEmps(int currentPage, int pa) throws SQLException, ClassNotFoundException {
        String sql="select * from (select a.*,rownum rn from (select * from bookinfo) a where rownum<=?) where rn>?";
        Connection con=DBLink.getCon();
        int i=currentPage*pa;
        int j=(currentPage-1)*pa;
        PreparedStatement ps=con.prepareStatement(sql);
        ps.setInt(1,i);
        ps.setInt(2,j);
        ResultSet rs=ps.executeQuery();
        ArrayList<Book> list=new ArrayList<>();
        while(rs.next())
        {
            Book f=new Book();
            f.setBookId(rs.getInt("bookId"));
            f.setBookName(rs.getString("bookName"));
            f.setWriter(rs.getString("writer"));
            f.setBookMoney(rs.getFloat("bookMoney"));
            f.setBooknum(rs.getInt("booknum"));
            list.add(f);

        }
        return list;

    }

}
