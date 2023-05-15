document.addEventListener('DOMContentLoaded', comprobarSesion);

function comprobarSesion(){
    const tipoUsuario = localStorage.getItem("tipoUsuario");
    if(tipoUsuario !== "proveedor"){
        if(tipoUsuario !== null){
            const redirecciones = {
                'usuarios': '/usuarios/inicio.html',
                'rider': '/riders/inicio.html',
                'administrador': '/src/proveedores/inicio.html',
            }

            window.location.href = redirecciones.tipoUsuario;
        }else{
            window.location.href = '../src/index.html';
        }
    }else{
        return true;
    }
}