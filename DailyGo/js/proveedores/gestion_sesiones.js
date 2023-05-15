const sesionUsuario = localStorage.getItem("tipo")
document.addEventListener('load', comprobarSesionUsuario(sesionUsuario));

function comprobarSesion(tipoUsuario){
    if(tipoUsuario !== "proveedor"){
        if(tipoUsuario !== null){
            const redirecciones = {
                'usuarios': '../src/usuarios/inicio.html',
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