/*
El código proporcionado comienza con un comando DROP DATABASE IF EXISTS DAILYGO;. Este comando elimina la base de datos DAILYGO,
si ya existe, lo que permite crear una nueva base de datos con el mismo nombre sin conflictos.
A continuación, el código crea la base de datos DAILYGO si no existe, utilizando la sentencia CREATE DATABASE IF NOT EXISTS.
Luego, se utiliza USE DAILYGO; para indicar que las sentencias SQL que siguen afectarán a la base de datos DAILYGO.
*/

DROP DATABASE IF EXISTS DAILYGO;
CREATE DATABASE IF NOT EXISTS DAILYGO;
USE DAILYGO;

 
/*
 ····TABLA CLIENTES····
Declaración de una tabla llamada clientes con siete columnas: COD_CLI, NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI e IMG_CLI.
La columna COD_CLI es la clave primaria de la tabla, que se incrementa automáticamente cada vez que se agrega un nuevo registro.
NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, y PW_CLI son columnas requeridas y deben tener un valor válido antes de que se pueda insertar un registro en la tabla.
La columna IMG_CLI es opcional y se utiliza para almacenar la imagen del perfil del cliente.
La tabla tiene una restricción única llamada ÚNIDCA en las columnas TLF_CLI y MAIL_CLI, lo que significa que no puede haber dos registros
en la tabla con la misma combinación de valores en esas dos columnas.

*/


CREATE TABLE `clientes` (
    `COD_CLI` int(10) NOT NULL AUTO_INCREMENT COMMENT 'PK/Código Cliente',
    `NOM_CLI` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nombre',
    `APE_CLI` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Apellidos',
    `TLF_CLI` int(11) NOT NULL COMMENT 'Teléfono',
    `MAIL_CLI` varchar(80) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Correo electrónico',
    `PW_CLI` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Contrasenya',
    PRIMARY KEY (`COD_CLI`),
    UNIQUE KEY `ÚNIDCA` (`TLF_CLI`, `MAIL_CLI`)
);

/*
 ····TABLA PROVEEDORES····
Esta tabla almacena la información de los proveedores que ofrecen productos a la empresa. 
Cada proveedor se identifica con un CIF único y se almacenan sus datos de contacto, incluyendo su dirección,
teléfono y correo electrónico. Además, se incluye una imagen de la compañía para facilitar su identificación. 
La contraseña se almacena para garantizar la seguridad del acceso a la información del proveedor.
"valoraciones": un número decimal con una precisión de una cifra antes del punto decimal y una precisión de una cifra después del punto decimal.
"categoria": una cadena de caracteres con un máximo de 50 caracteres.
"coordenadas": una cadena de caracteres con un máximo de 30 caracteres, donde se guardarán las coordenadas en el formato "latitud,longitud" (por ejemplo, "40.4168,-3.7038").
*/

CREATE TABLE `proveedores` (
    `CIF_PROV` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT 'PK/CIF > A-00000000',
    `RAZSOC` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'Razón Social - Nombre',
    `DIR_PROV` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Dirección',
    `TLF_PROV` int(11) NOT NULL COMMENT 'Teléfono',
    `MAIL_PROV` varchar(80) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Correo electrónico',
    `PW_PROV` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Contraseña',
    `VALORACIONES` DECIMAL(2,1) COMMENT 'Valoración del proveedor',
    `CATEGORIA` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'Categoría del proveedor',
    `TIEMPO` int(3) COMMENT 'Tiempo de Espera',
    `COORDENADAS` VARCHAR(30) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Coordenadas del proveedor',
    PRIMARY KEY (`CIF_PROV`)
);


/*
 ····TABLA RIDERS····
Esta sentencia SQL crea una tabla llamada riders que almacena información sobre los repartidores o "riders".
 Los campos de la tabla incluyen el DNI del rider,
 su nombre, apellidos, teléfono, correo electrónico, contraseña e imagen de perfil.
 La columna DNI_RID se define como la clave primaria de la tabla.
*/

CREATE TABLE `riders` (
    `DNI_RID` varchar(9) CHARACTER SET utf8mb4 NOT NULL COMMENT 'PK/DNI',
    `NOM_RID` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nombre',
    `APE_RID` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Apellidos',
    `TLF_RID` int(11) NOT NULL COMMENT 'Teléfono',
    `MAIL_RID` varchar(80) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Correo electrónico',
    `PW_RID` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Contraseña',
    PRIMARY KEY (`DNI_RID`)
);

