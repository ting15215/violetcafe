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
    <link rel="stylesheet" href="../css/board.css"> <!--連結CSS-->
</head>
    
<body>
    <header>
        <div class="logo"> <!--LOGO-->
            <a href="index.jsp"><img src="../image/logo.png" style="width: 100px; height: 100px;"></a>
        </div>
        <nav>
            <a href="index.jsp">首頁</a>
            <a href="coffee.jsp">商品頁面</a>
            <a href="board.jsp">留言板</a>
            <a href="aboutus.jsp">關於我們</a>
            <a href="login.jsp">登入會員</a>
            <a href="cart.jsp">🛒購物車</a>
        </nav>
    </header>

    <div class="bgset">
        <main>
            <br><br><h1>留言板</h1>
            <div class="container">
                <h2>你們的每一條意見，都可以讓我們變得更好!</h2>
                <h3>-Violet Cafe-</h3>
            </div>
            <div class="container1">
                <h2>在此觀看其他人的留言</h2>
				<%
					String pro_id = request.getParameter("gopro");
					try {
					//Step 1: 載入資料庫驅動程式 
						Class.forName("com.mysql.jdbc.Driver");
						try {
					//Step 2: 建立連線 	
							String url="jdbc:mysql://localhost/?serverTimezone=UTC";
							String sql="";
							Connection con=DriverManager.getConnection(url,"root","1234");
							if(con.isClosed())
							   out.println("連線建立失敗");
							else {
					//Step 3: 選擇資料庫   
								sql="USE `coffee`";
								con.createStatement().execute(sql);
					//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet
								String comm = request.getParameter("gopro");
								sql="SELECT * FROM `board` WHERE `board_id` = '"+pro_id+"'"; //算出共幾筆留言
								ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
								rs.last();
								int total_content = rs.getRow();
					//Step 5: 顯示結果

								sql = "SELECT * FROM `board` WHERE `customer_id` = '"+pro_id+"' ORDER BY `board_id` DESC";
								rs = con.createStatement().executeQuery(sql);
								while(rs.next()){
										out.print("<div class='board'>");
										out.print("<div class='msg'>");
										out.print("<h4 style='text-align:left;'>姓名:"+rs.getString(3)+"</h4>");
										out.print("<h4 style='text-align:left;'>購買商品:"+rs.getString(4)+"</h4>");
										out.print("<h4 style='text-align:left;'>評價星級:"+rs.getString(5)+"★</h4>");
										out.print("<h4 style='text-align:left;'>評價內容:"+rs.getString(6)+"</h4>");
										out.print("<h4 style='text-align:left;'>日期:"+rs.getString(7)+"</h4>");
										out.print("</div>");
										out.print("</div>");
									}
					//Step 6: 關閉連線
							  con.close();
						  }
						}
						catch (SQLException sExec) {
							   out.println("SQL錯誤"+sExec.toString());
							   
						}
					}
					catch (ClassNotFoundException err) {
						  out.println("class錯誤"+err.toString());
					}
				%>

            <div class="container2">
                <div class="add">
					
                    <h2>或在此留下回饋吧!</h2>
                    <form action="board_add.jsp" method="post">
                        留言者：<input type="text" name="author"><br>
                        購買的商品：<input type="text" name="product"><br>
                        <div class="STAR">
                            評價星級：
                            <input type="radio" name="star" id="star1" value="5">
                            <label for="star1">5★</label>
                            <input type="radio" name="star" id="star2" value="4">
                            <label for="star2">4★</label>
                            <input type="radio" name="star" id="star3" value="3">
                            <label for="star3">3★</label>
                            <input type="radio" name="star" id="star4" value="2">
                            <label for="star4">2★</label>
                            <input type="radio" name="star" id="star5" value="1">
                            <label for="star5">1★</label>
                        </div>
                        想分享的內容：<br><textarea row="2" cols="30" name="content" wrap="soft"></textarea><br>
						<input type="hidden" name="com" value="<%=pro_id%>">
                        <button type="submit">送出留言</button>
                    </form>
                </div>
            </div>
        </main>
        <div class="fix"></div>
        <footer>
            <p class="pagetop"><a href="#top">▲回TOP</a></p> <!--TOP傳送門-->
            <p class="copyright">瀏覽人數：<%@include file="counter.jsp"%><br> Copyright © 2023。本網站僅為作業之用，如有侵權敬請告知。</p>
        </footer>
    </div>
</body>
</html>