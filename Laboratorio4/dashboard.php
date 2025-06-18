<!DOCTYPE html>
<html lang="es">
<?php
session_start();
include("verificarsesion.php");
include("verificarestado.php");
?>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Correo Interno</title>
  <link rel="stylesheet" href="./css/fontsgoogle.css">
  <link rel="stylesheet" href="./css/fontawesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="./css/dashboard.css">
  <link rel="stylesheet" href="./css/modal.css">
  <link rel="stylesheet" href="./css/tablas.css">
</head>

<body>
  <div class="dashboard-container">
   
    <header class="dashboard-header">
      <div class="header-title">Correo Interno</div>
      <div class="user-info">
        <div class="user-avatar"><?php echo substr($_SESSION['nombre'], 0, 1); ?></div>
        <div class="user-name"><?php echo $_SESSION['nombre']; ?></div>
      </div>
    </header>

   
    <aside class="dashboard-sidebar">
      <div class="sidebar-section">
        <h3>Bandejas</h3>
        <nav class="sidebar-nav">
          <div class="sidebar-item active" onclick="listarCorreos('becorreo.php')">
            <i class="fas fa-inbox"></i> Bandeja de entrada
            <!--<span class="badge">5</span>!-->
          </div>
          <div class="sidebar-item" onclick="listarCorreos('bscorreo.php')">
            <i class="fas fa-paper-plane"></i> Enviados
          </div>
          <div class="sidebar-item" onclick="listarCorreos('bocorreo.php')">
            <i class="fas fa-file"></i> Borradores
          </div>
          <div class="sidebar-item" onclick="listarCorreos('delcorreo.php')">
            <i class="fas fa-trash"></i> Eliminados
          </div>
        </nav>
      </div>

      <?php if($_SESSION['nivel'] == '1'): ?>
      <div class="sidebar-section">
        <h3>Administración</h3>
        <nav class="sidebar-nav">
          <div class="sidebar-item" onclick="listarUsuarios()">
            <i class="fas fa-users-cog"></i> Administrar usuarios
          </div>
          <div class="sidebar-item" onclick="auditarCorreos()">
            <i class="fas fa-search"></i> Auditoría
          </div>
          <div class="sidebar-item" onclick="notificacionMasiva()">
            <i class="fas fa-bullhorn"></i> Correo masivo
          </div>
        </nav>
      </div>
      <?php endif; ?>

      <div class="sidebar-section">
        <nav class="sidebar-nav">
          <div class="sidebar-item" onclick="modalCorreo()">
            <i class="fas fa-plus-circle"></i> Redactar nuevo
          </div>
          <a class="sidebar-item" href="logout.php">
            <i class="fas fa-sign-out-alt"></i> Cerrar sesión
          </a>
        </nav>
      </div>
    </aside>

   
    <main class="dashboard-main">
      <div class="section-header">
        <h1 class="section-title" id="section-title">Bandeja de entrada</h1>
        <button class="compose-btn" onclick="modalCorreo()">
          <i class="fas fa-plus"></i> Redactar
        </button>
      </div>
      
      <div id="contenido">
        <!-- los correos se muestran aqui -->
      </div>
    </main>
  </div>

  <div id="myModal" class="modal">
    <div class="modal-content">
      <div class="modal-header">
        <h2 id="titulo-modal">Título del Modal</h2>
        <span class="close">&times;</span>
      </div>
      <div class="modal-body" id="contenido-modal"></div>
    </div>
  </div>

  <script src="./js/fetch.js"></script>
  <script src="./js/modal.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const sidebarItems = document.querySelectorAll('.sidebar-item');
      sidebarItems.forEach(item => {
        item.addEventListener('click', function() {
          if(!this.classList.contains('active')) {
            sidebarItems.forEach(i => i.classList.remove('active'));
            this.classList.add('active');
          }
        });
      });
      
      listarCorreos('becorreo.php');
    });
  </script>

</body>

</html>