CREATE DATABASE PetSavvy
GO
use PetSavvy
GO
CREATE TABLE Almacen (
Id_Almacen int NOT NULL PRIMARY KEY,
Albergue_Id int NOT NULL,
ID_Gastos int NOT NULL,
id_medicamento int NOT NULL,
Id_Accesorio int NOT NULL,
ID_Food int NOT NULL
) 

CREATE TABLE Animal (
Id int NOT NULL  PRIMARY KEY,
Edad int NOT NULL,
Raza varchar(40) NOT NULL,
Tamanio int NOT NULL,
Color varchar(20) NOT NULL,
Afinidad varchar(20) NOT NULL,
Proceso_Adopcion_Id int NOT NULL,
Albergue_Id int NOT NULL
) 

CREATE TABLE Catalogo (
ID int NOT NULL PRIMARY KEY,
) 

CREATE TABLE Cita (
Id int NOT NULL PRIMARY KEY,
Catalogo_ID int NOT NULL,
Encargado_DNI varchar(8) NOT NULL,
)

CREATE TABLE Encargado (
DNI varchar(8) NOT NULL PRIMARY KEY,
Nombre varchar(40) NOT NULL,
Telefono char(9) NULL,
Albergue_Id int NOT NULL
) 

CREATE TABLE Gastos (
ID_Gastos int NOT NULL PRIMARY KEY,
Nombre varchar(100) NOT NULL,
Fecha_compra date NOT NULL,
Monto float NOT NULL,
)

CREATE TABLE Medicamentos (
id_medicamento int NOT NULL PRIMARY KEY,
Nombre varchar(20) NOT NULL,
Fecha_compra date NOT NULL,
Fecha_Vencimiento date NOT NULL,
) 

CREATE TABLE Proceso_Adopcion (
Id int NOT NULL PRIMARY KEY,
Catalogo_ID int NOT NULL,
Encargado_DNI varchar(8) NOT NULL,
)

CREATE TABLE Receta (
Id int NOT NULL PRIMARY KEY,
id_medicamento int NOT NULL,
id_Animal int NOT NULL,
id_Veterinario int NOT NULL,
) 

CREATE TABLE Veterinario (
id int NOT NULL PRIMARY KEY,
Nombre varchar(20) NOT NULL,
Apellido varchar(20) NOT NULL,
NumeroColegiatura char(9) NOT NULL,
) 

CREATE TABLE Albergue (
Id int NOT NULL PRIMARY KEY,
Nombre varchar(100) NOT NULL,
Direccion varchar(100) NOT NULL,
Veterinario_id int NOT NULL,
) 

CREATE TABLE Alimentos (
ID_Food int NOT NULL PRIMARY KEY,
Marca varchar(100) NOT NULL,
cantidad int NOT NULL,
) 

CREATE TABLE Adoptante(
    Id_Adoptante int NOT NULL PRIMARY KEY,
    Nombre varchar(40) NOT NULL,
    DNI char(8) NOT NULL,
    Telefono char(9) NOT NULL,
    Direccion varchar(90) NULL,
    Cita_Id int NOT NULL,
    Proceso_Adopcion_Id int NOT NULL,
) 
CREATE TABLE Accesorios(
    Id_Accesorio int NOT NULL PRIMARY KEY,
    Nombre varchar(20) NOT NULL,
    Cantidad int NOT NULL,
) 

ALTER TABLE Adoptante ADD CONSTRAINT fk_Cita FOREIGN KEY (Cita_Id) REFERENCES Cita (Id);
ALTER TABLE Adoptante ADD CONSTRAINT fk_Proceso_Adopcion FOREIGN KEY (Proceso_Adopcion_Id) REFERENCES Proceso_Adopcion (Id);
ALTER TABLE Albergue ADD CONSTRAINT fk_Veterinario FOREIGN KEY (Veterinario_id) REFERENCES Veterinario (id);
ALTER TABLE Almacen ADD CONSTRAINT fk_Accesorio FOREIGN KEY (Id_Accesorio) REFERENCES Accesorios (Id_Accesorio);
ALTER TABLE Almacen ADD CONSTRAINT fk_Albergue3 FOREIGN KEY (Albergue_Id) REFERENCES Albergue (Id);
ALTER TABLE Almacen ADD CONSTRAINT fk_Almacen FOREIGN KEY (ID_Food) REFERENCES Alimentos (ID_Food);
ALTER TABLE Almacen ADD CONSTRAINT fk_Gastos FOREIGN KEY (ID_Gastos) REFERENCES Gastos (ID_Gastos);
ALTER TABLE Almacen ADD CONSTRAINT fk_Medicamento FOREIGN KEY (id_medicamento) REFERENCES Medicamentos (id_medicamento);
ALTER TABLE Animal ADD CONSTRAINT fk_Albergue2 FOREIGN KEY (Albergue_Id) REFERENCES Albergue (Id);
ALTER TABLE Animal ADD CONSTRAINT fk_Proceso_Adopcion2 FOREIGN KEY (Proceso_Adopcion_Id) REFERENCES Proceso_Adopcion (Id);
ALTER TABLE Cita ADD CONSTRAINT fk_Catalogo FOREIGN KEY (Catalogo_ID) REFERENCES Catalogo (ID);
ALTER TABLE Cita ADD CONSTRAINT fk_Encargado FOREIGN KEY (Encargado_DNI) REFERENCES Encargado (DNI);
ALTER TABLE Encargado ADD CONSTRAINT fk_Albergue FOREIGN KEY (Albergue_Id) REFERENCES Albergue (Id);
ALTER TABLE Proceso_Adopcion ADD CONSTRAINT fk_Catalogos FOREIGN KEY (Catalogo_ID) REFERENCES Catalogo (ID);
ALTER TABLE Proceso_Adopcion ADD CONSTRAINT fk_Encargados FOREIGN KEY (Encargado_DNI) REFERENCES Encargado (DNI);
ALTER TABLE Receta ADD CONSTRAINT fk_Animal FOREIGN KEY (id_Animal) REFERENCES Animal (Id);
ALTER TABLE Receta ADD CONSTRAINT fk_Medicamento2 FOREIGN KEY (id_medicamento) REFERENCES Medicamentos (id_medicamento);
ALTER TABLE Receta ADD CONSTRAINT fk_Veterinario2 FOREIGN KEY (id_Veterinario) REFERENCES Veterinario (id);

