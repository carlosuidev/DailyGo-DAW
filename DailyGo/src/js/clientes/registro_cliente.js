try {
    document.addEventListener("DOMContentLoaded", iniciarEventos);
} catch (error) {
    console.log(
        `Error del Listener a la hora de iniciar los eventos: ${error}`
    );
}

const crearCuenta = document.getElementById("crearCuenta");

// DATOS FORMULARIO
const nombre = document.getElementById("nombre");
const apellidos = document.getElementById("apellidos");
const telefono = document.getElementById("telefono");
const correo = document.getElementById("correo");
const contrasena = document.getElementById("contrasena");
const confirmarContrasena = document.getElementById("confirmarContrasena");
const terminos = document.getElementById("terminos");

// ALERTAS FORMULARIO
const msgCorreo = document.getElementById("msgCorreo");
const msgCorreoExiste = document.getElementById("msgCorreoExiste");
const msgNombre = document.getElementById("msgNombre");
const msgApellidos = document.getElementById("msgApellidos");
const msgTelefono = document.getElementById("msgTelefono");
const msgTelefonoExiste = document.getElementById("msgTelefonoExiste");
const msgContrasena = document.getElementById("msgContrasena");
const msgConfirmarContrasena = document.getElementById(
    "msgConfirmarContrasena"
);
const msgTerminos = document.getElementById("msgTerminos");

// Peticiones HTTP POST
const xhrNuevoUsuario = new XMLHttpRequest();
const xhrCorreo = new XMLHttpRequest();
const xhrTelefono = new XMLHttpRequest();

function iniciarEventos() {
    try {
        nombre.addEventListener("input", validarNombre);
        apellidos.addEventListener("input", validarApellidos);
        telefono.addEventListener("input", validarTelefono);
        correo.addEventListener("input", validarCorreo);
        contrasena.addEventListener("input", validarContrasena);
        confirmarContrasena.addEventListener(
            "input",
            validarConfirmarContrasena
        );
        terminos.addEventListener("click", validarTerminos);

        crearCuenta.addEventListener("click", peticionCrearUsuario);
    } catch (error) {
        console.log(
            `Los eventos no están funcionando correctamente: ${error}`
        );
    }
}

function validarCorreo() {
    try {
        const expCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;

        if (expCorreo.test(correo.value)) {
            xhrCorreo.onreadystatechange = respuestaExisteCorreo;
            xhrCorreo.open("POST", ".....................", true);
            xhrCorreo.setRequestHeader(
                "Content-type",
                "application/x-www-form-urlencoded"
            );
            xhrCorreo.send(`correo=${correo.value}`);

            return true;
        } else {
            correo.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgCorreo.setAttribute("class", "flex");
            msgCorreoExiste.setAttribute("class", "hidden");

            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar el correo: ${error}`);
    }
}

function respuestaCorreo() {
    try {
        if (xhrCorreo.readyState == 4 && xhrCorreo.status == 200) {
            let jsonCorreo = JSON.parse(xhrCorreo.responseText);

            if (jsonCorreo[0].msg === "no existe") {
                correo.setAttribute(
                    "class",
                    "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
                );
                msgCorreoExiste.setAttribute("class", "hidden");
                msgCorreo.setAttribute("class", "hidden");
                return false;
            } else {
                correo.setAttribute(
                    "class",
                    "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
                );
                msgCorreoExiste.setAttribute("class", "flex");
                msgCorreo.setAttribute("class", "hidden");
                return true;
            }
        }
    } catch (error) {
        console.log(
            `No se ha obtenido respuesta de la existencia del correo: ${error}`
        );
    }
}

function validarContrasena() {
    try {
        const expContrasena =
            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)([A-Za-z\d$@$!%*?&]|[^ ]){8,16}$/;

        if (expContrasena.test(contrasena.value)) {
            contrasena.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgContrasena.setAttribute("class", "hidden");
            return true;
        } else {
            contrasena.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgContrasena.setAttribute("class", "flex");
            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar la contraseña: ${error}`);
    }
}

function validarConfirmarContrasena() {
    try {
        const expContrasenaRep =
            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)([A-Za-z\d$@$!%*?&]|[^ ]){8,16}$/;

        if (
            contrasena.value === confirmarContrasena.value &&
            expContrasenaRep.test(confirmarContrasena.value)
        ) {
            confirmarContrasena.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgConfirmarContrasena.setAttribute("class", "hidden");
            return true;
        } else {
            confirmarContrasena.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgConfirmarContrasena.setAttribute("class", "flex");
            return false;
        }
    } catch (error) {
        console.log(
            `No se ha podido validar la confirmación de la contraseña: ${error}`
        );
    }
}

