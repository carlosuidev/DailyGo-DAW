<?php
try {
    $conexion = mysqli_connect("localhost", "root", "", "dailygo");
    mysqli_select_db($conexion, "dailygo") or die("No se puede seleccionar la BD");
    /* Lazo la consulta sobre la BD*/
    $datos = mysqli_query($conexion, "SELECT * FROM proveedores");
    $numr = mysqli_num_rows($datos);
    if ($numr > 0) {
        while($data=mysqli_fetch_assoc($datos)){
            $array_data[]=$data;
        }   
        echo json_encode($array_data);
    } else {
        echo 'False';
    }
} catch (\Throwable $th) {
    return "$th";
}
    
