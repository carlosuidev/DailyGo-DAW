const sesionUsuario = localStorage.getItem("tipo")
document.addEventListener('DOMContentLoaded', comprobarSesionUsuario(sesionUsuario));

function comprobarSesion(tipoUsuario){
    if(tipoUsuario !== null){
        const redirecciones = {
            'usuarios': '../src/usuarios/inicio.html',
            'rider': '../src/riders/inicio.html',
            'proveedor': '../src/proveedores/inicio.html',
            'administrador': '../src/administrador/inicio.html'
        }

        window.location.href = redirecciones.tipoUsuario;
    }else{
        return true;
    }
}