function enviarDatosLogin() {
  var formlogin = document.getElementById('form-login');
  var datos = new FormData(formlogin);

  fetch('login.php', {method: 'POST',body: datos})
  .then(response => response.text())
  .then(data => {
    if (data === 'true') {
      redireccionarDashboard();
    } else if (data === 'suspendido') {
      let mensaje = "Usuario suspendido, contacte al administrador";
      redireccionarLogin(mensaje);

    }else if (data === 'false') {
      let mensaje = "Usuario o contraseña incorrectos";
      redireccionarLogin(mensaje);
    }
  })
}

function redireccionarDashboard() {
  fetch('dashboard.php')
    .then(response => response.text())
    .then(data => {
      window.location.href = 'dashboard.php';
    })
}

function redireccionarLogin(msgerror) {
  const mensaje = document.getElementById('mensaje-error');
  const formulario = document.getElementById('form-login');
  mensaje.style.backgroundColor = "transparent";
  mensaje.style.padding = "0";
  if(msgerror == "Usuario suspendido, contacte al administrador") {
    mensaje.style.backgroundColor = "yellow";
    mensaje.style.padding = "10px";
    mensaje.style.borderRadius = "10px";
  }
  if (msgerror != "") {
    mensaje.innerHTML = msgerror;
  }else{
    mensaje.innerHTML = "";
  }
  formulario.reset();
}

function datosRegistrar() {
  fetch('formregister.php')
    .then((response) => response.text())
    .then((data) => {
		  document.querySelector("#titulo-modal").innerHTML = "Registrar Usuario"
		  document.querySelector("#contenido-modal").innerHTML = data
		  document.getElementById("myModal").style.display = "block";
		  });
}

function enviarDatosRegistro(url) {
  var formregister = document.getElementById('form-register');
  var datos = new FormData(formregister);

  fetch("adduser.php", { method: "POST", body: datos })
    .then((response) => response.text())
	  .then((data) => {
		  document.querySelector("#titulo-modal").innerHTML = "Mensaje"
		  document.querySelector("#contenido-modal").innerHTML = data
      if(url === 'a_vercuentas.php') {
        listarUsuarios();
      }else{
        let msgerror = "";
        redireccionarLogin(msgerror);
      }
		  }
	  );
}

function modalCorreo() {
  fetch('redactarcorreo.php')
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Redactar Correo"
      document.querySelector("#contenido-modal").innerHTML = data
      document.getElementById("myModal").style.display = "block";
      });
}

function accionCorreo(accion) {
  var formcorreo = document.getElementById('form-correo');
  var datos = new FormData(formcorreo);
  var urlrefresh = 'becorreo.php'
  var url = `enviarcorreo.php?accion=${accion}`;

  fetch(url, { method: "POST", body: datos })
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Mensaje"
      document.querySelector("#contenido-modal").innerHTML = data
      listarCorreos(urlrefresh);
      }
    );
}

function listarCorreos(url) {
  var contenedor;
  contenedor = document.getElementById("contenido");
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      objeto = JSON.parse(data);
      contenedor.innerHTML = renderizarCorreo(objeto, url);
    });
}

function ordenarCorreos(urlmain,pagina, buscar, orden, ascendente) {
  var url = urlmain + `?pagina=${pagina}&buscar=${buscar}&orden=${orden}&asendente=${ascendente}`;
  var contenedor = document.getElementById("contenido");
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      objeto = JSON.parse(data);
      contenedor.innerHTML = renderizarCorreo(objeto, urlmain);
    });
}

function redireccionarBuscar(urlmain,pagina, buscar, orden, ascendente) {
  var nuevobuscar = document.getElementById("barra-buscar").value;
  ordenarCorreos(urlmain,pagina, nuevobuscar, orden, ascendente);
}

