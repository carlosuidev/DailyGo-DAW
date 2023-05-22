document.addEventListener("DOMContentLoaded", iniciarCarrito);
const contadorPedidos = document.getElementById("contadorPedidos");
const totalBar = document.getElementById("totalBar");
const listProductosBar = document.getElementById("listProductosBar");
const btnCarrito = document.getElementById("btnCarrito");

function iniciarCarrito(){
    mostrarBarraProductos();
}

function mostrarBarraProductos() {
    enlacePedido();

    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        calcularCantidad();
        calcularImporte();
    }else{
        listProductosBar.innerHTML = "No tienes ningún producto en tu carrito :(";
        totalBar.innerHTML = "0.00€";
    }
}

function addProducto(id, precio, nombre){
    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        let carrito = JSON.parse(localStorage.getItem("miCarrito"));

        if(true){

        }
        nuevoProducto = crearNuevoProducto(id, precio, nombre);
        carrito.push(nuevoProducto);
        localStorage.setItem("miCarrito", JSON.stringify(carrito));
    }else{
        nuevoProducto = crarNuevoProducto(id, precio, nombre);
        
        localStorage.setItem("miCarrito", JSON.stringify(nuevoProducto));
    }
}

function crearNuevoProducto(id, precio, nombre){
    return {id: id, precio: precio, nombre: nombre, cantidad: 1};
}

function aumentarCantidad(id){
    try {
        let carrito = JSON.parse(localStorage.getItem("miCarrito"));

        let posicion = carrito.findIndex(function(producto){
            return producto.id == id;
        });

        if(carrito[posicion].cantidad != 99){
            carrito[posicion].cantidad = carrito[posicion].cantidad+1;
        }

        localStorage.setItem("miCarrito", JSON.stringify(carrito));

        mostrarBarraProductos();

        return true;
    } catch (e) {
        return false;
    }
}

function reducirCantidad(id){
    try {
        let carrito = JSON.parse(localStorage.getItem("miCarrito"));

        let posicion = carrito.findIndex(function(producto){
            return producto.id == id;
        });

        if(carrito[posicion].cantidad == 1){
            eliminarProducto(id);
            return true;
        }else{
            carrito[posicion].cantidad = carrito[posicion].cantidad-1;
            localStorage.setItem("miCarrito", JSON.stringify(carrito));
        }

        mostrarBarraProductos();
        
        return true;
    } catch (e) {
        return false;
    }
}

function eliminarProducto(id){
    let carrito = JSON.parse(localStorage.getItem("miCarrito"));
    localStorage.setItem("miCarrito", JSON.stringify(carrito));
    mostrarBarraProductos();
}

function crearComponenteProducto(element){
    const componente = document.createElement("div");
    componente.setAttribute("class", "bg-blue-700 px-3 py-2 rounded-lg");
    const producto = document.createElement("p");
    producto.textContent = element.nombre;
    producto.setAttribute("class", "text-sm text-white font-semibold");

    const divUd = document.createElement("div");
    divUd.setAttribute("class", "flex items-center h-fit mt-1 gap-1.5");
    const ud = document.createElement("p");
    ud.setAttribute("class", "");
    ud.textContent = element.cantidad;
    divUd.appendChild(ud);
    const btnMas = document.createElement("button");
    ud.setAttribute("class", "");
    ud.textContent = element.cantidad;
    divUd.appendChild(ud);

    return componente;
}

function enlacePedido(){
    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        .textContent = "Buscar tiendas";
    }else{
        .textContent = "0";
    }
}

function calcularCantidad(){
    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        contadorPedidos.innerHTML = JSON.parse(localStorage.getItem("miCarrito")).length;
    }else{
        contadorPedidos.innerHTML = "0";
    }
}

function calcularImporte(){
    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        totalBar.textContent = "X";
    }else{
        totalBar.textContent = "0";
    }
}