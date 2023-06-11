<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增商品</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/backmanage2.css"> <!--連結CSS-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
</head>

  <body>
    <div>
        <div class="backg"></div>
      </div>
      
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="#"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <h1>後台管理系統</h1>
        <nav>
            <a href="back_new.jsp">新增商品</a>
            <a href="back_delete.jsp">刪除商品</a>
            <a href="back_alter.jsp">修改商品</a>
            <a href="order_view.jsp">瀏覽訂單</a>
        </nav>
        <div>
            <a href="login.jsp" class="logout"><p>
                <img src="../image/logout.png" alt="" style="width:100px; height:100px;" >
            </p></a>
        </div>
    </header>

    <section class="all">
		<br><br><div class="title" style="text-align:center">商品新增</div><br><br>
        <form action="back_new2.jsp">
		
          商品編號&nbsp; : &nbsp;<input type="text" id="alter" name="id" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          商品名稱&nbsp; : &nbsp;<input type="text" id="alter" name="name" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          商品介紹&nbsp; : &nbsp;<input type="text" id="alter" name="intro" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          圖片路徑&nbsp; : &nbsp;<input type="text" id="alter" name="img" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          商品產地&nbsp; : &nbsp;<input type="text" id="alter" name="place" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          商品價格&nbsp; : &nbsp;<input type="text" id="alter" name="price" style="height:20px;width:300px;">
          <br>
          <br>
		  <br>
          商品庫存&nbsp; : &nbsp;<input type="text" id="alter" name="iventory" style="height:20px;width:300px;">
          <br>
          <br>
		  
          <div class="btn_group">
			<a href="#" onclick="javascript:window.location.reload()" >
				<input type="reset"  class="btn" value="重設">
			</a>
            <input type="submit" class="btn" value="新增">
          </div>
          
        </form>
      
    </section>

	<footer style="background-color: #7f5539; width: 100%; height:4%; position: absolute; bottom: 0;"></footer>
  </body>
</html>