/*
 ····TABLA PRODUCTOS····

creación de una tabla llamada productos. Esta tabla tiene siete columnas: COD_PROD, DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD, PRIMARY KEY y FOREIGN KEY.
La columna COD_PROD es el código del producto y es de tipo int y AUTO_INCREMENT, lo que significa que se generará automáticamente un valor único 
para cada nuevo registro. La columna DEN_PROD es la denominación del producto y es de tipo varchar. La columna PU_PROD es el precio unitario y es de
tipo DECIMAL con una precisión de 5 dígitos, 2 de ellos decimales. La columna CIF_PROV_PROD es el CIF del proveedor y es de tipo varchar. La columna 
IMG_PROD es la imagen del producto y es de tipo varchar. La columna PRIMARY KEY establece que COD_PROD es la clave primaria de la tabla. La columna KEY 
crea un índice para la columna CIF_PROV_PROD. La columna FOREIGN KEY establece una relación entre la tabla productos y la tabla proveedores, utilizando 
la columna CIF_PROV_PROD como clave foránea, lo que significa que la columna CIF_PROV_PROD en la tabla productos hace referencia a la columna CIF_PROV en
la tabla proveedores. La cláusula ON DELETE CASCADE indica que si un proveedor
se elimina de la tabla proveedores, todos los productos asociados a ese proveedor también se eliminarán automáticamente de la tabla productos.

*/

CREATE TABLE `productos` (
    `COD_PROD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Producto',
    `DEN_PROD` varchar(40) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Denomincación de Producto',
    `PU_PROD` DECIMAL(5, 2) DEFAULT NULL COMMENT 'Precio Unitario',
    `CIF_PROV_PROD` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT 'CIF del Proveedor > A-00000000',
    `IMG_PROD` varchar(2) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Imagen de producto',
    PRIMARY KEY (`COD_PROD`),
    KEY `CIF_PROV_PROD` (`CIF_PROV_PROD`),
    CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CIF_PROV_PROD`) REFERENCES `proveedores` (`CIF_PROV`) ON DELETE CASCADE
);

/*
 ····TABLA MENSAJES····

crea una tabla llamada "mensajes" con varias columnas. Las columnas incluyen un campo de clave primaria llamado "COD_MEN" que se incrementa 
automáticamente cada vez que se inserta un nuevo mensaje, un campo para el código del cliente que envía el mensaje, un campo para el asunto 
del mensaje y otro campo para el contenido del mensaje. Además, hay una clave externa que establece una relación con la tabla "clientes" en 
el campo "COD_CLI_MEN". Esto significa que cada mensaje en la tabla "mensajes" se relaciona con un cliente en la tabla "clientes". La clave externa
se utiliza para mantener la integridad referencial de la base de datos, lo que garantiza que solo se puedan agregar mensajes para clientes que existen 
en la tabla "clientes".

*/

CREATE TABLE `mensajes` (
    `COD_MEN` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK/Código de Mensaje',
    `COD_CLI_MEN` int(11) NOT NULL COMMENT 'Código Cliente',
    `ASU_MEN` varchar(40) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Asunto',
    `MEN_MEN` varchar(254) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Mensaje',
    PRIMARY KEY (`COD_MEN`),
    KEY `COD_CLI_MEN` (`COD_CLI_MEN`),
    CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`COD_CLI_MEN`) REFERENCES `clientes` (`COD_CLI`) ON DELETE CASCADE
);

/*
 ····TABLA VENTAS····
rea una tabla que almacena información sobre ventas realizadas en un sistema de delivery. Esta tabla tiene varios campos, 
como NUM_VEN que es un identificador único para cada venta y COD_CLI_VEN que indica el código del cliente que realizó la venta. 
También incluye el campo DNI_RID_VEN que indica el DNI del rider encargado de entregar la venta y DIR_VEN que es la dirección a 
la que se realizará la entrega. El campo FECH_VEN indica la fecha en que se realizó la venta y ESTADO_VEN indica el estado actual 
de la venta. Finalmente, la tabla también incluye el campo COM_VEN que es un campo de texto para incluir comentarios adicionales sobre 
la venta. La tabla tiene dos claves foráneas, una que hace referencia al código de cliente en la tabla clientes y otra que hace referencia 
al DNI del rider en la tabla riders, ambas con la opción ON DELETE CASCADE para mantener la integridad referencial.
*/

