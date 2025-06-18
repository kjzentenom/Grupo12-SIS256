<?php
session_start();
include("verificarsesion.php");
include("verificarestado.php");
include("conexion.php");

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
//Usuario Sesion Actual
$miscorreos = $_SESSION['id'];
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
    (c.id_remitente = $miscorreos OR c.id_destinatario = $miscorreos)
    AND c.tipo = 0
    AND ((u_remit.nombre LIKE '%$buscar%') OR (u_dest.nombre LIKE '%$buscar%'));";

$result_paginacion = $con->query($sql_paginacion);
$row_paginacion = mysqli_fetch_array($result_paginacion);
$total = $row_paginacion["total"];
$nropaginas = $total/5;
$nropaginas = ceil($nropaginas);
$inicio = ($pagina-1)*5;

$sql="SELECT
    c.id,
    c.asunto,
    c.cuerpo,
    c.fecha_envio,
    c.estado,
    c.tipo,
    u_dest.correo AS correo_destinatario,
    u_dest.nombre AS nombre_destinatario
FROM
    correos AS c
JOIN
    usuarios AS u_dest ON c.id_destinatario = u_dest.id
JOIN
    usuarios AS u_remit ON c.id_remitente = u_remit.id
WHERE
    (c.id_remitente = $miscorreos OR c.id_destinatario = $miscorreos) 
    AND c.tipo = 0
    AND ((u_dest.correo LIKE '%$buscar%') OR (u_remit.correo LIKE '%$buscar%') OR (c.asunto LIKE '%$buscar%') OR (c.estado LIKE '%$buscar%'))
    ORDER BY $orden $asc 
    LIMIT $inicio,5;";

$resultado=$con->query($sql);

$arreglocorreos = [];
while($row=mysqli_fetch_array($resultado)){
    $arreglocorreos[] = [ 
         "o" => "Eliminado:",
        "id" => $row['id'],
        "correo" => $row['correo_destinatario'],
        "nombre" => $row['nombre_destinatario'],
        "estado"=>$row["estado"],
        "asunto"=>$row["asunto"],
        "cuerpo"=>$row["cuerpo"],
        "fecha_envio"=>$row["fecha_envio"],
        "tipo"=>$row["tipo"],
    ];
}
$arreglobsc = [
    "datacorreos" => $arreglocorreos,
    "asc" => $asc,
    "buscar" => $buscar,
    "pagina" => $pagina,
    "orden" => $orden,
    "objetivo" => "c.id",
    "nropaginas" => $nropaginas,
    "urlraiz" => "delcorreo.php",
];

echo json_encode($arreglobsc);
?>