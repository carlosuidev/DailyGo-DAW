<?php
$json = file_get_contents('php://input');

// Decodificar el JSON a un array asociativo
$data = json_decode($json, true);
if (isset($data["producIni"])) {
    $cif = $data["cif"];
    $conexion = mysqli_connect("localhost", "root", "", "dailygo");
    $arrayProductos = [];
    mysqli_select_db($conexion, "dailygo") or die("No se puede seleccionar la BD");
    /* Lazo la consulta sobre la BD*/
    try {
        $datos = mysqli_query($conexion, "SELECT COD_PROD as codigo, DEN_PROD as nombre, PU_PROD as precio from productos where CIF_PROV_PROD = '$cif'");
        $numr = mysqli_num_rows($datos);
        if ($numr != 0) {
            while ($data = mysqli_fetch_assoc($datos)) {
                array_push($arrayProductos,  $data);
            }
            echo json_encode($arrayProductos);
        }
    } catch (Exception $err) {
        echo $err;
    }
}
