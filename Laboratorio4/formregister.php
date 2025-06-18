<meta charset="UTF-8">
<?php
session_start();
$url = "";
if (isset($_SESSION['nivel']) && $_SESSION['nivel'] == 1) {
    $url = "a_vercuentas.php";
}
?>
<form id="form-register" method="post" action="javascript:enviarDatosRegistro(<?php echo '`'.$url.'`'; ?>)">
    <input type="text" name="nombre" id="nombre" placeholder="Nombre" required><br>
    <input type="text" name="usuario" id="usuario" placeholder="Usuario" required><br>
    <input type="email" name="correo" id="correo" placeholder="Correo Electronico" required><br>
    <input type="password" name="password" id="password" placeholder="Contraseña" required>

    <?php if (isset($_SESSION['nivel']) && $_SESSION['nivel'] == 1) { ?>
        <div class="nivel" style="display: flex; justify-content: space-evenly;">
            <label for="nivel">Nivel:</label>
            <div class="usuario-container">
                <input type="radio" name="nivel" id="nivel0" value="0"> Usuario
            </div>
            <div class="admin-container">
                <input type="radio" name="nivel" id="nivel1" value="1"> Administrador
            </div>
        </div>
    <?php } ?>

    <input type="submit" id="btn-register" value="Registrarse">
</form>