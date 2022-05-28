DROP DATABASE IF EXISTS DAILYGO;
CREATE DATABASE IF NOT EXISTS DAILYGO;
USE DAILYGO;

CREATE TABLE `clientes` (
    `COD_CLI` int(10) NOT NULL AUTO_INCREMENT COMMENT 'PK/Código Cliente',
    `NOM_CLI` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nombre',
    `APE_CLI` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Apellidos',
    `TLF_CLI` int(11) NOT NULL COMMENT 'Teléfono',
    `MAIL_CLI` varchar(80) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Correo electrónico',
    `PW_CLI` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Contrasenya',
    `IMG_CLI` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Imagen perfil',
    PRIMARY KEY (`COD_CLI`),
    UNIQUE KEY `ÚNIDCA` (`TLF_CLI`, `MAIL_CLI`)
);

CREATE TABLE `proveedores` (
    `CIF_PROV` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT 'PK/CIF > A-00000000',
    `RAZSOC` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL COMMENT 'Razón Social - Nombre',
    `DIR_PROV` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Dirección',
    `TLF_PROV` int(11) NOT NULL COMMENT 'Teléfono',
    `MAIL_PROV` varchar(80) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Correo electrónico',
    `PW_PROV` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Contraseña',
    `IMG_PROV` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Imagen de la compañía',
    PRIMARY KEY (`CIF_PROV`)
);

CREATE TABLE `riders` (
    `DNI_RID` varchar(9) CHARACTER SET utf8mb4 NOT NULL COMMENT 'PK/DNI',
    `NOM_RID` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Nombre',
    `APE_RID` varchar(120) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Apellidos',
    `TLF_RID` int(11) NOT NULL COMMENT 'Teléfono',
    `MAIL_RID` varchar(80) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Correo electrónico',
    `PW_RID` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Contraseña',
    `IMG_RID` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Imagen perfil',
    PRIMARY KEY (`DNI_RID`)
);

