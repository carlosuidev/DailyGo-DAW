document.addEventListener("DOMContentLoaded", iniciarEventos);

const xhrEntrar = new XMLHttpRequest();

const tipoUsuario = document.getElementById("tipoUsuario").value;

const msgIncorrecto = document.getElementById("msgIncorrecto");
const btnEntrar = document.getElementById("btnEntrar");
const correo = document.getElementById("correo");
const msgCorreo = document.getElementById("msgCorreo");
const contrasena = document.getElementById("contrasena");
const msgContrasena = document.getElementById("msgContrasena");

function iniciarEventos() {
    correo.addEventListener("input", validarCorreo);
    contrasena.addEventListener("input", validarContrasena);
    btnEntrar.addEventListener("click", peticionEntrar);
}

function validarCorreo() {
    try {
        const expCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;

        if (expCorreo.test(correo.value)) {
            correo.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgCorreo.setAttribute("class", "hidden");

            return true;
        } else {
            correo.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgCorreo.setAttribute("class", "flex");

            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar el correo electrónico: ${error}`);
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

function peticionEntrar() {
    try {
        validarCorreo();
        validarContrasena();

        let direccionServer = "";

        if (validarCorreo() && validarContrasena()) {
            xhrEntrar.onreadystatechange = respuestaEntrar;
            switch (tipoUsuario) {
                case "rider":
                    direccionServer = "...";
                    break;
                case "proveedor":
                    direccionServer = "...";
                    break;
                case "cliente":
                    direccionServer = "...";
                    break;
                default:
                    direccionServer = "...";
                    break;
            }
            xhrEntrar.open("POST", `${direccionServer}`, true);
            xhrEntrar.setRequestHeader(
                "Content-type",
                "application/x-www-form-urlencoded"
            );
            xhrEntrar.send(
                `correo=${correo.value}&contrasena=${contrasena.value}`
            );
        }
    } catch (error) {
        console.log(
            `No se ha podido realizar la petición para entrar: ${error}`
        );
    }
}

function respuestaEntrar() {
    try {
        if (xhrEntrar.readyState == 4 && xhrEntrar.status == 200) {
            let jsonEntrar = JSON.parse(xhrEntrar.responseText);
            if (jsonEntrar[0].msg === "dentro") {
                switch (tipoUsuario.value) {
                    case "administrador":
                        localStorage.setItem("nombre", nombre.value);
                        localStorage.setItem("apellidos", apellidos.value);
                        localStorage.setItem("correo", correo.value);
                        localStorage.setItem("telefono", telefono.value);
                        localStorage.setItem("tipoUsuario", "administrador");
                        break;
                        
                    case "usuario":
                        localStorage.setItem("nombre", nombre.value);
                        localStorage.setItem("apellidos", apellidos.value);
                        localStorage.setItem("correo", correo.value);
                        localStorage.setItem("telefono", telefono.value);
                        localStorage.setItem("tipoUsuario", "usuario");
                        break;

                    case "rider":
                        localStorage.setItem("nombre", nombre.value);
                        localStorage.setItem("apellidos", apellidos.value);
                        localStorage.setItem("correo", correo.value);
                        localStorage.setItem("dni", dni.value);
                        localStorage.setItem("telefono", telefono.value);
                        localStorage.setItem("tipoUsuario", "rider");
                        break;

                    case "proveedor":
                        localStorage.setItem("razonSocial", razonSocial.value);
                        localStorage.setItem("nif", nif.value);
                        localStorage.setItem("correo", correo.value);
                        localStorage.setItem("telefono", telefono.value);
                        localStorage.setItem("direccion", direccion.value);
                        localStorage.setItem("tipoUsuario", "proveedor");
                        break;

                    default:
                        msgIncorrecto.setAttribute("class", "flex");
                        break;
                }
            } else {
                msgIncorrecto.setAttribute("class", "flex");
            }

            window.location.href = "../../src/index.html";
        }
    } catch (error) {
        console.log(
            `No hay una respuesta válida por parte del servidor: ${error}`
        );
    }
}
