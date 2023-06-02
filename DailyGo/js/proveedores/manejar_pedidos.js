document.addEventListener('DOMContentLoaded', iniciarProveedor);

const btnActualizar = document.getElementById("btnActualizar");


function iniciarProveedor() {
    personalizarUI();
    mostrarSolicitudes();
    mostrarPendientes();    
    btnActualizar.addEventListener("click", () => {
        mostrarSolicitudes();
        mostrarPendientes();
    });
}

function personalizarUI() {
    try {
        // Imagen de fondo
        const hero = document.getElementById("hero-proveedor");
        const cif = localStorage.getItem("cif");
        hero.style.backgroundImage = `linear-gradient(to bottom, rgba(16, 14, 52, 0.2), rgba(16, 14, 52, 0.9)), url('../../img_bbdd/fondos/${cif}.jpg')`;
        hero.style.backgroundSize = "cover";
        hero.style.backgroundPosition = "center";
        // Nombre proveedor - razón social
        const razonProv = document.getElementById("razonProv");
        razonProv.innerHTML = "aa"
        razonProv.innerHTML = localStorage.getItem("razonSocial");
        //Logo
        const logo = document.getElementById("logoProveedor");
        logo.style.backgroundImage = `url('../../img_bbdd/proveedores/${cif}.jpg')`;
        logo.style.backgroundSize = "cover";
        logo.style.backgroundPosition = "center";
    } catch (e) {
        console.log("Sin imágenes");
    }
}

function crearComponenteSolicitud(element) {
    const componente = document.createElement("componente");
    componente.setAttribute("class", "")
}

function crearComponentePendientes(){

}

function mostrarSolicitudes() {

}

function modificarEstado(idPedido, estado) {
    const datos = {
        id: idPedido,
        estado: estado
    }


}

