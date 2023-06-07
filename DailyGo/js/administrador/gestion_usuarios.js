document.addEventListener('DOMContentLoaded', iniciarGestionUsuarios);

const listaUsuarios = document.getElementById("listaUsuarios");

const nombre = document.getElementById("nombre");
const apellidos = document.getElementById("apellidos");
const correo = document.getElementById("correo");
const telefono = document.getElementById("telefono");

const btnCrearUsuario = document.getElementById("btnCrearUsuario");

function iniciarGestionUsuarios() {
    obtenerUsuarios();

    nombre.addEventListener("input", validarNombre);
    apellido.addEventListener("input", validarApellidos);
    correo.addEventListener("input", validarCorreo);
    telefono.addEventListener("input", validarTelefono)

    btnCrearUsuario.addEventListener("click", agregarUsuario);

    mostrarDatosUsuario(idUsuario.value);
}

// MOSTRAR USUARIOS
function obtenerUsuarios() {
    fetch("../server/.....", {
        method: "POST",
        body: null,
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            data.forEach(datosUsuario => {
                const fila = document.createElement("tr");
                fila.setAttribute("class", "border-b border-blue-700 duration-300 hover:bg-blue-800/50 bg-blue-800");

                const tdId = document.createElement("td");
                tdId.setAttribute("class", "p-4");
                tdId.textContent = datosUsuario.id;
                fila.appendChild(tdId);

                const tdNombre = document.createElement("td");
                tdNombre.setAttribute("class", "p-4");
                tdNombre.textContent = datosUsuario.nombre;
                fila.appendChild(tdNombre);

                const tdApellidos = document.createElement("td");
                tdApellidos.setAttribute("class", "p-4");
                tdApellidos.textContent = datosUsuario.apellidos;
                fila.appendChild(tdApellidos);

                const tdTelefono = document.createElement("td");
                tdTelefono.setAttribute("class", "p-4");
                tdTelefono.textContent = datosUsuario.telefono;
                fila.appendChild(tdTelefono);

                const tdCorreo = document.createElement("td");
                tdCorreo.setAttribute("class", "p-4");
                tdCorreo.textContent = datosUsuario.correo;
                fila.appendChild(tdCorreo);

                const tdAcciones = document.createElement("td");
                tdAcciones.setAttribute("class", "p-4");
                tdAcciones.innerHTML = `
                <button class="px-2 cursor-pointer duration-300 bg-blue-900 border border-yellow-500 text-yellow-500 hover:text-white hover:bg-yellow-500 rounded-full w-fit" 
                    onclick="modificarUsuario(id)">
                        Modificar
                </button>
                <button class="px-2 cursor-pointer duration-300 bg-blue-900 border border-red-500 text-red-500 hover:text-white hover:bg-red-500 rounded-full w-fit"
                    onclick="elimianarUsuario(id)">
                        Eliminar
                </button>
                `;
                fila.appendChild(tdAcciones);

                listaUsuarios.appendChild(fila);
            });
        })
        .catch(error => {
            console.error("Error: No se han podido mostrar los usuarios ->", error);
        });
}

// VALIDACIONES
function validarNombre() {
    try {
        const expNombre = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ]{2,20}\s?)+$/;

        if(expNombre.test(nombre.value)){
            nombre.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgNombre.setAttribute("class", "hidden");

            return true;
        }else{
            nombre.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgNombre.setAttribute("class", "flex");
            return false;
        }
    } catch (e) {
        console.log(`No ha sido posible validar el nombre de usuario -> ${e}`);
        return false;
    }
}

