window.addEventListener('DOMContentLoaded', iniciarResumenCompra);



function iniciarResumenCompra() {
    mostrarProductos();
}

function mostrarProductos() {
    const listaProductosTabla = document.getElementById("listaProductosTabla");
    listaProductosTabla.innerHTML = "";
    if (typeof localStorage !== "undefined" && localStorage.getItem("miCarrito") && JSON.parse(localStorage.getItem("miCarrito")).length >= 1) {
        let carrito = JSON.parse(localStorage.getItem("miCarrito"));

        carrito.forEach(producto => {
            listaProductosTabla.appendChild(crearFila(producto));
        });
    } else {
        listaProductosTabla.innerHTML = "<tr><td class='p-4 text-sm'>(Sin productos)</td></tr>";
    }
}

function crearFila(element) {
    const fila = document.createElement("tr");
    fila.setAttribute("class", "hover:bg-blue-100/20 duration-300")

    const tdNombre = document.createElement("td");
    tdNombre.setAttribute("class", "p-4 text-sm font-medium");
    tdNombre.innerHTML = `
        <div class='flex items-center gap-2'>
            <div class='w-12 h-12 rounded border' style='background-image: url("../../img_bbdd/productos/${element.id}.jpg"); background-size: cover; background-position: center bottom;'>
            </div>
            <div>
                <p>${element.nombre}</p>
                <p class="text-sm font-normal text-blue-300">${element.tienda}</p>
            </div>
        </div>
    `;
    fila.appendChild(tdNombre);

    const tdPrecio = document.createElement("td");
    tdPrecio.setAttribute("class", "p-4 text-sm");
    tdPrecio.textContent = `${element.precio.toFixed(2)}€`;
    fila.appendChild(tdPrecio);

    const tdCantidad = document.createElement("td");
    tdCantidad.setAttribute("class", "p-4 text-sm text-center");
    tdCantidad.innerHTML = `
        <div class="flex gap-2">
            <button onclick='aumentarCantidad(${element.id})' class="cursor-pointer duration-300 bg-white border border-blue-200 hover:bg-green-500 w-5 h-5 font-bold rounded-full" onclick="aumentarCantidad(id)">
                <p class="relative bottom-0.5">+</p>
            </button>
            <p>${element.cantidad}</p>
            <button onclick='reducirCantidad(${element.id})' class="cursor-pointer duration-300 bg-white border border-blue-200 hover:bg-red-500 w-5 h-5 font-bold rounded-full" onclick="reducirCantidad(id)">
                <p class="relative bottom-0.5">-</p>
            </button>
        </div>
    `;
    fila.appendChild(tdCantidad);

    const tdTotal = document.createElement("td");
    tdTotal.setAttribute("class", "p-4 text-sm");
    tdTotal.textContent = `${(element.precio*element.cantidad).toFixed(2)}€`;
    fila.appendChild(tdTotal);

    const tdEliminar = document.createElement("td");
    tdEliminar.setAttribute("class", "p-4 text-sm text-center");
    tdEliminar.innerHTML = `
    <button
    class="cursor-pointer duration-300 bg-white border border-red-500 text-red-500 hover:text-white hover:bg-red-500 w-5 h-5 rounded-full"
    onclick="eliminarProducto(${element.id})">
        <p class="relative bottom-0.5">x</p>
    </button>
    `;
    fila.appendChild(tdEliminar);

    return fila;
}

function eliminarProducto(id) {
    let carrito = JSON.parse(localStorage.getItem("miCarrito"));
    carrito.splice(obtenerPosicionProducto(carrito, id), 1);
    localStorage.setItem("miCarrito", JSON.stringify(carrito));
    mostrarProductos();
}

function aumentarCantidad(id) {
    let carrito = JSON.parse(localStorage.getItem("miCarrito"));
    let pos = obtenerPosicionProducto(carrito, id);
    if(carrito[pos].cantidad < 99){
        carrito[pos].cantidad = carrito[pos].cantidad+1;
        localStorage.setItem("miCarrito", JSON.stringify(carrito));
        mostrarProductos();
    }else{
        return true;
    }
}

function reducirCantidad(id) {
    let carrito = JSON.parse(localStorage.getItem("miCarrito"));
    let pos = obtenerPosicionProducto(carrito, id);
    if(carrito[pos].cantidad != 1 ){
        carrito[pos].cantidad = carrito[pos].cantidad-1;
        localStorage.setItem("miCarrito", JSON.stringify(carrito));
        mostrarProductos();
    }else{
        eliminarProducto(id);
    }
}

function obtenerPosicionProducto(carrito, id) {
    const pos = carrito.findIndex(function (producto) {
        return producto.id == id;
    });

    return pos;
}