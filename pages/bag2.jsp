<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Violet Cafe</title>
    <link rel="icon" href="../image/icon.ico">
    <link rel="stylesheet" href="../css/store.css"> <!--連結CSS-->
</head>
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="index2.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <nav>
            <a href="index2.jsp">首頁</a>
            <a href="coffee2.jsp">商品頁面</a>
            <a href="board2.jsp">留言板</a>
            <a href="aboutus2.jsp">關於我們</a>
            <a href="logout.jsp">登出會員</a>
            <a href="members.jsp">修改會員資料</a>
            <a href="cart2.jsp">🛒購物車</a>
        </nav>
    </header>
	
    <div class="content">
        <ul>
            <li>
                <a href="coffee2.jsp">咖啡</a>
                <ul>
                    <li><a href="dominican2.jsp">多明尼加</a></li>
                    <li><a href="isobia2.jsp">伊索比亞</a></li>
                    <li><a href="taiwan2.jsp">台灣</a></li>
                </ul>
            </li>
            <li><a href="bag2.jsp">咖啡包</a></li>
            <li><a href="tool2.jsp">沖泡工具</a></li>
        </ul>
      </div>


    <article>
        <div class="product-container">
		<%
		try { // 例外處理
				Class.forName("com.mysql.jdbc.Driver"); // 啟動 JDBC 驅動程式
				try {	// 例外處理
					String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC"; // url 是連接 MySQL 的位址（IP 或網域）
					String sql=""; // 建立字串變數 sql
					Connection con=DriverManager.getConnection(url,"root","1234"); // 連接 MySQL 資料庫（帳號：root；密碼：1234）
					if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
					   out.println("警告：連線建立失敗！"); // 連線關閉代表連線沒有被建立
					else { // 連線成功建立就可以開始取得與更新資料庫的資料
						sql="USE `coffee`"; // SQL 語法：使用 cych 資料庫
						con.createStatement().execute(sql); // 執行上一行的 SQL
						sql="SELECT * FROM `products` WHERE `id` BETWEEN 'P016' AND 'P020'"; // SQL 語法：取得 counter 資料表中的所有資料
						ResultSet rs=con.createStatement().executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
				   int count=0;
				   while(rs.next())
				   {
					   out.print("<form method='post' action='cart_add.jsp' class='product'>");;
					   out.print("<a href='products.jsp?product_id="+rs.getString(1)+"'>"+"<img src='"+rs.getString(4)+"'>"+"</a>");//產品圖片
					   out.print("<h3>"+rs.getString(2)+"</h3>"+"<br>");//產品名稱
					   out.print("<p style='font-size:15px;'>"+rs.getString(3)+"</p>"+"<br>");//產品內容
					   out.print("<p style='font-size:15px;'>"+"產地:"+rs.getString(5)+"</p>"+"<br>");//產地
					   out.print("<div>");
					   out.print("<input type='button' value='-' class='btn' onclick='minus("+count+")'>");
					   out.print("<input type='text' value='1' id='input_sum" +count+ "'class='input_sum' name='product_number' >");
					   out.print("<input type='button' value='+' class='btn' onclick='add("+count+")'>");
					   out.print("<input type='hidden' name='product_id' value='"+rs.getString(1)+"'>");
					   out.println("<input type='submit' value='加入購物車'>"+"<br>"+"<br>");
					   out.print("價格:"+rs.getString(6)+"&nbsp"+"&nbsp");
					   out.print("庫存:"+rs.getString(7));
					   out.print("</div>");
					   out.print("</form>");
					   count++;
					}
					con.close();
				}}
				catch (SQLException sExec) {
					out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
				}
			}
			catch (ClassNotFoundException err) {
			  out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
			}
		
		%>

        </div>
 
    </article>

    <footer>
        <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
        <p class="copyright">瀏覽人數：<%@include file="counter.jsp"%><br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
    </footer>

    <script>
        function minus(n){
            var num = Number(document.getElementsByClassName("input_sum")[n].value);
            if(num>0){
                document.getElementsByClassName("input_sum")[n].value = num -1;
            }
        }

        function add(n){
            var num = Number(document.getElementsByClassName("input_sum")[n].value);
            if(num<100){
                document.getElementsByClassName("input_sum")[n].value = num +1;
            }
        }
    </script>
</body>
</html>