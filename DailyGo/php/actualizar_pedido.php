<?php
$servername = "localhost";
$username = "localhost";
$password = "";
$dbname = "dailygo";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$json = file_get_contents('php://input');
$datosJson = json_decode($json, true);

$id = $datosJson['id'];
$estado = $datosJson['estado'];
$nota = intval($datosJson['nota']);

if(isset($datosJson['nota'])){
    $sql = "UPDATE ventas SET estado_ven='$estado', valoracion=$nota WHERE num_ven=$id";
}else{
    $sql = "UPDATE ventas SET estado_ven='$estado' WHERE num_ven=$id";
}



if ($conn->query($sql) === TRUE) {
    echo "Actualizado";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