------------------Andrea--------------
--data para veterinarios
INSERT INTO Veterinario VALUES(1,'Jon','Stein','953779');
INSERT INTO Veterinario VALUES(2,'Billy','Jansson','466972');
INSERT INTO Veterinario VALUES(3,'Mauricio','Dun','574905');
INSERT INTO Veterinario VALUES(4,'Kelvin','Hainsworth','857378');
INSERT INTO Veterinario VALUES(5,'Carlos','Bromley','264433');
INSERT INTO Veterinario VALUES(6,'Quenten','Ruiz','261942');
INSERT INTO Veterinario VALUES(7,'Jeremy','Beveridge','503104');
INSERT INTO Veterinario VALUES(8,'Ramon','Sears','665356');
INSERT INTO Veterinario VALUES(9,'Amira','Stockton','297135');
INSERT INTO Veterinario VALUES(10,'Oswaldo','Johansen','995981');
INSERT INTO Veterinario VALUES(11,'Irene','Reddenhurst','424197');
INSERT INTO Veterinario VALUES(12,'Maxwell','O Reilly','459963');
INSERT INTO Veterinario VALUES(13,'Kenzie','Blackwood','761868');
INSERT INTO Veterinario VALUES(14,'Elliot','Lim','128306');

--data de albergue
INSERT INTO Albergue VALUES(1,'Albergue Canino "La Esperanza"','Calle del Sol, Colonia San Francisco, Ciudad Esperanza, Estado Central',1);
INSERT INTO Albergue VALUES(2,'Albergue Felino "Gatos Sin Hogar"','Avenida Principal, Urbanización Los Álamos, Distrito Residencial, Ciudad Primavera',2);
INSERT INTO Albergue VALUES(3,'Refugio de Mascotas "Patas Felices"','Paseo Marítimo, Barrio La Costa, Ciudad Bella Vista, País del Mar',3);
INSERT INTO Albergue VALUES(4,'Albergue Animal "Amor y Protección"','Calle Mayor, Barrio El Centro, Ciudad Antigua, Provincia Histórica',4);
INSERT INTO Albergue VALUES(5,'Centro de Adopción "Hogar Animal"','Avenida del Parque, Urbanización El Bosque, Ciudad País Verde',5);
INSERT INTO Albergue VALUES(6,'Albergue Canino y Felino "Amigos Peludos"','Calle Real, Colonia San Pedro, Ciudad Moderna, Estado Metropolitano',6);
INSERT INTO Albergue VALUES(7,'Refugio de Animales "Rincón de Esperanza"','Avenida Principal, Barrio La Esperanza, Ciudad Bella Esperanza, Sol',7);
INSERT INTO Albergue VALUES(8,'Albergue de Rescate Animal "Vida Nueva"','Paseo de los Robles, Urbanización Las Acacias, Ciudad Tranquila, Sereno',8);
INSERT INTO Albergue VALUES(9,'Corazón Animal','Calle del Carmen, Barrio El Mirador, Ciudad Encantada, País de Ser',9);
INSERT INTO Albergue VALUES(10,'Un Hogar para Todos','Calle del Río, Colonia El Prado, Ciudad Hermosa, Estado Delicias',10);
INSERT INTO Albergue VALUES(11,'Albergue para Mascotas "Amigos Fieles"','Avenida Libertad, Urbanización Los Pinos, Distrito Libertador, Esperanza',11);
INSERT INTO Albergue VALUES(12,'Refugio de Animales "Un Nuevo Comienzo"','Paseo del Mar, Barrio Las Brisas, Ciudad Costera, el Horizonte',12);
INSERT INTO Albergue VALUES(13,'Albergue de Adopción "Patas de Amor"','Calle Principal, Barrio El Carmen, Ciudad Antigua, Provincia',13);
INSERT INTO Albergue VALUES(14,'Hogar Animal "Casa de Esperanza"','Avenida de la Paz, Urbanización Los Alamos, Ciudad Serena',14);

--data de catalogo
INSERT INTO Catalogo VALUES(1);
INSERT INTO Catalogo VALUES(2);
INSERT INTO Catalogo VALUES(3);
INSERT INTO Catalogo VALUES(4);
INSERT INTO Catalogo VALUES(5);
INSERT INTO Catalogo VALUES(6);
INSERT INTO Catalogo VALUES(7);
INSERT INTO Catalogo VALUES(8);
INSERT INTO Catalogo VALUES(9);
INSERT INTO Catalogo VALUES(10);
INSERT INTO Catalogo VALUES(11);
INSERT INTO Catalogo VALUES(12);
INSERT INTO Catalogo VALUES(13);
INSERT INTO Catalogo VALUES(14);

