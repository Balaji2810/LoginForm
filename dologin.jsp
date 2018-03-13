<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
String userid=request.getParameter("e"); 
session.setAttribute("userid",userid); 
String pwd=request.getParameter("p"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1","root","MYSQL"); 
Statement st= con.createStatement(); 
String msg,msg2,msg3;

ResultSet rs=st.executeQuery("select * from login where email='"+userid+"'"); 
if(rs.next()) 
{ 
if(rs.getString(1).equals(pwd)) 
{ 
msg="welcome, "+rs.getString(2);
msg3="\nHow was your day"; 
msg2="Log Out";
} 
else 
{ 
msg="Invalid password try again"; 
msg2="Go Back";
msg3="check your password";
} 
} 
else	 
{	
msg="Invalid eMail try again";
msg2="Go Back";
msg3="check your eMail address";
}
%>
<canvas id="c"></canvas>
        
        <script>
        
        var c = document.getElementById("c");
        var ctx = c.getContext("2d");

        
        c.height = window.innerHeight;
        c.width = window.innerWidth;

        
        var matrix = "QWERTYUIOPLKJHGFDSAZXCVBNM123456789@#$%^&*()*&^";
        
        matrix = matrix.split("");

        var font_size = 10;
        var columns = c.width/font_size; 
        
        var drops = [];
        
        
        for(var x = 0; x < columns; x++)
            drops[x] = 1; 

        

    function getRandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
    }

        
        function draw()
        {
            
            
            
            ctx.fillStyle = "rgba(0, 0, 0, 0.04)";
            ctx.fillRect(0, 0, c.width, c.height);

            ctx.fillStyle = "green";
            ctx.font = font_size + "px arial";
           
            for(var i = 0; i < drops.length; i++)
            {
                
                var text = matrix[Math.floor(Math.random()*matrix.length)];
                                ctx.fillText(text, i*font_size, drops[i]*font_size);

                
                                if(drops[i]*font_size > c.height && Math.random() > 0.975)
                    drops[i] = 0;

                
                drops[i]++;
            }
        }

        var za=1; 

        setInterval(draw, 40);

        
        </script>
  <div class="form" style="transform: translateY(-135%);">


<h1><%=msg%> <br><%=msg3%></h1>




<%if(msg2.equals("Log Out"))
{
%>
<br>
<form action="update.jsp">
<button type="submit" class="button" >Update Details</button>
</form>
<br>
<form action="delete.jsp">
<button type="submit" class="button">Delete Account</button>
</form><br>
<%

}
else {
	
%>

<br><br><br><br><br><br><br><br>
<%}%>
<form action="log.jsp">
<button type="submit" class="button" ><%=msg2%></button>
</form>

</div>
</body>
</html>