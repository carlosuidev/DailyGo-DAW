let marker;

let map = L.map('map').setView([40.314224,-3.7038],6)

//Agregar tilelAyer mapa base desde openstreetmap
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
  attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

document.getElementById('select-location').addEventListener('change',function(e){
  let coords = e.target.value.split(",");
  map.flyTo(coords,13);

  // Obtener referencia al elemento select
const selectLocation = document.getElementById('select-location');

// Agregar evento de escucha para cuando cambie la selección
selectLocation.addEventListener('change', function() {
  // Obtener la ubicación seleccionada
  const selectedLocation = selectLocation.value.split(',');
  const lat = selectedLocation[0];
  const lng = selectedLocation[1];

  // Eliminar cualquier marcador anterior
  if (marker) {
    map.removeLayer(marker);
  }

  // Crear un marcador y agregarlo al mapa
  marker = L.marker([lat, lng]).addTo(map);

  // Centrar el mapa en la ubicación seleccionada
  map.flyTo([lat, lng], 13);
});
// Obtener la ubicación seleccionada
const selectedLocation = selectLocation.value.split(',');
const lat = selectedLocation[0];
const lng = selectedLocation[1];

// Eliminar cualquier marcador anterior
if (marker) {
  map.removeLayer(marker);
}

// Crear un marcador y agregarlo al mapa
marker = L.marker([lat, lng]).addTo(map);

// Centrar el mapa en la ubicación seleccionada
map.flyTo([lat, lng], 13);

})