--data de encargado
INSERT INTO Encargado VALUES('35986101','Dakota','144025037',1);
INSERT INTO Encargado VALUES('46770822','Stephon','678031057',2);
INSERT INTO Encargado VALUES('61210093','Jaden','238148939',3);
INSERT INTO Encargado VALUES('98532854','Aleena','179445392',4);
INSERT INTO Encargado VALUES('31477825','Marvin','726132620',5);
INSERT INTO Encargado VALUES('66822716','Shania','351100338',6);
INSERT INTO Encargado VALUES('28400237','Drew','811592922',7);
INSERT INTO Encargado VALUES('72445658','Amelia','389197522',8);
INSERT INTO Encargado VALUES('39423809','Sabine','596131258',9);
INSERT INTO Encargado VALUES('37042491','Alfonso','622023967',10);
INSERT INTO Encargado VALUES('70923687','Max','567810621',11);
INSERT INTO Encargado VALUES('36113437','Aleena','345447820',12);
INSERT INTO Encargado VALUES('40329218','Alma','760095746',13);
INSERT INTO Encargado VALUES('55230028','Jayda','191792307',14);


--data de cita
INSERT INTO Cita VALUES(1,1,'35986101');
INSERT INTO Cita VALUES(2,2,'46770822');
INSERT INTO Cita VALUES(3,3,'61210093');
INSERT INTO Cita VALUES(4,4,'98532854');
INSERT INTO Cita VALUES(5,5,'31477825');
INSERT INTO Cita VALUES(6,6,'66822716');
INSERT INTO Cita VALUES(7,7,'28400237');
INSERT INTO Cita VALUES(8,8,'72445658');
INSERT INTO Cita VALUES(9,9,'39423809');
INSERT INTO Cita VALUES(10,10,'37042491');
INSERT INTO Cita VALUES(11,11,'70923687');
INSERT INTO Cita VALUES(12,12,'36113437');
INSERT INTO Cita VALUES(13,13,'40329218');
INSERT INTO Cita VALUES(14,14,'55230028');


--data de accesorios
INSERT INTO Accesorios VALUES(1,'Collar',22);
INSERT INTO Accesorios VALUES(2,'Correa',18);
INSERT INTO Accesorios VALUES(3,'Arnés',28);
INSERT INTO Accesorios VALUES(4,'Caja de arena',33);
INSERT INTO Accesorios VALUES(5,'Cama para mascotas',32);
INSERT INTO Accesorios VALUES(6,'Juguete de masticar',20);
INSERT INTO Accesorios VALUES(7,'Juguete interactivo',37);
INSERT INTO Accesorios VALUES(8,'Rascador para gatos',24);
INSERT INTO Accesorios VALUES(9,'Comedero y bebedero',18);
INSERT INTO Accesorios VALUES(10,'Transportador',47);
INSERT INTO Accesorios VALUES(11,'Ropa para mascotas',44);
INSERT INTO Accesorios VALUES(12,'Cepillo',18);
INSERT INTO Accesorios VALUES(13,'Productos de pelaje',27);
INSERT INTO Accesorios VALUES(14,'Bolsas',36);


--data de gastos
INSERT INTO Gastos VALUES(1,'Alimentación para los animales','2022/01/22',179.50);
INSERT INTO Gastos VALUES(2,'Atención veterinaria y medicamentos','2022/01/23',357.25);
INSERT INTO Gastos VALUES(3,'Esterilización y castración de los animales','2022/01/25',243.75);
INSERT INTO Gastos VALUES(4,'Mantenimiento de las instalaciones y jaulas','2022/01/26',247.80);
INSERT INTO Gastos VALUES(5,'Limpieza y desinfección de las áreas','2022/01/27',356.90);
INSERT INTO Gastos VALUES(6,'Salarios y beneficios para el personal','2022/01/25',354.60);
INSERT INTO Gastos VALUES(7,'Suministros y equipos para el cuidado de los animales','2022/01/28',174.30);
INSERT INTO Gastos VALUES(8,'Publicidad y promoción de los animales para adopción','2022/01/28',355.40);
INSERT INTO Gastos VALUES(9,'Gastos de transporte relacionados con los animales','2022/01/28',127.75);
INSERT INTO Gastos VALUES(10,'Organización de eventos de adopción','2022/01/28',347.90);
INSERT INTO Gastos VALUES(11,'Reparaciones y mantenimiento de infraestructuras','2022/01/28',262.10);
INSERT INTO Gastos VALUES(12,'Pagos de servicios públicos como electricidad y agua','2022/01/28',251.60);
INSERT INTO Gastos VALUES(13,'Gastos administrativos para el funcionamiento del albergue','2022/01/28',175.20);
INSERT INTO Gastos VALUES(14,'Seguros y licencias requeridos','2022/01/28',341.80);


