setTimeout(closeMenu(),1000);

function openMenu() {
	document.getElementById("layer").style.width = "100vw";
	if(screen.width>600)
    {	
    	document.getElementById("sideMenu").style.width = "320px";
    	document.getElementById("main").style.marginLeft = "320px";
	}
	else
	{
		document.getElementById("sideMenu").style.width = "100vw";
    	document.getElementById("main").style.marginLeft = "100vw" ;
	}
}

function closeMenu() {
	document.getElementById("layer").style.width = "0";
    document.getElementById("sideMenu").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "#fff";
}