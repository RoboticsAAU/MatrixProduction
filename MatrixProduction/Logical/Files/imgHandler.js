
var x;
var y;
var z;
var imgVar;
var old_img;
var loadPossible = true;
var timeout = 200;
var CamId = 0;
var scale = 0;
var CamIp = "192.168.200.8";
var testImage = true;
var allowRead = true;
var CompletedAcquisitionCnt_old;
var myTimer;
var scaled = false;
var OPC_read_done = true;
var old_camId = 1;
var drawResults = false;

function DrawCirc(ctx, camIdx, point) {
	//**************************************************
	//** Recursively draw 19 circles if x,y <> 0,0    **
	//************************************************** 
	brease.services.opcua.read([{"nodeId": "::AsGlobalPV:gCam["+camIdx+"].io.di.points["+point+"].x","attributeId": 13}]).then(function(value) {
		x=value.results[0].value;
		//console.log("x: " + x);
		if(x==null) {
			console.log("::AsGlobalPV:gCam["+camIdx+"].io.di.points["+point+"].x is null, might not be enabled in OPCUA config")
			return;
		}
		brease.services.opcua.read([{"nodeId": "::AsGlobalPV:gCam["+camIdx+"].io.di.points["+point+"].y","attributeId": 13}]).then(function(value) {
			y=value.results[0].value;
			
			if(x!==0&&y!==0) {
				x = x/100;
				y = y/100;
				ctx.beginPath();
				ctx.arc(x, y, 7, 0, 2 * Math.PI, false);
				ctx.lineWidth = 3;
				ctx.strokeStyle = '#00ff00';
				ctx.stroke();
				ctx.font = "12px Arial";
				ctx.fillStyle = "#00ff00";
				ctx.fillText(""+point, x+10, y+15);
			}
			if(point < 19) // TODO: fix hardcoded point array size
				DrawCirc(ctx, camIdx, point+=1);
		});
	}); 
}

function DrawLines(ctx, camIdx) {
	//**************************************************
	//** Recursively draw 19 circles if x,y <> 0,0    **
	//************************************************** 
	brease.services.opcua.read([{"nodeId": "::AsGlobalPV:gConfig.videoRegister.laneOffsetPixel["+camIdx+"]","attributeId": 13}]).then(function(value) {
		z=value.results[0].value;
			
			if(z!==0) {
				ctx.beginPath();
				ctx.moveTo(0, z);
				ctx.lineTo(1000, z);
				ctx.lineWidth = 3;
				ctx.strokeStyle = '#ff0000';
				ctx.stroke();
				ctx.fillStyle = "red";
				ctx.font = "30px Arial";
				ctx.fillText("1", 1050, z+88);

				ctx.beginPath();
				ctx.moveTo(0, z+175);
				ctx.lineTo(1000, z+175);
				ctx.lineWidth = 3;
				ctx.strokeStyle = '#ff0000';
				ctx.stroke();
				ctx.fillStyle = "red";
				ctx.font = "30px Arial";
				ctx.fillText("2", 1050, z+88+175);


				ctx.beginPath();
				ctx.moveTo(0, z+175*2);
				ctx.lineTo(1000, z+175*2);
				ctx.lineWidth = 3;
				ctx.strokeStyle = '#ff0000';
				ctx.stroke();
				ctx.font = "30px Arial";
				ctx.fillText("3", 1050, z+88+175*2);


				ctx.beginPath();
				ctx.moveTo(0, z+175*3);
				ctx.lineTo(1000, z+175*3);
				ctx.lineWidth = 3;
				ctx.strokeStyle = '#ff0000';
				ctx.stroke();
				ctx.font = "45px Arial";
				ctx.fillText("4", 1050, z+88+175*3);
                
				ctx.beginPath();
				ctx.moveTo(0, z+175*4);
				ctx.lineTo(1000, z+175*4);
				ctx.lineWidth = 3;
				ctx.strokeStyle = '#ff0000';
				ctx.stroke();
			}
	}); 
}

