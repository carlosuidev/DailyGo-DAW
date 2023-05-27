document.addEventListener('DOMContentLoaded', iniciarPerfil);

const nombre = document.getElementById("nombre");
const apellidos = document.getElementById("apellidos");
const telefono = document.getElementById("telefono");
const correo = document.getElementById("correo");
const contrasenaActual = document.getElementById("contrasenaActual");
const contrasenaNueva = document.getElementById("contrasenaNueva");

const msgNombre = document.getElementById("msgNombre");
const msgApellidos = document.getElementById("msgApellidos");
const msgTelefono = document.getElementById("msgTelefono");
const msgCorreo = document.getElementById("msgCorreo");
const msgTelefonoExiste = document.getElementById("msgTelefonoExiste");
const msgCorreoExiste = document.getElementById("msgCorreoExiste");
const msgContrasenaNueva = document.getElementById("msgContrasenaNueva");

const correctoDatos = document.getElementById("correctoDatos");
const incorrectoDatos = document.getElementById("incorrectoDatos");

const correctoContrasena = document.getElementById("correctoContrasena");
const incorrectoContrasena = document.getElementById("incorrectoContrasena");

const btnNombre = document.getElementById("btnnombre");
const btnApellidos = document.getElementById("btnApellidos");
const btnTelefono = document.getElementById("btnTelefono");
const btnCorreo = document.getElementById("btnCorreo");
const btnContrasena = document.getElementById("btnContrasena");

function iniciarPerfil() {
    mostrarDatos();
    nombre.addEventListener("input", validarNombre);
    apellidos.addEventListener("input", validarApellidos);
    telefono.addEventListener("input", validarTelefono);
    correo.addEventListener("input", validarCorreo);
    contrasenaNueva.addEventListener("input", validarContrasena);

    btnNombre.addEventListener("click", cambiarNombre);
    btnApellidos.addEventListener("click", cambiarApellidos);
    btnTelefono.addEventListener("click", cambiarTelefono);
    btnCorreo.addEventListener("click", cambiarCorreo);
    btnContrasena.addEventListener("click", cambiarContrasena);
}

function mostrarDatos() {
    nombre.value = localStorage.getItem("nombre");
    apellidos.value = localStorage.getItem("apellidos");
    telefono.value = localStorage.getItem("telefono");
    correo.value = localStorage.getItem("correo");
}

function validarNombre() {
    const expNombre = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ]{2,20}\s?)+$/;
    if (expNombre.test(nombre.value)) {
        nombre.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgNombre.setAttribute("class", "hidden");
        return true;
    } else {
        nombre.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgNombre.setAttribute("class", "flex");
        return false;
    }
}

function validarApellidos() {
    const expApellidos = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ]{2,}\s?-?\s?){1,4}$/;
    if (expApellidos.test(apellidos.value)) {
        apellidos.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgApellidos.setAttribute("class", "hidden");
        return true;
    } else {
        nombrapellidos.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgApellidos.setAttribute("class", "flex");
        return false;
    }
}

