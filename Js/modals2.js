

function openSignModal() {
    document.getElementById("signModal").style.width = "100vw";
}

function closeModal() {
    document.getElementById("signModal").style.width = "0vw";
}

window.onclick = function (event) {
    if ((event.target == document.getElementById("signModal")) || (event.target == document.getElementById("logModal")))
        closeModal();
}