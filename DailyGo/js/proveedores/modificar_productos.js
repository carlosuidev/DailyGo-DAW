document.addEventListener('DOMContentLoaded', mostrarDatos);

const productosIniciales = document.getElementById("productosIniciales");
const razonProv = document.getElementById("razonProv");
const datosProductos = document.getElementById('mostrarDatosProductos');
const cif = localStorage.getItem("cif");
const razonSocial = localStorage.getItem("razonSocial");
const logo = document.getElementById("logoProveedor");
const hero = document.getElementById("hero-proveedor");
const nombreProducto = document.getElementById("nombreProducto");
const imagenProducto = document.getElementById("imagenProducto");
const imgEdit = document.getElementById("imgEdit");
const precioUnitario = document.getElementById("precioUnitario");

const ocultoImagen = document.getElementById("ocultoImagen");
const ocultoNombre = document.getElementById("ocultoNombre");
const ocultoDinero = document.getElementById("ocultoDinero");

const msgImagen = document.getElementById("msgImagen");
const msgNombreProducto = document.getElementById("msgNombreProducto");
const msgPrecioUnitario = document.getElementById("msgPrecioUnitario");


const correctoDatos = document.getElementById("correctoDatos");
const incorrectoDatos = document.getElementById("incorrectoDatos");

// const correctoContrasena = document.getElementById("correctoContrasena");
// const incorrectoContrasena = document.getElementById("incorrectoContrasena");

const btnNombreProducto = document.getElementById("btnNombreProducto");
const btnPrecioUnitario = document.getElementById("btnPrecioUnitario");
const btnImagen = document.getElementById("btnImagen");
// const btnTelefono = document.getElementById("btnTelefono");
// const btnCorreo = document.getElementById("btnCorreo");
// const btnBanner = document.getElementById("btnBanner");
// const btnContrasena = document.getElementById("btnContrasena");
// const btnPerfil = document.getElementById("btnPerfil");

//
let validarImagenTrue = '';
let validarNombre = '';
let precioUnitarioValidado = '';
// let validacionDirec = '';
// let validacionCorreo = '';
// let validacionTelefono = '';
// let validacionCoordenadas = '';
// let validacionContrasenhaAntigua = '';
// let validacionContrasenhaNueva = '';
// let validacionPerfil = '';
// let validacionBanner = '';

function mostrarDatos() {
    btnImagen.addEventListener("click", cambiarImagen)
    imgEdit.addEventListener("change", validarImagen);

    btnNombreProducto.addEventListener("click", cambiarNombreProducto);
    nombreProducto.addEventListener("input", validarNombreProducto);

    btnPrecioUnitario.addEventListener("click", cambiarPrecioUnitario)
    precioUnitario.addEventListener("input", validarPrecioUnitario);

    productosIniciales.addEventListener("change", modiProducMostrar);
    razonProv.innerHTML = localStorage.getItem("razonSocial");
    razonSocial.innerHTML = localStorage.getItem("razonSocial");
    logo.style.backgroundImage = `url('../../img_bbdd/proveedores/${cif}.jpg')`;
    logo.style.backgroundSize = "cover";
    logo.style.backgroundPosition = "center";
    hero.style.backgroundImage = `linear-gradient(to bottom, rgba(16, 14, 52, 0.2), rgba(16, 14, 52, 0.9)), url('../../img_bbdd/fondos/${cif}.jpg')`;
    hero.style.backgroundSize = "cover";
    hero.style.backgroundPosition = "center";

    productosInicialesArray = {
        'producIni': 'producIni',
        'cif': cif
    }

    fetch("../../php/proveedores/modificar_productos.php", {
        method: "POST",
        body: JSON.stringify(productosInicialesArray),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Error en la solicitud');
            }
            return response.json();
        })
        .then(data => {
            data.forEach(element => {
                productosIniciales.innerHTML += "<option value='" + element.codigo + "'>" + element.nombre + "</option>"
            });
        })

}

function modiProducMostrar() {
    ocultoNombre.setAttribute("class", "");
    ocultoImagen.setAttribute("class", "");
    ocultoDinero.setAttribute("class", "");
    productosArray = {
        'idProd': productosIniciales.value,
        'cif': cif
    }
    console.log(productosIniciales.value)
    fetch("../../php/proveedores/modificar_productos.php", {
        method: "POST",
        body: JSON.stringify(productosArray),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Error en la solicitud');
            }
            return response.json();
        })
        .then(data => {
            data.forEach(element => {
                nombreProducto.value = element.nombre;
                imgEdit.style.backgroundImage = `url('../../img_bbdd/productos/${element.codigo}.jpg')`;
                precioUnitario.value = element.precio;
            });
            imgEdit.style.backgroundSize = "cover";
            imgEdit.style.backgroundPosition = "center";
        })
}

