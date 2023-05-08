<?php
 
     $asunto = $_POST["asunto"];
     $descripcion = $_POST["descripcion"];
     $id = $_POST["id"];
     $conexion = mysqli_connect("localhost", "root", "", "dailygo");
     mysqli_select_db($conexion, "dailygo") or die("No se puede seleccionar la BD");
     /* Lazo la consulta sobre la BD*/
     try {
         $datos = mysqli_query($conexion, "INSERT INTO mensajes (ASU_MEN, MEN_MEN, COD_CLI_MEN) VALUES ('$asunto', '$descripcion', $id)");
        echo 'Creada';
     } catch (Exception $err) {
         echo 'tusMuertos';
     }