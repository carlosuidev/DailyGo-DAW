document.addEventListener('DOMContentLoaded', iniciarPerfil);

const productosIniciales = document.getElementById("productosIniciales");



// const msgRazsoc = document.getElementById("msgRazsoc");
// const msgDireccion = document.getElementById("msgDirec");
// const msgBanner = document.getElementById("msgBanner");


const correctoDatos = document.getElementById("correctoDatos");
const incorrectoDatos = document.getElementById("incorrectoDatos");

// const correctoContrasena = document.getElementById("correctoContrasena");
// const incorrectoContrasena = document.getElementById("incorrectoContrasena");

// const btnRazsoc = document.getElementById("btnRazsoc");
// const btnDirec = document.getElementById("btnDirec");
// const btnCoord = document.getElementById("btnCoord");
// const btnTelefono = document.getElementById("btnTelefono");
// const btnCorreo = document.getElementById("btnCorreo");
// const btnBanner = document.getElementById("btnBanner");
// const btnContrasena = document.getElementById("btnContrasena");
// const btnPerfil = document.getElementById("btnPerfil");

//
// let validacionRazsoc = '';
// let validacionDirec = '';
// let validacionCorreo = '';
// let validacionTelefono = '';
// let validacionCoordenadas = '';
// let validacionContrasenhaAntigua = '';
// let validacionContrasenhaNueva = '';
// let validacionPerfil = '';
// let validacionBanner = '';

function iniciarPerfil() {
    mostrarDatos();
    // coordenadas.addEventListener("input", validarCoordenadas);
    // perfil.addEventListener("change", validarImagenPerfil);
    // razsoc.addEventListener("input", validarRazsoc);
    // cat.addEventListener("change", cambiarCategoria);
    // direccion.addEventListener("input", validarDireccion);
    // telefono.addEventListener("input", validarTelefono);
    // correo.addEventListener("input", validarCorreo);
    // banner.addEventListener("change", validarImagenBanner);
    // contrasenaNueva.addEventListener("input", validarContrasena);

    // btnRazsoc.addEventListener("click", cambiarRazsoc);
    // btnCoord.addEventListener("click", cambiarCoordenadas);
    // btnDirec.addEventListener("click", cambiarDireccion);
    // btnTelefono.addEventListener("click", cambiarTelefono);
    // btnCorreo.addEventListener("click", cambiarCorreo);
    // btnContrasena.addEventListener("click", cambiarContrasena);
    // btnPerfil.addEventListener("click", guardarImagen);
    // btnBanner.addEventListener("click", guardarImagenBanner);
}

function mostrarDatos() {
    cif = localStorage.getItem("cif");
    document.getElementById("razonProv").innerHTML = localStorage.getItem("razonSocial");
    const logo = document.getElementById("logoProveedor");
    logo.style.backgroundImage = `url('../../img_bbdd/proveedores/${cif}.jpg')`;
    logo.style.backgroundSize = "cover";
    logo.style.backgroundPosition = "center";
    const hero = document.getElementById("hero-proveedor");
    hero.style.backgroundImage = `linear-gradient(to bottom, rgba(16, 14, 52, 0.2), rgba(16, 14, 52, 0.9)), url('../../img_bbdd/fondos/${cif}.jpg')`;
    hero.style.backgroundSize = "cover";
    hero.style.backgroundPosition = "center";
    productosInicialesArray = {
        'producIni': 'producIni',
        'cif': localStorage.getItem("cif")
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
            console.log(data)
            data.forEach(element => {
                productosIniciales.innerHTML += "<div class='flex flex-row mb-3'>" +
                    "<div class='flex gap-2'>" +
                    "<img src='../../img_bbdd/productos/" + element.codigo + ".jpg' alt='producto' width='150'>" +
                    "</div>" +
                    "<label for='nombreProd' class='mb-2'>Nombre Producto:</label>" +
                    "<div class='flex gap-3'>" +
                    "<input type='text' name='nombreProd' id='nombreProd' value='" + element.nombre + "'" +
                    "class='rounded-md border border-blue-100 focus:border-blue-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300'>" +
                    "<input type='button' id='btnDenom'" +
                    "class='duration-300 text-white bg-green-500 rounded-md font-semibold hover:bg-green-600 py-2 px-3 cursor-pointer'" +
                    "value='✅'></input>" +
                    "</div>" +
                    "<div class='hidden' id='msgDenom'>" +
                    "<small class='text-xs text-red-500 mt-2'>Escriba nombre válido</small>" +
                    "</div>" +
                    "<label for='precio' class='ml-2'>Precio unitario:</label>" +
                    "<div class='flex gap-2'>" +
                    "<input type='text' name='precio' id='precio' value='" + element.precio + "'" +
                    "class='rounded-md border border-blue-100 focus:border-blue-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300'>" +
                    "<input type='button' id='btnCoord'" +
                    "class='duration-300 text-white bg-green-500 rounded-md font-semibold hover:bg-green-600 py-2 px-3 cursor-pointer'" +
                    "value='✅'></input>" +
                    "</div>" +
                    "<div class='hidden' id='msgPrecio'>" +
                    "<small class='text-xs text-red-500 mt-2'>Escriba coordenadas válidas</small>" +
                    "</div>" +
                    "</div>"
            });
        })


    // razsoc.value = localStorage.getItem("razonSocial");
    // direccion.value = localStorage.getItem("direccion");
    // telefono.value = localStorage.getItem("telefono");
    // correo.value = localStorage.getItem("correo");
}