function validarTelefono() {
    const expTelefono = /^(6|7|8|9)\d{8}$/;
    if (expTelefono.test(telefono.value)) {
        const datos = {
            'telefono': telefono.value
        }

        fetch("ruta...", {
            method: "POST",
            body: JSON.stringify(datos),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(data => {
                if (data.msg = "no existe") {
                    telefono.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
                    msgTelefono.setAttribute("class", "hidden");
                    msgTelefonoExiste.setAttribute("class", "hidden");
                    return true;
                } else {
                    telefono.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
                    msgTelefono.setAttribute("class", "hidden");
                    msgTelefonoExiste.setAttribute("class", "flex");
                    return false;
                }
            })
            .catch(error => {
                console.error("Error: ", error);
                return false;
            });
    } else {
        telefono.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgTelefono.setAttribute("class", "flex");
        msgTelefonoExiste.setAttribute("class", "hidden");
        return false;
    }
}

function validarCorreo() {
    const expCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;
    if (expCorreo.test(correo.value)) {
        const datos = {
            'correo': correo.value
        }

        fetch("ruta...", {
            method: "POST",
            body: JSON.stringify(datos),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(data => {
                if (data.msg = "no existe") {
                    correo.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
                    msgCorreo.setAttribute("class", "hidden");
                    msgCorreoExiste.setAttribute("class", "hidden");
                    return true;
                } else {
                    correo.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
                    msgCorreo.setAttribute("class", "hidden");
                    msgCorreoExiste.setAttribute("class", "flex");
                    return false;
                }
            })
            .catch(error => {
                console.error("Error: ", error);
                return false;
            });
    } else {
        correo.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgCorreo.setAttribute("class", "flex");
        msgCorreoExiste.setAttribute("class", "hidden");
        return false;
    }
}

function validarContrasena() {
    const expContrasena =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)([A-Za-z\d$@$!%*?&]|[^ ]){8,16}$/;
    if (expContrasena.test(contrasenaNueva.value)) {
        contrasenaNueva.setAttribute("class", "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgContrasenaNueva.setAttribute("class", "hidden");
        return true;
    } else {
        contrasenaNueva.setAttribute("class", "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300");
        msgContrasenaNueva.setAttribute("class", "flex");
        return false;
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
        .then(data => {
            if (data.msg = "actualizado") {
                correctoDatos.setAttribute("class", "flex");
                setTimeout(function () {
                    correctoDatos.setAttribute("class", "hidden");
                }, 3000);
                return true;
            } else {
                incorrectoDatos.setAttribute("class", "flex");
                setTimeout(function () {
                    incorrectoDatos.setAttribute("class", "hidden");
                }, 3000);
                return false;
            }
        })
        .catch(error => {
            console.error("Error: ", error);
            return false;
        });
}

function cambiarNombre() {
    validarNombre();
    if (validarNombre()) {
        const datos = {
            'nombre': nombre.value,
            'id': localStorage.getItem("id")
        }
        const res = actualizarDatos("../../php/actualizar_datos_usuario.php", datos);
        if(res){
            localStorage.setItem("nombre", nombre.value);
        }
    }
}

function cambiarApellidos() {
    validarApellidos();
    if (validarApellidos()) {
        const datos = {
            'apellidos': apellidos.value,
            'id': localStorage.getItem("id")
        }
        const res = actualizarDatos("../../php/actualizar_datos_usuario.php", datos);
        if(res){
            localStorage.setItem("apellidos", apellidos.value);
        }
    }
}

function cambiarTelefono() {
    validarTelefono();
    if (validarTelefono()) {
        const datos = {
            'telefono': telefono.value,
            'id': localStorage.getItem("id")
        }
        const res = actualizarDatos("../../php/actualizar_datos_usuario.php", datos);
        if(res){
            localStorage.setItem("telefono", telefono.value);
        }
    }
}

function cambiarCorreo() {
    validarCorreo();
    if (validarCorreo()) {
        const datos = {
            'correo': correo.value,
            'id': localStorage.getItem("id")
        }
        const res = actualizarDatos("../../php/actualizar_datos_usuario.php", datos);
        if(res){
            localStorage.setItem("correo", correo.value);
        }
    }
}

function cambiarContrasena() {
    validarContrasena();
    if (validarContrasena()) {
        const datos = {
            'contrasenaActual': contrasenaActual.value,
            'contrasenaNueva': contrasenaNueva.value,
            'id': localStorage.getItem("id")
        }

        fetch("../../php/actualizar_datos_usuario.php", {
            method: "POST",
            body: JSON.stringify(datos),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(data => {
                if (data.msg = "actualizado") {
                    correctoContrasena.setAttribute("class", "flex");
                    setTimeout(function () {
                        correctoContrasena.setAttribute("class", "hidden");
                    }, 3000);
                    return true;
                } else {
                    incorrectoContrasena.setAttribute("class", "flex");
                    setTimeout(function () {
                        incorrectoContrasena.setAttribute("class", "hidden");
                    }, 3000);
                    return false;
                }
            })
            .catch(error => {

                console.error("Error: ", error);
                return false;
            });
    }
}