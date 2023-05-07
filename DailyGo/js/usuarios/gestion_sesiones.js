const sesionUsuario = localStorage.getItem("tipo");
document.addEventListener('DOMContentLoaded', comprobarSesion(sesionUsuario));

function comprobarSesion(tipoUsuario){
    if(tipoUsuario !== "usuario"){
        if(tipoUsuario !== null){
            const redirecciones = {
                'proveedor': '../src/proveedor/inicio.html',
                'rider': '../src/riders/inicio.html',
                'administrador': '../src/proveedores/inicio.html',
            }

            window.location.href = redirecciones.tipoUsuario;
        }else{
            window.location.href = '../src/index.html';
        }
    }else{
        return true;
    }
}