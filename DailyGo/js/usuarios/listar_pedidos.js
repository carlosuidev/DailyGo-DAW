window.addEventListener('DOMContentLoaded', iniciarPedidos);

function iniciarPedidos() {
    listarPedidos();

}

function confirmarRecepcion(id) {

}

function crearComponentePedido(element) {
    const componete = document.createElement("div");
    componete.setAttribute("class", "bg-white border rounded-lg p-5");

    const superior = document.createElement("div");
    superior.setAttribute("class", "flex gap-3 justify-content-between");

    const div = document.createElement("div");

    const id = document.createElement("h4");
    id.textContent = `ID Pedido: ${element['NUM_VEN']}`;
    id.setAttribute("class", "font-bold");
    div.appendChild(id);

    const tienda = document.getElementById("p");
    tienda.textContent = element['RAZSOC'];
    div.appendChild(tienda);

    const estado = document.getElementById("small");
    estado.textContent = element['ESTADO_VEN'];
    switch (element.estado) {
        case "En preparación":
            estado.setAttribute("class", "bg-yellow-200 text-yellow-600 py-0.5 px-2.5 rounded-full")
            break;
        case "Cancelado":
            estado.setAttribute("class", "bg-red-200 text-red-600 py-0.5 px-2.5 rounded-full")
            break;
        case "En reparto":
            estado.setAttribute("class", "bg-yellow-200 text-yellow-600 py-0.5 px-2.5 rounded-full");
            break;
        case "Entregado":
            estado.setAttribute("class", "bg-green-200 text-green-600 py-0.5 px-2.5 rounded-full");
            break;
        case "Valorado":
            estado.setAttribute("class", "bg-green-200 text-green-600 py-0.5 px-2.5 rounded-full");
            break;
        default:
            estado.setAttribute("class", "bg-yellow-200 text-yellow-600 py-0.5 px-2.5 rounded-full");
            break;
    }
    div.appendChild(estado);
    componete.appendChild(div);

    const btn = document.createElement("input");
    btn.setAttribute("type", "button");

    if (element.estado == "En reparto") {
        btn.setAttribute("class", "bg-indigo-600 text-white w-full rounded-md py-2 mt-3 hover:bg-indigo-700 duration-300 font-semibold");
        btn.disabled = false;
        btn.value = "Confirmar recepción";
        btn.setAttribute("onclick", `confirmarRecepcion(${element.id})`);
    } else if (element.estado == "Completado") {
        btn.setAttribute("class", "bg-indigo-600 text-white w-full rounded-md py-2 mt-3 hover:bg-indigo-700 duration-300 font-semibold");
        btn.disabled = false;
        btn.value = "Valorar";
        btn.setAttribute("onclick", `valorarPedido(${element.id})`);
    } else {
        btn.setAttribute("class", "opacity-50 bg-indigo-600 text-white w-full rounded-md py-2 mt-3 hover:bg-indigo-700 duration-300 font-semibold");
        btn.disabled = true;
        btn.value = "Confirmar recepción";
    }
    componete.appendChild(btn);

    return componete;
}

function crearComponenteFila(element) {
    const fila = document.createElement("tr");
    fila.setAttribute("class", "p-4 text-sm font-medium text-blue-800");

    const id = document.createElement("td");
    id.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    id.setAttribute("scope", "col");
    id.textContent = element['num_ven'];
    fila.appendChild(id);

    const producto = document.createElement("td");
    producto.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    producto.setAttribute("scope", "col");
    producto.innerHTML = `
        <div class='flex items-center gap-2'>
            <div class="w-12 h-12 rounded border" style="background-image: url('../../img_bbdd/productos/${element['cod_prod']}.jpg'); background-size: cover; background-position: center bottom;">
            </div>
            <div>
                <p>${element['den_prod']}</p>
                <p class="text-sm font-normal text-blue-300">${element['razsoc']}</p>
            </div>
        </div>
    `;
    fila.appendChild(producto);

    const cantidad = document.createElement("td");
    cantidad.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    cantidad.setAttribute("scope", "col");
    cantidad.textContent = element['cant_det'];
    fila.appendChild(cantidad);

    const direccion = document.createElement("td");
    direccion.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    direccion.setAttribute("scope", "col");
    direccion.textContent = element['DIR_VEN'];
    fila.appendChild(direccion);

    const fecha = document.createElement("td");
    fecha.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    fecha.setAttribute("scope", "col");
    fecha.textContent = element['FECH_VEN'];
    fila.appendChild(fecha);

    return fila;
}

function listarPedidos() {
    const datos = {
        'id': localStorage.getItem("id")
    }
    fetch("../../php/listar_pedidos_usuario.php", {
        method: "POST",
        body: JSON.stringify(datos),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            const historialPedidos = document.getElementById("historialPedidos");
            data.forEach(element => {
                if(element['ESTADO_VEN'] == "Entregado" || element['ESTADO_VEN'] == "Valorado"){
                    historialPedidos.appendChild(crearComponenteFila(element));
                }
            });
        })
        .catch(error => {
            console.error("Error: No se ha podido crear la petición ->", error);
        });
}

function valorarPedido(){

}

