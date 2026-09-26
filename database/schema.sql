CREATE DATABASE IF NOT EXISTS platomatch_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE platomatch_db;

-- 1. Tabla de Usuarios (HU-01)
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabla de Perfil Alimentario (HU-02 y HU-03)
CREATE TABLE IF NOT EXISTS perfil_alimentario (
    id_perfil INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT UNIQUE NOT NULL,
    presupuesto_max DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    cantidad_personas INT NOT NULL DEFAULT 1,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- 3. Tabla Maestra de Restricciones y Alergias (HU-04)
CREATE TABLE IF NOT EXISTS restricciones_salud (
    id_restriccion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    tipo ENUM('ALERGIA', 'CONDICION_MEDICA') NOT NULL
);

-- 4. Tabla Intermedia Usuario - Restricciones (HU-04)
CREATE TABLE IF NOT EXISTS usuario_restricciones (
    id_usuario INT NOT NULL,
    id_restriccion INT NOT NULL,
    PRIMARY KEY (id_usuario, id_restriccion),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_restriccion) REFERENCES restricciones_salud(id_restriccion) ON DELETE CASCADE
);

-- 5. Tabla Maestra de Ingredientes (HU-05)
CREATE TABLE IF NOT EXISTS ingredientes (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    unidad_medida VARCHAR(20) DEFAULT 'gramos'
);

-- 6. Tabla Intermedia Inventario del Usuario (HU-05)
CREATE TABLE IF NOT EXISTS usuario_ingredientes (
    id_usuario INT NOT NULL,
    id_ingrediente INT NOT NULL,
    PRIMARY KEY (id_usuario, id_ingrediente),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente) ON DELETE CASCADE
);

-- Datos iniciales (Seed Data)
INSERT IGNORE INTO restricciones_salud (nombre, tipo) VALUES 
('Gluten', 'ALERGIA'), ('Lácteos', 'ALERGIA'), ('Mariscos', 'ALERGIA'), ('Huevo', 'ALERGIA'),
('Anemia', 'CONDICION_MEDICA'), ('Diabetes', 'CONDICION_MEDICA'), ('Hipertensión', 'CONDICION_MEDICA');

INSERT IGNORE INTO ingredientes (nombre) VALUES 
('Arroz'), ('Lentejas'), ('Pollo'), ('Espinaca'), ('Tomate'), ('Cebolla'), ('Zanahoria');