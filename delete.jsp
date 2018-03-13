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
String email=(String)session.getAttribute("userid");


Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1","root","MYSQL"); 
Statement st= con.createStatement(); 

ResultSet rs;
st.executeUpdate("delete from login where email='"+email+"'"); 
//ut.println(email);






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

  <div class="form" style="transform: translateY(-200%);">


<h1>Your account, <%=email%> </h1>
<h1>Is Deleted Successfully...</h1>
<form action="log.jsp">
<button type="submit" class="button" >Go Back</button>
</form>
</div>

</html>