function crearComponentePedido(element) {
    const componete = document.createElement("div");
    componete.setAttribute("class", "bg-white border rounded-lg p-5");

    const superior = document.createElement("div");
    superior.setAttribute("class", "flex gap-3 justify-content-between");

    const div = document.createElement("div");

    const id = document.createElement("h4");
    id.textContent = `ID: ${element.id}`;
    id.setAttribute("class", "font-bold");
    div.appendChild(id);

    const tienda = document.getElementById("p");
    tienda.textContent = element.tienda;
    div.appendChild(tienda);

    const estado = document.getElementById("small");
    estado.textContent = element.estado;
    switch (element.estado) {
        case "En preparación":
            estado.setAttribute("class", "bg-yellow-200 text-yellow-600 py-0.5 px-2.5 rounded-full")
            break;
        case "Cancelado":
            estado.setAttribute("class", "bg-red-200 text-red-600 py-0.5 px-2.5 rounded-full")
            break;
        case "En reparto":
            estado.setAttribute("class", "bg-yellow-200 text-yellow-600 py-0.5 px-2.5 rounded-full");
            break;
        case "Entregado":
            estado.setAttribute("class", "bg-green-200 text-green-600 py-0.5 px-2.5 rounded-full");
            break;
        case "Valorado":
            estado.setAttribute("class", "bg-green-200 text-green-600 py-0.5 px-2.5 rounded-full");
            break;
        default:
            estado.setAttribute("class", "bg-yellow-200 text-yellow-600 py-0.5 px-2.5 rounded-full");
            break;
    }
    div.appendChild(estado);
    componete.appendChild(div);

    const btn = document.createElement("input");
    btn.setAttribute("type", "button");

    if (element.estado == "En reparto") {
        btn.setAttribute("class", "bg-indigo-600 text-white w-full rounded-md py-2 mt-3 hover:bg-indigo-700 duration-300 font-semibold");
        btn.disabled = false;
        btn.value = "Confirmar recepción";
        btn.setAttribute("onclick", `confirmarRecepcion(${element.id})`);
    } else if (element.estado == "Completado") {
        btn.setAttribute("class", "bg-indigo-600 text-white w-full rounded-md py-2 mt-3 hover:bg-indigo-700 duration-300 font-semibold");
        btn.disabled = false;
        btn.value = "Valorar";
        btn.setAttribute("onclick", `valorarPedido(${element.id})`);
    } else {
        btn.setAttribute("class", "opacity-50 bg-indigo-600 text-white w-full rounded-md py-2 mt-3 hover:bg-indigo-700 duration-300 font-semibold");
        btn.disabled = true;
        btn.value = "Confirmar recepción";
    }
    componete.appendChild(btn);

    return componete;
}

function crearComponenteFila(element) {
    const fila = document.createElement("tr");
    fila.setAttribute("class", "p-4 text-sm font-medium text-blue-800");

    const id = document.createElement("td");
    id.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    id.setAttribute("scope", "col");
    id.textContent = element['num_ven'];
    fila.appendChild(id);

    const producto = document.createElement("td");
    producto.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    producto.setAttribute("scope", "col");
    producto.innerHTML = `
        <div class='flex items-center gap-2'>
            <div class="w-12 h-12 rounded border" style="background-image: url('../../img_bbdd/productos/${element['cod_prod']}.jpg'); background-size: cover; background-position: center bottom;">
            </div>
            <div>
                <p>${element['den_prod']}</p>
                <p class="text-sm font-normal text-blue-300">${element['razsoc']}</p>
            </div>
        </div>
    `;
    fila.appendChild(producto);

    const cantidad = document.createElement("td");
    cantidad.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    cantidad.setAttribute("scope", "col");
    cantidad.textContent = element['cant_det'];
    fila.appendChild(cantidad);

    const direccion = document.createElement("td");
    direccion.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    direccion.setAttribute("scope", "col");
    direccion.textContent = element['DIR_VEN'];
    fila.appendChild(direccion);

    const fecha = document.createElement("td");
    fecha.setAttribute("class", "p-4 text-sm font-medium text-blue-800");
    fecha.setAttribute("scope", "col");
    fecha.textContent = element['FECH_VEN'];
    fila.appendChild(fecha);

    return fila;
}

function listarPedidos() {
    const datos = {
        'id': localStorage.getItem("id")
    }
    fetch("../../php/listar_pedidos_usuario.php", {
        method: "POST",
        body: JSON.stringify(datos),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            const historialPedidos = document.getElementById("historialPedidos");
            const pedidosActivos = document.getElementById("pedidosActivos");
            data.forEach(element => {
                if(element['ESTADO_VEN'] == "Entregado" || element['ESTADO_VEN'] == "Valorado"){
                    historialPedidos.appendChild(crearComponenteFila(element));
                }
            });
        })
        .catch(error => {
            console.error("Error: No se ha podido crear la petición ->", error);
        });
}

function listarPedidosActivos() {
    const datos = {
        'id': localStorage.getItem("id")
    }
    fetch("../../php/listar_pedidos_activos_usuario.php", {
        method: "POST",
        body: JSON.stringify(datos),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            const historialPedidos = document.getElementById("historialPedidos");
            const pedidosActivos = document.getElementById("pedidosActivos");
            data.forEach(element => {
                if(element['ESTADO_VEN'] !== "Entregado" || element['ESTADO_VEN'] !== "Valorado"){
                    historialPedidos.appendChild(crearComponenteFila(element));
                }
            });
        })
        .catch(error => {
            console.error("Error: No se ha podido crear la petición ->", error);
        });
}

