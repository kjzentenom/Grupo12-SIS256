<?php
session_start();
require('verificarsesion.php');
require('verificarnivel.php');
include('conexion.php');

$id_cuenta = $_GET['id'];
$nombre = $_POST['nombre'];
$user = $_POST['usuario'];
$correo = $_POST['correo'];
$password = $_POST['password'];
$nivel = $_POST['nivel'] ?? 0;
$estado = $_POST['estado'] ?? 1;

$sql_verificar_contraseña = "SELECT password FROM usuarios WHERE id = ?";
$stmt = $con->prepare($sql_verificar_contraseña);
$stmt->bind_param("i", $id_cuenta);
$stmt->execute();
$result = $stmt->get_result();
$row_contraseña = $result->fetch_assoc();

if ($password == $row_contraseña['password']) {
  $password = $row_contraseña['password'];
} else {
  $password = sha1($password);
}

$sql = "UPDATE usuarios SET nombre = ?, user = ?, correo = ?, password = ?, nivel = ?, estado = ? WHERE id = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("ssssiii", $nombre, $user, $correo, $password, $nivel, $estado, $id_cuenta);

if ($stmt->execute()) {
  echo 'Cuenta actualizada exitosamente';
} else {
  echo 'Error al Actualizar la cuenta';
}

?>