CREATE TABLE `productos` (
    `COD_PROD` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de Producto',
    `DEN_PROD` varchar(40) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Denomincación de Producto',
    `PU_PROD` DECIMAL(5, 2) DEFAULT NULL COMMENT 'Precio Unitario',
    `CIF_PROV_PROD` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT 'CIF del Proveedor > A-00000000',
    `IMG_PROD` varchar(1000) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'Imagen de producto',
    PRIMARY KEY (`COD_PROD`),
    KEY `CIF_PROV_PROD` (`CIF_PROV_PROD`),
    CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CIF_PROV_PROD`) REFERENCES `proveedores` (`CIF_PROV`) ON DELETE CASCADE
);

CREATE TABLE `mensajes` (
    `COD_MEN` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PK/Código de Mensaje',
    `COD_CLI_MEN` int(11) NOT NULL COMMENT 'Código Cliente',
    `ASU_MEN` varchar(40) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Asunto',
    `MEN_MEN` varchar(254) CHARACTER SET utf8mb4 NOT NULL COMMENT 'Mensaje',
    PRIMARY KEY (`COD_MEN`),
    KEY `COD_CLI_MEN` (`COD_CLI_MEN`),
    CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`COD_CLI_MEN`) REFERENCES `clientes` (`COD_CLI`) ON DELETE CASCADE
);

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

CREATE TABLE `detalle_ventas` (
    `NUM_VEN_DET` int(11) NOT NULL COMMENT 'Código de la venta',
    `COD_PROD_DET` int(11) NOT NULL COMMENT 'Código de Producto',
    `CANT_DET` int(11) NOT NULL COMMENT 'Cantidad de Producto',
    PRIMARY KEY (`NUM_VEN_DET`, `COD_PROD_DET`),
    KEY `COD_PROD_DET` (`COD_PROD_DET`),
    CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`NUM_VEN_DET`) REFERENCES `ventas` (`NUM_VEN`) ON DELETE CASCADE,
    CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`COD_PROD_DET`) REFERENCES `productos` (`COD_PROD`) ON DELETE CASCADE
);

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-12344355',
        'McDonald´s',
        'Magdelena, 4',
        '555234312',
        'hello@mcdonalds.es',
        '123456',
        'img/macas.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-10384850',
        'KFC',
        'Águila, 28',
        '555123454',
        'hello@kfc.es',
        '123456',
        'img/KFC.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'B-54364364',
        'La Tagliatella',
        'Av. General Pérez, 128',
        '555325675',
        'hello@latagliatella.es',
        '123456',
        'img/Tagliatella.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-12342342',
        'Domino´s',
        'Magdalena, 4',
        '555553235',
        'hello@dominos.es',
        '123456',
        'img/Dominos.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-43242314',
        'El Corte Inglés',
        'Preciados, 23',
        '555097874',
        'hello@elcorteingles.es',
        '123456',
        'img/ElCorteIngles.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-65623643',
        'Starbucks',
        'Gran Vía, 234',
        '555123214',
        'hello@starbucks.es',
        '123456',
        'img/Starbucks.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'G-96865455',
        'Bar La Reja',
        'Padre Amigo, 23',
        '555887333',
        'hello@barlareja.es',
        '123456',
        'img/LaReja.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-65747547',
        'Dunkin Coffee',
        'Luces blancas, 1',
        '555234434',
        'hello@dunkincoffee.es',
        '123456',
        'img/Dunkin.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-85743853',
        'Gran Nemrut',
        'Oporto, 4',
        '555023821',
        'hello@grannemrut.es',
        '123456',
        'img/Nemrut.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'B-12340090',
        'VIPS',
        'Av. Paz, 2',
        '555342398',
        'hello@vips.es',
        '123456',
        'img/vips.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-12344365',
        'Farmacias Trébol',
        'Oca, 33',
        '555099883',
        'hello@farmaciastrebol.es',
        '123456',
        'img/fTrebol.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-12676789',
        'Goiko Grill',
        'Tembleque, 8',
        '555099830',
        'hello@goikogrill.es',
        '123456',
        'img/goiko.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'G-65654745',
        'UDON',
        'Magdalena, 7',
        '555099949',
        'hello@udon.es',
        '123456',
        'img/UDON.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-55654626',
        'Pans & Company',
        'Av. Tomás, 12',
        '555667321',
        'hello@pans.es',
        '123456',
        'img/pansandcompany.png'
    );

INSERT INTO
    PROVEEDORES(
        CIF_PROV,
        RAZSOC,
        DIR_PROV,
        TLF_PROV,
        MAIL_PROV,
        PW_PROV,
        IMG_PROV
    )
VALUES
(
        'A-12347574',
        'Tim Hortons',
        'Vía libre, 4',
        '555671240',
        'hello@timhortons.es',
        '123456',
        'img/timHortons.png'
    );

INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Big Mac','5.95','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/2635e21b-9bae-4835-9efe-defc1ab25c1b_1080x943_App_Bundles_McMBM.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú McPollo','6.00','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/40137127-c045-4d04-9f28-e2376ecdb973_1080x943_App_Bundles_McMMcPollo.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('McFlurry KitKat Chocolate','3.75','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/6e4e7154-4515-412c-b6d7-96c3a7311248_8f660d847e7cca448dea2c44d4e7dbf7.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Patatas Fritas McDonalds','1.00','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/f2e320e6-1277-43d3-a575-c4f41a8ac7aa_1080x943-App_0004_Patatas-Grandes.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('McNuggets','2.00','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/f905450a-f1f6-4b2b-a7e3-4dbc70561d1c_Producto+202+-+_9McN+uggets-+sin+100pollo.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Cono Helado McDonald','1.00','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/5e88cdfd-5711-43a8-b93d-d75631d96747_1080x943-App_0000_Cono.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Happy Meal','6.75','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/4f4686cb-c92c-4bbe-9d14-a6bb8e83665d_1200x1200_NGK_McMenu_HM_McBites_9.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menu The Signature Collection','10.80','A-12344355','https://mcdonalds.es/api/cms/images/mcdonalds-es/8e038a45-55b8-452f-9ddd-8defa3728959_1080x943_Signature-Cabra-2021-sencilla.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tiritas','0.80','A-12344365','https://salunatur.com/6999-medium_default/tiritas-plastico-hartmann-19-x-72-250-ud.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Algodón','1.00','A-12344365','https://images-na.ssl-images-amazon.com/images/I/51ND-czdddL._AC_SX679_.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Vendas','1.00','A-12344365','https://www.bimedica.com/imagenes_productos/553.png?v=7');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Alcohol 96º','1.20','A-12344365','https://www.farmavazquez.com/58174-thickbox_default/kern-pharma-alcohol-96-250-ml.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Agua oxigenada','1.60','A-12344365','https://www.medicalcanada.es/imagenes/image/productos/012-3903_1_012-3903_1-agua-oxigenada-montplet.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Crema de Manos','2.23','A-12344365','https://www.clara.es/medio/2019/10/09/crema-de-manos-para-el-invierno_1ecf9a37_1000x1500.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú bucket 12 tiras','15.95','A-10384850','https://www.kfcjamaica.com/sites/default/files/2021-03/kfc_Bucket_15_21pc_2021_03_08.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú bucket 5 alitas pollo picante','9.95','A-10384850','https://static.kfc.es/images/items/lg/41193.jpg?v=3mNNXL');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú La Sobrada','9.95','A-10384850','https://static.kfc.es/images/items/lg/41193.jpg?v=3mNNXL');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Doble BBQ Bacon Cheese Burguer','7.50','A-10384850','https://www.chollosocial.com/media/data/2020/12/1607829049.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú 3 piezas pollo picante','5.00','A-10384850','https://www.just-eat.es/CmsAssets/media/Images/Chains/KFC/Dishes/Menu-3-Piezas-de-Pollo-320x320.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Mini helado Fresa KFC','1.40','A-10384850','https://static.kfc.es/images/items/lg/40817.jpg?v=Lvb8nL');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tiras Receta Crispy Kentucky','2.95','A-10384850','https://www.cabroworld.com/wp-content/uploads/2018/05/receta-KFC-1.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Burrata e panzenella','7.50','B-54364364','https://res.cloudinary.com/hesvvq3zo/image/upload/v1649774231/CARTA/ANTIPASTI/BURRATAPANZANELLA/WEB/burrata.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Focaccia di Recco','6.95','B-54364364','https://www.sanpellegrinofruitbeverages.com/es/sites/g/files/xknfdk846/files/focaccia_1200x700_14.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Fondente de queso','8.95','B-54364364','https://res.cloudinary.com/hesvvq3zo/image/upload/v1649774332/CARTA/ANTIPASTI/FONDENTEQUESO/WEB/fondente_de_queso.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Pane Tagliatella','11.95','B-54364364','https://res.cloudinary.com/hesvvq3zo/image/upload/v1649409139/CARTA/PANE/3PANE/WEB/3pane.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Provoletta','12.49','B-54364364','https://res.cloudinary.com/hesvvq3zo/image/upload/v1649774424/CARTA/ANTIPASTI/PROVOLETTA/WEB/Provoletta.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tortellini Fritti','14.89','B-54364364','https://deliziosetentazionidivale.it/wp-content/uploads/2021/11/Tortellini-Fritti.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('4 stagioni','14.59','B-54364364','https://mangia.es/wp-content/uploads/2021/10/34-4-stagioni.jpeg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bianca di foie','16.59','B-54364364','https://sonaesierracms-v2.cdnpservers.net/wp-content/uploads/sites/31/2021/01/pizza-tagliatella.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Hawaiana Crispy','19.95','A-12342342','https://www.elconfidencialdigital.com/asset/zoomcrop,1280,720//media/elconfidencialdigital/images/2021/10/14/2021101417374290114.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Parmesana Carbonada','19.95','A-12342342','https://restauracionnews.com/wp-content/uploads/2020/09/Parmesana-Carbonara.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Texas BBQ Crispy','19.95','A-12342342','https://holacomida.com/es/upload/1626971221-Texas%20BBQ%20Crispy%20Familiar.jpeg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Extravaganzza','19.95','A-12342342','https://media-cdn.tripadvisor.com/media/photo-s/0e/52/3b/38/extravaganzza-feat.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Margarita','16.95','A-12342342','https://www.dominos.com.au/ManagedAssets/AU/product/P301/AU_P301_en_hero_4055.jpg?v-1013096145');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Barbacoa','16.95','A-12342342','https://okdiario.com/img/2015/09/08/receta-pizza-barbacoa.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tony Pepperoni','16.95','A-12342342','https://www.noticiasde.info/sites/default/files/styles/large/public/2018-10/pizzaport.jpg?itok=Ytw_cbDY');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Patanegra','16.95','A-12342342','https://i.ytimg.com/vi/N9yH4qd4iSc/maxresdefault.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Cuatro Quesos','16.95','A-12342342','https://simplementerecetas.com/wp-content/uploads/2020/08/Pizaa-de-cuatro-quesos-750x500.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bandeja Sushi C.I','4.95','A-43242314','https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202108/02/00118288400635____7__1200x1200.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Macarrones con tomate C.I','4.95','A-43242314','https://www.cocinacaserayfacil.net/wp-content/uploads/2018/07/macarrones-con-tomate-y-atun.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Paella Valenciana C.I','6.59','A-43242314','https://mechelarestaurante.es/wp-content/uploads/2020/05/PAELLA-2.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Manzana Rosetta C.I','0.45','A-43242314','https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202204/07/00118101900316____3__325x325.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Sopa de marisco C.I','3.50','A-43242314','https://content-cocina.lecturas.com/medio/2018/07/19/paso-a-paso-para-hacer-una-sopa-de-fiesta-con-pescado-y-marisco-resultado-final_c380ea1e_720x360.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tortilla de patata C.I','5.50','A-43242314','https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202110/04/00118851000929____4__1200x1200.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tarta de arándanos C.I','2.95','A-43242314','https://aptcrecetas.elcorteingles.es/supermercado/aptc/images/aptc/2147714/tartas-que-delicias_0.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tarta de manzana C.I','2.95','A-43242314','https://aptcrecetas.elcorteingles.es/supermercado/aptc/images/aptc/594243/tarta-de-manzana_0.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Frapuccino Starbucks','4.95','A-65623643','https://badun.nestle.es/imgserver/v1/80/1290x742/82c0d9edbe53-frapuccino-de-chocolate.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Iced Chocolate Starbucks','3.49','A-65623643','https://www.starbucks.es/sites/starbucks-es/files/styles/c10_2_col_text_560x467/public/2022-03/SBX-UK-MOP-WhiteChocolateMocha.jpg.webp?itok=cU2NCZlp');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Latte Starbucks','3.49','A-65623643','https://www.starbucks.es/sites/starbucks-es/files/styles/c10_2_col_text_560x467/public/2022-03/SBX-UK-MOP-Caffe%CC%80Americano.jpg.webp?itok=ag7Cnqe1');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Americano Starbucks','4.50','A-65623643','https://www.starbucks.es/sites/starbucks-es/files/styles/c10_2_col_text_560x467/public/2021-11/Espresso.jpeg.webp?itok=-kPKCTdy');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Expresso Starbucks','3.49','A-65623643','https://www.starbucks.es/sites/starbucks-es/files/styles/c10_2_col_text_560x467/public/2021-11/Espresso%20Macchiato.jpeg.webp?itok=qGRtPlOs');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Macchiato Starbucks','5.49','A-65623643','https://www.starbucks.es/sites/starbucks-es/files/styles/c10_2_col_text_560x467/public/2021-11/Latte%20Macchiato.jpeg.webp?itok=NYZh9PaB');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Cappuccino Starbucks','3.75','A-65623643','https://www.starbucks.es/sites/starbucks-es/files/styles/c10_2_col_text_560x467/public/2022-03/SBX-UK-MOP-Cappuccino.jpg.webp?itok=zBw4SXIE');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Caramel Machiatto Starbucks','6.75','A-65623643','https://www.starbucks.es/sites/starbucks-es/files/styles/c10_2_col_text_560x467/public/2022-03/SBX-UK-MOP-CaramelMacchiato.jpg.webp?itok=Fk_12Iex');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Jamón La Reja','2.95','G-96865455','https://cdn.palbincdn.com/users/38724/images/jamon-serrano-1588876554.jpeg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Chorizo La Reja','2.95','G-96865455','https://estaticos-cdn.elperiodico.com/clip/59929013-2257-41e5-b901-426ac9ccf3d5_alta-libre-aspect-ratio_default_0.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Bacon-Queso La Reja','2.95','G-96865455','https://europastry.com/es/wp-content/uploads/sites/5/2021/05/3324_r1_6.jpeg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Calamares La Reja','2.95','G-96865455','https://static-sevilla.abc.es/media/gurmesevilla/2013/05/bocadillo-calamares.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Lomo La Reja','2.95','G-96865455','https://static-sevilla.abc.es/media/gurmesevilla/2015/07/bocadillo-de-queso-con-lomo-de-cerdo-y-cebolla-confitada.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Jamón-Queso La Reja','2.95','G-96865455','https://1.bp.blogspot.com/-C-QpPjL_FTs/Wt2vk8P3dXI/AAAAAAAABKI/4wTdXMlqZ8ocBcVSNoJZQjFrFEX6GFxeQCLcBGAs/w1200-h630-p-k-no-nu/bocadillo_jamon_y_queso_ml.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de TortillaLa Reja','2.95','G-96865455','https://s1.eestatic.com/2020/12/10/actualidad/542458256_167258130_1706x960.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Atún La Reja','2.95','G-96865455','https://recetinas.com/wp-content/uploads/2018/04/bocadillo-de-atun-con-tomate.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Dunkin Clásico','1.95','A-65747547','https://www.dunkin.es/wp-content/uploads/2019/09/cafe_latte.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Dunkin Americano','1.95','A-65747547','https://www.dunkin.es/wp-content/uploads/2019/09/Artboard-Copy-3-1.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Dunkin Chocolate','1.95','A-65747547','https://www.dunkin.es/wp-content/uploads/2019/09/chocolate.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Dunkin Café Latte','2.75','A-65747547','https://www.dunkin.es/wp-content/uploads/2019/09/capuccino.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Dunkin Café Solo','2.75','A-65747547','https://www.dunkin.es/wp-content/uploads/2019/09/espresso.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Kebab','5.50','A-85743853','https://saborgourmet.com/wp-content/uploads/el-kebab-tipico-de-turquia-istock.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Durum','6.00','A-85743853','https://www.gourmetkebab.es/wp-content/uploads/2020/04/durum-kebab.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Falafel','5.75','A-85743853','https://s1.eestatic.com/2019/09/05/cocinillas/recetas/aperitivos-y-entrantes/garbanzos-recetas_veganas-sin_gluten_426968083_133807737_1024x576.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Pizza de Kebab','8.00','A-85743853','https://www.unileverfoodsolutions.es/dam/global-ufs/mcos/SPAIN/calcmenu/recipes/ES-recipes/general/pizza-kebab/main-header.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Piezas de pollo x5','4.00','A-85743853','https://cdn1.comohacerpara.com/imgn/18269-receta-pollo-frito-estilo-kfc.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Tortitas Bacon VIPS','2.95','B-12340090','https://www.vips.es/sites/default/files/styles/optimize/public/tortitas720x500.jpg?itok=OcEswInv');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Batido Chocolate VIPS','4.50','B-12340090','https://www.vips.es/sites/default/files/styles/optimize/public/batido-oreo720x500-.jpg?itok=ufBXfN_U');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Sándwich Txangurrón VIPS','9.95','B-12340090','https://www.vips.es/sites/default/files/styles/optimize/public/product/vips/txangurro-landing.png?itok=Tkss_f00');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Sándwich Piri Piri Chicken VIPS','9.95','B-12340090','https://www.vips.es/sites/default/files/styles/optimize/public/ficha_de_producto_vips_720x500_sw_piri_piri.jpg?itok=jBRGSjou');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Sándwich Pastrami VIPS','9.95','B-12340090','https://www.vips.es/sites/default/files/styles/optimize/public/product/vips/pastrami-landing.png?itok=qoPSwHvK');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Hamburguesa Classic VIPS','6.59','B-12340090','https://www.vips.es/sites/default/files/styles/optimize/public/ficha-de-producto-vips_720x500_hb-clasica.jpg?itok=DZIK6z5C');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Goiko Burger Carne','9.95','A-12676789','https://www.goiko.com/wp-content/uploads/2019/11/Classic_Web_Desktop.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Goiko Burger Vegana','9.95','A-12676789','https://i.blogs.es/fda746/beyond/1366_2000.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Goiko Burger Anús','9.95','A-12676789','https://www.goiko.com/wp-content/uploads/2017/02/M30_Web_Desktop.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Goiko Burger Queso','9.95','A-12676789','https://www.goiko.com/wp-content/uploads/2017/03/Kevin_Web_Desktop.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Goiko Patatas','1.50','A-12676789','https://pbs.twimg.com/media/E86Ee0bXMAEnp3H?format=jpg&name=4096x4096');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Goiko Creamy Crunch','12.90','A-12676789','https://www.goiko.com/wp-content/uploads/2017/01/BCD_1331-1.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Menú Goiko La Lady','11.50','A-12676789','https://www.goiko.com/wp-content/uploads/2021/12/LADY_1200x600.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Goiko Helado','2.95','A-12676789','https://www.goiko.com/wp-content/uploads/2019/11/PostresPortada_Web_Desktop-3.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Ramen UDON','7.59','G-65654745','https://www.udon.es/products/images/miso_ramen_45653001.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Sushi Bandeja UDON','8.95','G-65654745','https://holacomida.com/es/upload/1594941847-Noodle%20Rolls.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Mix UDON Izakayas','14.35','G-65654745','https://media-cdn.tripadvisor.com/media/photo-s/0f/46/eb/e5/izakayas.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Guyozas UDON','7.95','G-65654745','https://www.udon.es/products/images/gyozas_de_cerdo_45653366.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Café Latte Tim Hortons','2.95','A-12347574','https://timhortonswp.blob.core.windows.net/uploads/2019/01/Latte.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Descafeinado Tim Hortons','2.10','A-12347574','https://timhortonswp.blob.core.windows.net/uploads/2017/11/CafeDecaf.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('French Vanilla','4.95','A-12347574','https://timhortonswp.blob.core.windows.net/uploads/2019/01/French.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Donut','2.10','A-12347574','https://timhortonsmx.com/assets/img/products/image-donut.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Napolitana','2.10','A-12347574','https://panamarbakery.com/public/Image/2022/3/12212_media_napolit_choco50_int.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Americano Tim Hortons','2.10','A-12347574','https://timhortonsmx.com/assets/img/products/CafeAmericano.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Cappuccino Tim Hortons','2.10','A-12347574','https://timhortons.co.th/wp-content/uploads/2020/02/hot-cappuccino.png');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo de Pechuga de Pollo','4.50','A-55654626','https://www.pansandcompany.com/files/products/es/bocadillos/clasicos/pechuga-de-pollo/images/25_10_2021_02_51_18.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo Serrano Brie','4.50','A-55654626','https://www.pansandcompany.com/files/products/es/bocadillos/premium/serrano-brie/images/25_10_2021_03_01_27.jpg');
INSERT INTO PRODUCTOS(DEN_PROD, PU_PROD, CIF_PROV_PROD, IMG_PROD) VALUES('Bocadillo Ibérico','4.50','A-55654626','https://www.pansandcompany.com/files/products/es/bocadillos/premium/iberico/images/25_10_2021_02_56_02.jpg');

INSERT INTO CLIENTES(NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI) VALUES('Carlos', 'Almendros Arellano', 608694312, 'carlos@gmail.com','123usuario');
INSERT INTO CLIENTES(NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI) VALUES('Ignacio', 'Gil Torres', 775432842, 'nacho@gmail.com','123usuario');
INSERT INTO CLIENTES(NOM_CLI, APE_CLI, TLF_CLI, MAIL_CLI, PW_CLI) VALUES('Lucas', 'Duro Serrano', 654237192, 'lucas@gmail.com','123usuario');

INSERT INTO RIDERS(DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID) VALUES('11234356G','Jonathan', 'Casa Pila', 765457386, 'jota@dailygo.com','123usuario');
INSERT INTO RIDERS(DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID) VALUES('11264584L','Benito', 'Martínez Ocasio', 694957545, 'benito@dailygo.com','123usuario');
INSERT INTO RIDERS(DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID) VALUES('12345465X','Paula', 'Badosa Gibert', 600434523, 'paula@dailygo.com','123usuario');
INSERT INTO RIDERS(DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID) VALUES('12222345T','Amicus', 'Echo', 666342345, 'amicus@dailygo.com','123usuario');
INSERT INTO RIDERS(DNI_RID, NOM_RID, APE_RID, TLF_RID, MAIL_RID, PW_RID) VALUES('16632387Y','Ibai', 'Llanos Garatea', 756454534, 'ibai@dailygo.com','123usuario');

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN, COM_VEN) 
VALUES(1, '11234356G', 'Margaritas, 81', '18-03-2022', 'Entregado', 'Cuidado con el perro');

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN, COM_VEN) 
VALUES(1, '12345465X', 'Av. de Concha Espina, 14', '28-05-2022', 'Entregado', 'La entrada está en obras');

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN) 
VALUES(1, '11264584L', 'Margaritas, 81, 14', '30-05-2022', 'Entregado');



INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN) 
VALUES(2, '12345465X', 'Lucecitas, 22', '12-01-2022', 'Entregado');

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN) 
VALUES(2, '11264584L', 'Lucecitas, 22', '23-03-2022', 'Entregado');

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN) 
VALUES(2, '11234356G', 'Don Juan, 14', '28-03-2022', 'Entregado');



INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN) 
VALUES(3, '11234356G', 'General Ricardos 32', '20-03-2022', 'Entregado');

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN) 
VALUES(3, '11264584L', 'General Ricardos 32', '11-05-2022', 'Entregado');

INSERT INTO VENTAS (COD_CLI_VEN, DNI_RID_VEN, DIR_VEN, FECH_VEN, ESTADO_VEN) 
VALUES(3, '12345465X', 'General Ricardos 32', '28-05-2022', 'Entregado');

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(1, 1, 2);
INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(1, 5, 1);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(2, 1, 4);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(3, 33, 8);
INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(3, 32, 1);
INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(3, 30, 1);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(4, 20, 1);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(5, 8, 2);
INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(5, 22, 2);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(6, 7, 2);
INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(6, 8, 2);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(7, 6, 2);
INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(7, 2, 2);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(8, 23, 1);
INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(8, 67, 4);

INSERT INTO detalle_ventas (NUM_VEN_DET, COD_PROD_DET, CANT_DET) VALUES
(9, 48, 2);
