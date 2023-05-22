document.addEventListener("DOMContentLoaded", iniciarCarrito);
const contadorPedidos = document.getElementById("contadorPedidos");
const totalBar = document.getElementById("totalBar");
const listCarrito = document.getElementById("listCarrito");
const btnCarrito = document.getElementById("btnCarrito");

function iniciarCarrito(){
    mostrarBarraProductos();
}

function mostrarBarraProductos() {
    enlacePedido();
    listCarrito.innerHTML = "";

    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        let carrito = JSON.parse(localStorage.getItem("miCarrito"));
        
        carrito.forEach(producto => {
            listCarrito.appendChild(crearComponenteProductoCarrito(producto));
        });

        //calcularCantidad();
        //calcularImporte();
    }else{
        listCarrito.innerHTML = "No tienes ningún producto en tu carrito :(";
        totalBar.innerHTML = "0.00€";
    }
}

function addProducto(id, precio, nombre, tienda){
    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        let carrito = JSON.parse(localStorage.getItem("miCarrito"));

        const posicion = obtenerPosicionProducto(carrito);
        if(posicion != -1){
            if(carrito.cantidad[posicion] != 99){
                carrito.cantidad[posicion] = carrito.cantidad[posicion]+1;
            }else{
                return true;
            }
        }else{
            nuevoProducto = crearNuevoProducto(id, precio, nombre);
            carrito.push(nuevoProducto);
        }
        
        localStorage.setItem("miCarrito", JSON.stringify(carrito));
    }else{
        let arrayObj = [];
        nuevoProducto = crearNuevoProducto(id, precio, nombre);
        arrayObj.push(nuevoProducto);
        localStorage.setItem("miCarrito", JSON.stringify(arrayObj));
    }

    mostrarBarraProductos();
}

function crearNuevoProducto(id, precio, nombre, tienda){
    return {id: id, precio: precio, nombre: nombre, cantidad: 1, tienda: tienda};
}

function obtenerPosicionProducto(carrito, idProd){
    let posicion = carrito.findIndex(function(producto){
            return producto.id == idProd;
    });

    return posicion;
}

function aumentarCantidad(id){
    try {
        let carrito = JSON.parse(localStorage.getItem("miCarrito"));

        let posicion = obtenerPosicionProducto(carrito, id);

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
    carrito.splice(obtenerPosicionProducto(id), 1);
    mostrarBarraProductos();
}

function crearComponenteProductoCarrito(element){
    const componente = document.createElement("div");
    componente.setAttribute("class", "bg-blue-700 px-3 py-2 rounded-lg w-fit");
    const producto = document.createElement("p");
    producto.textContent = element.nombre;
    producto.setAttribute("class", "text-sm text-white font-semibold");
    componente.appendChild(producto);

    const divUd = document.createElement("div");
    divUd.setAttribute("class", "flex items-center h-fit mt-1 gap-1.5");
    const ud = document.createElement("p");
    ud.setAttribute("class", "text-xs text-white/60 mr-2");
    ud.textContent = element.cantidad;
    divUd.appendChild(ud);

    const btnMas = document.createElement("button");
    btnMas.setAttribute("class", "mr-1 bg-indigo-700 hover:bg-indigo-800 duration-300 rounded-full h-5 w-5 flex items-center justify-center");
    btnMas.setAttribute("onclick", `aumentarCantidad(${element.id})`);
    btnMas.textContent = "+";
    divUd.appendChild(btnMas);

    const btnMenos = document.createElement("button");
    btnMenos.setAttribute("class", "mr-1 bg-indigo-700 hover:bg-indigo-800 duration-300 rounded-full h-5 w-5 flex items-center justify-center");
    btnMenos.setAttribute("onclick", `reducirCantidad(${element.id})`);
    btnMenos.textContent = "-";
    divUd.appendChild(btnMenos);
    componente.appendChild(divUd);

    return componente;
}

function enlacePedido(){
    const enlace = document.getElementById("enlacePedido");
    if(typeof localStorage !== "undefined" && localStorage.getItem("miCarrito")){
        enlace.setAttribute("href", "carrito.html");
        enlace.textContent = "Pedir ahora";
    }else{
        enlace.setAttribute("href", "busqueda_tiendas.php");
        enlace.textContent = "Buscar tiendas";
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
        const carrito = document.getElementById("")
        totalBar.textContent = "X";
    }else{
        totalBar.textContent = "0";
    }
}