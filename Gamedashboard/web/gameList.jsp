<%-- 
    Document   : addGame
    Created on : May 27, 2021, 1:14:28 PM
    Author     : User
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
         <div class="container mt-5 pt-5 " style="padding-bottom: 8%">
             <h1 class="text-white mt-5 text-center text-uppercase  "><span><i class="fas fa-headset"></i></span><br/>Game List</h1>
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
                String sql ="SELECT * FROM game";
                resultSet = statement.executeQuery(sql);

               while(resultSet.next()){    
                 String name = resultSet.getString("name");
               
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
                          <span><i class="fas fa-play text-white-50"></i>&nbsp;&nbsp;<span class="text-white">Price : RS.<%=resultSet.getString("price")%>.00</span></span><br/>
                          <span><i class="fas fa-play text-white-50"></i>&nbsp;&nbsp;<span class="text-white">Platform : <%=resultSet.getString("platform")%></span></span><br/>
                          <span><i class="fas fa-play text-white-50"></i>&nbsp;&nbsp;<span class="text-white">Tags : <%=resultSet.getString("Tags")%></span></span><br/>
                          
                      </div>
                    </div>       
                          <a href="oneGame.jsp?id=<%=resultSet.getString("id")%>">
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
