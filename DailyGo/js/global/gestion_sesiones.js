const sesionUsuario = localStorage.getItem("tipoUsuario");
document.addEventListener('load', comprobarSesion(sesionUsuario));

function comprobarSesion(tipoUsuario){
    if(tipoUsuario !== null){
        const redirecciones = {
            usuario: '../src/usuarios/inicio.html',
            rider: '../src/riders/inicio.html',
            proveedor: '../src/proveedores/inicio.html',
            administrador: '../src/administrador/inicio.html'
        }
        return window.location.href = redirecciones[tipoUsuario];
    }else{
        return true;
    }
}