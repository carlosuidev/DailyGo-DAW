const btnCerrarSesion = document.getElementById("btnCerrarSesion");
btnCerrarSesion.addEventListener("click", cerrarSesion);

function cerrarSesion() {
    try {
        localStorage.clear();
    } catch (error) {
        console.log(
            `Se ha producido un error a la hora de cerrar sesión: ${error}`
        );
    }
}
