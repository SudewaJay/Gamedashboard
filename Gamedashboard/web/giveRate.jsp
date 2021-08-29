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
         <%
                String gameId = request.getParameter("id");
                String name = request.getParameter("name");
                String image = request.getParameter("image");
                
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
          %>
         <div class="container " style="margin-top: 158px;">
             <h3 class="text-warning text-center"><%=name%></h3>
             <div class="container black-c">
                <div class="row  pb-5 pt-5">
                    <div class="col-sm-6  border-end">
                      <form action="servlet_add_user" method="post"> 
                      <h3 class="pt-2 pb-3 text-white text-center fw-light text-uppercase text-decoration-underline">Add New Player</h3>
                      <div class="card black-c">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Full Name : </span>
                              <input type="text" id="name" name="name" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Address : </span>
                              <input type="text" id="Address" name="Address" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Telephone Number : </span>
                              <input type="tel" id="Address" name="tel" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Age : </span>
                            <input type="number" min="0" id="age" name="age" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Email : </span>
                              <input type="email" min="0" id="email" name="email" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Game No : <%=gameId%></span>
                              <input type="hidden" id="game" value=" <%=gameId%>" name="game" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                          <input type="hidden" name="pageName" value="<%=name%>">
                           <input type="hidden" name="image" value="<%=image%>">
                      <div class="text-end mt-3 " style="margin-right: 5%;">
                             <button type="submit" name="submit" class="btn text-dark fw-bolder btn-warning  btn-sm">Save <i class="fas fa-save"></i></button>
                      </div>
                      </form>
                    </div>
                    <div class="col-sm-6">
                    <div class="text-end" style="margin: 0% 5% 2% 5%;">
                <%  
                    
                            try{ 
                               connection = DriverManager.getConnection(connectionUrl, userId, password);
                               statement=connection.createStatement();
                               String sql ="SELECT count(gameId) as 'count' FROM gamedone where gameId = '"+gameId+"'";
                               resultSet = statement.executeQuery(sql);
                               while(resultSet.next()){           
                                      String count = resultSet.getString("count");
//                                      session.setAttribute("count", count);
//                                      String counts = (String)session.getAttribute("count");
                  %>            
                               <span class="text-white">Match Count : <%=count%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
              
                  <%                
                                        }
                                     } catch (Exception e) {
                                     e.printStackTrace();
                              }
                  %>
                           <a href="gameCount?id=<%=gameId%>&name=<%=name%>&image=<%=image%>">  
                              <button type="submit" name="submit"  class="btn btn-outline-white btn-sm">Add A Match</button>
                           </a>
                    </div>
                      <center>
                        <img src="<%=image%>" style="width:90%" class="text-center img-fluid"  alt="" />
                        <h5 class="mt-4 text-white text-uppercase fw-light text-decoration-underline" style="letter-spacing: 2px;">Player Ranking</h5>
                     </center>
                       
                              <%  
                             int countRANK = 0;
                             String counts = (String)session.getAttribute("count");
                            try{ 
                               connection = DriverManager.getConnection(connectionUrl, userId, password);
                               statement=connection.createStatement();
                               String sql ="SELECT name AS 'name', id as 'id',  score AS 'score' , matchCount AS 'matchCount' , (score+(matchCount/"+counts+")) AS 'rank' FROM USER WHERE  game = '"+gameId+"' ORDER BY rank DESC";
                               resultSet = statement.executeQuery(sql);
                               while(resultSet.next()){           
                                        countRANK = countRANK + 1;                                        
                  %>       
                          <div class="p-3" style="background-color: #181F23;margin: 0% 5% 1% 5%; border-radius: 2px; box-shadow: 1px 2px 2px #2C3438;">
                            <div class="row">
                                <div class="col-3">
                                   <a class="btn btn-primary fw-bold btn-sm" style="background-color: #3b5998; font-size:15px;" href="#!" role="button" ><%=countRANK%></a>
                                </div>
                                
                                <div class="col-7 pt-1">
                                    <span class="text-white text-light"><%=resultSet.getString("name")%></span>
                                </div>
                                <div class="col-2 pt-1">
                                    <a href="updatePlayer.jsp?id=<%=resultSet.getString("id")%>&name=<%=resultSet.getString("name")%>&gameName=<%=name%>&score=<%=resultSet.getString("score")%>&matchCount=<%=resultSet.getString("matchCount")%>&image=<%=image%>&gameId=<%=gameId%>">
                                        <i class="fas fa-pen-nib text-success"></i>
                                    </a>
                                </div>
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
             </div>
         </div>
         <jsp:include page="footer.jsp"/>
    </body>
</html>
