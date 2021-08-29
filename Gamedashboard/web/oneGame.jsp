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
         <div class="container " style="margin-top: 158px;">
             <%
                String gameId = request.getParameter("id");
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
                String sql ="SELECT * FROM game where id='"+gameId+"'";
                resultSet = statement.executeQuery(sql);

               while(resultSet.next()){    
                 String name = resultSet.getString("name");
               
             %>
             <form action="gameUpdate" method="post"> 
             <div class="container black-c">
                <h1 class="pt-5 pb-5 text-gold-2 text-center fw-light text-uppercase text-decoration-underline"><%=resultSet.getString("name")%></h1>
               
                <div class="row  pb-5">
                   
                    <div class="col-sm-6">
                     <center>
                        <img src="<%=resultSet.getString("image")%>" style="width:90%" class="text-center img-fluid  alt="" />
                     </center>
                      <br/>
                      <div class="card black-c">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Game Name : </span>
                              <input type="text" id="name" value="<%=name%>" name="name" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Game Price(LKR) : </span>
                              <input type="hidden" value="<%=gameId%>" name="gameId"/>
                            <input type="number" min="0" value="<%=resultSet.getString("price")%>" id="price" name="price" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Platform : </span>
                            <select id="platform" name="platform" class="form-control border border-warning text-white" >
                                <option class="black-c" value="<%=resultSet.getString("platform")%>" disabled="disabled" selected="selected">Selected - <%=resultSet.getString("platform")%></option>
                                <option class="black-c" value="Windows">Windows</option>
                                <option class="black-c" value="Android">Android</option>
                                <option class="black-c" value="IOS">IOS</option>
                                <option class="black-c" value="Linux">Linux</option>
                                <option class="black-c"value="Ubundu">Ubundu</option>
                            </select>
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Release Date : </span>
                              <input type="date" value="<%=resultSet.getString("realeseDate")%>"  id="realeseDate" name="realeseDate" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                     <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Tag : </span>
                              <input type="text" value="<%=resultSet.getString("Tags")%>"  id="Tag" name="Tag" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      
                      <div class="card black-c">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Story : </span>
                              <textarea  rows="14" value="<%=resultSet.getString("story")%>" id="story" name="story" class="form-control border border-warning text-white" ><%=resultSet.getString("story")%></textarea>
                                  
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Requirement : </span>
                              <textarea  rows="8" id="requiments" value="<%=resultSet.getString("requiments")%>" name="requiments" class="form-control border border-warning text-white" ><%=resultSet.getString("requiments")%></textarea>
                                  
                          </div>
                      </div>
                      <div class="text-end mt-3">
                                <button type="submit" name="submit" class="btn text-dark fw-bolder btn-warning  btn-sm">Update <i class="fas fa-save"></i></button>
                        <a href="gameList.jsp">
                                <button type="button"   name="submit" class="btn text-warning fw-bolder btn-outline-warning  btn-sm">Back </button>
                        </a>
                        <a href="gameDelete?id=<%=resultSet.getString("id")%>">
                                <button type="button"  style="margin-right: 5%;" name="submit" class="btn text-danger fw-bolder btn-outline-danger  btn-sm">Delete </button>
                        </a>
                      </div>
                    </div>
                  </div>
             </div>
             </form>
              <%                
                               }
                            } catch (Exception e) {
                            e.printStackTrace();
                     }
             %>
                 
         </div>
         <jsp:include page="footer.jsp"/>
    </body>
</html>
