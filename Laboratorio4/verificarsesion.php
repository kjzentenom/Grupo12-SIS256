<?php
if (!isset($_SESSION["correo"]))
{
    echo "<div class='mensaje-alerta' style='background-color: #ffe0e0;
  border: 1px solid #ff9999;
  border-radius: 5px;
  padding: 15px 20px; 
  margin-bottom: 20px;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #c00000;
  font-size: 1rem;
  line-height: 1.5;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

  width: fit-content;
  max-width: 90%;
  margin-left: auto;
  margin-right: auto;
  text-align: center;'> Inicie Sesión para continuar </div>";
    ?>
    <meta http-equiv="refresh" content="3;url=formlogin.html">
    <?php
    die();
}
?>