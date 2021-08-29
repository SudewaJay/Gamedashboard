<%-- 
    Document   : addGame
    Created on : May 27, 2021, 1:14:28 PM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp"/>
    <body style="background-color: #111111;">
         <jsp:include page="navbar.jsp"/>
         <%
               String playerid = request.getParameter("id");
               String name = request.getParameter("name");
               String gameName = request.getParameter("gameName");
               String score = request.getParameter("score");
               String matchCount = request.getParameter("matchCount");
               String image = request.getParameter("image");
               String gameId = request.getParameter("gameId");
        %> 
         <div class="container " style="margin-top: 158px;">
             <form action="servlet_player_update" method="post"> 
             <div class="container black-c">
                <h1 class="pt-5 pb-5 text-gold-2 text-center fw-light text-uppercase text-decoration-underline">Update Player Profile</h1>
                <div class="row  pb-5">
                    <div class="col-sm-6">
                    <div class="row text-center">
                        <div class="col ms-3 me-3 pt-3 pb-2" style="background-color: #2D3031;">
                            <div class="text-warning h4 fw-light">
                                <%=matchCount%><br/>Match Count
                                <input type="hidden" value="<%=matchCount%>" name="matchCountCurrent" id="matchCountCurrent"/>
                            </div>
                        </div>
                        <div class="col  ms-3 me-3 pt-3 pb-2" style="background-color: #2D3031;">
                            <div  class="text-warning h4 fw-light">
                                 <%=score%><br/>Score Count
                                 <input type="hidden" value="<%=score%>" name="scoreCurrent" id="scoreCurrent"/>
                                 <input type="hidden" value="<%=playerid%>" name="playerid" id="playerid"/>
                                 <input type="hidden" value="<%=gameName%>" name="gameName" id="gameName"/>
                                   <input type="hidden" value="<%=image%>" name="image" id="image"/>
                                   <input type="hidden" value="<%=gameId%>" name="game" id="game"/>
                            </div>
                        </div>
                    </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Game Name : </span>
                            <input type="text" min="0" value="<%=gameName%>" id="price" name="price" class="form-control border border-light text-white" />
                          </div>
                      </div>
                     <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Player Name : </span>
                            <input type="text" min="0" value="<%=name%>" id="price" name="price" class="form-control border border-light text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Player Name : </span>
                            <input type="text" min="0" value="<%=name%>" id="price" name="price" class="form-control border border-light text-white" />
                          </div>
                      </div>
                       <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                               <span class="text-light">Current Score : </span>
                               <input type="number" oninput="scoreFunction()" value="<%=score%>" class="form-control  bg-white"  id="scoreNew" name="scoreNew" required="required"/>
                               
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Match Count : </span>
                              <input type="number"  oninput="MatchCount()" min="0" value="<%=matchCount%>" id="matchNew" name="matchNew" class="form-control border border-light text-white" />
                          </div>
                      </div>
                          <div class="mt-3 text-end pe-4">
                          <button type="submit" name="submit" class="btn btn-outline-warning btn-sm">Save</button>
                      </div>
                      <hr/>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-warning text-capitalize">Score Count Is : <small id="scorer" class="text-warning text-capitalize"></small></span><br/>
                              <span class="text-warning text-capitalize">Player Match Count : <small id="matchr" class="text-warning"> </small></span>
                          </div>
                      </div>
                    </div>
                   
                    <div class="col-sm-6">
                       <img src="https://i.imgur.com/yczvRdw.jpg" class="img-fluid" alt="..." />
                    </div>
                  </div>
             </div>
             </form>
         </div>
         <jsp:include page="footer.jsp"/>
         <script>
            
              function scoreFunction() {
              var x = document.getElementById("scoreNew").value;
              var scoreCurrent = document.getElementById("scoreCurrent").value;
              document.getElementById("scorer").innerHTML = Number(x)+Number(scoreCurrent);
            }
            
            
              function MatchCount() {
              var matchNew = document.getElementById("matchNew").value;
              var scoreCurrent = document.getElementById("scoreCurrent").value;
              document.getElementById("matchr").innerHTML = Number(matchNew)+Number(scoreCurrent);
            }
         </script>
    </body>
</html>