-- data de animal
INSERT INTO Animal VALUES(1,10,' Labrador Retriever',30,'Negro','Amigable',8,1);
INSERT INTO Animal VALUES(2,2,' Bulldog Francés',45,'Blanco','Tímido',4,2);
INSERT INTO Animal VALUES(3,12,' Poodle',35,'Marrón','Juguetón',5,3);
INSERT INTO Animal VALUES(4,10,' Golden Retriever',50,'Gris','Protector',9,4);
INSERT INTO Animal VALUES(5,7,' Boxer',40,'Dorado','Leal',12,5);
INSERT INTO Animal VALUES(6,11,' Chihuahua',25,'Crema','Sociable',11,6);
INSERT INTO Animal VALUES(7,3,' Husky Siberiano',55,'Atigrado','Independiente',1,7);
INSERT INTO Animal VALUES(8,3,' Rottweiler',60,'Leonado','Curioso',14,8);
INSERT INTO Animal VALUES(9,8,' Beagle',38,'Crema','Energético',6,9);
INSERT INTO Animal VALUES(10,9,' Dalmata',42,'Canela','Tranquilo',2,10);
INSERT INTO Animal VALUES(11,11,' Bichón Frisé',28,'Tricolor','Tranquilo',3,11);
INSERT INTO Animal VALUES(12,5,' Pastor Alemán',48,'Bicolor','Cariñoso',10,12);
INSERT INTO Animal VALUES(13,9,' Cocker Spaniel',33,'Crema','Agresivo',13,13);
INSERT INTO Animal VALUES(14,6,' Shih Tzu',37,'Plateado','Territorial',7,14);


--data de alimentos
INSERT INTO Alimentos VALUES(1,'Royal Canin',6);
INSERT INTO Alimentos VALUES(2,'Eukanuba',6);
INSERT INTO Alimentos VALUES(3,'Pro Plan',19);
INSERT INTO Alimentos VALUES(4,'Nutro',14);
INSERT INTO Alimentos VALUES(5,'Pedigree',23);
INSERT INTO Alimentos VALUES(6,'Dog Chow',30);
INSERT INTO Alimentos VALUES(7,'Hills Science Diet',29);
INSERT INTO Alimentos VALUES(8,'Natures Variety',4);
INSERT INTO Alimentos VALUES(9,'Acana',30);
INSERT INTO Alimentos VALUES(10,'Taste of the Wild',27);
INSERT INTO Alimentos VALUES(11,'Merrick',24);
INSERT INTO Alimentos VALUES(12,'Blue Buffalo',24);
INSERT INTO Alimentos VALUES(13,'Canagan',15);
INSERT INTO Alimentos VALUES(14,'Orijen',26);

--data de almacen
INSERT INTO Almacen VALUES(1,1,14,8,4,10);
INSERT INTO Almacen VALUES(2,2,8,10,8,7);
INSERT INTO Almacen VALUES(3,3,1,9,4,10);
INSERT INTO Almacen VALUES(4,4,7,10,12,1);
INSERT INTO Almacen VALUES(5,5,3,9,10,9);
INSERT INTO Almacen VALUES(6,6,10,12,2,14);
INSERT INTO Almacen VALUES(7,7,2,5,12,9);
INSERT INTO Almacen VALUES(8,8,2,8,8,13);
INSERT INTO Almacen VALUES(9,9,3,6,1,7);
INSERT INTO Almacen VALUES(10,10,4,11,14,6);
INSERT INTO Almacen VALUES(11,11,12,13,4,7);
INSERT INTO Almacen VALUES(12,12,9,10,13,14);
INSERT INTO Almacen VALUES(13,13,13,2,5,1);
INSERT INTO Almacen VALUES(14,14,11,1,10,6);


--data de proceso_adopcion
INSERT INTO Proceso_Adopcion VALUES(1,1,'35986101');			
INSERT INTO Proceso_Adopcion VALUES(2,2,'46770822');			
INSERT INTO Proceso_Adopcion VALUES(3,3,'61210093');			
INSERT INTO Proceso_Adopcion VALUES(4,4,'98532854');			
INSERT INTO Proceso_Adopcion VALUES(5,5,'31477825');			
INSERT INTO Proceso_Adopcion VALUES(6,6,'66822716');			
INSERT INTO Proceso_Adopcion VALUES(7,7,'28400237');			
INSERT INTO Proceso_Adopcion VALUES(8,8,'72445658');			
INSERT INTO Proceso_Adopcion VALUES(9,9,'39423809');			
INSERT INTO Proceso_Adopcion VALUES(10,10,'37042491');			
INSERT INTO Proceso_Adopcion VALUES(11,11,'70923687');			
INSERT INTO Proceso_Adopcion VALUES(12,12,'36113437');			
INSERT INTO Proceso_Adopcion VALUES(13,13,'40329218');			
INSERT INTO Proceso_Adopcion VALUES(14,14,'55230028');			



--data de adoptante
INSERT INTO Adoptante VALUES(1,'Octavio','75635231','933425575','Calle San Miguel, Urb. Los Pinos, Lima',1,1);
INSERT INTO Adoptante VALUES(2,'Deja','88433609','993347730','Avenida del Sol, Residencial El Dorado, Arequipa',2,2);
INSERT INTO Adoptante VALUES(3,'Charles','88910521','953844733','Jr. Los Robles, Urbanización La Primavera, Trujillo',3,3);
INSERT INTO Adoptante VALUES(4,'Kimora','94754207','945102909','Calle Las Flores, Villa del Mar, Chiclayo',4,4);
INSERT INTO Adoptante VALUES(5,'Carmen','73710222','968162952','Av. Los Alamos, Condominio Los Pájaros, Cusco',5,5);
INSERT INTO Adoptante VALUES(6,'Shirley','79161026','948997019','Pasaje Los Jazmines, Barrio San Antonio, Piura',6,6);
INSERT INTO Adoptante VALUES(7,'Albert','84266532','959888617','Calle Las Acacias, Urbanización Santa Rosa, Iquitos',7,7);
INSERT INTO Adoptante VALUES(8,'Tatiana','84088301','965460737','Av. Los Pinos, Residencial Los Cedros, Huancayo',8,8);
INSERT INTO Adoptante VALUES(9,'Gunnar','86069712','917310109','Jr. Las Orquídeas, Urb. Los Laureles, Tacna',9,9);
INSERT INTO Adoptante VALUES(10,'Blaise','79603773','904025965','Calle Los Cipreses, Villa Bonita, Chimbote',10,10);
INSERT INTO Adoptante VALUES(11,'Kamden','71550841','979945316','Av. Los Lirios, Residencial El Bosque, Pucallpa',11,11);
INSERT INTO Adoptante VALUES(12,'Lena','75069595','938756881','Pasaje Las Margaritas, Urbanización Los Páramos, Juliaca',12,12);
INSERT INTO Adoptante VALUES(13,'Nicole','86353107','928856149','Jr. Los Girasoles, Urb. Las Palmas, Huaraz',13,13);
INSERT INTO Adoptante VALUES(14,'Angie','95367170','951025004','Calle Los Olivos, Villa Hermosa, Ica',14,14);

