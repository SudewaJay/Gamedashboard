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
         <div class="container " style="margin-top: 158px;">
             <form action="servlet_add_game" method="post"> 
             <div class="container black-c">
                <h1 class="pt-5 pb-5 text-gold-2 text-center fw-light text-uppercase text-decoration-underline">Add New Game</h1>
                <div class="row  pb-5">
                    <div class="col-sm-6">
                      <div class="card black-c">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Game Name : </span>
                              <input type="text" id="name" name="name" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Game Price : </span>
                            <input type="number" min="0" id="price" name="price" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Platform : </span>
                            <select id="platform" name="platform" class="form-control border border-warning text-white" >
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
                              <input type="date"  id="realeseDate" name="realeseDate" class="form-control border border-warning text-white" />
                          </div>
                      </div>
                     <div class="card black-c mt-4">
                          <div class="container">
                            <div class="row">
                              <div class="col-md">
                                <div class="form-outline ">
                                   <span class="text-light">Tag One </span>
                                   <input type="text"  id="Tags1" name="Tags1" class="form-control black-c  border border-warning text-white" />
                                </div>
                              </div>
                              <div class="col-md">
                                <div class="form-outline ">
                                  <span class="text-light">Tag Two </span>
                                  <input type="text" id="Tags2" name="Tags2"  class="form-control black-c  border border-warning text-white" />
                                </div>
                              </div>
                              <div class="col-md">
                                <div class="form-outline ">
                                  <span class="text-light">Tag Three </span>
                                  <input type="text" id="Tags3" name="Tags3" name="file" class="form-control black-c  border border-warning text-white" />
                                </div>
                              </div>
                            </div>
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Attach Image: </span>
                               <input type="text" id="image" name="image" class="form-control black-c  border border-warning text-white" />
                          </div>
                      </div>
                    </div>
                    <div class="col-sm-6">
                      
                      <div class="card black-c">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Story : </span>
                              <textarea  rows="10"  id="story" name="story" class="form-control border border-warning text-white" ></textarea>
                                  
                          </div>
                      </div>
                      <div class="card black-c mt-4">
                          <div class="form-outline ms-4 me-4">
                              <span class="text-light">Requirement : </span>
                              <textarea  rows="6" id="requiments" name="requiments" class="form-control border border-warning text-white" ></textarea>
                                  
                          </div>
                      </div>
                        <div class="text-end mt-3 " style="margin-right: 5%;">
                             <button type="submit" name="submit" class="btn text-dark fw-bolder btn-warning  btn-sm">Save <i class="fas fa-save"></i></button>
                        </div>
                    </div>
                  </div>
             </div>
             </form>
         </div>
         <jsp:include page="footer.jsp"/>
    </body>
</html>