function renderizarCorreo(objeto, url) {
  let urlmain = url;
  let correos = objeto.datacorreos;
  let asc = objeto.asc;
  let buscar = objeto.buscar;
  let pagina = objeto.pagina;
  let orden = objeto.orden;
  let objetivo = objeto.objetivo;
  let nropaginas = objeto.nropaginas;
  let raiz = objeto.urlraiz;

  let html = `<form action="javascript:redireccionarBuscar('${urlmain}',1,'${buscar}','${orden}','${asc}')">
        <input id="barra-buscar" type="text" name="buscar" placeholder="Buscar">
        <input class="boton-buscar" type="submit" value="Buscar">
      </form>`;

  html += `<div class="correos-container"><table>
    <thead>
      <tr id="cabecera">
        <th data-label="Acción">*</th>
        <th data-label="Correo"><a href="javascript:ordenarCorreos('${urlmain}','${pagina}', '${buscar}', '${objetivo}', '${(orden == objetivo && asc == 'ASC' ? 'DESC' : 'ASC')}')">Correo</a></th>
        <th data-label="Asunto"><a href="javascript:ordenarCorreos('${urlmain}','${pagina}', '${buscar}', 'c.asunto', '${(orden == 'c.asunto' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Asunto</a></th>
        <th data-label="Estado"><a href="javascript:ordenarCorreos('${urlmain}','${pagina}', '${buscar}', 'c.estado', '${(orden == 'c.estado' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Estado</a></th>
        <th data-label="Operaciones">Operaciones</th>
      </tr>
    </thead>
    <tbody>`;

  for (var i = 0; i < correos.length; i++) {
    html += `<tr`;
    if (correos[i].estado == "abierto") {
      html += ` id="abierto">`;
    }
    else if (correos[i].estado == "enviado") {
      html += ` id="enviado">`;
    }else{
      html += `>`;
    }
    html += `
      <td data-label="Acción">${correos[i].o}</td>
      <td data-label="Correo">${correos[i].correo}</td>
      <td data-label="Asunto">${correos[i].asunto}</td>
      <td data-label="Estado">${correos[i].estado}</td>
      <td data-label="Operaciones" class="table-actions">`;
    
    if(correos[i].estado == "pendiente") {
      html += `<a href="javascript:editarCorreo('${correos[i].id}', '${url}')">Editar</a>`;
    } else if(correos[i].tipo == "0") {
      html += `<a href="javascript:verCorreoModal('${correos[i].id}', '${url}')">Ver</a>
               <a href="javascript:restaurarCorreo('${correos[i].id}', '${url}')">Restaurar</a>`;
    }else{
      html += `<a href="javascript:verCorreoModal('${correos[i].id}', '${url}')">Ver</a>
               <a href="javascript:eliminarCorreo('${correos[i].id}', '${url}')">Eliminar</a>`;
    }
    
    html += `</td></tr>`;
  }
  html += `</tbody></table>`;
  //Paginacion
  html += `<div class="pagination" style="display: flex; gap: 10px">
          <a class="active" href="javascript:ordenarCorreos('${urlmain}',1,'${buscar}','${orden}','${asc}')">&laquo;</a>
          <a class="active" href="javascript:ordenarCorreos('${urlmain}',${parseInt(pagina) - 1},'${buscar}','${orden}','${asc}')">&lt</a>`;
  for (i = 1; i <= nropaginas; i++) {
    html += `<a class='${(pagina == i ? 'selected' : 'default')}' href="javascript:ordenarCorreos('${urlmain}',${i},'${buscar}','${orden}', '${asc}')">${i}</a>`;
  }
  html += `<a class="active" href="javascript:ordenarCorreos('${urlmain}',${parseInt(pagina) + 1},'${buscar}','${orden}','${asc}')">&gt</a>  
           <a class="active" href="javascript:ordenarCorreos('${urlmain}',${nropaginas},'${buscar}','${orden}','${asc}')">&raquo;</a> 
	</div> </div>`;
  return html;
}

function verCorreoModal(id,urlrefresh) {
  var url = `mostrarcorreo.php?id=${id}`;
  actualozarEstadoCorreo(id);
  var openCorreo = document.getElementById('abierto');
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
		  document.querySelector("#titulo-modal").innerHTML = "Correo"
		  document.querySelector("#contenido-modal").innerHTML = data
		  document.getElementById("myModal").style.display = "block"
      listarCorreos(urlrefresh);
		  });
}

function actualozarEstadoCorreo(id) {
  var url = `actualizarestadoabierto.php?id=${id}`;
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      console.log(data);
    });
}

function eliminarCorreo(id,urlrefresh) {
  var url = `eliminarcorreo.php?id=${id}`;
  var contenedor = document.getElementById("contenido");
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      contenedor.innerHTML = data
      listarCorreos(urlrefresh);
    });
}

function restaurarCorreo(id,urlrefresh) {
  var url = `restaurarcorreo.php?id=${id}`;
  var contenedor = document.getElementById("contenido");
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      contenedor.innerHTML = data
      listarCorreos(urlrefresh);
    });
}

