show databases;

use pro2_bases2;

/********************** Trigger bitácora/historial **********************/
delete from carrera
where carrera.id_carrera = 90;

select * from curso;

INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
VALUES(70001,'F_deportes_2',10002,1,5,1);

delete from curso 
where curso.id_curso = 70001;



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#curso
DELIMITER $$
DROP TRIGGER IF EXISTS log_curso_1$$
CREATE TRIGGER log_curso_1
AFTER insert 
ON curso FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','curso');
	END$$

DELIMITER $$
DROP TRIGGER IF EXISTS log_curso_2$$
CREATE TRIGGER log_curso_2
AFTER update 
ON curso FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','curso');
	END$$

DELIMITER $$
DROP TRIGGER IF EXISTS log_curso_3$$
CREATE TRIGGER log_curso_3
AFTER delete 
ON curso FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','curso');
	END$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#carrera
DELIMITER $$
DROP TRIGGER IF EXISTS log_carrera_1$$
CREATE TRIGGER log_carrera_1
AFTER insert 
ON carrera FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','carrera');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_carrera_2$$
CREATE TRIGGER log_carrera_2
AFTER update 
ON carrera FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','carrera');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_carrera_3$$
CREATE TRIGGER log_carrera_3
AFTER delete 
ON carrera FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','carrera');
	END
$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#estudiante
DELIMITER $$
DROP TRIGGER IF EXISTS log_estudiante_1$$
CREATE TRIGGER log_estudiante_1
AFTER insert 
ON estudiante FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','estudiante');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_estudiante_2$$
CREATE TRIGGER log_estudiante_2
AFTER update 
ON estudiante FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','estudiante');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_estudiante_3$$
CREATE TRIGGER log_estudiante_3
AFTER delete 
ON estudiante FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','estudiante');
	END
$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#docente

DELIMITER $$
DROP TRIGGER IF EXISTS log_docente_1$$
CREATE TRIGGER log_docente_1
AFTER insert 
ON docente FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','docente');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_docente_2$$
CREATE TRIGGER log_docente_2
AFTER update 
ON docente FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','docente');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_docente_3$$
CREATE TRIGGER log_docente_3
AFTER delete 
ON docente FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','docente');
	END
$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#asignacion
DELIMITER $$
DROP TRIGGER IF EXISTS log_asignacion_1$$
CREATE TRIGGER log_asignacion_1
AFTER insert 
ON asignacion FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','asignacion');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_asignacion_2$$
CREATE TRIGGER log_asignacion_2
AFTER update 
ON asignacion FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','asignacion');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_asignacion_3$$
CREATE TRIGGER log_asignacion_3
AFTER delete 
ON asignacion FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','asignacion');
	END
$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#acta
DELIMITER $$
DROP TRIGGER IF EXISTS log_acta_1$$
CREATE TRIGGER log_acta_1
AFTER insert 
ON acta FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','acta');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_acta_2$$
CREATE TRIGGER log_acta_2
AFTER update 
ON acta FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','acta');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_acta_3$$
CREATE TRIGGER log_acta_3
AFTER delete 
ON acta FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','acta');
	END
$$
DELIMITER ;


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#habilitar_curso
DELIMITER $$
DROP TRIGGER IF EXISTS log_habilitar_curso_1$$
CREATE TRIGGER log_habilitar_curso_1
AFTER insert 
ON habilitar_curso FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','habilitar_curso');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_habilitar_curso_2$$
CREATE TRIGGER log_habilitar_curso_2
AFTER update 
ON habilitar_curso FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','habilitar_curso');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_habilitar_curso_3$$
CREATE TRIGGER log_habilitar_curso_3
AFTER delete 
ON habilitar_curso FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','habilitar_curso');
	END
$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#Horario
DELIMITER $$
DROP TRIGGER IF EXISTS log_horario_1$$
CREATE TRIGGER log_horario_1
AFTER insert 
ON horario FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','horario');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_horario_2$$
CREATE TRIGGER log_horario_2
AFTER update 
ON horario FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','horario');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_horario_3$$
CREATE TRIGGER log_horario_3
AFTER delete 
ON horario FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','horario');
	END
$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#notas
DELIMITER $$
DROP TRIGGER IF EXISTS log_nota_1$$
CREATE TRIGGER log_nota_1
AFTER insert 
ON nota FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Insert','nota');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_nota_2$$
CREATE TRIGGER log_nota_2
AFTER update 
ON nota FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Update','nota');
	END
$$
DELIMITER ;


DELIMITER $$
DROP TRIGGER IF EXISTS log_nota_3$$
CREATE TRIGGER log_nota_3
AFTER delete 
ON nota FOR EACH ROW
	BEGIN
	   INSERT INTO historial(fecha,transaccion,tabla)
	   VALUES (now(),'Delete','nota');
	END
$$
DELIMITER ;

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@












