package model;

/**购物车栏*/
public class CartItem {
	// 购物车栏ID
	private int cartItemId;
	// 商品ID
	private int goodsId;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	// 商品名称
	private String username;
	private String goodsName;
	// 商品的数量
	private int amount;
	//  商品的价格
	private double price;
	// 总金额
	private double sum;
	public int getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(int cartItemId) {
		this.cartItemId = cartItemId;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getSum() {
		return sum;
	}
	public void setSum(double sum) {
		this.sum = sum;
	}
	@Override
	public String toString() {
		return "CartItem [cartItemId=" + cartItemId + ", goodsId=" + goodsId + ", goodsName=" + goodsName + ", amount="
				+ amount + ", price=" + price + ", sum=" + sum + "]";
	}
	
	
}