function validarImagen() {
    const expImagen = /\.(jpg)/i;
    if (expImagen.test(imgEdit.value)) {
        imgEdit.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgImagen.setAttribute("class", "hidden");
        validarImagenTrue = true;
    } else {
        imgEdit.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgImagen.setAttribute("class", "flex");
        validarImagenTrue = false;
    }
}

function validarNombreProducto() {
    const expProducto = /^[\wñÑÁáÉéÍíÓóÚú.,:;"'¡¿\s]{2,200}$/i;
    if (expProducto.test(nombreProducto.value)) {
        nombreProducto.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgNombreProducto.setAttribute("class", "hidden");
        validarNombre = true;
    } else {
        nombreProducto.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgNombreProducto.setAttribute("class", "flex");
        validarNombre = false;
    }
}

function validarPrecioUnitario() {
    const expPrecio = /^(\d{1,3})(\.\d{1,2})?$/i;
    if (expPrecio.test(precioUnitario.value)) {
        precioUnitario.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgPrecioUnitario.setAttribute("class", "hidden");
        precioUnitarioValidado = true;
    } else {
        precioUnitario.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgPrecioUnitario.setAttribute("class", "flex");
        precioUnitarioValidado = false;
    }
}

function actualizarDatos(ruta, datos) {
    fetch(ruta, {
        method: "POST",
        body: JSON.stringify(datos),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Error en la solicitud');
            }
            return response.text();
        })
        .then(data => {
            console.log(data)
            switch (data) {
                case "coordenadasCambiadas":
                    correctoDatos.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    break;
                case "catCambiada":
                    correctoDatos.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    break;
                case "actualizadoRazsoc":
                    correctoDatos.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    localStorage.setItem("razonSocial", razsoc.value);
                    break;
                case "actualizadoDir":
                    correctoDatos.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    localStorage.setItem("direccion", direccion.value);
                    break;
                case "actualizadoTel":
                    correctoDatos.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    localStorage.setItem("telefono", telefono.value);
                    break;
                case "actualizadoMail":
                    correctoDatos.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    localStorage.setItem("correo", correo.value);
                    break;
                case "actualizadoContra":
                    correctoContrasena.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoContrasena.setAttribute("class", "hidden");
                    }, 3000);
                    break;
                case "telExiste":
                    telefono.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
                    msgTelefono.setAttribute("class", "hidden");
                    msgTelefonoExiste.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    break;
                case "mailExiste":
                    correo.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
                    msgCorreo.setAttribute("class", "hidden");
                    msgCorreoExiste.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                    break;
                case "contraExiste":
                    incorrectoContrasena.setAttribute("class", "flex");
                    setTimeout(function () {
                        incorrectoContrasena.setAttribute("class", "hidden");
                    }, 3000);
                    break;
            }

        })
        .catch(error => {
            console.error("Error: ", error);
            return false;
        });
}

function cambiarNombreProducto() {
    if (validacionRazsoc) {
        const datos = {
            'razSoc': razsoc.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/modificar_productos.php", datos);

    }
}

function cambiarPrecioUnitario() {
    if (validacionDirec) {
        const datos = {
            'direccion': direccion.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/modificar_productos.php", datos);

    }
}

function cambiarImagen() {
    if (validacionPerfil) {
        var archivo = perfil.files[0]
        var formData = new FormData();
        formData.append('imagen', archivo);
        formData.append('cif', localStorage.getItem("cif"))
        fetch('../../php/proveedores/cambiar_imagen_proveedores.php', {
            method: 'POST',
            body: formData
        })
            .then(response => {
                if (response.ok) {
                    console.log('Datos enviados con éxito');
                    return response.text();
                } else {
                    console.log('Error al enviar los datos');
                }
            })
            .then(data => {
                if (data == 'Imagen guardada correctamente') {
                    correctoDatos.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoDatos.setAttribute("class", "hidden");
                    }, 3000);
                }
            })
            .catch(error => {
                console.log('Error en la solicitud:', error);
            });
    }
}

// function guardarImagenBanner() {
//     if (validacionBanner) {
//         var archivo = banner.files[0]
//         var formData = new FormData();
//         formData.append('imagen', archivo);
//         formData.append('cif', localStorage.getItem("cif"))
//         fetch('../../php/proveedores/actualizar_banner_proveedores.php', {
//             method: 'POST',
//             body: formData
//         })
//             .then(response => {
//                 if (response.ok) {
//                     console.log('Datos enviados con éxito');
//                     return response.text();
//                 } else {
//                     console.log('Error al enviar los datos');
//                 }
//             })
//             .then(data => {
//                 console.log(data)
//                 if (data == 'Imagen guardada correctamente') {
//                     correctoDatos.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                 }
//             })
//             .catch(error => {
//                 console.log('Error en la solicitud:', error);
//             });
//     }
// }