// function validarCoordenadas() {
//     const expCoord = /^[-+]?((([0-9]|[1-9][0-9]|1[0-7][0-9])(\.\d{1,8})?)|180(\.0{1,8})?),[-+]?((([0-9]|[1-9][0-9]|1[0-7][0-9])(\.\d{1,8})?)|180(\.0{1,8})?)$/;
//     if (expCoord.test(coordenadas.value)) {
//         coordenadas.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgCoord.setAttribute("class", "hidden");
//         validacionCoordenadas = true;
//     } else {
//         coordenadas.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgCoord.setAttribute("class", "flex");
//         validacionCoordenadas = false;
//     }
// }

// function validarImagenPerfil() {
//     const expPerfil = /\.(jpg)/i;
//     if (expPerfil.test(perfil.value)) {
//         perfil.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgPerfil.setAttribute("class", "hidden");
//         validacionPerfil = true;
//     } else {
//         perfil.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgPerfil.setAttribute("class", "flex");
//         validacionPerfil = false;
//     }
// }

// function validarImagenBanner() {
//     const expBanner = /\.(jpg)/i;
//     if (expBanner.test(banner.value)) {
//         banner.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgBanner.setAttribute("class", "hidden");
//         validacionBanner = true;
//     } else {
//         banner.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgBanner.setAttribute("class", "flex");
//         validacionBanner = false;
//     }
// }

// function validarRazsoc() {
//     const expRazSoc = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ']{2,20}\s?)+$/;
//     if (expRazSoc.test(razsoc.value)) {
//         razsoc.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgRazsoc.setAttribute("class", "hidden");
//         validacionRazsoc = true;
//     } else {
//         razsoc.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgRazsoc.setAttribute("class", "flex");
//         validacionRazsoc = false;
//     }
// }

// function validarDireccion() {
//     const expDirec = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ /.,0-9]){2,40}$/;
//     if (expDirec.test(direccion.value)) {
//         direccion.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgDireccion.setAttribute("class", "hidden");
//         validacionDirec = true;
//     } else {
//         direccion.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgDireccion.setAttribute("class", "flex");
//         validacionDirec = false;
//     }
// }

// function validarTelefono() {
//     const expTelefono = /^(6|7|8|9)\d{8}$/;
//     if (expTelefono.test(telefono.value)) {
//         telefono.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgTelefono.setAttribute("class", "hidden");
//         msgTelefonoExiste.setAttribute("class", "hidden");
//         validacionTelefono = true;
//     } else {
//         telefono.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgTelefono.setAttribute("class", "flex");
//         msgTelefonoExiste.setAttribute("class", "hidden");
//         validacionTelefono = false;
//     }
// }

// function validarCorreo() {
//     const expCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;
//     if (expCorreo.test(correo.value)) {
//         correo.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgCorreo.setAttribute("class", "hidden");
//         msgCorreoExiste.setAttribute("class", "hidden");
//         validacionCorreo = true;

//     } else {
//         correo.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgCorreo.setAttribute("class", "flex");
//         msgCorreoExiste.setAttribute("class", "hidden");
//         validacionCorreo = false;
//     }
// }

