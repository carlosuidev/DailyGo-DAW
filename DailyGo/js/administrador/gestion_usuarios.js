
const listaUsuarios = document.getElementById("listaUsuarios");

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
                tdAcciones.textContent = datosUsuario.acciones;
                fila.appendChild(tdAcciones);

                tdAcciones.innerHTML = `
                <button onclick="borrarUsuario(telefono)" class="bg-red-600 px-2 rounded">x</button>
                <button onclick="borrarUsuario(telefono)" class="bg-red-600 px-2 rounded">x</button>
                <button onclick="borrarUsuario(telefono)" class="bg-red-600 px-2 rounded">x</button>
                `;

                listaUsuarios.appendChild(fila);
            });
        })
        .catch(error => {
            console.error("Error: No se han podido mostrar los usuarios ->", error);
        });
}

function validarNombre(){

}

function validarApellidos(){

}

function validarContrasena(){
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

function comprobarTelefono() {

}

function comprobarCorreo() {
    try {
        const expCorreo = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$/;

        if (expCorreo.test(correo.value)) {
            fetch("../server/.....", {
                method: "POST",
                body: JSON.stringify({ telefono: telefono }),
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

function agregarUsuario() {
    const nombre = document.getElementById("nombre");
    const apellidos = document.getElementById("apellidos");
    const telefono = document.getElementById("telefono");
    const correo = document.getElementById("correo");
    const contrasena = document.getElementById("contrasena");

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
            // Muestro datos
        })
        .catch(error => {
            console.error("Error: No se han podido mostrar los usuarios ->", error);
        });
}

function modificarUsuario(telefono) {
    fetch("../server/.....", {
        method: "POST",
        body: JSON.stringify({ telefono: telefono }),
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
}

function borrarUsuario(telefono) {
    fetch("../server/.....", {
        method: "POST",
        body: JSON.stringify({ telefono: telefono }),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            // Muestro datos / respuesta
        })
        .catch(error => {
            console.error("Error: No se ha podido eleminar el usuario -> ", error);
        });
}