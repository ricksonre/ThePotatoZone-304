<!DOCTYPE html>
<html>

<%@ include file='header.jsp' %>

<head>
<meta charset="ISO-8859-1">
<title>Search For Potato!</title>
<script src="https://unpkg.com/ml5@0.1.3/dist/ml5.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.3/p5.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.7.3/addons/p5.dom.js"></script>
      <script>
      
      var mobilenet;
      var canv;
      var MyMup = false;
      var ctx;
      var background2 = new Image();
      background2.src = "https://cdn.discordapp.com/attachments/468719321087082516/649902104399577088/image1.jpg";
      function modelReady(){
          console.log('Model ready');
      }
      

      function setup(){
    	  
    	  
          canv = createCanvas(640,480);
          background(100);
          canv.drop(gotFile);
          
          mobilenet  = new ml5.imageClassifier('MobileNet',modelReady);
          clearSoup();
          frameRate(120);
         
          
      }

      
      

      function gotFile(file) {
        // If it's an image file
        if (file.type === 'image') {
          // Create an image DOM element but don't show it
          const img = createImg(file.data).hide();
          // Draw the image onto the canvas
          image(img, 0, 0, width, height);
        } else {
          console.log('Not an image file!');
        }
      }
     
      
      function clearSoup(){
          fill(255);
          canv.clear(0, 0, width, height);
          fill(0);
      }
      function changeGray(){
         MyMup=true;
      }
      function stopGray(){
          MyMup=false;
      }

      function predict(){
          
          var savedData = document.getElementById("images");
          savedData.src = canvas.toDataURL();
          console.log(savedData);
          mobilenet.predict(savedData, getResult);
          
          
          
          
      }
      function getResult(erroo, resu){
          console.log(resu);
          document.getElementById("text1").innerHTML = "Prediction:"+resu[0].className;
      }
      function imageReady(){
          
      }

      
      </script>
</head>
<body>
<p id="text1">Prediction</p>
        
        <button type="button" onclick={predict()}>find product</button>
        <button type="button" onclick={clearSoup()}>Clear</button>
        <img id="images">


</body>
</html>