CREATE TABLE `ventas` (
    `NUM_VEN` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK/Número de Venta',
    `COD_CLI_VEN` int(11) NOT NULL COMMENT 'Código Cliente',
    `DNI_RID_VEN` varchar(9) CHARACTER SET utf8mb4 NOT NULL COMMENT 'DNI Rider',
    `DIR_VEN` varchar(120) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Dirección de la Venta',
    `FECH_VEN` varchar(10) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT 'Fecha de la Venta',
    `ESTADO_VEN` varchar(40) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Estado de la venta/pedido',
    `COM_VEN` varchar(128) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Comentarios sobre la venta',
    PRIMARY KEY (`NUM_VEN`),
    KEY `COD_CLI_VEN` (`COD_CLI_VEN`),
    KEY `DNI_RID_VEN` (`DNI_RID_VEN`),
    CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`COD_CLI_VEN`) REFERENCES `clientes` (`COD_CLI`) ON DELETE CASCADE,
    CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`DNI_RID_VEN`) REFERENCES `riders` (`DNI_RID`) ON DELETE CASCADE
);

/*
 ····TABLA DETALLE_VENTAS····

 La tabla "detalle_ventas" se utiliza para almacenar los detalles de una venta, incluyendo los códigos de los productos vendidos 
 y las cantidades correspondientes. Los campos "NUM_VEN_DET" y "COD_PROD_DET" se utilizan como claves primarias compuestas para 
 garantizar que no se puedan agregar dos veces los mismos detalles de venta. La clave externa "NUM_VEN_DET" se utiliza para hacer 
 referencia a la clave primaria de la tabla "ventas", mientras que la clave externa "COD_PROD_DET" se utiliza para hacer referencia 
 a la clave primaria de la tabla "productos". Estas claves externas garantizan que no se puedan agregar detalles de venta para ventas 
 o productos que no existen.
*/

CREATE TABLE `detalle_ventas` (
    `NUM_VEN_DET` int(11) NOT NULL COMMENT 'Código de la venta',
    `COD_PROD_DET` int(11) NOT NULL COMMENT 'Código de Producto',
    `CANT_DET` int(11) NOT NULL COMMENT 'Cantidad de Producto',
    PRIMARY KEY (`NUM_VEN_DET`, `COD_PROD_DET`),
    KEY `COD_PROD_DET` (`COD_PROD_DET`),
    CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`NUM_VEN_DET`) REFERENCES `ventas` (`NUM_VEN`) ON DELETE CASCADE,
    CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`COD_PROD_DET`) REFERENCES `productos` (`COD_PROD`) ON DELETE CASCADE
);

/*
 ····INSERCIÓN DE PROVEEDORES····
· CIF_PROV -> CIF del proveedor
· RAZSOC -> Nombre comercial del proveedor
· DIR_PROV -> Dirección del proveedor
· TLF_PROV -> Teléfono del proveedor
· MAIL_PROV -> Email del proveedor
· PW_PROV -> Contraseña del proveedor
· IMG_PROV -> imagen png del proveedor
*/
   
