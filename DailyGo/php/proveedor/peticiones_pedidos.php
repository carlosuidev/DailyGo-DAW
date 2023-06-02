<?php
$json = file_get_contents('php://input');

// Decodificar el JSON a un array asociativo
$data = json_decode($json, true);
$cif = $data["cif"];

$conexion = mysqli_connect("localhost", "root", "", "dailygo");
mysqli_select_db($conexion, "dailygo") or die("No se puede seleccionar la BD");
/* Lazo la consulta sobre la BD*/
try {
    $datos = mysqli_query($conexion, "SELECT DISTINCT ventas.num_ven, ventas.estado_ven, ventas.com_ven from ventas 
    JOIN detalle_ventas ON  detalle_ventas.num_ven_det=ventas.num_ven 
    JOIN riders ON ventas.dni_rid_ven=riders.dni_rid 
    JOIN productos ON detalle_ventas.cod_prod_det=productos.cod_prod 
    JOIN proveedores ON proveedores.cif_prov=productos.cif_prov_prod
    WHERE proveedor.cif_prov = $cif AND ventas.estado_ven = 'Creado'");
    $numr = mysqli_num_rows($datos);
    if ($numr > 0) {
        while ($data = mysqli_fetch_assoc($datos)) {
            $array_data[] = $data;
        }
        echo json_encode($array_data);
    } else {
        $arrError = array('msg' => "Sin resultados");
        echo json_encode($arrError);
    }
} catch (Exception $err) {
    echo 'Error';
}
