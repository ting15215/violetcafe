<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
	<head>
		<title>確認產品新增</title>
	</head>
	
	<body>
<%          
			String id=request.getParameter("id");
            String name=request.getParameter("name");
            String intro=request.getParameter("intro");
            String img=request.getParameter("img");
            String place=request.getParameter("place");
            String price=request.getParameter("price");
            String iventory=request.getParameter("iventory");
			
		   if(id=="")
		   {
			   out.print("<script>alert(decodeURIComponent('新增失敗！商品編號不能為空！請重新輸入'));location.href='back_new.jsp'</script>");
			   return;
		   }

		   if(name=="")
		   {
			   out.print("<script>alert(decodeURIComponent('新增失敗！商品名稱不能為空！請重新輸入'));location.href='back_new.jsp'</script>");
			   return;
		   }
		   if(intro=="")
		   {
			   out.print("<script>alert(decodeURIComponent('新增失敗！商品介紹不能為空！請重新輸入'));location.href='back_new.jsp'</script>");
			   return;
		   }
		   if(img=="")
		   {
			   out.print("<script>alert(decodeURIComponent('新增失敗！圖片路徑不能為空！請重新輸入'));location.href='back_new.jsp'</script>");
			   return;
		   }
		   if(place=="")
		   {
			   out.print("<script>alert(decodeURIComponent('新增失敗！商品產地不能為空！請重新輸入'));location.href='back_new.jsp'</script>");
			   return;
		   }
		   if(price=="")
		   {
			   out.print("<script>alert(decodeURIComponent('新增失敗！商品價格不能為空！請重新輸入'));location.href='back_new.jsp'</script>");
			   return;
		   }
		   if(iventory=="")
		   {
			   out.print("<script>alert(decodeURIComponent('新增失敗！商品庫存不能為空！請重新輸入'));location.href='back_new.jsp'</script>");
			   return;
		   }
	
	
			try { // 例外處理
				Class.forName("com.mysql.jdbc.Driver"); // 啟動 JDBC 驅動程式
				try {	// 例外處理
					String url="jdbc:mysql://localhost/?serverTimezone=UTC"; // url 是連接 MySQL 的位址（IP 或網域）
					String sql=""; // 建立字串變數 sql
					Connection con=DriverManager.getConnection(url,"root","1234"); // 連接 MySQL 資料庫（帳號：root；密碼：1234）
					if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
					   out.println("警告：連線建立失敗！"); // 連線關閉代表連線沒有被建立
					else { // 連線成功建立就可以開始取得與更新資料庫的資料
						sql="USE `coffee`"; // SQL 語法：使用 cych 資料庫
						con.createStatement().execute(sql); // 執行上一行的 SQL
						boolean rs=con.createStatement().execute(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果	
						
						String sql1 = "INSERT INTO  `products` (`id`,`name`,`intro`,`img`,`place`,`price`,`iventory`) VALUES ('"+id+"','"+name+"','"+intro+"','"+img+"','"+place+"','"+price+"','"+iventory+"')"; 
						con.createStatement().execute(sql1);
						   
						out.print("<script>alert('新增成功!');location.href='back_new.jsp'</script>");
							
						
					con.close();						
					}
					}	
				
				catch (SQLException sExec) {
					out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
					}
				}
				catch (ClassNotFoundException err) {
					out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
					}

%>

	</body>
</html>