function editarCorreo(id,urlrefresh) {
  var url = `editarcorreo.php?id=${id}`;
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Editar Correo"
      document.querySelector("#contenido-modal").innerHTML = data
      document.getElementById("myModal").style.display = "block"
      listarCorreos(urlrefresh);
      });
}

function guardarEditarCorreo(accion, id) {
  var datos = new FormData(document.querySelector("#form-correo"));
  var url = `guardareditarcorreo.php?id=${id}&accion=${accion}`;
  var urlrefresh = 'bocorreo.php';

  fetch(url, { method: "POST", body: datos })
    .then((response) => response.text())
	  .then((data) => {
		  document.querySelector("#titulo-modal").innerHTML = "Mensaje"
		  document.querySelector("#contenido-modal").innerHTML = data
      listarCorreos(urlrefresh);
		  }
	  	  );
}

function enviarBorrador(accion, id) {
  var formborrador = document.getElementById('form-correo');
  var datos = new FormData(formborrador);
  var url = `enviarborrador.php?accion=${accion}&id=${id}`;
  var urlrefresh = 'bocorreo.php';

  fetch(url, { method: "POST", body: datos })
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Mensaje"
      document.querySelector("#contenido-modal").innerHTML = data
      listarCorreos(urlrefresh);
      }
    );
}

//CRUD USUARIOS
function listarUsuarios() {
  var contenedor;
  contenedor = document.getElementById("contenido");
  fetch('a_vercuenta.php')
    .then((response) => response.text())
    .then((data) => {
      usuarios = JSON.parse(data);
      contenedor.innerHTML = renderizarUsuarios(usuarios);
    });
}

function ordenarUsuarios(pagina, buscar, orden, ascendente) {
  var url = `a_vercuenta.php?pagina=${pagina}&buscar=${buscar}&orden=${orden}&asendente=${ascendente}`;
  var contenedor;
  contenedor = document.getElementById("contenido");
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      usuarios = JSON.parse(data);
      contenedor.innerHTML = renderizarUsuarios(usuarios);
    });
}

function redireccionarBuscarUsuarios(pagina, buscar, orden, ascendente) {
  var nuevobuscar = document.getElementById("barra-buscar-usuarios").value;
  ordenarUsuarios(pagina, nuevobuscar, orden, ascendente);
}

function renderizarUsuarios(objeto) {
  let usuarios = objeto.datausuarios;
  let asc = objeto.asc;
  let buscar = objeto.buscar;
  let pagina = objeto.pagina;
  let orden = objeto.orden;
  let nropaginas = objeto.nropaginas;

  let html = `<form action="javascript:redireccionarBuscarUsuarios(1,'${buscar}','${orden}','${asc}')">
        <input id="barra-buscar-usuarios" type="text" name="buscar" placeholder="Buscar">
        <input class="boton-buscar" type="submit" value="Buscar">
      </form>`;

  html += `<div class="correos-container"> <table class="data-table">
    <thead>
      <tr>
        <th data-label="Nombre"><a href="javascript:ordenarUsuarios('${pagina}','${buscar}', 'nombre', '${(orden == 'nombre' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Nombre</a></th>
        <th data-label="Usuario"><a href="javascript:ordenarUsuarios('${pagina}','${buscar}', 'user', '${(orden == 'user' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Usuario</th>
        <th data-label="Correo"><a href="javascript:ordenarUsuarios('${pagina}','${buscar}', 'correo', '${(orden == 'correo' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Correo</th>
        <th data-label="Estado"><a href="javascript:ordenarUsuarios('${pagina}','${buscar}', 'estado', '${(orden == 'estado' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Estado</th>
        <th data-label="Operaciones">Operaciones</th>
      </tr>
    </thead>
    <tbody>`;

  for (var i = 0; i < usuarios.length; i++) {
    html += `
      <tr>
        <td data-label="Nombre">${usuarios[i].nombre}</td>
        <td data-label="Usuario">${usuarios[i].user}</td>
        <td data-label="Correo">${usuarios[i].correo}</td>
        <td data-label="Estado" id="${(usuarios[i].estado == '0') ? 'suspendido' : 'habilitado' }">${(usuarios[i].estado == '0') ? 'Suspendido' : 'Habilitado'}</td>
        <td data-label="Operaciones" class="table-actions">
          <a class="btn-action edit" href="javascript:editarUsuario('${usuarios[i].id}')">
            <i class="fas fa-edit"></i> Editar
          </a>
          <a class="btn-action delete" href="javascript:eliminarCuenta('${usuarios[i].id}')">
            <i class="fas fa-trash-alt"></i> Eliminar
          </a>
        </td>
      </tr>`;
  }
  
  html += `</tbody></table>
    <div class="add-user-btn">
      <a class="btn-action add" href="javascript:datosRegistrar()">
        <i class="fas fa-user-plus"></i> Registrar Usuario
      </a>
    </div>`;

  html += `<div class="pagination" style="display: flex; gap: 10px">
          <a class="active" href="javascript:ordenarUsuarios('1,'${buscar}','${orden}','${asc}')">&laquo;</a>
          <a class="active" href="javascript:ordenarUsuarios(${parseInt(pagina) - 1},'${buscar}','${orden}','${asc}')">&lt</a>`;
  for (i = 1; i <= nropaginas; i++) {
    html += `<a class='${(pagina == i ? 'selected' : 'default')}' href="javascript:ordenarUsuarios(${i},'${buscar}','${orden}', '${asc}')">${i}</a>`;
  }
  html += `<a class="active" href="javascript:ordenarUsuarios(${parseInt(pagina) + 1},'${buscar}','${orden}','${asc}')">&gt</a>  
           <a class="active" href="javascript:ordenarUsuarios(${nropaginas},'${buscar}','${orden}','${asc}')">&raquo;</a> 
	</div> </div>`;
  
  return html;
}