function validarApellidos() {
    try {
        const expApellidos = /^([a-zA-ZáéíóúÁÉÍÓÚñÑüÜñ]{2,}\s?-?\s?){1,4}$/;

        if(expApellidos.test(apellidos.value)){
            apellidos.setAttribute(
                "class",
                "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgApellidos.setAttribute("class", "hidden");

            return true;
        }else{
            apellidos.setAttribute(
                "class",
                "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
            );
            msgApellidos.setAttribute("class", "flex");
            return false;
        }
    } catch (e) {
        console.log(`No ha sido posible validar los apellidos del usuario -> ${e}`)
        return false;
    }
}

function validarCorreo() {
    try {
        const expCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;

        if (expCorreo.test(correo.value)) {
            fetch("../server/.....", {
                method: "POST",
                body: JSON.stringify({ correo: correo.value }),
                headers: {
                    "Content-Type": "application/json"
                }
            })
                .then(response => response.json())
                .then(data => {
                    if(data[0].msg == "no existe"){
                        correo.setAttribute(
                            "class",
                            "rounded-md border border-green-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
                        );
                        msgCorreo.setAttribute("class", "hidden");
                        msgCorreoExiste.setAttribute("class", "hidden");
                        return true;
                    }else{
                        correo.setAttribute(
                            "class",
                            "rounded-md border border-red-500 p-2 bg-blue-100/10 focus:bg-blue-100/30 duration-300"
                        );
                        msgCorreo.setAttribute("class", "hidden");
                        msgCorreoExiste.setAttribute("class", "flex");
                        return false;
                    }
                })
                .catch(error => {
                    console.error("Error: No se ha podido modificar el usuario -> ", error);
                    return false;
                });
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
        return false;
    }
}

function validarTelefono() {
    try {
        const expTelefono = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;

        if (expTelefono.test(telefono.value)) {
            fetch("../server/.....", {
                method: "POST",
                body: JSON.stringify({ telefono: telefono.value }),
                headers: {
                    "Content-Type": "application/json"
                }
            })
                .then(response => response.json())
                .then(data => {
                    // Muestro datos / respuesta
                })
                .catch(error => {
                    console.error("Error: No se ha podido modificar el usuario -> ", error);
                });

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
        console.log(`No se ha podido validar el telefono: ${error}`);
    }
}

// MOSTRAR DATOS USUARIO ACTUAL PARA SU MODIFICACIÓN
function mostrarDatosUsuario(idUsuario) {
    if(typeof idUsuario != undefined){
        fetch("../server/.....", {
            method: "POST",
            body: JSON.stringify({ id: idUsuario.value }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                nombre.setAttribute("value", data[0].nombre);
                apellido.setAttribute("value", data[0].apellidos);
                correo.setAttribute("value", data[0].correo);
                telefono.setAttribute("value", data[0].telefono);
            })
            .catch(error => {
                console.error("Error: No se ha podido modificar el usuario -> ", error);
            });
    }
}

// MOSTRAR USUAARIO
function agregarUsuario() {
    validarNombre();
    validarApellidos();
    validarCorreo();
    validarTelefono();
    validarContrasena();
    if(validarNombre() && validarApellidos() && validarCorreo() && validarTelefono() && validarContrasena()){
        fetch("../server/.....", {
            method: "POST",
            body: JSON.stringify({
                nombre: nombre.value,
                apellidos: apellidos.value,
                telefono: telefono.value,
                correo: correo.value,
                contrasena: contrasena.value
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                if(data[0].msg == "creado"){
                    listaUsuarios();
                }
            })
            .catch(error => {
                console.error("Error: No se han podido mostrar los usuarios ->", error);
            });
    }
}

function modificarNombre(){
    validarNombre()
    if (validarNombre()) {
        fetch("../server/.....", {
            method: "POST",
            body: JSON.stringify({
                id: idUsuario.value,
                telefono: nombre.value
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                // Muestro datos / respuesta
            })
            .catch(error => {
                console.error("Error: No se ha podido modificar el nombre del usuario -> ", error);
            });
    }
}

function modificarApellidos(){
    validarApellidos()
    if (validarApellidos()) {
        fetch("../server/.....", {
            method: "POST",
            body: JSON.stringify({
                id: idUsuario.value,
                telefono: apellidos.value
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                // Muestro datos / respuesta
            })
            .catch(error => {
                console.error("Error: No se ha podido modificar el apellido del usuario -> ", error);
            });
    }
}

function modificarTelefono() {
    validarTelefono()
    if (validarTelefono()) {
        fetch("../server/.....", {
            method: "POST",
            body: JSON.stringify({
                id: idUsuario.value,
                telefono: nuevoTelefono.value
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                // Muestro datos / respuesta
            })
            .catch(error => {
                console.error("Error: No se ha podido modificar el telefono del usuario -> ", error);
            });
    }
}

function modificarCorreo(){
    validarCorreo();
    if(validarCorreo()){
        fetch("../server/.....", {
            method: "POST",
            body: JSON.stringify({
                id: idUsuario.value,
                telefono: correo.value
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(response => response.json())
            .then(data => {
                // Muestro datos / respuesta
            })
            .catch(error => {
                console.error("Error: No se ha podido modificar el telefono del usuario -> ", error);
            });
    }
}



// BORRAR USUARIO
function borrarUsuario(id) {
    fetch("../server/.....", {
        method: "POST",
        body: JSON.stringify({ id: id }),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            obtenerUsuarios();
        })
        .catch(error => {
            console.error("Error: No se ha podido eleminar el usuario -> ", error);
        });
}