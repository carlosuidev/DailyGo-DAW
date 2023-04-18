const sesionUsuario = localStorage.getItem("tipo")
document.addEventListener('DOMContentLoaded', comprobarSesionUsuario(sesionUsuario));

function comprobarSesionUsuario(tipoUsuario){
    if(tipoUsuario === null){
        window.location.href = "index.html";
    }else if(tipoUsuario !== "usuario"){
        const redirecciones = {
            'rider': '../src/riders/inicio.html',
            'proveedor': '../src/proveedores/inicio.html',
            'administrador': '../src/administrador/inicio.html'
        }

        window.location.href = redirecciones.tipoUsuario;
    }else{
        return true;
    }
}