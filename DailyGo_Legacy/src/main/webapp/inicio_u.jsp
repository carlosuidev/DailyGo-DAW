<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.tablas.Clientes"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/fondos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>DailyGo | Pedidos rápidos a domicilio</title>
    <link rel="shortcut icon" href="svg/Favicon.ico" type="image/x-icon">
</head>

<body>
	<%
	HttpSession misesion = request.getSession();
 	Clientes cliente = (Clientes) misesion.getAttribute("emailIU");
 	if (cliente == null){
 		response.sendRedirect("iniciar_sesion_u.html");
 	}
	%>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm fixed-top ps-5 pe-5">
        <div class="container-fluid p-2">
            <a href="#" class="navbar-brand">
                <img src="svg/Logotype.svg" alt="DailyGO" />
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="tienda_u.jsp" class="nav-item nav-link">Tienda</a>
                    <a href="seguimientoPedido.jsp" class="nav-item nav-link">Pedidos</a>
                    <a href="contacto_u.jsp" class="nav-item nav-link">Contacto</a>
                </div>
                <div class="navbar-nav ms-auto">
                    <a href="carritoCompra_u.jsp" class="nav-item nav-link">
                        <img src="svg/Carrito_Navbar.svg" alt="">
                    </a>
                    <a href="perfil_u.jsp" class="nav-item nav-link">
                        <img src="svg/User_Icon_Navbar.svg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <div id="LandingU" class="p-5 min-vh-100" style="padding-top: 35vh !important;">
        <div class="row my-auto h-100">
            <div class="col-md-6 col-sm-12">
                <h1 class="text-white mb-4 display-5 text-shadow">Pedidos y comidas <br> a domicilio en minutos</h1>
                <div class="pt-3 ps-4 pe-4 pb-4 bg-white rounded">
                    <form action="ServletForm" method="POST">
                        <p class="font-weight-bold">Introduce tu local favorito y empieza a pedir</p>
                        <div class="input-group">
                            <input name="restauranteNombre" id="restauranteNombre" type="text" class="form-control" placeholder="Tim Hortons, KFC, McDonald´s..."
                                aria-label="Tim Hortons" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-secondary" type="submit"><i
                                        class="fa-solid fa-magnifying-glass me-2"></i>BUSCAR</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <section id="Descripcion" class="container mt-5 p-5">
        <div class="row my-auto">
            <div class="col-sm-12 col-md-5 mb-5">
                <video class="w-100 rounded" autoplay loop controls>
                    <source src="media/landing_u_food.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
            <div class="col-md-1"></div>
            <div class="col-sm-12 col-md-6 mt-2">
                <h6 class="text-secondary">COMPRA TUS MARCAS DE SIEMPRE</h6>
                <h2 class="text-primary">De la tienda a tu puerta</h2>
                <p class="mt-4 pe-4">Encuentra tus restaurantes favoritos con los descuentos más atractivos para pedir
                    comida. Date de alta en nuestra newsletter y recibe los mejores descuentos en comida a domicilio</p>
                <a href="sobre_nosotros.html" target="_blank" class="btn btn-secondary mt-4">SABER MÁS<S></S></a>
            </div>
        </div>
    </section>

    <section id="DescargarApp" class="container mt-5 p-5">
        <div class="row my-auto">
            <div class="col-sm-12 col-md-5 mb-5">
                <h6 class="text-secondary">DONDE DESEES</h6>
                <h2 class="text-primary">Pide desde cualquier lugar con nuestra App ¿A qué esperas?</h2>
                <p class="mt-4 pe-4">¿Quieres estar al día de nuestros productos y ofertas? Ahora también disponibles en
                    tu móvil gracias a esta App. La aplicación te permitirá acceder a nuestro catálogo de forma muy
                    cómoda y fácil. Disponible tanto en App Store como Google Play.</p>
                <div class="d-flex flex-wrap mt-4">
                    <a href="https://www.apple.com/es/app-store/" target="_blank" class="me-3 mt-2">
                        <img src="svg/AppleStore.svg" alt="">
                    </a>
                    <a href="https://play.google.com/store?hl=es&gl=US" target="_blank" class="mt-2">
                        <img src="svg/GooglePlay.svg" alt="">
                    </a>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-sm-12 col-md-5 mt-2 row">
                <img src="img/App.png" class="w-100 h-100" style='object-fit: contain;'>
            </div>
        </div>
    </section>

    <section id="Suscripciones" class="bg-primary text-center p-5 d-flex flex-column align-items-center">
        <h6 class="text-warning">DESCUBRE NUESTROS PLANES</h6>
        <h2 class="text-white">Benefíciate de las mejores ofertas y <br>
            envíos gratis con nuestros planes</h2>
        <div class="row mt-5 w-75">
            <div class="col-md-4 col-sm-12 bg-white rounded p-4 text-center shadow-lg mt-2">
                <img src="svg/Plan1.svg" alt="" class="mb-3">
                <h2 class="text-secondary">Basic</h2>
                <p><i class="fa-solid fa-circle-check text-primary me-1"></i>Promociones especiales<br><i
                        class="fa-solid fa-circle-check text-primary me-1"></i>Cupones de descuento <br><i
                        class="fa-solid fa-circle-check text-primary me-1"></i>Y mucho más <br> -<br>-</p>
                <div class="d-flex justify-content-center align-items-baseline mb-2">
                    <h2 class="display-5">0</h2>
                    <p class="font-weight-bold"> €/mes</p>
                </div>
                <a href="suscripciones_u.jsp" class="btn btn-outline-secondary w-100">SEGUIR COMO BASIC</a>
            </div>
            <div class="col-md-4 col-sm-12 bg-white rounded p-4 text-center shadow-lg mt-2">
                <img src="svg/Plan2.svg" alt="" class="mb-3">
                <h2 class="text-secondary">Pro</h2>
                <p><i class="fa-solid fa-circle-check text-secondary me-1"></i>Promociones especiales<br><i
                        class="fa-solid fa-circle-check text-secondary me-1"></i>Cupones de descuento <br> <i
                        class="fa-solid fa-circle-check text-secondary me-1"></i>Envíos gratis<br> <i
                        class="fa-solid fa-circle-check text-secondary me-1"></i>Descuentos del 5%<br> <i
                        class="fa-solid fa-circle-check text-secondary me-1"></i>Y mucho más </p>
                <div class="d-flex justify-content-center align-items-baseline mb-2">
                    <h2 class="display-5">7</h2>
                    <p class="font-weight-bold"> €/mes</p>
                </div>
                <a href="suscripciones_u.jsp" class="btn btn-secondary w-100">PASAR A PRO</a>
            </div>
            <div class="col-md-4 col-sm-12 bg-white rounded p-4 text-center shadow-lg mt-2">
                <img src="svg/Plan3.svg" alt="" class="mb-3">
                <h2 class="text-secondary">Expert</h2>
                <p><i class="fa-solid fa-circle-check text-primary me-1"></i>Promociones especiales<br><i
                        class="fa-solid fa-circle-check text-primary me-1"></i>Cupones de descuento <br> <i
                        class="fa-solid fa-circle-check text-primary me-1"></i>Envíos gratis<br> <i
                        class="fa-solid fa-circle-check text-primary me-1"></i>Descuentos del 10%<br> <i
                        class="fa-solid fa-circle-check text-primary me-1"></i>Y mucho más </p>
                <div class="d-flex justify-content-center align-items-baseline mb-2">
                    <h2 class="display-5">15</h2>
                    <p class="font-weight-bold"> €/mes</p>
                </div>
                <a href="suscripciones_u.jsp" class="btn btn-outline-secondary w-100">PASAR A EXPERT</a>
            </div>
        </>
    </section>
    <section id="Riders" class="p-5 bg-primary d-flex flex-column align-items-center justify-content-center">
        <span class="border border-top border-white w-100 opacity-25"></span>
        <div class="row my-auto mt-5 p-5">
            <div class="col-md-6 col-sm-12 d-flex flex-column justify-content-center mb-5">
                <h3 class="text-white mb-4">
                    Colabora siendo rider, partner <br> o trabajando con nosotros
                </h3>
                <p class="text-white mb-4">En DailyGo ofrecemos puestos de trabajo para riders, programadores, gestores
                    de
                    venta y cientos de puestos disponibles para todos.</p>
                <a href="https://www.linkedin.com/" target="_blank" class="btn btn-warning text-primary w-75">BUSCAR EMPLEO <i
                        class="fa-solid fa-arrow-right-long ms-3"></i></a>
            </div>
            <div class=" col-lg-none col-md-1"></div>
            <div class="col-md-5 col-sm-12">
                <img src="img/Bolsa_McCafe.png" class="w-75" alt="">
            </div>

        </div>
        
    </section>

    <!--FOOTER-->
    <div>
        <footer class="bg-secondary text-center text-lg-start text-white">
            <div class="container p-3">
                <div class="row my-5 container-fluid mx-auto">
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-3">
                        <div class="shadow-1-strong d-flex align-items-center justify-content-center mb-4 mx-auto">
                            <img src="svg/LOGOfooter.svg" height="40" alt="" loading="lazy" />
                        </div>
                        <p class="text-center small mb-4">Puedes seguirnos en el Twitter <br> de Carlos Almendros y en
                            el <br> Instagram de Ignacio Gil</p>
                        <ul class="list-unstyled d-flex flex-row justify-content-center">
                            <li>
                                <a class="text-white px-2" href="https://www.twitter.com/design_c2a" target="_blank">
                                    <img src="svg/twitter.svg"></img>
                                </a>
                            </li>
                            <li>
                                <a class="text-white px-2" href="https://www.instagram.com/arrobaladygaga"
                                    target="_blank">
                                    <img src="svg/instagram.svg"></img>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4 ps-5">
                        <h5 class="text-uppercase mb-4">De interés</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="#" class="text-white  text-decoration-none">Inicio</a>
                            </li>
                            <li class="mb-2">
                                <a href="tienda_u.jsp" class="text-white text-decoration-none">Tienda</a>
                            </li>
                            <li class="mb-2">
                                <a href="contacto_u.jsp" class="text-white text-decoration-none">Contacto</a>
                            </li>
                            <li class="mb-2">
                                <a href="sobre_nosotros.html" class="text-white text-decoration-none" target="_blank">Sobre nosotros</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4">
                        <h5 class="text-uppercase mb-4">Servicios</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="#" class="text-white text-decoration-none">Pedidos</a>
                            </li>
                            <li class="mb-2">
                                <a href="#" class="text-white text-decoration-none">Riders</a>
                            </li>
                            <li class="mb-2">
                                <a href="#" class="text-white text-decoration-none">Venta de productos</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0 pt-4">
                        <h5 class="text-uppercase mb-4">Información</h5>

                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <a href="privacidad.html" class="text-white text-decoration-none" target="_blank"> Politica de
                                    privacidad</a>
                            </li>
                            <li class="mb-2">
                                <a href="condiciones.html" class="text-white text-decoration-none" target="_blank"> Condiciones de
                                    uso</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
                © 2022 DailyGo S.A.
            </div>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
</body>

</html>