INSERT INTO proveedores (CIF_PROV, RAZSOC, DIR_PROV, TLF_PROV, MAIL_PROV, PW_PROV, VALORACIONES, CATEGORIA, TIEMPO, COORDENADAS) VALUES
	('A-00000001', 'McDonald´s', 'C/ Goya, 70', '604564312', 'hello@mcdonalds.com', '123456Ar', '4.7', 'Hamburguesa', '20', '40.4168,-3.7038'),
	('A-00000002', 'Subway', 'Plaza del Carmen, 38', '643242323', 'hello@subway.com', '123456Ar', '3.0', 'Sandwich', '20', '40.392826,-3.661071'),
	('A-00000003', 'KFC', 'C/ Goya, 68', '754353463', 'hello@kfc.com', '123456Ar', '4.0', 'Americana', '30', '40.386208,-3.678436'),
	('A-00000004', 'Goiko', 'Gta. de Bilbao, 3', '644231323', 'hello@goiko.com', '123456Ar', '3.6', 'Hamburguesa', '40', '40.544043,-3.630498'),
	('A-00000005', 'Domino´s Pizza', 'C/ Juan Bravo, 62', '633343252', 'hello@dominos.com', '123456Ar', '4.8', 'Pizzza', '15', '40.544043,-3.630498'),
	('A-00000006', 'Starbucks', 'CC Islazul', '645235121', 'hello@starbucks.com', '123456Ar', '4.9', 'Bebida', '20', '40.544043,-3.630498'),
	('A-00000007', 'Donner Kebab', 'Av. Oporto 89', '742304344', 'hello@donner.com', '123456Ar', '4.2', 'Kebab', '20', '40.461531,-4.129427'),
	('A-00000008', 'Farmacia Trébol', 'Av. Oporto 57', '700331344', 'hello@ftrebol.com', '123456Ar', '4.2', 'Parafarmacia', '10', '40.410657,-3.720553'),
	('A-00000009', 'Dunkin\'', 'C/ Fuencarral, 43', '643242000', 'hello@dunkin.com', '123456Ar', '4.4', 'Bebida', '15', '40.544043,-3.630498'),
	('A-00000010', 'Carl´s Jr', 'C/ Gran Vía, 45', '600324143', 'hello@carls.com', '123456Ar', '3.8', 'Hamburguesa', '30', '40.551917,-3.615504'),
	('A-00000011', 'THUNDER', 'C/ Don Felipe, 4', '711232131', 'hello@thunder.com', '123456Ar', '3.9', 'Vegana', '20', '40.544043,-3.630498'),
	('A-00000012', 'UDON', 'C/ Narváez, 36', '762626652', 'hello@udon.com', '123456Ar', '4.3', 'Asiática', '15', '40.544043,-3.630498'),
	('A-00000013', 'Taco Bell', 'CC Parque Sur', '634234411', 'hello@tacobell.com', '123456Ar', '3.7', 'Mexicana', '30', '40.544043,-3.630498'),
	('A-00000014', 'La Tagliatella', 'C/ O´Donell, 8', '742342423', 'hello@latagliatella.com', '123456Ar', '4.0', 'Italiana', '50', '40.410657,-3.720553'),
	('A-00000015', 'Manolo Bakes', 'CC Xanadú', '654535231', 'hello@manolobakes.com', '123456Ar', '4.7', 'Dulce', '15', '40.461531,-4.129427'),
	('A-00000016', 'Toc Toc', 'Av. de Gran Bretaña, 1', '666886848', 'hello@toctoc.com', '123456Ar', '4.9', 'Asiática', '20', '40.544043,-3.630498'),
	('A-00000017', 'Rodilla', 'CC Islazul', '777234213', 'hello@rodilla.com', '123456Ar', '5.0', 'Sandwich', '15', '40.551917,-3.615504'),
	('A-00000018', 'Aloha Poké', 'C/ de la Libertad, 17 ', '772277271', 'hello@alohapoke.com', '123456Ar', '4.6', 'Vegana', '20', '40.334281,-3.714209'),
	('A-00000019', 'Pizzería Carlos', 'C/ Alcalá, 238', '634302031', 'hello@pizzeriacarlos.com', '123456Ar', '4.7', 'Pizza', '30', '40.544043,-3.630498'),
	('A-00000020', 'OVEN', 'C/ Gran Vía, 55', '703040608', 'hello@oven.com', '123456Ar', '4.2', 'Italiana', '40', '40.544043,-3.630498');
/*
 ····INSERCIÓN DE PRODUCTOS····
· DEN_PROD -> Denominación comercial del producto
· RPU_PROD -> Precio del producto
· CIF_PROV_PROD -> CIF del proveedor correspondiente del producto *
· IMG_PROD -> Imagen en png del producto.
· TIEMPO_PREP_PROD -> tiempo de preparacion del producto 
*/
 
