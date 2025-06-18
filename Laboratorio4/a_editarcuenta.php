<link rel="stylesheet" href="./css/a_editarcuenta.css">
<link rel="stylesheet" href="./css/modal.css">
<?php
session_start();
require('verificarsesion.php');
require('verificarnivel.php');
include('conexion.php');

$id_usuario = $_GET['id'];

$sql_usuario = "SELECT id,nombre,user,correo,password,nivel,estado FROM usuarios WHERE id = ?";
$stmt = $con->prepare($sql_usuario);
$stmt->bind_param("i", $id_usuario);
$result_usuario = $stmt->execute();
$row_usuario = $stmt->get_result()->fetch_assoc();
?>

<form id="form-editar-cuenta" action="javascript:guardarEditarCuenta('<?php echo $id_usuario; ?>')" method="POST">
    <label for="nombre">Nombre</label>
    <input type="text" name="nombre" id="nombre" value="<?php echo $row_usuario['nombre']; ?>">
    <label for="usuario">Usuario</label>
    <input type="text" name="usuario" id="usuario" value="<?php echo $row_usuario['user']; ?>">
    <label for="correo">Correo</label>
    <input type="text" name="correo" id="correo" value="<?php echo $row_usuario['correo']; ?>">
    <label for="password">Contraseña</label>
    <input type="text" name="password" id="password" value="<?php echo $row_usuario['password']; ?>">
    <div class="nivel" style="display: flex; justify-content: space-evenly;">
        <label for="nivel">Nivel:</label>
        <div class="usuario-container">
            <input type="radio" name="nivel" value="0" <?php echo $row_usuario['nivel'] == 0 ? 'checked' : ''; ?>>Usuario
        </div>
        <div class="admin-container">
            <input type="radio" name="nivel" value="1" <?php echo $row_usuario['nivel'] == 1 ? 'checked' : ''; ?>>Administrador
        </div>
    </div>
    <div class="estado" style="display: flex; justify-content: space-evenly;">
        <label for="estado">Estado:</label>
        <div class="habilitado-container">
            <input type="radio" name="estado" value="1" <?php echo $row_usuario['estado'] == 1 ? 'checked' : ''; ?>>Habilitada
        </div>
        <div class="suspendido-container">
            <input type="radio" name="estado" value="0" <?php echo $row_usuario['estado'] == 0 ? 'checked' : ''; ?>>Suspendida
        </div>
    </div>
    <input type="submit" value="Guardar">
</form>