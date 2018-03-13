
<html>

<head>
  
  <title>Login Form</title>
  
  
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



  <div class="form" style="transform: translateY(-130%);">
      
      <ul class="tab-group">
        <li ><a href="signup.jsp">Sign Up</a></li>
        <li ><a style="background: green;color: #ffffff;" >Log In</a></li>
      </ul>
      
     
        
        <div id="login">   
          <h1>Welcome</h1>
          
          <form action="dologin.jsp" method="post">
          
            <div class="field-wrap">
            <input name="e" type="email" required autocomplete="on" placeholder="Email Address*">
          </div>
          
          <div class="field-wrap">
            <input name="p" type="password"required autocomplete="off" placeholder="Password*">
          </div>
                             
          <button class="button"/>Log In</button>
          
          </form>

        </div>
        
      </div>
      
</div> 




</body>

</html>
