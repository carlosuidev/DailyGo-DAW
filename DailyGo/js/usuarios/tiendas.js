document.addEventListener("DOMContentLoaded", iniciarTiendas);

function iniciarTiendas() {
    CarouselCategorias();
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