# -*- coding: utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


# regiones
[ "Tarapacá",
  "Antofagasta",
  "Atacama",
  "Coquimbo",
  "Valparaíso",
  "Libertador General Bernardo O'Higgins",
  "Maule",
  "BioBío",
  "Araucania",
  "Los Lagos",
  "General Carlos Ibañez del Campo",
  "Magallanes y Antártica Chilena",
  "Metropolitana",
  "Los Ríos",
  "Arica y Parinacota"
  ].each_with_index do |region, misc|
  Mantenedor.create(:tipo => :region, :valor => region, :misc => misc + 1)
end

# crear comunas por region
comunas_region = {
  "1" => ["Alto Hospicio","Camiña","Colchane","Huara","Iquique","Paihuano","Pica","Pozo Almonte"],
  "2" => ["Antofagasta","Calama","María Elena","Mejillones","Ollagüe","San Pedro de Atacama","Sierra Gorda","Taltal","Tocopilla"],
  "3" => ["Alto del Carmen","Caldera","Chañaral","Copiapó","Diego de Almagro","Freirina","Huasco","Tierra Amarilla","Vallenar"],
  "4" => ["Andacollo","Canela","Combarbalá","Coquimbo","Illapel","La Higuera","La Serena","Los Vilos","Monte Patria","Ovalle","Punitaqui","Río Hurtado","Salamanca","Vicuña"],
  "5" => ["Algarrobo","Cabildo","Calera","Calle Larga","Cartagena","Casablanca","Catemu","Concón","El Quisco","El Tabo","Hijuelas","Isla de Pascua","Juan Fernández","La Cruz","La Ligua","Limache","Llay Llay","Los Andes","Nogales","Olmué","Panquehue","Papudo","Petorca","Puchuncaví","Putaendo","Quillota","Quilpué","Quintero","Rinconada","San Antonio","San Esteban","San Felipe","Santa María","Santo Domingo","Valparaíso","Villa Alemana","Viña del Mar","Zapallar"],
  "6" => ["Chimbarongo","Chépica","Codegua","Coinco","Coltauco","Doñihue","Graneros","La Estrella","Las Cabras","Lolol","Machalí","Malloa","Marchihue","Mostazal","Nancagua","Navidad","Palmilla","Paredones","Peralillo","Peumo","Pichidegua","Pichilemu","Pumanque","Quinta De Tilcoco","Rancagua","Rengo","Requinoa","San Fernando","San Vicente","Santa Cruz"],
  "7" => ["Cauquenes","Chanco","Colbún","Constitución","Curepto","Curicó","Empedrado","Hualañé","Licantén","Linares","Longaví","Maule","Molina","Parral","Pelarco","Pelluhue","Pencahue","Rauco","Retiro","Romeral","Río Claro","Sagrada Familia","San Clemente","San Javier","San Rafael","Talca","Teno","Vichuquén","Villa Alegre","Yerbas Buenas"],
  "8" => ["Alto Bíobío","Antuco","Arauco","Bulnes","Cabrero","Cañete","Chiguayante","Chillán","Chillán Viejo","Cobquecura","Coelemu","Coihueco","Concepción","Contulmo","Coronel","Curanilahue","El Carmen","Florida","Hualpén","Hualqui","Laja","Lebu","Los Alamos","Los Angeles","Lota","Mulchén","Nacimiento","Negrete","Ninhue","Pemuco","Penco","Pinto","Portezuelo","Quilaco","Quilleco","Quillón","Quirihue","Ranquil","San Carlos","San Fabián","San Ignacio","San Nicolás","San Pedro de La Paz","San Rosendo","Santa Bárbara","Santa Juana","Talcahuano","Tirua","Tomé","Trehuaco","Tucapel","Yumbel","Yungay","Ñiquén"],
  "9" => ["Angol","Carahue","Cholchol","Collipulli","Cunco","Curacautín","Curarrehue","Ercilla","Freire","Galvarino","Gorbea","Lautaro","Loncoche","Lonquimay","Los Sauces","Lumaco","Melipeuco","Nueva Imperial","Padre Las Casas","Perquenco","Pitrufquén","Pucón","Purén","Renaico","Saavedra","Temuco","Teodoro Schmidt","Toltén","Traiguén","Victoria","Vilcún","Villarrica"],
  "10" => ["Ancud","Calbuco","Castro","Chaitén","Chonchi","Cochamó","Curaco de Vélez","Dalcahue","Fresia","Frutillar","Futaleufú","Hualaihue","Llanquihue","Los Muermos","Maullín","Osorno","Palena","Puerto Montt","Puerto Octay","Puerto Varas","Puqueldón","Purranque","Puyehue","Queilén","Quellón","Quemchi","Quinchao","Río Negro","San Juan de La Costa","San Pablo"],
  "11" => ["Aisén","Chile Chico","Cisnes","Cochrane","Coyhaique","Guaitecas","Lago Verde","Ohiggins","Río Ibáñez","Tortel"],
  "12" => ["Antártica", "Cabo de Hornos","Laguna Blanca","Natales","Porvenir","Primavera","Punta Arenas","Río Verde","San Gregorio","Timaukel","Torres del Paine"],
  "13" => ["Alhué","Buin","Calera de Tango","Cerrillos","Cerro Navia","Colina","Conchalí","Curacaví","El Bosque","El Monte","Estación Central","Huechuraba","Independencia","Isla de Maipo","La Cisterna","La Florida","La Granja","La Pintana","La Reina","Lampa","Las Condes","Lo Barnechea","Lo Espejo","Lo Prado","Macul","Maipú","María Pinto","Melipilla","Padre Hurtado","Paine","Pedro  Aguirre Cerda","Peñaflor","Peñalolén","Pirque","Providencia","Pudahuel","Puente Alto","Quilicura","Quinta Normal","Recoleta","Renca","San Bernardo","San Joaquín","San José de Maipo","San Miguel","San Pedro","San Ramón","Santiago","Subdere","Talagante","Tiltil","Vitacura","Ñuñoa"],
  "14" => ["Corral","Futrono","La Unión","Lago Ranco","Lanco","Los Lagos","Mariquina","Máfil","Paillaco","Panguipulli","Río Bueno","Valdivia"],
  "15" => ["Arica","Camarones","General Lagos","Putre"]
  }

comunas_region.each_pair do |region, lista|
  lista.each do |comuna|
    Mantenedor.create(:tipo => :comuna, :valor => comuna, :misc => region)
  end
end



# tipo identificacion
[ "RUN",
  "Otro"
  ].each do |valor|
  Mantenedor.create(:tipo => :tipoidentificacion, :valor => valor)
end

# tipo sexo
[ "Masculino",
  "Femenino",
  "Entidad"
  ].each do |valor|
  Mantenedor.create(:tipo => :tiposexo, :valor => valor)
end

# Ambientes
[ "Desarrollo",
  "QA",
  "Producción"
  ].each do |valor|
  Mantenedor.create(:tipo => :ambiente, :valor => valor)
end

# roles
[ "Administrador",
  "Jefe Proyecto",
  "Analista",
  "Tester",
  "Usuario"
  ].each do |nombre|
  Role.create(:nombre => nombre)
end

# usuario admin
User.create(
    :nombre => 'Administrador del Sistema',
    :login => 'admin',
    :password => 'claudia',
    :password_confirmation => 'claudia',
    :roles => Role.where(:nombre => 'Administrador')
    
    )

# Direcciones de Correo donde se enviarán mail cuando se creen Eventos
[ "ramirezqueupul@gmail.com"  
  ].each do |valor|
  Mantenedor.create(:tipo => :mail_evento, :valor => valor)
end