function initVision() { 
	//************************************************************
	//** initialize content for vision controm        		    **
	//** 1) add canvas to div id=visionContent_CAM_canvas_frame **
	//** 2) declare image and setup canvassize                  **
	//** 3) define onLoad function to redraw image and circles  **
	//************************************************************
	var div = document.querySelector('[id="viControl_content_CAM_canvas_frame"]');
	var html = div.innerHTML;
	div.innerHTML = html.substring(1,html.length-6) + 
	"<canvas id='myCanvas' style='width:100%;height:100%' style='top:0px left:0px'></canvas></div>";
	
	// Use an off-screen image to load the next frame.
	imgVar = new Image();
	old_img = new Image();
	imgVar.src = "test.jpg";
	old_img = imgVar;
	const cnvs = document.getElementById("myCanvas");
	const ctx = cnvs.getContext("2d");
	ctx.canvas.width = div.clientWidth;
	ctx.canvas.height = div.clientHeight;

	myTimer = setInterval(function(){
		
		
	if (OPC_read_done){
		OPC_read_done = false;

		//----- Read useTestImage property ------
		brease.services.opcua.read([{"nodeId": "::mpViewCont:vision_control.useTestImage","attributeId": 13}]).then(function(value) {
			testImage = value.results[0].value;
		});
		//---------------------------------------
		//----- Read Cam id and ip property -----

		tmpId = brease.uiController.widgetsController.getWidget("viControl_content_current_unit").widget.getValue("0");
		brease.services.opcua.read([{"nodeId": "::AsGlobalPV:gCam["+tmpId+"].status.ipAddress","attributeId": 13}]).then(function(value) {
			//NOTE: id and ip is set together to avoid image from one cam and cirles from another.
			CamId = tmpId;
			CamIp = value.results[0].value;
		});

		brease.services.opcua.read([{"nodeId": "::mpViewCont:vision_control.allowRead","attributeId": 13}]).then(function(value) {
			allowRead = value.results[0].value;
		});

		brease.services.opcua.read([{"nodeId": "::mpViewCont:vision_control.camIndex","attributeId": 13}])
		
		//if (old_camId !== CamId){
			loadPossible = true;
		//}
		//old_camId = CamId

		//---------------------------------------
		//------- detect new image ready --------
		brease.services.opcua.read([{"nodeId": "::AsGlobalPV:gCam["+CamId+"].status.CompletedAcquisitionCnt","attributeId": 13}]).then(function(value) {
			OPC_read_done = true;
			if(CompletedAcquisitionCnt_old !== value.results[0].value){
				if(loadPossible && allowRead){
					if(testImage){
						imgVar.src = "test.jpg";
						console.log('CAM id: ' + CamId + ' IP: ' + CamIp + ' loading test image');
}
					else{
						imgVar.src = "http://" + CamIp + ":8080/jpg?q=50+" + (new Date).getTime();
						console.log('CAM id: ' + CamId + ' IP: ' + CamIp + ' loading image');
						loadPossible = false;
					}
				}
			
		
			}
			CompletedAcquisitionCnt_old = value.results[0].value;
		});
		//---------------------------------------
		
	}}, timeout);
		
		
	
	imgVar.onload = () => {
		var scale = scaleToFill(imgVar, ctx);//Math.floor(scaleToFill(imgVar, ctx) * 10 ) / 10;
		// //console.log('scale: ' + scaleToFill(imgVar, ctx) + ',' + scale);
		ctx.resetTransform();
		ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
		ctx.scale(scale,scale);
		ctx.drawImage(imgVar, 0, 0);
		DrawLines(ctx,CamId);
		DrawCirc(ctx, CamId , 0);
		loadPossible = true;
	}
}

function scaleToFill(img, ctx){
    //**************************************************
	//** find scale to fit image in canvas            **
	//************************************************** 
    return Math.min(ctx.canvas.width / img.width, ctx.canvas.height / img.height);
}