--data de receta
INSERT INTO Receta VALUES(1,1,1,1);
INSERT INTO Receta VALUES(2,2,2,2);
INSERT INTO Receta VALUES(3,3,3,3);
INSERT INTO Receta VALUES(4,5,4,4);
INSERT INTO Receta VALUES(5,14,5,5);
INSERT INTO Receta VALUES(6,12,6,6);
INSERT INTO Receta VALUES(7,1,7,7);
INSERT INTO Receta VALUES(8,11,8,8);
INSERT INTO Receta VALUES(9,12,9,9);
INSERT INTO Receta VALUES(10,6,10,10);
INSERT INTO Receta VALUES(11,3,11,10);
INSERT INTO Receta VALUES(12,8,12,12);
INSERT INTO Receta VALUES(13,13,13,13);
INSERT INTO Receta VALUES(14,5,14,14);

--data de medicamentos
INSERT INTO Medicamentos VALUES(1,'Amoxicilina','2023/02/01','2024/02/01');
INSERT INTO Medicamentos VALUES(2,'Metronidazol','2023/02/02','2024/02/02');
INSERT INTO Medicamentos VALUES(3,'Ibuprofeno','2023/02/03','2024/02/03');
INSERT INTO Medicamentos VALUES(4,'Prednisona','2023/02/04','2024/02/04');
INSERT INTO Medicamentos VALUES(5,'Ciprofloxacina','2023/02/05','2024/02/05');
INSERT INTO Medicamentos VALUES(6,'Ketoprofeno','2023/02/06','2024/02/06');
INSERT INTO Medicamentos VALUES(7,'Enrofloxacina','2023/02/07','2024/02/07');
INSERT INTO Medicamentos VALUES(8,'Meloxicam','2023/02/08','2024/02/08');
INSERT INTO Medicamentos VALUES(9,'Fenbendazol','2023/02/09','2024/02/09');
INSERT INTO Medicamentos VALUES(10,'Ivermectina','2023/02/10','2024/02/10');
INSERT INTO Medicamentos VALUES(11,'Dipirona','2023/02/11','2024/02/11');
INSERT INTO Medicamentos VALUES(12,'Ranitidina','2023/02/12','2024/02/12');
INSERT INTO Medicamentos VALUES(13,'Omeprazol','2023/02/13','2024/02/13');
INSERT INTO Medicamentos VALUES(14,'Doxiciclina','2023/02/14','2024/02/14');

-----------------------------Brenda---------------------------

-----------------------------Datos de gastos---------------------------
INSERT INTO Gastos VALUES(15,'Pasaje','2023-05-12',37.5)
INSERT INTO Gastos VALUES(16,'Alimentos','2023-05-13',5.3)
INSERT INTO Gastos VALUES(17,'Otros','2023-05-14',9.6)
INSERT INTO Gastos VALUES(18,'Construccion','2023-05-15',52.6)
INSERT INTO Gastos VALUES(19,'Comida','2023-05-16',62.7)
INSERT INTO Gastos VALUES(20,'Pasaje','2023-05-17',20.5)
INSERT INTO Gastos VALUES(21,'Alimentos','2023-05-18',48)
INSERT INTO Gastos VALUES(22,'Medicina','2023-05-19',50.6)
INSERT INTO Gastos VALUES(23,'Comida','2023-05-20',12.8)
INSERT INTO Gastos VALUES(24,'Pasaje','2023-05-21',584.2)
INSERT INTO Gastos VALUES(25,'Alimentos','2023-05-22',36.6)
INSERT INTO Gastos VALUES(26,'Medicina','2023-05-23',41.2)
INSERT INTO Gastos VALUES(27,'Comida','2023-05-24',22.5)
INSERT INTO Gastos VALUES(28,'Pasaje','2023-05-25',55.7)
INSERT INTO Gastos VALUES(29,'Alimentos','2023-05-26',31)

