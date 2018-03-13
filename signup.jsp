
<html>

<head>
  
  <title>Sign-Up</title>
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>



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






  <div class="form" style="transform: translateY(-112%);">
      
      <ul class="tab-group">
        <li ><a style="background:green;color: #ffffff;" >Sign Up</a></li>
        <li ><a href="log.jsp">Log In</a></li>
      </ul>
      
      
        <div id="signup">   
          <h1>Register Now</h1>
          
          <form action="doreg.jsp" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <input type="text" name="fname" required autocomplete="off" placeholder="First Name*">
            </div>
        
            <div class="field-wrap">
              <input type="text" name="lname" required autocomplete="off" placeholder="Last Name*">
            </div>
          </div>

          <div class="field-wrap">
            <input type="email"required autocomplete="off" name="email" placeholder="Email Address*">
          </div>
          
          <div class="field-wrap">
            <input type="password"required autocomplete="off" name="pass" placeholder="Set Password*">
          </div>
          
          <button type="submit" class="button"/>Get Started</button>
          
          </form>
        </div>
     
</div> 




</body>

</html>
