document.addEventListener("DOMContentLoaded", iniciarCarrito);
const contadorPedidos = document.getElementById("#ontadorPedidos")
const totalBar = document.getElementById("totalBar");
const listProductosBar = document.getElementById("listProductosBar");

function iniciarCarrito(){
    mostrarBarraProductos();
}

function mostrarBarraProductos() {
    if(typeof localStorage !== "undefined" && localStorage.getItem("pedidoSesion")){
        totalBar.innerHTML = "0,00€";
    }else{
        listProductosBar.innerHTML = "No tienes ningún producto en tu carrito :(";
        totalBar.innerHTML = "0,00€";
    }
}

function objetoProducto(){
    
}