-----------------------------Datos para veterinarios---------------------------
INSERT INTO Veterinario VALUES(15,'Hugo','GARCIA','569845')
INSERT INTO Veterinario VALUES(16,'Mateo','RODRIGUEZ','126459')
INSERT INTO Veterinario VALUES(17,'Martín','GONZALEZ','235980')
INSERT INTO Veterinario VALUES(18,'Lucas','FERNANDEZ','953067')
INSERT INTO Veterinario VALUES(19,'Leo','LOPEZ','351268')
INSERT INTO Veterinario VALUES(20,'Lucía.','MARTINEZ','264820')
INSERT INTO Veterinario VALUES(21,'María.','SANCHEZ','605020')
INSERT INTO Veterinario VALUES(22,'Paula.','PEREZ','805401')
INSERT INTO Veterinario VALUES(23,'Daniela.','GOMEZ','332065')
INSERT INTO Veterinario VALUES(24,'Sara.','MARTIN','669080')
INSERT INTO Veterinario VALUES(25,'Carla.','JIMENEZ','240548')
INSERT INTO Veterinario VALUES(26,'Martina.','HERNANDEZ','558094')
INSERT INTO Veterinario VALUES(27,'Mario','RUIZ','998050')
INSERT INTO Veterinario VALUES(28,'Diego','DIAZ','550492')
INSERT INTO Veterinario VALUES(29,'David','MORENO','5784732')

-----------------------------Datos de albergue---------------------------
INSERT INTO Albergue VALUES(15,'The Hostel Inn','Jr 28 De Julio 148',15)	
INSERT INTO Albergue VALUES(16,'Cozy Home','Los Cedros 209,',16)	
INSERT INTO Albergue VALUES(17,'El Escape','Av. 28 de Julio 878',17)	
INSERT INTO Albergue VALUES(18,'DG Nómadas','Jr. Ucayali N° 388 ',18)	
INSERT INTO Albergue VALUES(19,'Comfy We','Jr. Camaná 616 ',19)	
INSERT INTO Albergue VALUES(20,'Weekend Inn','AV De La Poesia 160',20)	
INSERT INTO Albergue VALUES(21,'Nature Corner','JR Carabaya',21)	
INSERT INTO Albergue VALUES(22,'4 Friends','AV Arenales 1302',22)	
INSERT INTO Albergue VALUES(23,'Young & Fun','Av. Abancay Cuadra 5',23)	
INSERT INTO Albergue VALUES(24,'El Mochilero','JR Lima 378',24)	
INSERT INTO Albergue VALUES(25,'Arca del cielo','AV De La Poesia 160',25)	
INSERT INTO Albergue VALUES(26,'Petfinder','JR Carabaya',26)	
INSERT INTO Albergue VALUES(27,'No Kill Advocacy ','AV Arenales 1302',27)	
INSERT INTO Albergue VALUES(28,'Costero de mascota','Av. Abancay Cuadra 5',28)	
INSERT INTO Albergue VALUES(29,'Alley Cat','JR Lima 378',29)	

-----------------------------Datos de catalogo---------------------------
INSERT INTO Catalogo VALUES(15);
INSERT INTO Catalogo VALUES(16);
INSERT INTO Catalogo VALUES(17);
INSERT INTO Catalogo VALUES(18);
INSERT INTO Catalogo VALUES(19);
INSERT INTO Catalogo VALUES(20);
INSERT INTO Catalogo VALUES(21);
INSERT INTO Catalogo VALUES(22);
INSERT INTO Catalogo VALUES(23);
INSERT INTO Catalogo VALUES(24);
INSERT INTO Catalogo VALUES(25);
INSERT INTO Catalogo VALUES(26);
INSERT INTO Catalogo VALUES(27);
INSERT INTO Catalogo VALUES(28);
INSERT INTO Catalogo VALUES(29);

-----------------------------Datos de encargado---------------------------
INSERT INTO Encargado VALUES('198111140','Joel','998548656',15)	
INSERT INTO Encargado VALUES('231504970','Nil','956826598',16)	
INSERT INTO Encargado VALUES('199795098','Jan','934587162',17)	
INSERT INTO Encargado VALUES('729416320','Pol','998788474',18)	
INSERT INTO Encargado VALUES('316193057','Raúl','948956998',19)	
INSERT INTO Encargado VALUES('232041550','Charlotte','999444666',20)	
INSERT INTO Encargado VALUES('211047801','Ruby','988569558',21)	
INSERT INTO Encargado VALUES('255298875','Lilly/Lily','900500122',22)	
INSERT INTO Encargado VALUES('161324032','Olivia','923650650',23)	
INSERT INTO Encargado VALUES('701952945','Chloe','960483580',24)	
INSERT INTO Encargado VALUES('199779165','Sophie','998878584',25)	
INSERT INTO Encargado VALUES('310314524','Emily','905517847',26)	
INSERT INTO Encargado VALUES('236755129','Asier','941548715',27)	
INSERT INTO Encargado VALUES('218008999','Biel','933665848',28)	
INSERT INTO Encargado VALUES('909728370','Ander','989596000',29)

-----------------------------Datos de cita---------------------------
INSERT INTO Cita VALUES(15,15,'232041550')	
INSERT INTO Cita VALUES(16,16,'211047801')	
INSERT INTO Cita VALUES(17,17,'255298875')	
INSERT INTO Cita VALUES(18,18,'161324032')	
INSERT INTO Cita VALUES(19,19,'701952945')	
INSERT INTO Cita VALUES(20,20,'199779165')	
INSERT INTO Cita VALUES(21,21,'236755129')	
INSERT INTO Cita VALUES(22,22,'218008999')	
INSERT INTO Cita VALUES(23,23,'909728370')	
INSERT INTO Cita VALUES(24,24,'198111140')	
INSERT INTO Cita VALUES(25,25,'231504970')	
INSERT INTO Cita VALUES(26,26,'199795098')	
INSERT INTO Cita VALUES(27,27,'729416320')	
INSERT INTO Cita VALUES(28,28,'316193057')	
INSERT INTO Cita VALUES(29,29,'232041550')	


