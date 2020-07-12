<%@page import="model.CartItem"%>
<%@page import="util.Pager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/public.css" />
<link rel="stylesheet" href="../css/style.css" />
<style type="text/css">
#shopping_cart {
	width: 50%;
	/* height: 50%; */
	position: relative;
	left: 280px;
}

table td {
	text-align: center;
}

td span {
	cursor: pointer;
}

.delete-item {
	height: 50px;
	width: 100px;
	background: gray;
	line-height: 50px;
	font-size: 22px;
	border-radius: 26px;
	color: red;
	position: relative;
	left: 11px;
	cursor: pointer;
	display: block;
}
#box2 {
	text-align: center;
}

ul {
	list-style: none;
	margin-left: 50px;
}

ul li {
	display: inline;
	line-height: 40px;
	float: left ;
	margin-top: -5px;
}
ul li:nth(1){
	margin-left: 23px;
}

li span font {
	color: red;
	margin: 0 6px;
}
</style>
<script type="text/javascript">
	function deleteItem(itemId){
		var url = "<%=request.getContextPath()%>/cart/deleteItem.do?itemId="+itemId+"&user=<%=session.getAttribute("sname")%> ";
		location.href=url;
	}
</script>
</head>
<body>
	<!-- 购物车 -->
	<div id="shopping_cart">
		<div class="message success">我的购物车</div>
		<table class="data-table cart-table">
			<tr>
				<th class="align_left" width="40">商品名称</th>
				<th class="align_center" width="20%">单价</th>
				<th class="align_center" width="20%">数量</th>
				<th class="align_center" width="20%">金额</th>
				<th class="align_center" width="20%">删除</th>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				Pager<CartItem> pager = (Pager<CartItem>) request.getAttribute("ps");
				for (CartItem item : pager.getList()) {
			%>
			<tr>
				<td><img style="display: block;"
					title="<%=item.getGoodsName()%>"
					src="<%=request.getContextPath()%>/imags/im<%=item.getGoodsId()%>.jpg">
					<span><%=item.getGoodsName()%></span></td>
				<td class="align_center vline"><span><%=item.getPrice()%></span></td>
				<td class="align_center vline"><span><%=item.getAmount()%></span></td>
				<td class="align_center vline"><span><%=item.getSum()%></span></td>
				<td class="align_center vline"><span class="delete-item"
					onclick="deleteItem(<%=item.getCartItemId()%>)">删除</span></td>
			</tr>
			<%
				}
			%>
		</table>
		<div id="box2">
			<%
				if (pager.getCurrentPage() == 1) {
			%>
			<a href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=pager.getCurrentPage() + 1%>&user=<%=session.getAttribute("sname")%>">下一页</a> <a
				href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=pager.getSumPage()%>&user=<%=session.getAttribute("sname")%>">末页</a>
			<%
				} else if (pager.getCurrentPage() == pager.getSumPage()) {
			%>
			<a href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=1%>&user=<%=session.getAttribute("sname")%>" />首页</a> <a
				href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=pager.getCurrentPage() - 1%>&user=<%=session.getAttribute("sname")%>" />上一页</a>
			<%
				} else {
			%>
			<a href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=1%>&user=<%=session.getAttribute("sname")%>" />首页</a> <a
				href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=pager.getCurrentPage() - 1%>&user=<%=session.getAttribute("sname")%>" />上一页</a> <a
				href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=pager.getCurrentPage() + 1%>&user=<%=session.getAttribute("sname")%>">下一页</a> <a
				href="<%=request.getContextPath()%>/cart/listItem.do?currentPage=<%=pager.getSumPage()%>&user=<%=session.getAttribute("sname")%>">末页</a>
			<%
				}
			%>
			共
			<%=pager.getCurrentPage()%>/<%=pager.getSumPage()%>页&emsp; 共<%=pager.getCountPa()%>条记录
		</div>
		<!-- 结算 -->
		<div class="totals">
			<div class="action_buttonbar">
				<ul>
					<li><span>购物车中共有<font><%=request.getAttribute("allAmount") %></font>件商品
					</span></li>
					<li><span>总额<font><%=request.getAttribute("sumMoney") %></font>元
					</span></li>
				</ul>
				<%-- <font><a href="${shop}/user/confirm.jsp">
						<button type="button" title="" class="checkout fr"
							style="background-color: #f38256;">订单确认</button>
				</a></font> --%>
				<button type="button" title="" class=" fr" 
					onclick="location.href='<%=request.getContextPath()%>/cart/clear.do&user=<%=session.getAttribute("sname")%>'"
				>
					<font><font>清空购物车</font> </font>
				</button>
				<a href="<%=request.getContextPath()%>/list.do">
					<button type="button" title="" class="continue fr">
						<font>继续购物</font>
					</button>
				</a>
				<div style="clear: both"></div>
			</div>
		</div>
	</div>

</body>
</html>