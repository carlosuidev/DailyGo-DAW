window.addEventListener('DOMContentLoaded', comprobarSesion);

function comprobarSesion(tipoUsuario){
    const tipoUsuario = localStorage.getItem("tipoUsuario");
    if(tipoUsuario !== "administrador"){
        if(tipoUsuario !== null){
            const redirecciones = {
                'usuarios': '../src/usuarios/inicio.html',
                'rider': '../src/riders/inicio.html',
                'proveedor': '../src/proveedores/inicio.html',
            }

            window.location.href = redirecciones.tipoUsuario;
        }else{
            window.location.href = '../src/index.html';
        }
    }else{
        return true;
    }
}