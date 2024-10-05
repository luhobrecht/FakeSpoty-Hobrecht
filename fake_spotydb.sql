-- Creación de la base de datos
CREATE DATABASE FakeSpoty;

-- Seleccionar la base de datos para usar
USE FakeSpoty;

-- Creación de la tabla Género Musical
CREATE TABLE Genero_Musical (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    genero_nombre VARCHAR(50) NOT NULL
);

-- Creación de la tabla Cantantes
CREATE TABLE Cantantes (
    id_cantante INT PRIMARY KEY AUTO_INCREMENT,
    cantante_nombre VARCHAR(100) NOT NULL
);

-- Creación de la tabla Canciones
CREATE TABLE Canciones (
    id_cancion INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    duracion TIME,
    id_genero INT,
    id_cantante INT,
    CONSTRAINT FK_Cancion_Genero FOREIGN KEY (id_genero) REFERENCES Genero_Musical(id_genero),
    CONSTRAINT FK_Cancion_Cantante FOREIGN KEY (id_cantante) REFERENCES Cantantes(id_cantante)
);

-- Creación de la tabla Lista de Reproducción
CREATE TABLE Lista_Reproduccion (
    id_lista INT PRIMARY KEY AUTO_INCREMENT,
    fecha_creacion DATE NOT NULL,
    id_cancion INT,
    duracion TIME,
    nombre VARCHAR(100) NOT NULL,
    id_usuario INT,
    CONSTRAINT FK_Lista_Cancion FOREIGN KEY (id_cancion) REFERENCES Canciones(id_cancion)
);

-- Creación de la tabla Usuarios
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    id_lista INT,
    CONSTRAINT FK_Usuarios_Lista FOREIGN KEY (id_lista) REFERENCES Lista_Reproduccion(id_lista)
);
