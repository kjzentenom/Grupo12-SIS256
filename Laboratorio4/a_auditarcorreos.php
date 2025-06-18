<?php
session_start();
require('verificarsesion.php');
require('verificarnivel.php');
include('conexion.php');

$orden = "c.id";
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
$sql_paginacion = "SELECT
    COUNT(*) AS total
FROM
    correos AS c
JOIN
    usuarios AS u_dest ON c.id_destinatario = u_dest.id
JOIN
    usuarios AS u_remit ON c.id_remitente = u_remit.id
WHERE
    ((u_remit.nombre LIKE '%$buscar%') OR (u_dest.nombre LIKE '%$buscar%'));";

$result_paginacion = $con->query($sql_paginacion);
$row_paginacion = mysqli_fetch_array($result_paginacion);
$total = $row_paginacion["total"];
$nropaginas = $total/5;
$nropaginas = ceil($nropaginas);
$inicio = ($pagina-1)*5;

$sql = "SELECT
    c.id AS id_correo,
    c.asunto,
    c.cuerpo,
    c.fecha_envio,
    c.estado,
    c.tipo,
    u_remit.correo AS correo_remitente,
    u_remit.nombre AS nombre_remitente,
    u_dest.correo AS correo_destinatario,
    u_dest.nombre AS nombre_destinatario
FROM
    correos AS c
JOIN
    usuarios AS u_remit ON c.id_remitente = u_remit.id
JOIN
    usuarios AS u_dest ON c.id_destinatario = u_dest.id
WHERE
    ((u_remit.nombre LIKE '%$buscar%') OR (u_remit.correo LIKE '%$buscar%') OR (c.asunto LIKE '%$buscar%') OR (u_dest.nombre LIKE '%$buscar%') OR (u_dest.correo LIKE '%$buscar%'))
ORDER BY $orden $asc
LIMIT $inicio, 5;";

$result = $con->query($sql);

$arreglocorreosauditar = [];
while ($row = mysqli_fetch_array($result)) {
    $arreglocorreosauditar[] = [
        "id_correo" => $row['id_correo'],
        "asunto" => $row['asunto'],
        "cuerpo" => $row['cuerpo'],
        "fecha_envio" => $row['fecha_envio'],
        "estado" => $row['estado'],
        "tipo" => $row['tipo'],
        "correo_remitente" => $row['correo_remitente'],
        "nombre_remitente" => $row['nombre_remitente'],
        "correo_destinatario" => $row['correo_destinatario'],
        "nombre_destinatario" => $row['nombre_destinatario']
    ];
}

$arregloaudioria = [
    "datacorreosauditar" => $arreglocorreosauditar,
    "asc" => $asc,
    "buscar" => $buscar,
    "pagina" => $pagina,
    "orden" => $orden,
    "nropaginas" => $nropaginas
];

echo json_encode($arregloaudioria);
?>