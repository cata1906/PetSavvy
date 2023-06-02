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