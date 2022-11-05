#**************************************************************************************************************************************
use proyecto2;
-- insertar datos en las tablas
INSERT INTO carrera (id_carrera,nombre) 
VALUES (6,'Ing en ciencias y sistemas');

INSERT INTO carrera (id_carrera,nombre) 
VALUES (1,'Medicina');

INSERT INTO carrera (id_carrera,nombre) 
VALUES (2,'odontologia');

INSERT INTO carrera (id_carrera,nombre) 
VALUES (3,'Administracion de empresas');

INSERT INTO carrera (id_carrera,nombre) 
VALUES (4,'psicologia');

INSERT INTO carrera (id_carrera,nombre) 
VALUES (5,'artes');

SELECT * FROM carrera c ;
#**************************************************************************************************************************************
INSERT INTO docente(id_docente_SIIF,nombre, apellido,fecha_nac,correo,telefono,direccion,dpi)
VALUES (1,'Juan','Casas','2010-02-03','juancasas@gmail.com',23457898,'zona 6 Guatemala',11111111);

INSERT INTO docente(id_docente_SIIF,nombre, apellido,fecha_nac,correo,telefono,direccion,dpi)
VALUES (2,'Carlos','Okres','2001-04-09','carlos_okres@gmail.com',34561234,'zona 7 Guatemala',22222222);

INSERT INTO docente(id_docente_SIIF,nombre, apellido,fecha_nac,correo,telefono,direccion,dpi)
VALUES (3,'Juan','Slobo','2002-01-21','juan_slobo@gmail.com',45673451,'zona 8 Guatemala',33333333);

INSERT INTO docente(id_docente_SIIF,nombre, apellido,fecha_nac,correo,telefono,direccion,dpi)
VALUES (4,'Mario','Juarez','2003-07-13','mario_juarez@gmail.com',54327896,'zona 9 Guatemala',44444444);

INSERT INTO docente(id_docente_SIIF,nombre, apellido,fecha_nac,correo,telefono,direccion,dpi)
VALUES (5,'Mariana','Castro','2004-03-08','mariana_castro@gmail.com',67897685,'zona 10 Guatemala',55555555);

SELECT * FROM docente d ;

#**************************************************************************************************************************************
INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (12345,'Estiben','Obrian','2001-01-08','estiben_obrian@yahoo.com',12345467,'zona 1 guatemala',1);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (21345,'Carlos','Joi','2002-02-02','carlos_joi@yahoo.com',22345467,'zona 2 guatemala',1);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (31345,'Leo','Dicaprio','2003-03-07','leo_dicaprio@yahoo.com',32345467,'zona 3 guatemala',4);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (41345,'James','Dimaz','2004-03-07','james_dimaz@yahoo.com',42345467,'zona 4 guatemala',2);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (51345,'Ricardo','Aka','2005-09-17','ricardo_aka@yahoo.com',52345467,'zona 5 guatemala',2);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (61345,'Alejandro','Merida','2006-03-11','alejandra_merida@yahoo.com',62345467,'zona 6 guatemala',2);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (71345,'Fernando','Rivera','2007-05-02','fernando_rivera@yahoo.com',72345467,'zona 7 guatemala',9);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (81345,'Javier','Muralles','2008-03-05','javier_muralles@yahoo.com',82345467,'zona 8 guatemala',2);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (91345,'Jesser','patos','2009-01-07','jesser_patos@yahoo.com',92345467,'zona 9 guatemala',9);

INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (10345,'barri','wai','2010-04-01','barri_wai@yahoo.com',10345467,'zona 10 guatemala',9);

SELECT * FROM estudiante e ;


#**************************************************************************************************************************************

SELECT * FROM curso c ;
#----------------------------   insertar 5 cursos en area comun   ----------------------------
INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(10000,'humanistica',0,4,0,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(10001,'Mate_1',0,7,0,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(10002,'deportes_1',0,1,0,0);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(10003,'tecnica_complementaria',0,3,0,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(10004,'quimica_basica',0,3,0,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(10005,'idioma_tecnico',0,2,0,0);


# ----------------------------  insertar 5 cursos por cada carrera con prerequisito ----------------------------
#	INSERT INTO carrera (id_carrera,nombre) 
#	VALUES (9,'Ing en ciencias y sistemas');
INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(20001,'A_Mate_2',10001,7,9,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(20002,'A_humanistica_2',10000,4,9,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(20003,'A_fisica_basica',10001,5,9,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(20004,'A_idioma_tecnico_2',10005,2,9,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(20005,'A_deportes_2',10002,1,9,1);




#	INSERT INTO carrera (id_carrera,nombre) 
#	VALUES (1,'Medicina');
INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(30001,'B_Mate_2',10001,7,1,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(30002,'B_humanistica_2',10000,4,1,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(30003,'B_fisica_basica',10001,5,1,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(30004,'B_idioma_tecnico_2',10005,2,1,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(30005,'B_deportes_2',10002,1,1,1);

SELECT * FROM curso c ;




#	INSERT INTO carrera (id_carrera,nombre) 
#	VALUES (2,'odontologia');
delete from curso 
where id_curso = 40002;


INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(40001,'C_Mate_2',10001,7,2,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(40002,'C_humanistica_2',10000,4,2,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(40003,'C_fisica_basica',10001,5,2,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(40004,'C_idioma_tecnico_2',10005,2,2,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(40005,'C_deportes_2',10002,1,2,1);

SELECT * FROM curso ;



#	INSERT INTO carrera (id_carrera,nombre) 
#	VALUES (3,'Administracion de empresas');

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(50001,'D_Mate_2',10001,7,3,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(50002,'D_humanistica_2',10000,4,3,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(50003,'D_fisica_basica',10001,5,3,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(50004,'D_idioma_tecnico_2',10005,2,3,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(50005,'D_deportes_2',10002,1,3,1);

SELECT * FROM curso ;


# INSERT INTO carrera (id_carrera,nombre) 
# VALUES (4,'psicologia');

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(60001,'E_Mate_2',10001,7,4,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(60002,'E_humanistica_2',10000,4,4,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(60003,'E_fisica_basica',10001,5,4,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(60004,'E_idioma_tecnico_2',10005,2,4,1);

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(60005,'E_deportes_2',10002,1,4,1);

SELECT * FROM curso ;



INSERT INTO carrera (id_carrera,nombre) 
VALUES (5,'artes');

SELECT * FROM carrera c ;
#**************************************************************************************************************************************







#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************
#**************************************************************************************************************************************




