INSERT INTO productos (DEN_PROD, PU_PROD, CIF_PROV_PROD) VALUES
	('ShareBox 25 McNuggets', '12.85', 'A-00000001'),
	('McMenú CBO', '9.2', 'A-00000001'),
	('McMenú BigMac', '9.20', 'A-00000001'),
	('McFlurry Kitkat Chocolate', '3.75', 'A-00000001'),
	('Patatas Fritas Pequeñas', '1.00', 'A-00000001'),
	('McExtreme BBQ', '9.30', 'A-00000001'),
	('Helado Cono', '1.00', 'A-00000001'),
	('Sub Great Caesar', '12.50', 'A-00000002'),
	('BBQ Pork', '11.90', 'A-00000002'),
	('Bistec y Queso', '11.90', 'A-00000002'),
	('Pollo al curry', '11.50', 'A-00000002'),
	('Atún', '10.90', 'A-00000002'),
	('4 Tiras Crujientes', '4.80', 'A-00000003'),
	('Menú BBQ Burger', '9.29', 'A-00000003'),
	('Menú Bucket Mix', '11.29', 'A-00000003'),
	('Menú 3 Piezas', '9.99', 'A-00000003'),
	('3 Alitas Picantes', '3.10', 'A-00000003'),
	('Kevin Bacon', '14.90', 'A-00000004'),
	('Kiki', '13.90', 'A-00000004'),
	('Teques', '10.90', 'A-00000004'),
	('Carbonara Mediana', '13.29', 'A-00000005'),
	('Campiña Mediana', '13.29', 'A-00000005'),
	('Cuatro Quesos Familiar', '17.40', 'A-00000005'),
	('Texas BBQ', '13.99', 'A-00000005'),
	('Gluten Free', '11.60', 'A-00000005'),
	('Caffe Latte', '3.70', 'A-00000006'),
	('Capuccino', '3.90', 'A-00000006'),
	('Cortado', '3.20', 'A-00000006'),
	('Expreso', '2.90', 'A-00000006'),
	('Frappuccino Caramelo', '5.75', 'A-00000006'),
	('Galleta', '2.20', 'A-00000006'),
	('Durum Mixto', '3.90', 'A-00000007'),
	('Durum de Pollo', '3.90', 'A-00000007'),
	('Durum de Ternera', '3.90', 'A-00000007'),
	('Kebab de Pollo', '3.90', 'A-00000007'),
	('Kebab de Ternera', '3.90', 'A-00000007'),
	('Kebab Mixto', '3.90', 'A-00000007'),
	('Tiritas', '1.00', 'A-00000008'),
	('Gasas', '1.50', 'A-00000008'),
	('Crema Solar Nivea 50', '4.90', 'A-00000008'),
	('Caja 12', '19.80', 'A-00000009'),
	('Caja 6', '11.00', 'A-00000009'),
	('Big Carl', '8.90', 'A-00000010'),
	('California', '12.50', 'A-00000010'),
	('Gran Angus', '10.50', 'A-00000010'),
	('6 Fingers de Tofu', '10.90', 'A-00000011'),
	('Hamburguesa Vegana', '8.90', 'A-00000011'),
	('Espaguetis al Ajillo', '7.90', 'A-00000011'),
	('Corral Chicken Yakisoba', '13.95', 'A-00000012'),
	('Miso Ramen', '13.40', 'A-00000012'),
	('4 Chicken Tai Fingers', '5.50', 'A-00000012'),
	('4 Canelones Thai', '13.95', 'A-00000012'),
	('Nikou Don', '10.50', 'A-00000012'),
	('Menú Bacon Cheesy Quesadilla', '9.50', 'A-00000013'),
	('Menú Tres Tacos Supreme', '9.50', 'A-00000013'),
	('Menú Quesarito', '10.50', 'A-00000013'),
	('Taglietelle', '15.90', 'A-00000014'),
	('Spaguetti ', '15.90', 'A-00000014'),
	('Mix Manolitos 8 uds.', '12.80', 'A-00000015'),
	('Manolitos originales 6 uds', '10.90', 'A-00000015'),
	('4 rollitos de primavera ', '6.50', 'A-00000016'),
	('Bandeja 12 piezas', '12.50', 'A-00000016'),
	('Sandwich jamón y queso', '5.50', 'A-00000017'),
	('Sandwich mixto', '5.50', 'A-00000017'),
	('Sandwich de pavo y queso', '6.50', 'A-00000017'),
	('Pack 32 croquetas', '13.00', 'A-00000017'),
	('Foccacia', '6.50', 'A-00000017'),
	('Not Chicken Nuggets Vegan', '12.95', 'A-00000018'),
	('Vegan Creamy', '11.50', 'A-00000018'),
	('Vegan Dream', '11.50', 'A-00000018'),
	('Familiar Speciale Carlos', '20.95', 'A-00000019'),
	('Mediana BBQ Crispy Carlos', '14.95', 'A-00000019'),
	('Mediana Gourmet Kebab', '11.96', 'A-00000019'),
	('Rigatoni al horno', '14.50', 'A-00000020'),
	('Pizza burrata', '15.00', 'A-00000020'),
	('Tagliatella de bologna', '15.00', 'A-00000020');