// function validarContrasena() {
//     const expContrasena =
//         /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)([A-Za-z\d$@$!%*?&]|[^ ]){8,16}$/;
//     if (expContrasena.test(contrasenaNueva.value)) {
//         contrasenaNueva.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgContrasenaNueva.setAttribute("class", "hidden");
//         validacionContrasenhaNueva = true;
//     } else {
//         contrasenaNueva.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//         msgContrasenaNueva.setAttribute("class", "flex");
//         validacionContrasenhaNueva = false;
//     }
// }

// function actualizarDatos(ruta, datos) {
//     fetch(ruta, {
//         method: "POST",
//         body: JSON.stringify(datos),
//         headers: {
//             "Content-Type": "application/json"
//         }
//     })
//         .then(response => {
//             if (!response.ok) {
//                 throw new Error('Error en la solicitud');
//             }
//             return response.text();
//         })
//         .then(data => {
//             console.log(data)
//             switch (data) {
//                 case "coordenadasCambiadas":
//                     correctoDatos.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     break;
//                 case "catCambiada":
//                     correctoDatos.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     break;
//                 case "actualizadoRazsoc":
//                     correctoDatos.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     localStorage.setItem("razonSocial", razsoc.value);
//                     break;
//                 case "actualizadoDir":
//                     correctoDatos.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     localStorage.setItem("direccion", direccion.value);
//                     break;
//                 case "actualizadoTel":
//                     correctoDatos.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     localStorage.setItem("telefono", telefono.value);
//                     break;
//                 case "actualizadoMail":
//                     correctoDatos.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     localStorage.setItem("correo", correo.value);
//                     break;
//                 case "actualizadoContra":
//                     correctoContrasena.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoContrasena.setAttribute("class", "hidden");
//                     }, 3000);
//                     break;
//                 case "telExiste":
//                     telefono.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//                     msgTelefono.setAttribute("class", "hidden");
//                     msgTelefonoExiste.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     break;
//                 case "mailExiste":
//                     correo.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
//                     msgCorreo.setAttribute("class", "hidden");
//                     msgCorreoExiste.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         correctoDatos.setAttribute("class", "hidden");
//                     }, 3000);
//                     break;
//                 case "contraExiste":
//                     incorrectoContrasena.setAttribute("class", "flex");
//                     setTimeout(function () {
//                         incorrectoContrasena.setAttribute("class", "hidden");
//                     }, 3000);
//                     break;
//             }

//         })
//         .catch(error => {
//             console.error("Error: ", error);
//             return false;
//         });
// }

// function cambiarCategoria() {
//     const datos = {
//         'categoria': cat.value,
//         'cif': localStorage.getItem("cif")
//     }
//     actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);


// }

// function cambiarRazsoc() {
//     if (validacionRazsoc) {
//         const datos = {
//             'razSoc': razsoc.value,
//             'cif': localStorage.getItem("cif")
//         }
//         actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);

//     }
// }

// function cambiarDireccion() {
//     if (validacionDirec) {
//         const datos = {
//             'direccion': direccion.value,
//             'cif': localStorage.getItem("cif")
//         }
//         actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);

//     }
// }

// function cambiarTelefono() {
//     if (validacionTelefono) {
//         const datos = {
//             'telefono': telefono.value,
//             'cif': localStorage.getItem("cif")
//         }
//         actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);

//     }
// }

// function cambiarCorreo() {
//     if (validacionCorreo) {
//         const datos = {
//             'correo': correo.value,
//             'cif': localStorage.getItem("cif")
//         }
//         actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);
//     }
// }

// function cambiarContrasena() {
//     if (validacionContrasenhaNueva) {
//         const datos = {
//             'contrasenaActual': contrasenaActual.value,
//             'contrasenaNueva': contrasenaNueva.value,
//             'cif': localStorage.getItem("cif")
//         }
//         actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);
//     }
// }

// function cambiarCoordenadas() {
//     if (validacionCoordenadas) {
//         const datos = {
//             'coordenadasCambiadas': coordenadas.value,
//             'cif': localStorage.getItem("cif")
//         }
//         actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);
//     }
// }

// function guardarImagen() {
//     if (validacionPerfil) {
//         console.log("a")
//         var archivo = perfil.files[0]
//         var formData = new FormData();
//         formData.append('imagen', archivo);
//         formData.append('cif', localStorage.getItem("cif"))
//         fetch('../../php/proveedores/cambiar_imagen_proveedores.php', {
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