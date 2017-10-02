function closeMenu() {
    document.getElementById("layer").style.width = "0";
    document.getElementById("sideMenu").style.width = "0";
    document.getElementById("prime-cont").style.paddingLeft = "0px";
    document.getElementById("navBtn").style.marginRight = "10px";
}

function openMenu() {
    if (screen.width >= 1024) {
        document.getElementById("layer").style.width = "0";
        document.getElementById("sideMenu").style.width = "240px";
        document.getElementById("prime-cont").style.paddingLeft = "240px";
        document.getElementById("navBtn").style.marginRight = "250px";
    }

    else if ((screen.width < 1024) && (screen.width >= 425)) {
        document.getElementById("layer").style.width = "100vw";
        document.getElementById("sideMenu").style.width = "320px";
        setTimeout(function () { document.getElementById("sideMenu").style.width = "0"; document.getElementById("layer").style.width = "0vw"; }, 2500);
    }
    else {
        document.getElementById("layer").style.width = "100vw";
        document.getElementById("sideMenu").style.width = "100vw";

        setTimeout(function () { document.getElementById("sideMenu").style.width = "0"; document.getElementById("layer").style.width = "0vw"; }, 2500);
    }
}

function openWindow() {
    if (screen.width >= 1024) {
        document.getElementById("layer").style.width = "0vw";
        document.getElementById("sideMenu").style.width = "240px";
        document.getElementById("prime-cont").style.paddingLeft = "240px";
        document.getElementById("btnLogout").style.marginRight = "250px";
    }

    else if ((screen.width < 1024) && (screen.width >= 425)) {
        document.getElementById("layer").style.width = "0vw";
        document.getElementById("sideMenu").style.width = "0px";

        setTimeout(function () { document.getElementById("sideMenu").style.width = "0"; document.getElementById("layer").style.width = "0vw"; }, 2500);
    }

    else {
        document.getElementById("layer").style.width = "0vw";
        document.getElementById("sideMenu").style.width = "100vw";

        setTimeout(function () { document.getElementById("sideMenu").style.width = "0"; document.getElementById("layer").style.width = "0vw";}, 1000);
    }
}