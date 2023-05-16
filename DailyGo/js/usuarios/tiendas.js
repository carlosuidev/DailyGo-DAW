document.addEventListener("DOMContentLoaded", iniciarTiendas);

const nombreTienda = document.getElementById("nombreTienda");

function iniciarTiendas() {
    if(filename() == "inicio.php" || "inicio.php#info-ayuda.php"){
        tiendasTop();
    }else{
        CarouselCategorias();
        mostrarTodasTiendas();
    }
}

function filename(){
    const rutaAbsoluta = self.location.href;   
	const posicionUltimaBarra = rutaAbsoluta.lastIndexOf("/");
	const rutaRelativa = rutaAbsoluta.substring( posicionUltimaBarra + "/".length , rutaAbsoluta.length );
	return rutaRelativa;  
}

function tiendasTop(){
    const listadoTiendas = document.getElementById("listadoTiendas");
    listadoTiendas.innerHTML = "";
    fetch("../../php/tiendas_top.php", {
        method: "POST",
        body: null,
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                data.forEach(element => {
                    listadoTiendas.appendChild(crearComponenteTienda(element));
                });
            } else {
                listadoTiendas.appendChild(crearComponenteSinResultados());
            }
        })
        .catch(error => {
            console.error("Error: No se ha podido obtener los datos de todas las tiendas -> ", error);
        });
}

function CarouselCategorias() {
    try {
        const swiper = new Swiper(".mySwiper", {
            slidesPerView: 3,
            spaceBetween: 3,
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            breakpoints: {
                640: {
                    slidesPerView: 7,
                    spaceBetween: 5,
                },
                768: {
                    slidesPerView: 8,
                    spaceBetween: 5,
                },
                1024: {
                    slidesPerView: 10,
                    spaceBetween: 5,
                },
            },
        });
    } catch (e) {
        console.log("No hay swiper en está página")
    }
}

function mostrarTodasTiendas() {
    const listadoTiendas = document.getElementById("listadoTiendas");

    listadoTiendas.innerHTML = "";
    const datos = {
        tienda: nombreTienda.value
    }
    fetch("../../php/listar_tiendas.php", {
        method: "POST",
        body: JSON.stringify(datos),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                data.forEach(element => {
                    listadoTiendas.appendChild(crearComponenteTienda(element));
                });
            } else {
                listadoTiendas.appendChild(crearComponenteSinResultados());
            }
        })
        .catch(error => {
            console.error("Error: No se ha podido obtener los datos de todas las tiendas -> ", error);
        });
}

function filtrarCategoria(categoria) {
    const listadoTiendas = document.getElementById("listadoTiendas");

    listadoTiendas.innerHTML = "";
    const datos = {
        categoria: categoria
    }
    fetch("../../php/tiendas_categoria.php", {
        method: "POST",
        body: JSON.stringify(datos),
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            if (data.length > 0) {
                data.forEach(element => {
                    listadoTiendas.appendChild(crearComponenteTienda(element));
                });
            } else {
                listadoTiendas.appendChild(crearComponenteSinResultados());
            }

        })
        .catch(error => {
            console.error("Error: No se ha podido obtener los datos de todas las tiendas -> ", error);
        });
}

function crearComponenteTienda(element) {
    const componente = document.createElement("div");
    componente.style.height = "200px";
    componente.style.backgroundImage = `linear-gradient(to bottom, rgba(16, 14, 52, 0.2), rgba(16, 14, 52, 0.9)), url('../../img_bbdd/fondos/${element['CIF_PROV']}.jpg')`;
    componente.style.backgroundSize = "cover";
    componente.style.backgroundPosition = "center";
    componente.setAttribute("class", "col-span-4 lg:col-span-1 md:col-span-1 shadow-lg hover:shadow-2xl duration-300 cursor-pointer rounded-lg");

    const contenedor = document.createElement("div");
    contenedor.setAttribute("class", "w-full h-full flex flex-col justify-end rounded-lg");

    const contendorTexto = document.createElement("div");
    contendorTexto.setAttribute("class", "w-full h-fit mx-auto text-center rounded-xl");

    const datosTienda = document.createElement("div");
    datosTienda.setAttribute("class", "p-5 mb-5");

    const razonSocial = document.createElement("h3");
    razonSocial.setAttribute("class", "text-white font-bold truncate");
    razonSocial.textContent = `${element['RAZSOC']}`;

    const categoria = document.createElement("small");
    categoria.setAttribute("class", "px-2 py-1 bg-indigo-700 rounded-full text-xs text-white");
    categoria.textContent = `${element['CATEGORIA']}`;

    datosTienda.appendChild(razonSocial);
    datosTienda.appendChild(categoria);

    const datosExtra = document.createElement("div");
    datosExtra.setAttribute("class", "flex flex-wrap text-sm justify-center gap-3 bg-white p-2.5 rounded-b-lg");

    const divValoracion = document.createElement("div");
    divValoracion.setAttribute("class", "flex flex-wrap items-center gap-1");

    const imgValoracion = document.createElement("img");
    imgValoracion.style.width = "16px";
    if (element['VALORACIONES'] >= 4) {
        imgValoracion.setAttribute("src", "../../assets/svg/valoracion_top.svg");
    } else {
        imgValoracion.setAttribute("src", "../../assets/svg/valoracion.svg");
    }

    imgValoracion.setAttribute("alt", "valoración");

    const valoracion = document.createElement("p");
    valoracion.textContent = `${element['VALORACIONES']}`;
    if (element['VALORACIONES'] >= 4) {
        valoracion.setAttribute("class", "text-yellow-500 font-bold");
    }

    divValoracion.appendChild(imgValoracion);
    divValoracion.appendChild(valoracion);

    const divTiempo = document.createElement("div");
    divTiempo.setAttribute("class", "flex flex-wrap items-center gap-1");

    const imgTiempo = document.createElement("img");
    imgTiempo.style.width = "16px";
    imgTiempo.setAttribute("src", "../../assets/svg/tiempo.svg");
    imgTiempo.setAttribute("alt", "tiempo");

    const tiempo = document.createElement("p");
    tiempo.textContent = `${element['TIEMPO']} min`;

    divTiempo.appendChild(imgTiempo);
    divTiempo.appendChild(tiempo);

    datosExtra.appendChild(divValoracion);
    datosExtra.appendChild(divTiempo);
    contendorTexto.appendChild(datosTienda);
    contendorTexto.appendChild(datosExtra);
    contenedor.appendChild(contendorTexto);
    componente.appendChild(contenedor);

    return componente;
}

function crearComponenteSinResultados() {
    const p = document.createElement("p");
    p.textContent = "No se han encontrado resultados 😢 Busca otra tienda ¡Hay miles!";
    p.setAttribute("class", "col-span-4");
    p.style.textAlign = "center";

    return p;
}