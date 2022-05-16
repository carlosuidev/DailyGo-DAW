<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/tienda.css">
    <link rel="stylesheet" href="styles.css">
    <title>DailyGo | Pedidos rápidos a domicilio</title>
    <link rel="shortcut icon" href="svg/Favicon.ico" type="image/x-icon">
</head>

<body>
    <!-- NAVBAR -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm fixed-top ps-5 pe-5">
        <div class="container-fluid p-2">
            <a href="inicio_u.html" class="navbar-brand">
                <img src="svg/Logotype.svg" alt="DailyGO" />
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="tienda_u.html" class="nav-item nav-link">Tienda</a>
                    <a href="seguimientoPedido.html" class="nav-item nav-link">Pedidos</a>
                    <a href="contacto_u.html" class="nav-item nav-link">Contacto</a>
                </div>
                <div class="navbar-nav ms-auto">
                    <a href="carritoCompra_u.html" class="nav-item nav-link">
                        <img src="svg/Carrito_Navbar.svg" alt="">
                    </a>
                    <a href="perfil_u.html" class="nav-item nav-link">
                        <img src="svg/User_Icon_Navbar.svg" alt="">
                    </a>
                </div>
            </div>
        </div>
    </nav>
    
    <div aria-label="breadcrumb" class="ms-5 mt-5" style="margin-top: 100px !important">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="tienda_u.html" class="text-secondary">Tiendas</a></li>
            <li class="breadcrumb-item active text-secondary" aria-current="page">McDonald´s</li>
        </ol>
    </div>

    <h2 class="ms-5 display-5">McDonald´s </h2>
    <hr class=" me-5 ms-5 w-75">
    <section class="container-fluid">
        <div class="row m-5">
            <div class="col-lg-3 col-sm-6 mb-4 me-3 border rounded h-100">
                <div class="h-50">
                    <img src="img/img_productos/mcnuggets.jpg" class="w-100">
                </div>
                <div class="p-3 h-50">
                    <h5 class="mt-5">McNuggets</h5>
                    <p>2,50&euro;</p>
                    <button type="submit" class="btn btn-sm btn-secondary w-100">PEDIR</button>
                </div>
            </div>
            <div class="col-lg-3 col-sm-2 mb-4 me-3 border rounded h-100">
                <div class="h-50">
                    <img src="img/img_productos/bigmac.png" class="w-100">
                </div>
                <div class="p-3 h-50">
                    <h5 class="mt-5">Menú Big Mac</h5>
                    <p>7,50€</p>
                    <button type="submit" class="btn btn-sm btn-secondary w-100">PEDIR</button>
                </div>
            </div>
            <div class="col-lg-3 col-sm-2 mb-4 me-3 border rounded h-100">
                <div class="h-50">
                    <img src="img/img_productos/mcflurry.png" class="w-100">
                </div>
                <div class="p-3">
                    <h5 class="mt-5">McFlurry KitKat Chocolate</h5>
                    <p>3,25€</p>
                    <button type="submit" class="btn btn-sm btn-secondary w-100">PEDIR</button>
                </div>
            </div>
            <div class="col-lg-3 col-sm-2 mb-4 me-3 border rounded h-100">
                <div class="h-50">
                    <img src="img/img_productos/patatas.png" class="w-100">
                </div>
                <div class="p-3">
                    <h5 class="mt-5">Patatas Fritas</h5>
                    <p>1€</p>
                    <button type="submit" class="btn btn-sm btn-secondary w-100">PEDIR</button>
                </div>
            </div>
            <div class="col-lg-3 col-sm-2 mb-4 me-3 border rounded h-100">
                <div class="h-50">
                    <img src="img/img_productos/mcpollo.jpg" class="w-100">
                </div>
                <div class="p-3">
                    <h5 class="mt-5">Menú McPollo</h5>
                    <p>8,50€</p>
                    <button type="submit" class="btn btn-sm btn-secondary w-100">PEDIR</button>
                </div>
            </div>
        </div>
    </section>

    <div class="text-center mb-5 mt-5">
        <img src="img/banner_970_300.png">
    </div>
    
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
                                <a href="inicio_u.html" class="text-white  text-decoration-none">Inicio</a>
                            </li>
                            <li class="mb-2">
                                <a href="tienda_u.html" class="text-white text-decoration-none">Tienda</a>
                            </li>
                            <li class="mb-2">
                                <a href="contacto_u.html" class="text-white text-decoration-none">Contacto</a>
                            </li>
                            <li class="mb-2">
                                <a href="sobre_nosotros.html" class="text-white text-decoration-none">Sobre nosotros</a>
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