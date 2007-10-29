var loadingImage = 'images/ajax-loader.gif';		

// Returns array with x,y page scroll values.
// Core code from - quirksmode.org
function getPageScroll(){
	var yScroll;
	if (self.pageYOffset) {
		yScroll = self.pageYOffset;
	} else if (document.documentElement && document.documentElement.scrollTop){	 // Explorer 6 Strict
		yScroll = document.documentElement.scrollTop;
	} else if (document.body) {// all other Explorers
		yScroll = document.body.scrollTop;
	}

	arrayPageScroll = new Array('',yScroll) 
	return arrayPageScroll;
}

// Returns array with page width, height and window width, height
// Core code from - quirksmode.org
// Edit for Firefox by pHaez
function getPageSize(){
	
	var xScroll, yScroll;
	if (window.innerHeight && window.scrollMaxY) {	
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}
	
	var windowWidth, windowHeight;
	if (self.innerHeight) {	// all except Explorer
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) { // other Explorers
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}	
	
	// for small pages with total height less then height of the viewport
	if(yScroll < windowHeight){
		pageHeight = windowHeight;
	} else { 
		pageHeight = yScroll;
	}
	// for small pages with total width less then width of the viewport
	if(xScroll < windowWidth){	
		pageWidth = windowWidth;
	} else {
		pageWidth = xScroll;
	}
	arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight) 
	return arrayPageSize;
}


function showLoader(objLink)
{
	// prep objects
	//var objOverlay = document.getElementById('overlay');
	var objLoadingImage = document.getElementById('loadingImage');
	
	var arrayPageSize = getPageSize();
	var arrayPageScroll = getPageScroll();

	// center loadingImage if it exists
   if (objLoadingImage) {
   	objLoadingImage.style.top = (arrayPageScroll[1] + ((arrayPageSize[3] - 35 - objLoadingImage.height) / 2) + 'px');
   	objLoadingImage.style.left = (((arrayPageSize[0] - 20 - objLoadingImage.width) / 2) + 'px');
   	objLoadingImage.style.display = 'block';
   }
	//// set height of Overlay to take up whole page and show
	//objOverlay.style.height = (arrayPageSize[1] + 'px');
	//objOverlay.style.display = 'block';
}

function hide_loader()
{
	// get objects
	//objOverlay = document.getElementById('overlay');
	objLoadingImage = document.getElementById('loadingImage');
	// hide overlay
		//objOverlay.style.display = 'none';
	//Effect.Fade(objOverlay, {duration: .3});
	//objLoadingImage.style.display = 'none';
	Effect.Fade(objLoadingImage, {duration: .3})
}

function show_loader() {
  showLoader(this); return false;
}