-- Crear la base de datos (clinica_notificaciones)
CREATE DATABASE clinica_notificaciones;

-- Crear la tabla medicamento
CREATE TABLE medicamento (
    idmedicamento int NOT NULL AUTO_INCREMENT,
    nombre varchar(45) NOT NULL,
    descripcion varchar(45) DEFAULT NULL,
    dosificacion varchar(45) NOT NULL,
    fecha_vencimiento date NOT NULL,
    registrado_en timestamp NULL DEFAULT NULL,
    PRIMARY KEY (idmedicamento)
);

-- Crear la tabla medicamento_paciente
CREATE TABLE medicamento_paciente (
    idmedi_paciente int NOT NULL AUTO_INCREMENT,
    paciente_id int NOT NULL,
    medicamento_id int NOT NULL,
    medico_id int NOT NULL,
    prescrito_en timestamp NULL DEFAULT NULL,
    dosificacion varchar(45) NOT NULL,
    duracion varchar(45) DEFAULT NULL,
    PRIMARY KEY (idmedi_paciente),
    KEY fk_medicamento_paciente_paciente (paciente_id),
    KEY fk_medicamento_paciente_medicamento (medicamento_id),
    KEY fk_medicamento_paciente_medico (medico_id),
    CONSTRAINT fk_medic FOREIGN KEY (medico_id) REFERENCES medico (idmedico),
    CONSTRAINT fk_medicamentoid FOREIGN KEY (medicamento_id) REFERENCES medicamento (idmedicamento),
    CONSTRAINT fk_pacienteid FOREIGN KEY (paciente_id) REFERENCES paciente (idpaciente)
);

-- Crear la tabla medico
CREATE TABLE medico (
    idmedico int NOT NULL AUTO_INCREMENT,
    user_id int NOT NULL,
    nombre varchar(45) NOT NULL,
    apellido varchar(45) NOT NULL,
    especialidad varchar(45) NOT NULL,
    numero_licencia varchar(45) NOT NULL,
    telefono varchar(45) DEFAULT NULL,
    direccion_consulta varchar(45) DEFAULT NULL,
    PRIMARY KEY (idmedico),
    UNIQUE KEY uq_medico_usuario (user_id),
    UNIQUE KEY uq_medico_licencia (numero_licencia),
    CONSTRAINT fk_medicoii FOREIGN KEY (user_id) REFERENCES usuario (idusuario)
);

-- Crear la tabla notificacion
CREATE TABLE notificacion (
    idnotificacion int NOT NULL AUTO_INCREMENT,
    medico_id int DEFAULT NULL,
    paciente_id int DEFAULT NULL,
    motivo varchar(255) NOT NULL,
    mensaje varchar(255) NOT NULL,
    creado_en timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    programado_para timestamp NULL DEFAULT NULL,
    leido tinyint DEFAULT '0',
    PRIMARY KEY (idnotificacion),
    KEY fk_notificacion_medico (medico_id),
    KEY fk_notificacion_paciente (paciente_id),
    CONSTRAINT fk_medico_idi FOREIGN KEY (medico_id) REFERENCES medico (idmedico),
    CONSTRAINT fk_pacientedi FOREIGN KEY (paciente_id) REFERENCES paciente (idpaciente)
);

-- Crear la tabla paciente
CREATE TABLE paciente (
    idpaciente int NOT NULL AUTO_INCREMENT,
    nombre varchar(45) NOT NULL,
    apellido varchar(45) NOT NULL,
    dni varchar(45) NOT NULL,
    fecha_nacimiento date NOT NULL,
    genero varchar(45) DEFAULT NULL,
    telefono varchar(45) DEFAULT NULL,
    direccion varchar(45) DEFAULT NULL,
    PRIMARY KEY (idpaciente)
);

-- Crear la tabla usuario
CREATE TABLE usuario (
    idusuario int NOT NULL AUTO_INCREMENT,
    nom_user varchar(45) NOT NULL,
    contra varchar(45) NOT NULL,
    correo varchar(45) NOT NULL,
    rol varchar(45) NOT NULL,
    PRIMARY KEY (idusuario),
    UNIQUE KEY uq_usuario_nombre (nom_user),
    UNIQUE KEY uq_usuario_correo (correo)
);
