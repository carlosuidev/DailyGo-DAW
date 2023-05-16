


const xhrProducto = new XMLHttpRequest();
const precio = document.getElementById("precio");
const denominacion = document.getElementById("denominacion");
const imagenProducto = document.getElementById("imagenProducto");

function iniciarEventos() {
  // Agrega los event listeners necesarios para tus elementos
}

function validarDenominacion() {
  // Implementa la validación de la denominación y devuelve true o false según corresponda
}

function validarPrecio() {
  const expPrecio = /^[0-9]{1,5}(.[0-9]{1,2})?$/;
  // Implementa la validación del precio y devuelve true o false según corresponda
}

function validarImagen() {
  // Obtén la imagen seleccionada en el input de imagenProducto
  const imagen = imagenProducto.files[0];
  
  if (!imagen || !imagen.type || (imagen.type !== 'image/jpeg' && imagen.type !== 'image/png')) {
    return false;
  }
  
  const maxTamano = 1024 * 1024; // 1 MB
  
  if (imagen.size > maxTamano) {
    return false;
  }
  
  return true;
}

function peticionNuevoProducto() {
  if (validarDenominacion() && validarPrecio() && validarImagen()) {
    // Construye los datos para enviar en la petición
    const datos = new FormData();
    datos.append('denominacion', denominacion.value);
    datos.append('precio', precio.value);
    datos.append('imagen', imagenProducto.files[0]);
    
    // Configura la petición
    xhrProducto.open('POST', 'URL_DE_TU_ENDPOINT');
    xhrProducto.onreadystatechange = respuestaNuevoProducto;
    
    // Envía la petición
    xhrProducto.send(datos);
  }
}

function respuestaNuevoProducto() {
  if (xhrProducto.readyState === XMLHttpRequest.DONE) {
    if (xhrProducto.status === 200) {
      // La petición fue exitosa
      console.log('Nuevo producto creado');
    } else {
      // La petición falló
      console.error('Error al crear el producto');
    }
  }
}
