<?php //Dolar Observado!
$url = "http://www.terra.cl/valores/";
$palabra = "DOLAR OBSERVADO";
$x = 1; //evita tags <! (invisibles)

$fd = @fopen($url, "r"); //abre la url y comienza desde el principio para solo lectura. Apertura para solo lectura; ubica el apuntador de archivo al comienzo del mismo.
while ($line=@fgets($fd,1000)){
$pos = strpos ($line, $palabra);
if ($pos){
$glosa = " ";
$line2=fgets($fd,1000);
echo strip_tags($glosa.trim($line2));
}
}
@fclose ($fd);

echo "<br>";

$url = "http://www.terra.cl/valores/";
$palabra = "EURO";
$x = 1; //evita tags <! (invisibles)

$fd = @fopen($url, "r"); //abre la url y comienza desde el principio para solo lectura. Apertura para solo lectura; ubica el apuntador de archivo al comienzo del mismo.
while ($line=@fgets($fd,1000)){
$pos = strpos ($line, $palabra);
if ($pos){
$glosa = " ";
$line2=fgets($fd,1000);
echo strip_tags($glosa.trim($line2));
}
}
@fclose ($fd);


//Extraer
	$options = array('http' => array(
	'method'  => 'GET',
	));

	$config= stream_context_create($options);
	$config_final=file_get_contents('http://www.pollmann.cl/tipodecambio.asp',false, $config);
//Extrae table con información de dolar aduanero	
	preg_match_all("|<table width=\"75%\" border=\"1\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#003E91\">(.*)</table>|sU", $config_final, $aduanero);
	


	$hoy = date("m");
	 $mes = nombremes($hoy);
	//echo $config_final;
	echo "<table>";
	$sTable = $aduanero[1][0];
	
	$inicio = strpos($sTable, 'Octubre');
	
	echo substr($sTable, 1500, strlen($sTable)); 
	echo "posicion : ".$inicio;
	echo "</table>";




	
//Extraer estado paso fronterizo !
	$options = array('http' => array(
	'method'  => 'GET',
	));

	$config= stream_context_create($options);
	$config_final=file_get_contents('http://www.pasosfronterizos.gov.cl/cf_loslibertadores.html',false, $config);
//Extrae table con información de dolar aduanero	
	preg_match_all("|<table border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"581\" align=\"left\">(.*)</table>|sU", $config_final, $libertadores);
	
   	//echo $config_final;
	echo "<table>";
	$tString =  $libertadores[1][0];
	echo $tString; // 6 
	echo "</table>";
	
	
	
	
	function nombremes($mes){
	 setlocale(LC_TIME, 'spanish');  
	 $nombre=strftime("%B",mktime(0, 0, 0, $mes, 1, 2000)); 
	 return $nombre;
	}
?>
