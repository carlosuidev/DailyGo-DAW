document.addEventListener('DOMContentLoaded', iniciarPerfil);

const razsoc = document.getElementById("razsoc");
const cat = document.getElementById("categorias");
const direccion = document.getElementById("direc");
const telefono = document.getElementById("telefono");
const correo = document.getElementById("correo");
const contrasenaActual = document.getElementById("contrasena");
const contrasenaNueva = document.getElementById("contrasenaNueva");

const msgRazsoc = document.getElementById("msgRazsoc");
const msgDireccion = document.getElementById("msgDirec");
const msgTelefono = document.getElementById("msgTelefono");
const msgCorreo = document.getElementById("msgCorreo");
const msgTelefonoExiste = document.getElementById("msgTelefonoExiste");
const msgCorreoExiste = document.getElementById("msgCorreoExiste");
const msgContrasenaNueva = document.getElementById("msgContrasenaNueva");

const correctoDatos = document.getElementById("correctoDatos");
const incorrectoDatos = document.getElementById("incorrectoDatos");

const correctoContrasena = document.getElementById("correctoContrasena");
const incorrectoContrasena = document.getElementById("incorrectoContrasena");

const btnRazsoc = document.getElementById("btnRazsoc");
const btnDirec = document.getElementById("btnDirec");
const btnTelefono = document.getElementById("btnTelefono");
const btnCorreo = document.getElementById("btnCorreo");
const btnContrasena = document.getElementById("btnContrasena");

//
let validacionRazsoc = '';
let validacionDirec = '';
let validacionCorreo = '';
let validacionTelefono = '';
let validacionContrasenhaAntigua = '';
let validacionContrasenhaNueva = '';

function iniciarPerfil() {
    mostrarDatos();
    razsoc.addEventListener("input", validarRazsoc);
    cat.addEventListener("change", cambiarCategoria);
    direccion.addEventListener("input", validarDireccion);
    telefono.addEventListener("input", validarTelefono);
    correo.addEventListener("input", validarCorreo);
    contrasenaNueva.addEventListener("input", validarContrasena);

    btnRazsoc.addEventListener("click", cambiarRazsoc);
    btnDirec.addEventListener("click", cambiarDireccion);
    btnTelefono.addEventListener("click", cambiarTelefono);
    btnCorreo.addEventListener("click", cambiarCorreo);
    btnContrasena.addEventListener("click", cambiarContrasena);
}

function mostrarDatos() {
    datosCategoria = {
        'cat': 'cat',
        'cif': localStorage.getItem("cif")
    }
    fetch("../../php/proveedores/actualizar_datos_proveedores.php", {
        method: "POST",
        body: JSON.stringify(datosCategoria),
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
        data.forEach( element=> {
            cat.innerHTML += "<option value='"+element.categoria+"'>"+element.categoria+"</option>"
            
        });
    })
    razsoc.value = localStorage.getItem("razonSocial");
    direccion.value = localStorage.getItem("direccion");
    telefono.value = localStorage.getItem("telefono");
    correo.value = localStorage.getItem("correo");
}

function validarRazsoc() {
    const expRazSoc = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ']{2,20}\s?)+$/;
    if (expRazSoc.test(razsoc.value)) {
        razsoc.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgRazsoc.setAttribute("class", "hidden");
        validacionRazsoc = true;
    } else {
        razsoc.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgRazsoc.setAttribute("class", "flex");
        validacionRazsoc = false;
    }
}

function validarDireccion() {
    const expDirec = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ /.,0-9]){2,40}$/;
    if (expDirec.test(direccion.value)) {
        direccion.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgDireccion.setAttribute("class", "hidden");
        validacionDirec = true;
    } else {
        direccion.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgDireccion.setAttribute("class", "flex");
        validacionDirec = false;
    }
}

function validarTelefono() {
    const expTelefono = /^(6|7|8|9)\d{8}$/;
    if (expTelefono.test(telefono.value)) {
        telefono.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgTelefono.setAttribute("class", "hidden");
        msgTelefonoExiste.setAttribute("class", "hidden");
        validacionTelefono = true;
    } else {
        telefono.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgTelefono.setAttribute("class", "flex");
        msgTelefonoExiste.setAttribute("class", "hidden");
        validacionTelefono = false;
    }
}

function validarCorreo() {
    const expCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;
    if (expCorreo.test(correo.value)) {
        correo.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgCorreo.setAttribute("class", "hidden");
        msgCorreoExiste.setAttribute("class", "hidden");
        validacionCorreo = true;

    } else {
        correo.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgCorreo.setAttribute("class", "flex");
        msgCorreoExiste.setAttribute("class", "hidden");
        validacionCorreo = false;
    }
}

function validarContrasena() {
    const expContrasena =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)([A-Za-z\d$@$!%*?&]|[^ ]){8,16}$/;
    if (expContrasena.test(contrasenaNueva.value)) {
        contrasenaNueva.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgContrasenaNueva.setAttribute("class", "hidden");
        validacionContrasenhaNueva = true;
    } else {
        contrasenaNueva.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgContrasenaNueva.setAttribute("class", "flex");
        validacionContrasenhaNueva = false;
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

function cambiarCategoria() {
    console.log(cat.value)
        const datos = {
            'categoria': cat.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);

    
}

function cambiarRazsoc() {
    if (validacionRazsoc) {
        const datos = {
            'razSoc': razsoc.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);

    }
}

function cambiarDireccion() {
    if (validacionDirec) {
        const datos = {
            'direccion': direccion.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);

    }
}

function cambiarTelefono() {
    if (validacionTelefono) {
        const datos = {
            'telefono': telefono.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);

    }
}

function cambiarCorreo() {
    if (validacionCorreo) {
        const datos = {
            'correo': correo.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);
    }
}

function cambiarContrasena() {
    if (validacionContrasenhaNueva) {
        const datos = {
            'contrasenaActual': contrasenaActual.value,
            'contrasenaNueva': contrasenaNueva.value,
            'cif': localStorage.getItem("cif")
        }
        actualizarDatos("../../php/proveedores/actualizar_datos_proveedores.php", datos);
    }
}