-----------------------------Datos de accesorios---------------------------
INSERT INTO Accesorios VALUES(15,'Collar',25)
INSERT INTO Accesorios VALUES(16,'Juguete',1)
INSERT INTO Accesorios VALUES(17,'Capa',28)
INSERT INTO Accesorios VALUES(18,'Pañuelo',11)
INSERT INTO Accesorios VALUES(19,'Cepillo',6)
INSERT INTO Accesorios VALUES(20,'Enterizo',5)
INSERT INTO Accesorios VALUES(21,'Gorro',14)
INSERT INTO Accesorios VALUES(22,'Gorro',25)
INSERT INTO Accesorios VALUES(23,'Platos',25)
INSERT INTO Accesorios VALUES(24,'Cepillo',10)
INSERT INTO Accesorios VALUES(25,'Capa',16)
INSERT INTO Accesorios VALUES(26,'Platos',14)
INSERT INTO Accesorios VALUES(27,'Collar',18)
INSERT INTO Accesorios VALUES(28,'Juguete',18)
INSERT INTO Accesorios VALUES(29,'Collar',22)

-----------------------------Datos de proceso_adopcion---------------------------
INSERT INTO Proceso_Adopcion VALUES(15,15,'232041550')
INSERT INTO Proceso_Adopcion VALUES(16,16,'211047801')
INSERT INTO Proceso_Adopcion VALUES(17,17,'255298875')
INSERT INTO Proceso_Adopcion VALUES(18,18,'161324032')
INSERT INTO Proceso_Adopcion VALUES(19,19,'701952945')
INSERT INTO Proceso_Adopcion VALUES(20,20,'199779165')
INSERT INTO Proceso_Adopcion VALUES(21,21,'236755129')
INSERT INTO Proceso_Adopcion VALUES(22,22,'218008999')
INSERT INTO Proceso_Adopcion VALUES(23,23,'909728370')
INSERT INTO Proceso_Adopcion VALUES(24,24,'198111140')
INSERT INTO Proceso_Adopcion VALUES(25,25,'231504970')
INSERT INTO Proceso_Adopcion VALUES(26,26,'199795098')
INSERT INTO Proceso_Adopcion VALUES(27,27,'729416320')
INSERT INTO Proceso_Adopcion VALUES(28,28,'316193057')
INSERT INTO Proceso_Adopcion VALUES(29,29,'232041550')


-----------------------------Datos de adoptante---------------------------
INSERT INTO Adoptante VALUES(15,'Saanvi','493414530','999585548','Av.los andes 153',15,15)				
INSERT INTO Adoptante VALUES(16,'Angel','706353929','996365484','Calle piroxinitas23',16,16)				
INSERT INTO Adoptante VALUES(17,'Pari','286578297','987958935','Calle pedregal alto',17,17)				
INSERT INTO Adoptante VALUES(18,'Diya','28826237','977784666','Calle tupac amaru',18,18)				
INSERT INTO Adoptante VALUES(19,'Ananya','713503572','922855466','Calle los tulipanes',19,19)				
INSERT INTO Adoptante VALUES(20,'Aadhya','96558819','912255847','Av. Los alamos',20,20)				
INSERT INTO Adoptante VALUES(21,'Pihu','545492988','901251445','Av. Primavero 20',21,21)				
INSERT INTO Adoptante VALUES(22,'Khushi','220176114','901520654','Av.JavierPrado 34',22,22)				
INSERT INTO Adoptante VALUES(23,'Teo','833287071','987458465','Calle las flores 23',23,23)				
INSERT INTO Adoptante VALUES(24,'Isaac','494020105','935568152','Calle angulo 123',24,24)				
INSERT INTO Adoptante VALUES(25,'Arnau','369313778','902236566','Calle las rosas ',25,25)				
INSERT INTO Adoptante VALUES(26,'Luka','858638709','988556222','Av. Canada',26,26)				
INSERT INTO Adoptante VALUES(27,'Max','114141236','905478987','Av.aguilar 20',27,27)				
INSERT INTO Adoptante VALUES(28,'Imran','15351570','915987487','Av.cieneguilla',28,28)				
INSERT INTO Adoptante VALUES(29,'Youssef','164272557','905648517','Av.jose huerta',29,29)				



----------------------------- Datos de animal---------------------------
INSERT INTO Animal VALUES(15,3,'Akita',10,'Blanco','Amigable',15,15)				
INSERT INTO Animal VALUES(16,5,'Mestizo',60,'Marron','Timido',16,16)				
INSERT INTO Animal VALUES(17,10,'Alaskan Husky',50,'Negro','Jugueton',17,17)				
INSERT INTO Animal VALUES(18,9,'Boxer',60,'Marron','Curioso',18,18)				
INSERT INTO Animal VALUES(19,3,'Boyero de Appenzell',50,'Negro','Timido',19,19)				
INSERT INTO Animal VALUES(20,7,'Mestizo',40,'Blanco','Jugueton',20,20)				
INSERT INTO Animal VALUES(21,1,'Spaniel de Campo',20,'Marron','Amigable',21,21)				
INSERT INTO Animal VALUES(22,1,'Spaniel Francés',30,'Marron','Travieso',22,22)				
INSERT INTO Animal VALUES(23,10,'Schnauzer estándar',65,'Gris','Agresivo',23,23)				
INSERT INTO Animal VALUES(24,5,'Pastor Áleman',85,'Marron','Inquito',24,24)				
INSERT INTO Animal VALUES(25,4,'Mestizo',15,'Gris','Timido',25,25)				
INSERT INTO Animal VALUES(26,4,'Bulldog inglés',62,'Negro','Amigable',26,26)				
INSERT INTO Animal VALUES(27,3,'Boxer',84,'Marron','Jugueton',27,27)				
INSERT INTO Animal VALUES(28,9,'Spaniel de Campo',24,'Gris','Agresivo',28,28)				
INSERT INTO Animal VALUES(29,5,'Schnauzer estándar',36,'Gris','Inquito',29,29)				
				


