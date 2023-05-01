document.addEventListener('DOMContentLoaded', iniciarPerfilUsuario);

const nombre =  document.getElementById("nombre");
const apellidos = document.getElementById("apellidos");
const contrasenaActual = document.getElementById("contrasenaActual");
const contrasenaNueva = document.getElementById("contrasenaNueva");
const btnActualizar = document.getElementById("actualizarDatos");

const msgNombre = document.getElementById("msgNombre");
const msgApellidos = document.getElementById("msgApellidos");
const msgContrasenaNueva = document.getElementById("msgContrasenaNueva");

const nombreActual = document.getElementById("nombreActual");
const apellidosActual = document.getElementById("apellidosActual");
const telefonoActual = document.getElementById("telefonoActual");
const correoActual = document.getElementById("correoActual");

function iniciarPerfilUsuario(){
    mostrarDatosUsuario();
    nombre.addEventListener("input", validarNombre);
    apellidos.addEventListener("input", validarApellidos);
    contrasenaActual.addEventListener("input", validarContrasenaActual);
    contrasenaNueva.addEventListener("input", validarContrasenaNueva);
    btnActualizar.addEventListener("click", peticionActualizar);
}

function mostrarDatosUsuario(){
    // Datos de perfil
    valuesPerfil(nombreActual, "nombre");
    valuesPerfil(apellidosActual, "apellidos");
    valuesPerfil(telefonoActual, "telefono");
    valuesPerfil(correoActual, "correo");

    // Datos del formulario
    valuesForm(nombre, "nombre");
    valuesForm(apellidos, "apellidos");
}

function valuesPerfil(elemento, nombreItem){
    try {
        elemento.textContent = localStorage.getItem(nombreItem);
    } catch (e) {
        console.log(`No se ha podido aplicar valores al elemento del perfil (${e})`);
    }
}

function valuesForm(elemento, nombreItem){
    try {
        elemento.value = localStorage.getItem(nombreItem);
    } catch (e) {
        console.log(`No se ha podido aplicar valores al elemento del formulario (${e})`);
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

function validarContrasenaActual() {
    try {
        const expContrasena =
            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)([A-Za-z\d$@$!%*?&]|[^ ]){8,16}$/;

        if (expContrasena.test(contrasenaActual.value)) {
            contrasenaActual.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            return true;
        } else {
            contrasenaActual.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar la contraseña: ${error}`);
    }
}

function validarContrasenaNueva() {
    try {
        const expContrasena =
            /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)([A-Za-z\d$@$!%*?&]|[^ ]){8,16}$/;

        if (expContrasena.test(contrasenaNueva.value)) {
            contrasenaNueva.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgContrasenaNueva.setAttribute("class", "hidden");
            return true;
        } else {
            contrasenaNueva.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgContrasenaNueva.setAttribute("class", "flex");
            return false;
        }
    } catch (error) {
        console.log(`No se ha podido validar la contraseña: ${error}`);
    }
}

function peticionActualizar(){
    try {
        validarNombre();
        validarApellidos();
        validarContrasenaActual();
        validarContrasenaNueva();

        if(validarNombre() && validarApellidos() && validarContrasenaActual() && validarContrasenaNueva()){
            
            fetch("../server/.....", {
                method: "POST",
                body: JSON.stringify({ 
                    nombre: nombre.value,
                    apellidos: apellidos.value,
                    contrasenaActual: contrasenaActual.value,
                    contrasenaNueva: contrasenaNueva.value
                }),
                headers: {
                    "Content-Type": "application/json"
                }
            })
                .then(response => response.json())
                .then(data => {
                    const correctoActualizar = document.getElementById("correctoActualizar");
                    const errorActualizar = document.getElementById("errorActualizar");
                    const msgError = document.getElementById("msgError");
                    if(data[0].msg == "Contraseña incorrecta"){
                        correctoActualizar.setAttribute("class", "hidden");
                        errorActualizar.setAttribute("class", "flex");
                        msgError.innerHTML = "Esa contraseña no es correcta";
                    }else if(data[0].msg == "Correcto"){
                        errorActualizar.setAttribute("class", "hidden");
                        correctoActualizar.setAttribute("class", "flex");
                    }else{
                        correctoActualizar.setAttribute("class", "hidden");
                        errorActualizar.setAttribute("class", "flex");
                        msgError.innerHTML = "No se han actualizados tus datos. Inténtalo de nuevo";
                    }
                })
                .catch(error => {
                    console.error("Error: No se ha podido crear la petición ->", error);
                });
        }
    } catch (e) {
        console.log(`No se puedo realizar la petición de actualizar los datos (${e})`);
    }
}