function editarUsuario(id) {
  var url = `a_editarcuenta.php?id=${id}`;
  var urladministrarusuario = 'a_vercuentas.php';
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Editar Cuenta"
      document.querySelector("#contenido-modal").innerHTML = data
      document.getElementById("myModal").style.display = "block"
      listarUsuarios(urladministrarusuario);
      });
}

function guardarEditarCuenta(id) {
  var datos = new FormData(document.querySelector("#form-editar-cuenta"));
  var url = `a_guardarcuenta.php?id=${id}`;
  var urlrefresh = 'a_vercuentas.php';

  fetch(url, { method: "POST", body: datos })
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Mensaje"
      document.querySelector("#contenido-modal").innerHTML = data
      listarUsuarios(urlrefresh);
      }
    );
}

function eliminarCuenta(id) {
  var url = `a_eliminarcuenta.php?id=${id}`;
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Mensaje"
      document.querySelector("#contenido-modal").innerHTML = data
      listarUsuarios();
      }
    );
}

function auditarCorreos() {
  var contenedor;
  contenedor = document.getElementById("contenido");
  fetch('a_auditarcorreos.php')
    .then((response) => response.text())
    .then((data) => {
      auditoria = JSON.parse(data);
      contenedor.innerHTML = renderizarAuditoria(auditoria);
    });
}

function ordenarAuditoria(pagina, buscar, orden, ascendente) {
  var url = `a_auditarcorreos.php?pagina=${pagina}&buscar=${buscar}&orden=${orden}&asendente=${ascendente}`;
  var contenedor;
  contenedor = document.getElementById("contenido");
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      auditoria = JSON.parse(data);
      contenedor.innerHTML = renderizarAuditoria(auditoria);
    });
}

function redireccionarBuscarAuditoria(pagina, buscar, orden, ascendente) {
  var nuevobuscar = document.getElementById("barra-buscar-auditoria").value;
  ordenarAuditoria(pagina, nuevobuscar, orden, ascendente);
}

