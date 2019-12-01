<%@ include file='header.jsp' %>
<br>
<br>
<div>Find your Potato!</div>
<input type="file" onchange="previewFile()"><br>
<img src="img/ptt.jpg" height="200" alt="Image preview...">
<button type="button" onclick="init()">Start</button>
<div id="webcam-container"></div>
<div id="label-container"></div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>

<script type="text/javascript">
	var preview= document.querySelector('img');
	function previewFile() {
	  
	  var file    = document.querySelector('input[type=file]').files[0];
	  var reader  = new FileReader();

	  reader.addEventListener("load", function () {
	    preview.src = reader.result;
	  }, false);

	  if (file) {
	    reader.readAsDataURL(file);
	  }
	}
	
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    async function init() {
    let model;
    model = await tmImage.load("ressource/model.json","ressource/metadata.json");
    
    const flip = false;
    const maxPredictions = model.getTotalClasses();
    var myImage = new Image(200, 200);
    
    myImage.src = preview.src;
    const prediction = await model.predictTopK(myImage, maxPredictions, flip);
    for (let i = 0; i < maxPredictions; i++) {
        const classPrediction =
            prediction[i].className + ": " + prediction[i].probability.toFixed(2);
        document.write(classPrediction);
    }
   	
    console.log("Best Prediction:"+prediction[0].className);
    
    switch(prediction[0].className){
    	
    case "Potanto":location.replace("product.jsp?id=4");
    	break;
    case "Potatoes":location.replace("product.jsp?id=5");
    	break;
    case "PotatoBox":location.replace("product.jsp?id=1");
    	break;
    case "BoxPotato":location.replace("product.jsp?id=2");
    	break;
    case "RustyPotatoes":location.replace("product.jsp?id=7");
    	break;
    case "WildPotato":location.replace("product.jsp?id=6");
    	break;
    case "TrapPotato":location.replace("product.jsp?id=10");
    	break;
    case "DryPotato":location.replace("product.jsp?id=8");
    	break;
    case "PotatoTrap":location.replace("product.jsp?id=9");
    	break;
    
    
    
    }
    
    }
</script>


