document.addEventListener("DOMContentLoaded", iniciarTiendas);

function iniciarTiendas() {
    CarouselCategorias();
    mostrarTodasTiendas();
}

function CarouselCategorias() {
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
}

function mostrarTodasTiendas(){
    const listadoTiendas =  document.getElementById("listadoTiendas");

    listadoTiendas.innerHTML = "";

    fetch("../../php/listar_tiendas.php", {
        method: "POST",
        body: null,
        headers: {
            "Content-Type": "application/json"
        }
    })
        .then(response => response.json())
        .then(data => {
            let i=1;

            data.forEach(element => {
                
                console.log(element['CIF_PROV'])
                listadoTiendas.innerHTML += `
                <div style="
                height: 200px;
                background-image:
                linear-gradient(to bottom, rgba(16, 14, 52, 0.2), rgba(16, 14, 52, 0.9)),
                url('../../img_bbdd/fondos/${i}.jpg');
                background-position: center; background-size: cover;"
                class="col-span-4 lg:col-span-1 md:col-span-1 shadow-lg hover:shadow-2xl duration-300 cursor-pointer rounded-lg">
                <div class="w-full h-full flex flex-col justify-end rounded-lg">
                    <div class=" w-full h-fit mx-auto text-center rounded-xl">
                        <div class="p-5 mb-5">
                            <h3 class="text-white font-bold truncate">${element['RAZSOC']}</h3>
                            <small class="px-2 py-1 bg-indigo-700 rounded-full text-xs text-white">${element['CATEGORIA']}</small>
                        </div>
                        <div class="flex flex-wrap text-sm justify-center gap-3 bg-white p-2.5 rounded-b-lg">
                            <div class="flex flex-wrap items-center gap-1">
                                <img src="../../assets/svg/valoracion.svg" alt="restaurante" width="16">
                                <p>${element['VALORACIONES']}</p>
                            </div>
                            <div class="flex flex-wrap items-center gap-1">
                                <img src="../../assets/svg/tiempo.svg" alt="tiempo" width="16">
                                <p>${element['TIEMPO']} min</p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
                `
                i++;
            });
        })
        .catch(error => {
            console.error("Error: No se ha podido obtener los datos de todas las tiendas -> ", error);
        });
}