-----------------------------Datos de medicamentos---------------------------
INSERT INTO Medicamentos VALUES(15,'Cetericina','2023-05-10','2024-05-10')
INSERT INTO Medicamentos VALUES(16,'Doxitel 100','2023-05-10','2024-05-10')
INSERT INTO Medicamentos VALUES(17,'Doxitel 200','2023-05-10','2024-05-10')
INSERT INTO Medicamentos VALUES(18,'Prednovet','2022-05-10','2023-05-10')
INSERT INTO Medicamentos VALUES(19,'Hepatiopet','2022-06-25','2023-06-25')
INSERT INTO Medicamentos VALUES(20,'Gastropet','2023-06-26','2024-06-26')
INSERT INTO Medicamentos VALUES(21,'Meloxivet ','2023-06-27','2024-06-27')
INSERT INTO Medicamentos VALUES(22,'Ketovet','2023-06-28','2024-06-28')
INSERT INTO Medicamentos VALUES(23,'Doxitel 100','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(24,'Hepatiopet','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(25,'Prednovet','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(26,'Gastropet','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(27,'Doxitel 100','2023-12-05','2024-12-05')
INSERT INTO Medicamentos VALUES(28,'Prednovet','2024-12-06','2025-12-06')
INSERT INTO Medicamentos VALUES(29,'Prednovet','2024-12-07','2025-12-07')

-----------------------------Datos de alimentos---------------------------
INSERT INTO Alimentos VALUES(15,'Catshow',2)
INSERT INTO Alimentos VALUES(16,'Ricocan',3)
INSERT INTO Alimentos VALUES(17,'Daggo',3)
INSERT INTO Alimentos VALUES(18,'ProPlan',3)
INSERT INTO Alimentos VALUES(19,'VetLife',2)
INSERT INTO Alimentos VALUES(20,'Ricocat',1)
INSERT INTO Alimentos VALUES(21,'Felix',1)
INSERT INTO Alimentos VALUES(22,'Catshow',2)
INSERT INTO Alimentos VALUES(23,'Felix',2)
INSERT INTO Alimentos VALUES(24,'Daggo',2)
INSERT INTO Alimentos VALUES(25,'ProPlan',1)
INSERT INTO Alimentos VALUES(26,'ProPlan',1)
INSERT INTO Alimentos VALUES(27,'Ricocan',2)
INSERT INTO Alimentos VALUES(28,'Ricocan',3)
INSERT INTO Alimentos VALUES(29,'Ricocat',3)

-----------------------------Datos de almacen---------------------------
INSERT INTO Almacen VALUES(15,18,17,25,29,15)			
INSERT INTO Almacen VALUES(16,26,29,16,26,16)			
INSERT INTO Almacen VALUES(17,15,24,18,23,17)			
INSERT INTO Almacen VALUES(18,20,16,19,21,18)			
INSERT INTO Almacen VALUES(19,21,25,22,20,19)			
INSERT INTO Almacen VALUES(20,22,18,15,15,20)			
INSERT INTO Almacen VALUES(21,16,27,17,18,21)			
INSERT INTO Almacen VALUES(22,17,19,26,17,22)			
INSERT INTO Almacen VALUES(23,25,20,28,27,23)			
INSERT INTO Almacen VALUES(24,19,23,29,24,24)			
INSERT INTO Almacen VALUES(25,28,24,23,25,25)			
INSERT INTO Almacen VALUES(26,29,23,16,28,26)			
INSERT INTO Almacen VALUES(27,27,28,27,25,27)			
INSERT INTO Almacen VALUES(28,26,15,20,19,28)			
INSERT INTO Almacen VALUES(29,23,22,21,16,29)			


-----------------------------Datos de receta---------------------------
INSERT INTO Receta VALUES(15,25,17,15)			
INSERT INTO Receta VALUES(16,16,29,16)			
INSERT INTO Receta VALUES(17,18,24,17)			
INSERT INTO Receta VALUES(18,19,16,18)			
INSERT INTO Receta VALUES(19,22,25,19)			
INSERT INTO Receta VALUES(20,15,18,20)			
INSERT INTO Receta VALUES(21,17,27,21)			
INSERT INTO Receta VALUES(22,26,19,22)			
INSERT INTO Receta VALUES(23,28,20,23)			
INSERT INTO Receta VALUES(24,29,23,24)			
INSERT INTO Receta VALUES(25,23,24,25)			
INSERT INTO Receta VALUES(26,16,23,26)			
INSERT INTO Receta VALUES(27,27,28,27)			
INSERT INTO Receta VALUES(28,20,15,28)			
INSERT INTO Receta VALUES(29,21,22,29)			



--ver tablas
Select * from Accesorios
Select * from Adoptante
Select * from Albergue
Select * from Alimentos
Select * from Almacen
Select * from Animal
Select * from Catalogo
Select * from Cita
Select * from Encargado
Select * from Gastos
Select * from Medicamentos
Select * from Proceso_Adopcion
Select * from Receta
Select * from Veterinario
