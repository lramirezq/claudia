function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("true");
  $(link).closest(".fields").hide();
}

function remove_fields_act(link) {
  $(link).prev("input[type=hidden]").val("true");
  $(link).closest(".fields").hide();
  recalcular();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
}


function add_fields_act(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
  recalcular();
}


function add_fields_especial(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
  
}

function aparece(id){
  objeto=document.getElementById(id);
  objeto.style.display="block";    
}

function desaparece(id){
  objeto=document.getElementById(id);
  objeto.style.display="none";
}

function tipo_id(id){
  tipoid = id.id
  rut = tipoid.replace('tipoidentificacion', 'rut');
  rid= rut;
  rut = "#"+rut;

  if(id.value =="RUN"){
      $(rut).Rut({
          on_error: function(){ document.getElementById(rid).value=""; document.getElementById(rid).focus; alert('El rut ingresado es incorrecto');  },  format_on: 'keyup'
      });
      
  }else{
    $(rut).val("");
    $(rut).unbind();
  }
}  

function tipos(id){
    tipoid = id.id
    cargo = tipoid.replace('tipo', 'cargo');
    cargo = "#"+cargo;
    tipoidentificacion = cargo.replace('cargo','tipoidentificacion');
    rut = cargo.replace('cargo', 'rut');
    nombres = cargo.replace('cargo', 'nombres');
    apellidos = cargo.replace('cargo', 'apellidos');
    cargo = cargo.replace('cargo', 'cargo');
    sexo = cargo.replace('cargo', 'sexo');
    edad = cargo.replace('cargo', 'edad');
    direccion = cargo.replace('cargo', 'direccion');
    region = cargo.replace('cargo', 'region');
    comuna = cargo.replace('cargo', 'comuna');
    telefono = cargo.replace('cargo', 'telefono');
    email = cargo.replace('cargo', 'email');
    otros = cargo.replace('cargo', 'otros');

  if (id.value == 'Funcionario Metro'){
    //Habilitamos combo
    $(cargo).removeAttr('disabled');
    //Eliminamos datos combo
    $(cargo).html('');
    //Llenamos Combo
    $(cargo).append('<option value="VVPP">VVPP</option>');
    $(cargo).append('<option value="Jefe Estación">Jefe Estación</option>');
    $(cargo).append('<option value="Conductor">Conductor</option>');
    $(cargo).append('<option value="Otro">Otro</option>');
    $("#asistencia").show("slow");

    
  }else if (id.value == 'Contratista Metro'){
    //Habilitamos Combo
    $(cargo).removeAttr('disabled');
    //Borramos Todo
    $(cargo).html('');
    //Agregamos elementos 
    $(cargo).append('<option value="GGSS">GGSS</option>');
    $(cargo).append('<option value="Asistente de andén">Asistente de andén</option>');
    $(cargo).append('<option value="Asistente de servicio al cliente">Asistente de servicio al cliente</option>');
    $(cargo).append('<option value="Otro">Otro</option>');
    $("#asistencia").show("slow");
  
  }else if (id.value == 'Metro'){
    //Llenamos datos de Metro por defecto
    /**
    Raz&oacuten Social: EMPRESA DE TRANSPORTE DE PASAJEROS METRO S.A.    
    Direcci&oacuten: Avda. Libertador Bernardo O'Higgins N 1414, Santiago.
    RUT: 61.219.000 - 3
    Fono: 56 - 2 - 250 3012
    P&aacutegina Web: www.metrosantiago.cl
    **/
    $(tipoidentificacion).val("RUN");
    $(rut).val("61.219.000-3")
    $(nombres).val("METRO");  
    $(apellidos).val("S.A.");
    $(direccion).val("Avda. Libertador Bernardo O'Higgins N 1414");
    $(region).val("Metropolitana");
    $(comuna).val("Santiago");
    $(telefono).val("250 3012");
    $(sexo).val("Entidad");
    $(email).val("sglea@grupotc.cl");
    $(otros).val("Página Web http://www.metro.cl");
  }else{
    //Borramos Todo
    $(cargo).html('');
    $(cargo).attr("disabled","disabled");
  }
}  
  

function buscaEvento(id){
  //alert(id.value);
  $.getScript('/javascripts/causas.js?codigo=' + id.value); 
}


function upvictimas(id){
  $.getScript('/javascripts/victimas.js?rut=' + id.value+ "&control=" + id.id); 
}

function upimputados(id){
  $.getScript('/javascripts/imputados.js?rut=' + id.value+ "&control=" + id.id); 
}

function estado_causa(id){
  if(id.value=="Terminada"){
    alert("Debe agregar Informe de Causa Terminada")
    $("#field_terminada").show("slow");
  }else{
    $("#field_terminada").hide("slow");
  }
} 




  
  function recalcular(){
	//Contar Actividades
	var a = 56;
	x = 0;y=0;i=0;j=0;totalcheck=0;totalchecktrue=0;
	while (i == 0){
		if(document.getElementById("proyecto_fases_attributes_"+x+"_actividads_attributes_"+y+"_estado")){
			totalcheck++;
			obj = document.getElementById("proyecto_fases_attributes_"+x+"_actividads_attributes_"+y+"_estado");
			if(obj.checked){
				totalchecktrue++;
			}
			y++;
			j=0;
		}else{
			y=0;
			x++;
			j++;
		}
		
		if(j==2){
			i=1;
		}
		
	}
	a = (totalchecktrue * 100 / totalcheck);
	$("#progressbar").progressbar({ value: a });
	$("#porcentaje").val(a.toFixed(2));
	$("#proyecto_porcentaje").val(a.toFixed(2));
  }


  function testing(x, f){
		
		id = f.id;
		id_proyecto = $("#proyecto_id").val();
		id = id.substring(0, id.length - 24);
		id = "#"+id+"valida";
		rechaza = id.substring(0, id.length - 6);
		rechaza+="rechaza"
	
		if (x =="valida"){
			$(id).attr('checked', true);
			$(rechaza).attr('checked', false);
		}else{
			$(id).attr('checked', false);
			$(rechaza).attr('checked', true);
		}

		document.forms["edit_proyecto_"+id_proyecto].submit();

  }