/*
 ····INSERCIÓN DE CLIENTES····
· NOM_CLI -> Nombre cliente
· APE_CLI -> Apellido del cliente
· TLF_CLI -> Teléfono del cliente 
· MAIL_CLI -> Email del cliente.
· PW_CLI -> contraseña del cliente.     PPPPPPPPPP cifrar contraseñas ppppppppppp
*/

INSERT INTO CLIENTES(NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI)
VALUES
('Carlos', 'Almendros Arellano', 608694312, 'carlos@gmail.com','123Usuario'),
('Ignacio', 'Gil Torres', 775432842, 'nacho@gmail.com','123Usuario'),
('Gonzalo', 'Oliver Alfonso', 690787526, 'gonzalo@gmail.com','123Usuario');

/*
 ····INSERCIÓN DE RIDERS····
· NOM_RID -> Nombre rider
· APE_RID -> Apellido del rider
· TLF_RID -> Teléfono del rider 
· MAIL_RID -> Email del rider.
· PW_RID -> contraseña del rider.     PPPPPPPPPP cifrar contraseñas ppppppppppp
*/

INSERT INTO RIDERS(DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID) 
 VALUES
('11234356G','Jonathan', 'Casa Pila', 765457386, 'jota@dailygo.com','123Usuario'),
('11264584L','Benito', 'Martínez Ocasio', 694957545, 'benito@dailygo.com','123Usuario'),
('12345465X','Paula', 'Badosa Gibert', 600434523, 'paula@dailygo.com','123Usuario'),
('12222345T','Amicus', 'Echo', 666342345, 'amicus@dailygo.com','123Usuario'),
('16632387Y','Ibai', 'Llanos Garatea', 756454534, 'ibai@dailygo.com','123Usuario');

/*
 ····INSERCIÓN DE VENTAS····
· COD_CLI_VEN -> Código del cliente
· DNI_RID_VEN -> dni del rider
· DIR_VEN -> direccion 
· FECH_VEN -> fecha
· ESTADO_VEN -> estado entregado/no entregado
· COM_VEN -> comentario
`COD_CLI_VEN` int(11) NOT NULL COMMENT 'Código Cliente',
*/

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN, COM_VEN) 
VALUES
(1, '11234356G', 'Margaritas, 81', '18-03-2022', 'Entregado', 'Cuidado con el perro'),
(1, '12345465X', 'Av. de Concha Espina, 14', '28-05-2022', 'Entregado', 'La entrada está en obras'),
(1, '11264584L', 'Margaritas, 81, 14', '30-05-2022', 'Entregado', ''),
(2, '12345465X', 'Lucecitas, 22', '12-01-2022', 'Entregado', ''),
(2, '11264584L', 'Lucecitas, 22', '23-03-2022', 'Entregado', ''),
(2, '11234356G', 'Don Juan, 14', '28-03-2022', 'Entregado', ''),
(3, '11234356G', 'General Ricardos 32', '20-03-2022', 'Entregado', ''),
(3, '11264584L', 'General Ricardos 32', '11-05-2022', 'Entregado', ''),
(3, '12345465X', 'General Ricardos 32', '28-05-2022', 'Entregado', '');

/*
 ····INSERCIÓN DE DETALLES DE VENTAS····
· NUM_VEN_DET -> numero venta detalle
· COD_PROD_DET -> Código producto
· CANT_DET -> Cantidad
*/

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) 
VALUES
(1, 1, 2),
(1, 5, 1),
(2, 1, 4),
(3, 33, 8),
(3, 32, 1),
(3, 30, 1),
(4, 20, 1),
(5, 8, 2),
(5, 22, 2),
(6, 7, 2),
(6, 8, 2),
(7, 6, 2),
(7, 2, 2),
(8, 23, 1),
(8, 67, 4),
(9, 48, 2);
