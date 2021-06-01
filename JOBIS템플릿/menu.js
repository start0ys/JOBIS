/**
 * 
 */
var menu = document.querySelectorAll(".menu");
var subMenu = document.querySelectorAll(".subMenu");


for (var i = 0; i < menu.length; i++) {
    HiddenVisible(i);

}


function HiddenVisible(i) {

    menu[i].addEventListener("mouseout", function () {
        subMenu[i].style.visibility = "hidden";
    });

    menu[i].addEventListener("mouseover", function () {
        subMenu[i].style.visibility = "visible";
    });
    subMenu[i].addEventListener("mouseout", function () {
        subMenu[i].style.visibility = "hidden";
    });

    subMenu[i].addEventListener("mouseover", function () {
        subMenu[i].style.visibility = "visible";
    });


}