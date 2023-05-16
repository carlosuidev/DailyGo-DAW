window.addEventListener('DOMContentLoaded', comprobarSesion);

function comprobarSesion(){
    const tipoUsuario = localStorage.getItem("tipoUsuario");
    if(tipoUsuario !== "rider"){
        if(tipoUsuario !== null){
            const redirecciones = {
                'usuarios': '/usuarios/inicio.php',
                'proveedor': '/riders/proveedor.html',
                'administrador': '/proveedores/inicio.html',
            }

            window.location.href = redirecciones.tipoUsuario;
        }else{
            window.location.href = '../index.html';
        }
    }else{
        return true;
    }
}