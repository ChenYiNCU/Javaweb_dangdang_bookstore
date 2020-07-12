<%@ page import="util.Page"%>
<%@ page import="model.Book"%><%--
  Created by IntelliJ IDEA.
  User: 益
  Date: 2020/5/30
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Title</title>
<style>
* {
	background: rgb(250, 250, 250)
}

#box1 {
	height: 1000px
}

#box1 table {
	border: 1px solid gainsboro;
	text-align: center;
	width: 1000px;
	margin: 0 auto;
}

#box1 table th {
	height: 50px;
	font-size: 16px;
	background: green;
	color: white
}

#box1 table td {
	border-bottom: green 1px solid;
	background: white
}

#box2 {
	text-align: center;
}

table td img {
	cursor: pointer;
}
#box23{
	position: fixed;
    right: 171px;
    width: 100px;
    top: 20px;
    cursor: pointer;	
}
</style>
<script type="text/javascript">
	function addToCart(bookId) {
		var isConfirm = confirm("是否添加到购物车");
		console.log(isConfirm);
		// 如果取消加到购物车，则范湖
		if (!isConfirm)
			return;
		// 通过ajax 来添加商品到购物车
		var xhr = getxhr();
		xhr.open("get", "<%=request.getContextPath()%>/cart/addItem.do?bookId="
				+ bookId+"&user="+"<%=session.getAttribute("sname")%>", true);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				alert("添加成功");
			}
		};
		xhr.send();
	}
	function getxhr() {
		var xhr = null;
		if (window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		} else {
			xhr = new ActiveXObject('Microsoft.XMLHttp');
		}
		return xhr;
	}
</script>
</head>
<body>
	<div id="box23"
		onclick="location.href='<%=request.getContextPath()%>/cart/listItem.do?user=<%=session.getAttribute("sname")%>'">
		<div>
			<img src="./imags/cart_empty.png" alt="" width="32px" height="32px">
		</div>
		<div style="position: absolute; top: 6px; left: 40px;">购物车</div>
	</div>
	<div id="box1">
		<img style="position: relative; left: 60px; margin-bottom: 30px"
			src="https://login.dangdang.com/images/logo.png" alt="">
		<table cellspacing="0" cellpadding="2px">
			<tr>
				<th></th>
				<th>BookName</th>
				<th>writer</th>
				<th>price</th>
			</tr>
			<%
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				Page p = new Page();
				p = (Page) request.getAttribute("ps");
				for (Book f : p.getList()) {
					int id = f.getBookId();
			%>
			<tr>
				<td><img src="./imags/im<%=id%>.jpg"
					onclick="addToCart('<%=id%>')"></td>
				<td><%=f.getBookName()%></td>
				<td><%=f.getWriter()%></td>
				<td><%=f.getBookMoney()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<div id="box2">
			<%
				if (p.getCurrentPage() == 1) {
			%>
			<a href="list.do?currentPage=<%=p.getCurrentPage() + 1%>">下一页</a> <a
				href="list.do?currentPage=<%=p.getSumPage()%>">末页</a>
			<%
				} else if (p.getCurrentPage() == p.getSumPage()) {
			%>
			<a href="list.do?currentPage=<%=1%>" />首页</a> <a
				href="list.do?currentPage=<%=p.getCurrentPage() - 1%>" />上一页</a>
			<%
				} else {
			%>
			<a href="list.do?currentPage=<%=1%>" />首页</a> <a
				href="list.do?currentPage=<%=p.getCurrentPage() - 1%>" />上一页</a> <a
				href="list.do?currentPage=<%=p.getCurrentPage() + 1%>">下一页</a> <a
				href="list.do?currentPage=<%=p.getSumPage()%>">末页</a>
			<%
				}
			%>
			共
			<%=p.getCurrentPage()%>/<%=p.getSumPage()%>页&emsp; 共<%=p.getCountPa()%>条记录
		</div>

	</div>



</body>
</html>
