function comprobarSesion(){
    const tipoUsuario = localStorage.getItem("tipoUsuario");
    if(tipoUsuario !== null){
        const redirecciones = {
            usuario: '../usuarios/inicio.php',
            rider: '../riders/perfil.html',
            proveedor: '../proveedores/inicio.html',
            administrador: '../administrador/inicio.html'
        }
        return window.location.href = redirecciones[tipoUsuario];
    }else{
        return true;
    }
}

comprobarSesion();