<%-- 
    Document   : index.jsp
    Created on : May 27, 2021, 6:20:07 AM
    Author     : Sudewa Jayanath
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"/>
    <body style="background-color: #111111;">
         <jsp:include page="navbar.jsp"/>
         <!-- Jumbotron -->
         <div class="p-5 text-left bg-light"  style="margin-top: 58px; background: url('http://www.androidguys.com/wp-content/uploads/2016/02/amazing-game-wallpaper-1.jpg')">
             <h1 style="margin:20% 0% 20% 0%; font-weight: 900; color: #FFA900;"><span class="text-decoration-underline" style="font-size: 200%; letter-spacing: 1px">WELCOME TO</span><br/><span class="text-white fw-normal" style="letter-spacing: 20px;">POWERGAMING</span></h1>
         </div>
         <!-- Jumbotron -->
         <div class="container mt-5 pt-5">
             <h1 class="text-white text-center text-uppercase  "><span><i class="fas fa-headset"></i></span><br/>Leaderboard</h1>
             <div class="text-end mb-3">
                 <a href="gameList.jsp">
                     <button type="button" class="btn add-game">Game List</button>
                 </a>&nbsp;
                 <a href="addGame.jsp">
                     <button type="button" class="btn add-game">Add New Game</button>
                 </a>
             </div>
                 <div class="row row-cols-1 row-cols-md-3 g-4">
                
                 <%             
               
                String driverName = "com.mysql.jdbc.Driver";
                String connectionUrl = "jdbc:mysql://localhost:3306/gamesystem";
                String userId = "root";
                String password = "nadun1459@";

                try {
                Class.forName(driverName);
                } catch (ClassNotFoundException e) {
                e.printStackTrace();
                }

                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null; 
        
                try{ 
                connection = DriverManager.getConnection(connectionUrl, userId, password);
                statement=connection.createStatement();
                String sql ="SELECT name as 'Name',platform as 'platform',realeseDate as 'realeseDate', image as 'image', id as 'id' FROM game";
                resultSet = statement.executeQuery(sql);

               while(resultSet.next()){    
                 String name = resultSet.getString("Name");
                 String platform = resultSet.getString("platform");
                 String realeseDate = resultSet.getString("realeseDate");
              %>
                 <div class="col">
                  <div class="card black-c">
                    <img
                        src="<%=resultSet.getString("image")%>"
                      class="card-img-top"
                      alt="..."
                    />
                    <div class="card-body">
                      <h6 class="card-title text-warning"><%=name%></h6>
                      <div class="card-text ms-3">
                         
                          <span><i class="fas fa-play text-white-50"></i>&nbsp;&nbsp;<span class="text-white">Platform : <%=platform%> </span></span><br/>
                          <span><i class="fas fa-play text-white-50"></i>&nbsp;&nbsp;<span class="text-white">Realese Date : <%=realeseDate%></span></span><br/>

                      </div>
                    </div>       
                      <a href="giveRate.jsp?id=<%=resultSet.getString("id")%>&name=<%=name%>&image=<%=resultSet.getString("image")%>">
                        <div class="d-grid gap-2 border border-0" style="border-radius: 0%; ">
                            <button class="btn text-white-50" type="button" style="letter-spacing: 1px;background-color: #141616;">View More Details <i class="fas fa-angle-double-right"></i></button>
                        </div>
                    </a>
                </div>
                 </div>
              <%                
                               }
                            } catch (Exception e) {
                            e.printStackTrace();
                     }
             %>
                 
           </div>
         </div>
         <jsp:include page="footer.jsp"/>
    </body>
</html>