function validarNombre() {
    try {
        const expNombre = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ]{2,20}\s?)+$/;

        if (expNombre.test(nombre.value)) {
            nombre.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgNombre.setAttribute("class", "hidden");
            return true;
        } else {
            nombre.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgNombre.setAttribute("class", "flex");
            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar el nombre: ${error}`);
    }
}

function validarApellidos() {
    try {
        const expApellidos = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ]{2,}\s?-?\s?){1,4}$/;

        if (expApellidos.test(apellidos.value)) {
            apellidos.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgApellidos.setAttribute("class", "hidden");
            return true;
        } else {
            apellidos.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgApellidos.setAttribute("class", "flex");
            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar los apellidos: ${error}`);
    }
}

function validarTelefono() {
    try {
        const expTelefono = /^(6|7|8|9)\d{8}$/;

        if (expTelefono.test(telefono.value)) {
            xhrTelefono.onreadystatechange = respuestaExisteTelefono;
            xhrTelefono.open("POST", ".....................", true);
            xhrTelefono.setRequestHeader(
                "Content-type",
                "application/x-www-form-urlencoded"
            );
            xhrTelefono.send(`telefono=${telefono.value}`);

            return true;
        } else {
            telefono.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgTelefono.setAttribute("class", "flex");
            msgTelefonoExiste.setAttribute("class", "hidden");

            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar el teléfono: ${error}`);
    }
}

function respuestaExisteTelefono() {
    try {
        if (xhrTelefono.readyState == 4 && xhrTelefono.status == 200) {
            let jsonTelefono = JSON.parse(xhrTelefono.responseText);

            if (jsonTelefono[0].msg === "no existe") {
                telefono.setAttribute(
                    "class",
                    "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
                );
                msgTelefonoExiste.setAttribute("class", "hidden");
                msgTelefono.setAttribute("class", "hidden");
                return false;
            } else {
                telefono.setAttribute(
                    "class",
                    "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
                );
                msgTelefonoExiste.setAttribute("class", "flex");
                msgTelefono.setAttribute("class", "hidden");
                return true;
            }
        }
    } catch (error) {
        console.log(
            `No se ha podido obtener la respuesta de la existencia del teléfono: ${error}`
        );
    }
}

function validarTerminos() {
    try {
        if (terminos.checked) {
            msgTerminos.setAttribute("class", "hidden");
        } else {
            msgTerminos.setAttribute("class", "flex");
        }
    } catch (error) {
        console.log(`No se ha podido validar los términos: ${error}`);
    }
}

function peticionCrearUsuario() {
    try {
        validarNombre();
        validarApellidos();
        validarCorreo();
        validarTelefono();
        validarContrasena();
        validarConfirmarContrasena();
        validarTerminos();

        if (
            validarNombre() &&
            validarApellidos() &&
            validarCorreo() &&
            validarTelefono() &&
            validarContrasena() &&
            validarConfirmarContrasena() &&
            validarTerminos()
        ) {
            xhrNuevoUsuario.onreadystatechange = respuestaCrearUsuario;
            xhrNuevoUsuario.open("POST", ".....................", true);
            xhrNuevoUsuario.setRequestHeader(
                "Content-type",
                "application/x-www-form-urlencoded"
            );
            xhrNuevoUsuario.send(
                `nombre=${nombre.value}&apellidos=${apellidos.value}&correo=${correo.value}&contrasena=${contrasena.value}&telefono=${telefono.value}`
            );
        }
    } catch (error) {
        console.log(`No se ha podido solicitar crear usuario: ${error}`);
    }
}

function respuestaCrearUsuario() {
    try {
        if (xhrNuevoUsuario.readyState == 4 && xhrNuevoUsuario.status == 200) {
            let jsonCrearUsuario = JSON.parse(xhrNuevoUsuario.responseText);
            if (jsonCrearUsuario[0].msg === "creado") {
                localStorage.setItem("id", jsonCrearUsuario[0].id);
                localStorage.setItem("nombre", nombre.value);
                localStorage.setItem("apellidos", apellidos.value);
                localStorage.setItem("correo", correo.value);
                localStorage.setItem("telefono", apellidos.value);
                // Redirección
            } else {
                const errorCrear = document.getElementById("errorCrear");
                errorCrear.setAttribute("class", "flex");
            }
        }
    } catch (error) {
        console.log(
            `No se ha podido obtener respuesta de la creación del usuario: ${error}`
        );
    }
}
