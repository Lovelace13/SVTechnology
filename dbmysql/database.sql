
-- El usuario bodeguero tendrá el rol de inventarios
-- El usuario secretaria tendrá el rol de inventarios y mensajeria
-- El rol de inventarios debe tener permisos para agregar, editar, eliminar y leer articulos (CRUD)
-- El rol de mensajeria deberá tener permisos CRUD para mensajeria 
-- El usuario Administrador debe tener todos los roles asignados
   
CREATE DATABASE prueba_inventario CHARACTER SET utf8mb4;

CREATE TABLE `articulos`(
	`id` int AUTO_INCREMENT not null,
    `nombre` varchar(60) not null,
    `fecha` datetime(3) NULL,
    PRIMARY KEY(`id` ASC)
);

CREATE TABLE `mensajeria`(
	`id` int AUTO_INCREMENT not null,
    `idarticulo` int,
    `mensaje` varchar(250) not null,
    `fecha` datetime(3) not null,
    PRIMARY KEY(`id` ASC)
);
    
CREATE ROLE 'inventarios'@'localhost', 'mensajeria'@'localhost';

GRANT select, update, insert, delete ON prueba_inventario.articulos to 'inventarios'@'localhost';
GRANT select, update, insert, delete ON prueba_inventario.mensajeria to 'mensajeria'@'localhost'; 
FLUSH PRIVILEGES;

CREATE USER 'admin'@'localhost' identified by 'admin123';
GRANT ALL PRIVILEGES ON prueba_inventario.* to 'admin'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'bodeguero'@'localhost' identified by 'bodeguero';
CREATE USER 'secretaria'@'localhost' identified by 'secretaria';

GRANT 'inventarios'@'localhost' TO 'bodeguero'@'localhost';
-- GRANT select, update, insert, delete ON prueba_inventario.articulos to 'bodeguero'@'localhost';

GRANT 'mensajeria'@'localhost' TO 'secretaria'@'localhost';
-- GRANT select, update, insert, delete ON prueba_inventario.mensajeria to 'secretaria'@'localhost';

SHOW GRANTS FOR 'bodeguero'@'localhost';
show grants for 'secretaria'@'localhost';

