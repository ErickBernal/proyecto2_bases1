create database proyecto2;

use proyecto2;
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE historial (
    id_historial int not null AUTO_INCREMENT,
    fecha date,
    transaccion   VARCHAR(100),
    primary key(id_historial)
);

drop table historial ;

select * from carrera ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE carrera (
    id_carrera      int not null AUTO_INCREMENT,
    nombre   VARCHAR(100),
	primary key(id_carrera)
);

ALTER TABLE carrera 
ADD PRIMARY KEY(id_carrera);

drop table carrera ;

select * from carrera ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE estudiante (
    carnet      bigint,
    nombre   VARCHAR(100),
    apellido   VARCHAR(100),
    fecha date,
    correo varchar(100),
    telefono int,
    direccion varchar(100),
    dpi      bigint,
    id_carrera int
);

ALTER TABLE estudiante  
ADD PRIMARY KEY(carnet);

ALTER TABLE estudiante 
ADD FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera);

select * from estudiante ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE docente (
    id_docente_SIIF int,
    nombre 		VARCHAR(100),
    apellido 	VARCHAR(100),
    fecha_nac	date,
    correo		VARCHAR(100),
    telefono	int,
    direccion	VARCHAR(100),
    dpi			bigint,
    PRIMARY KEY(id_docente_SIIF)
);

select * from docente ;
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE curso (
    id_curso 	int,
    nombre 		VARCHAR(100),
    prerrequisito_credito 	INT,
    credito_que_otorga		int,
    carrera		VARCHAR(100),
    obligatorio	bool,
    PRIMARY KEY(id_curso)
);

select * from curso;
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE acta(
	id_curso int,
	ciclo 	VARCHAR(100),
	seccion	char,
	fecha_hora	date,
	FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

SELECT * FROM acta;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE asignacion(
	id_curso int,
	carnet bigint,
	ciclo 	VARCHAR(100),
	seccion	char,
	FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
	FOREIGN KEY (carnet) REFERENCES estudiante(carnet)
);

SELECT * FROM asignacion;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE habilitar_curso(
	id_habilitar_curso 	int,
	id_curso 			int,
	ciclo 				VARCHAR(100),
	id_docente_SIIF		int,
	cupo_max			int,
	seccion				char,
	primary key(id_habilitar_curso),
	FOREIGN KEY (id_curso) REFERENCES curso(id_curso),
	FOREIGN KEY (id_docente_SIIF) REFERENCES docente(id_docente_SIIF)
);

drop table habilitar_curso ;

select * from habilitar_curso;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE horario(
	id_habilitar_curso 	int,
	dia 				int,
	horario				VARCHAR(100),
	FOREIGN KEY (id_habilitar_curso) REFERENCES habilitar_curso(id_habilitar_curso)
);

select * from horario;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
CREATE TABLE nota(
	id_habilitar_curso 	int,
	ciclo				VARCHAR(100),
	seccion				char,
	nota 				int,
	carnet 				bigint,
	FOREIGN KEY (id_habilitar_curso) REFERENCES habilitar_curso(id_habilitar_curso),
	FOREIGN KEY (carnet) REFERENCES estudiante(carnet)
);

drop table nota;

select * from nota;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
