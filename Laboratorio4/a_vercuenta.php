<?php
session_start();
require('verificarsesion.php');
require('verificarnivel.php');
include('conexion.php');

$orden = "id";
$buscar = "";
$asc = "ASC";
//Buscar
if(isset($_GET["buscar"]))
{$buscar=$_GET["buscar"];}
//Orden
if(isset($_GET['orden']))
{$orden = $_GET['orden'];}
//Asendente-Desendente
if(isset($_GET['asendente']))
{$asc= $_GET['asendente'];}
//PaginacionExterna
if(isset($_GET["pagina"])){
    $pagina=$_GET["pagina"];
}else{
    $pagina=1;
}

//Consulta Numero de Paginas
$sql_paginacion = "SELECT COUNT(*) AS total FROM usuarios WHERE nombre like '%$buscar%'";
$result_paginacion = $con->query($sql_paginacion);
$row_paginacion = mysqli_fetch_array($result_paginacion);
$total = $row_paginacion['total'];
$nropaginas = ceil($total / 5);
$inicio = ($pagina - 1) * 5;


$sql = "SELECT id,nombre,user,correo,password,nivel,estado 
FROM usuarios
WHERE ((nombre like '%$buscar%') OR (correo like '%$buscar%') OR (user like '%$buscar%')) 
ORDER BY $orden $asc 
LIMIT $inicio,5";

$result = $con->query($sql);

$arreglousuarios = [];
while ($row = mysqli_fetch_array($result)) {
    $arreglousuarios[] = [
        "id" => $row['id'],
        "nombre" => $row['nombre'],
        "user" => $row['user'],
        "correo" => $row['correo'],
        "password" => $row['password'],
        "nivel" => $row['nivel'],
        "estado" => $row['estado']
    ];
}
$arreglocuentas = [
    "datausuarios" => $arreglousuarios,
    "asc" => $asc,
    "buscar" => $buscar,
    "pagina" => $pagina,
    "orden" => $orden,
    "nropaginas" => $nropaginas
];

echo json_encode($arreglocuentas);
?>