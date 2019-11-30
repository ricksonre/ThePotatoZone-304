<div>Teachable Machine Image Model</div>
<button type="button" onclick="init()">Start</button>
<div id="webcam-container"></div>
<div id="label-container"></div>
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@1.3.1/dist/tf.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@0.8/dist/teachablemachine-image.min.js"></script>
<script type="text/javascript">
    // More API functions here:
    // https://github.com/googlecreativelab/teachablemachine-community/tree/master/libraries/image

    // the link to your model provided by Teachable Machine export panel
    async function init() {
    let model;
    model = await tmImage.load("ressource/model.json","ressource/metadata.json");
    
    const flip = false;
    const maxPredictions = model.getTotalClasses();
    var myImage = new Image(200, 200);
    myImage.src = "ressource/ptt.jpg";
    const prediction = await model.predictTopK(myImage, maxPredictions, flip);
    for (let i = 0; i < maxPredictions; i++) {
        const classPrediction =
            prediction[i].className + ": " + prediction[i].probability.toFixed(2);
        document.write(classPrediction);
    }
   
    }
</script>


