// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
var myVar = setInterval(myTimer, 1000);
function myTimer() {
    if(document.getElementById('Fin').value == false){
        $("#timeClock").html(parseInt($("#timeClock").html()) + 1);
    } else {
        $("#timeClock").html(parseInt($("#timeClock").html()));
    }
}  