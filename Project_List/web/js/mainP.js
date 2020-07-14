/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function mostrar() {
  
    document.getElementById("btnMostrar").style.display = "none";
    document.getElementById("listamostrar").style.display = "block";

}

function openNav() {
    document.getElementById("mySidenav").style.width = "263px";
    document.getElementById("main").style.marginLeft = "263px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "170px";
}
