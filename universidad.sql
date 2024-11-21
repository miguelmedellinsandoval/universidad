CREATE DATABASE Universidad;


USE Universidad;

CREATE TABLE estudiantes (
    EstudiantesID INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(100) UNIQUE,
    telefono int
    );
    
  CREATE TABLE cursos (
    CursosId INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    profesor_id INT,  -- Clave foránea para relacionar con un profesor
    FOREIGN KEY (profesor_id) REFERENCES profesores(id) ON DELETE SET NULL
);


	CREATE TABLE profesores (
    ProfesorId INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    especialidad VARCHAR(100)
    
);
CREATE TABLE estudiantes_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(EstudiantesID) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(CursosId) ON DELETE CASCADE
);
INSERT INTO estudiantes (nombre, email, fecha_nacimiento, telefono)
VALUES 
('Ana Gómez', 'ana.gomez@correo.com', '2000-05-12', '3115014436'),
('Luis Martínez', 'luis.martinez@correo.com', '2001-11-23', '3102132959'),
('Sofía Pérez', 'sofia.perez@correo.com', '1999-08-09', '3102132959');


SELECT * FROM estudiantes;
INSERT INTO Cursos (nombre, descripcion,fecha_inicio)
VALUES 
('Cálculo I', 'Introducción al cálculo diferencial e integral', 1),  
('Física I', 'Fundamentos de la física clásica', 2),                  
('Programación I', 'Introducción a la programación y estructuras de datos', 3);  

SELECT * FROM Cursos;
INSERT INTO Profesores (nombre, email,especialidad)
VALUES 
('Juan Pérez', 'juan.perez@universidad.com', 'Matemáticas'),
('Laura Sánchez', 'laura.sanchez@universidad.com', 'Física'),
('Carlos Rodríguez', 'carlos.rodriguez@universidad.com', 'Informática');
SELECT * FROM Profesores ;
INSERT INTO Estudiantes_Cursos (id_estudiante, id_curso, fecha_inscripcion)
VALUES 
(1, 1, '2024-08-01'),  -- Ana Gómez se inscribe en Cálculo I
(1, 2, '2024-08-01'),  -- Ana Gómez se inscribe en Física I
(2, 1, '2024-08-01'),  -- Luis Martínez se inscribe en Cálculo I
(3, 3, '2024-08-01');  -- Sofía Pérez se inscribe en Programación I