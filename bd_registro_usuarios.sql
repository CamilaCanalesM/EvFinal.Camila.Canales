-- Creación de la base de datos
CREATE DATABASE bd_registro_usuarios;

-- Uso de la base de datos recién creada
USE bd_registro_usuarios;

-- Creación de la tabla de usuarios
CREATE TABLE tbl_usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    edad int(3) NOT NULL,
    correo varchar(100) NOT NULL
);

-- Inserción de datos
INSERT INTO `tbl_usuarios` (`nombre`, `apellido`, `edad`, `correo`) VALUES
('Camila', 'Canales', 31, 'camila.canales.moreno@ciisa.cl'),
('Juan', 'Perez', 36, 'juan.perez.gonzalez@ciisa.cl');