function renderizarAuditoria(objeto) {
  let auditoria = objeto.datacorreosauditar;
  let asc = objeto.asc;
  let buscar = objeto.buscar;
  let pagina = objeto.pagina;
  let orden = objeto.orden;
  let nropaginas = objeto.nropaginas;

  let html = `<form action="javascript:redireccionarBuscarAuditoria(1,'${buscar}','${orden}','${asc}')">
        <input id="barra-buscar-auditoria" type="text" name="buscar" placeholder="Buscar">
        <input class="boton-buscar" type="submit" value="Buscar">
      </form>`;

  html += `<div class="correos-container"> <table style="border-collapse: collapse" border="1" >
        <thead>
        	<tr>
            <th data-label="Remitente"><a href="javascript:ordenarAuditoria('${pagina}','${buscar}', 'u_remit.nombre', '${(orden == 'u_remit.nombre' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Remitente</th>
            <th data-label="Correo Remitente"><a href="javascript:ordenarAuditoria('${pagina}','${buscar}', 'u_remit.correo', '${(orden == 'u_remit.correo' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Correo Remitente</th>
            <th data-label="Fecha"><a href="javascript:ordenarAuditoria('${pagina}','${buscar}', 'c.fecha_envio', '${(orden == 'c.fecha_envio' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Fecha</th>
            <th data-label="Asunto"><a href="javascript:ordenarAuditoria('${pagina}','${buscar}', 'c.asunto', '${(orden == 'c.asunto' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Asunto</th>
            <th data-label="Estado"><a href="javascript:ordenarAuditoria('${pagina}','${buscar}', 'c.estado', '${(orden == 'c.estado' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Estado</th>
            <th data-label="Destinatario"><a href="javascript:ordenarAuditoria('${pagina}','${buscar}', 'u_dest.nombre', '${(orden == 'u_dest.nombre' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Destinatario</th>
            <th data-label="Correo Destinatario"><a href="javascript:ordenarAuditoria('${pagina}','${buscar}', 'u_dest.correo', '${(orden == 'u_dest.correo' && asc == 'ASC' ? 'DESC' : 'ASC')}')">Correo Destinatario</th>
            <th >Operaciones</th>
        	</tr>
    		</thead>
      <tbody>`;
  for (var i = 0; i < auditoria.length; i++) {
    html += `<tr`;
    if (auditoria[i].tipo == "0") {
      html += ` id="eliminado">`;
    }
    else {
      html += `>`;
    }
    html += `
        <td data-label="Remitente">${auditoria[i].nombre_remitente}</td>
        <td data-label="Correo Remitente">${auditoria[i].correo_remitente}</td>
        <td data-label="Fecha">${auditoria[i].fecha_envio}</td>
        <td data-label="Asunto">${auditoria[i].asunto}</td>
        <td data-label="Estado">${auditoria[i].estado}</td>
        <td data-label="Destinatario">${auditoria[i].nombre_destinatario}</td>
        <td data-label="Correo Destinatario">${auditoria[i].correo_destinatario}</td>
        <td >
          <a class="boton-buscar" href="javascript:verCorreoModalAdmin('${auditoria[i].id_correo}')">Ver</a>
        </td>
      </tr>`;
  }
  html += "</tbody> </table>";
  html += `<div class="pagination" style="display: flex; gap: 10px">
          <a class="active" href="javascript:ordenarAuditoria('1,'${buscar}','${orden}','${asc}')">&laquo;</a>
          <a class="active" href="javascript:ordenarAuditoria(${parseInt(pagina) - 1},'${buscar}','${orden}','${asc}')">&lt</a>`;
  for (i = 1; i <= nropaginas; i++) {
    html += `<a class='${(pagina == i ? 'selected' : 'default')}' href="javascript:ordenarAuditoria(${i},'${buscar}','${orden}', '${asc}')">${i}</a>`;
  }
  html += `<a class="active" href="javascript:ordenarAuditoria(${parseInt(pagina) + 1},'${buscar}','${orden}','${asc}')">&gt</a>  
           <a class="active" href="javascript:ordenarAuditoria(${nropaginas},'${buscar}','${orden}','${asc}')">&raquo;</a> 
	</div> </div>`;
  return html;
}

function verCorreoModalAdmin(id) {
  var url = `mostrarcorreoadmin.php?id=${id}`;
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
		  document.querySelector("#titulo-modal").innerHTML = "Correo Vista Admin"
		  document.querySelector("#contenido-modal").innerHTML = data
		  document.getElementById("myModal").style.display = "block"
		  });
}

function notificacionMasiva() {
  fetch('a_redactarcorreomasivo.php')
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Redactar Correo Masivo"
      document.querySelector("#contenido-modal").innerHTML = data
      document.getElementById("myModal").style.display = "block";
      });
}

function enviarNotificacionMasiva() {
  var formcorreo = document.getElementById('form-correo-masivo');
  var datos = new FormData(formcorreo);
  var url = `a_enviarcorreomasivo.php`;

  fetch(url, { method: "POST", body: datos })
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#titulo-modal").innerHTML = "Mensaje"
      document.querySelector("#contenido-modal").innerHTML = data
      auditarCorreos();
      }
    );
}
