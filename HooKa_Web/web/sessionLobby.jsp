<%-- 
    Document   : sessionLobby
    Created on : 5 Apr 2022, 7:24:30 pm
    Author     : zhaoyiwu
--%>


<%@page import="ee.hooka.User"%>
<%@page import="ee.hooka.Session"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Timer"%>
<%@page import="java.util.TimerTask"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/master.css"> <%--Link to css--%>
        <link rel="icon" type="image/png" href="images/ZacZee's-logos_white.png"/> <%--Favicon--%>
        <title>HooKa - Sessions</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <jsp:include page="startSession" />
        <% 
                User c = (User) session.getAttribute("user");
            %>
        
        <div class="navbar">
<!--            <a href="index.jsp" ><img src="images/ZacZee's-logo-nav.png" alt="ZacZee's" width="30" Height="30"/></a>-->
             
            
            <% if(c == null){ %>
            
            <a href="register.jsp" >Register</a>
            <a href="login.jsp" >Login</a>
            
            <% }else{ %>
            
<!--            <form class="navForm" action="search" method="post" style="float: left">
                <input type="submit" value="Products"/>
            </form>
            <form class="navForm" action="cart" method="get" style="float: left">
                <input type="submit" value="Cart"/>
            </form> 
            <form class="navForm" action="profile" method="get" style="float: left">
                <input type="submit" value="Profile"/>
            </form>-->
<!--            <form class="navForm" action="logout" method="post">
                <input type="submit" value="Logout"/>
            </form>-->
            
            <% } %>
        </div>
        
        <br/><br/><br/>
        <div class="display">
            <% if(c == null){ %>
            <h1>Welcome to HooKa, Login to get started!</h1>

            <% }else{ 

            List<String> students = (ArrayList<String>) session.getAttribute("students");
            %>
            
            <div style="text-align: center">
                <font color="red">
                        <%=request.getAttribute("message")==null?"":request.getAttribute("message")%><br/>
                </font>
                <br/>
            </div>
            
            <h1>Waiting for students to join</h1>
            <h1>Current count: <%=students.size()%></h1>
            
            <form action="startSession" method="post">
                <input type="submit" value="Refresh"/>
            </form>
            
            <div class="outergrid">
            <% 
            if(students == null || students.size() <= 0){
            %>
            <tr><td colspan="5">(No students yet)</td></tr>
            <%
            }else{
                for(String student:students){
                %>
                
                    <div class="innergrid">
                            <b><%=student%></b>
                    </div>
                
                <%
                }
                
            }
            %>
            </div>
            
            <div>
            <form action="retrieveQuestion" method="post">
                <input type="submit" value="Show First Question"/>
            </form>
            </div>
            
            <% } %>
            
            <!--<div class="displaySub">    
                <div><h2>New Arrivals</h2></div>
                <div><img src="images/landingPageDisplay.jpg" alt="chuck 70 high tops" width=85%/></div>
                <div><img src="images/landingPageDisplay2.jpg" alt="yeezy slides onxy" width=90%/></div>
            </div>-->
        </div>
        
            
    </body>
</html>
