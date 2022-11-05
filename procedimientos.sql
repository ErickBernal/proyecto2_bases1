#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- CREAR_CARPETA
DELIMITER $$
    DROP PROCEDURE IF EXISTS CrearCarrera $$ 
    CREATE PROCEDURE CrearCarrera(
        cadena VARCHAR(100)
    )
    BEGIN
    DECLARE id int;
    DECLARE duplicado BOOLEAN;
        -- buscando el nuevo, id para asignar
		select ((select count(carrera.id_carrera) from carrera) + 1) into id;
        -- comprobando que solo acepte letras
        IF (ValidarLetras(cadena)) THEN
            -- comprobando si ya existe el nombre
			select if (exists(select id_carrera from carrera where nombre = cadena),true,false)
            into duplicado;
        
			if (not duplicado) then
				-- si el nombre no existe, guardamos
				insert carrera (id_carrera,nombre) 
				VALUES (id,cadena);
			else
				SELECT 'Nombre_duplicado';
            end if;
		else
			SELECT 'Nombre_invalido';
        END IF;
    END $$
DELIMITER ;



select * from carrera;
select count(id_carrera)from carrera;
call CrearCarrera('carrerass@');

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--CREAR_ESTUDIANTE
INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,id_carrera)
VALUES (12345,'Estiben','Obrian','2001-01-08','estiben_obrian@yahoo.com',12345467,'zona 1 guatemala',1);
-- procedimiento
DELIMITER $$
    DROP PROCEDURE IF EXISTS RegistrarEstudiante $$ 
    CREATE PROCEDURE RegistrarEstudiante(
        carnet_aux      bigint,
        nombre_aux      VARCHAR(100),
        apellido_aux    VARCHAR(100),
        fecha_aux       date,
        correo_aux      varchar(100),
        telefono_aux    int,
        direccion_aux   varchar(100),
        dpi_aux         bigint,
        id_carrera_aux  int
    )
    BEGIN
        if (existeEstudiante(carnet_aux)) then
            SELECT '(Este carnet ya existe)';
        else 
            -- validando nombres
            if (ValidarLetras(nombre_aux) ) then
                if ( ValidarLetras(apellido_aux)) then
                    if (ValidarEntero(id_carrera_aux))then
                        INSERT INTO estudiante  (carnet,nombre,apellido,fecha,correo,telefono,direccion,dpi,id_carrera)
                        VALUES (carnet_aux,nombre_aux,apellido_aux,fecha_aux,correo_aux,telefono_aux,direccion_aux,dpi_aux,id_carrera_aux);
                    else 
                        select '(id_carrera invalido)';
                    end if;
               else
                    select '(apellido invalido)';
                end if;
            else
                select '(nombre invalido)';
            end if;
        end if;
    END $$
DELIMITER ;

select * from estudiante;
CALL RegistrarEstudiante(202004765, 'Javier!', 'Gutierrez?', '2001-03-14',
'javier@gmail.com', 42543549, '29 avenida', 3024021520101, 1);


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- registrar docente


DELIMITER $$
    DROP PROCEDURE IF EXISTS RegistrarDocente $$ 
    CREATE PROCEDURE RegistrarDocente(
        nombre_ 	VARCHAR(100),
        apellido_ 	VARCHAR(100),
        fecha_nac_	date,
        correo_		VARCHAR(100),
        telefono_	int,
        direccion_	VARCHAR(100),
        dpi_		bigint,
        id_docente_SIIF_ int
    )
    BEGIN
        if (existeDocente(id_docente_SIIF_)) then
            SELECT '(El docente, ya existe)';
        else 
            -- validando nombres
            if (ValidarLetras(nombre_) ) then
                if ( ValidarLetras(apellido_)) then
                    if (ValidarEntero(id_docente_SIIF_))then
                        INSERT INTO docente(id_docente_SIIF,nombre, apellido,fecha_nac,correo,telefono,direccion,dpi)
                        VALUES (id_docente_SIIF_,nombre_,apellido_,fecha_nac_,correo_,telefono_,direccion_,dpi_);
                    else 
                        select '(id_docente_SIIF invalido)';
                    end if;
               else
                    select '(apellido invalido)';
                end if;
            else
                select '(nombre invalido)';
            end if;
        end if;
    END $$
DELIMITER ;

select * from DOCENTE;

CALL RegistrarDocente('Lui', 'Espino', '2000-12-1', 'Luis@gmail.com',
7812000, '12 avenida', 861220000101, 150);


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- crear curso
DELIMITER $$
    DROP PROCEDURE IF EXISTS CrearCurso $$ 
    CREATE PROCEDURE CrearCurso(
        id_curso_ 	            int,
        nombre_ 		        VARCHAR(100),
        prerrequisito_credito_ 	INT,
        credito_que_otorga_		int,
        carrera_		        VARCHAR(100),
        obligatorio_	        bool
    )
    BEGIN
        if (existeCurso(id_curso_)) then
            SELECT '(El Curso, ya existe)';
        else 
            -- validando nombres
            if (ValidarEntero(prerrequisito_credito_))then
                if (ValidarEntero(credito_que_otorga_))then
                    INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
                    VALUES(id_curso_,nombre_,prerrequisito_credito_,credito_que_otorga_,carrera_,obligatorio_);
                else 
                    select '(credito_que_otorga Invalido)';
                end if;
            else 
                select '(prerrequisito_credito Invalido)';
            end if;

        end if;
    END $$
DELIMITER ;

select * from curso;
CALL CrearCurso(1112, 'Mate 1', 0, 3, 0, 1); -- ok
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- hibilitar curso
DELIMITER $$
    DROP PROCEDURE IF EXISTS HabilitarCurso $$ 
    CREATE PROCEDURE HabilitarCurso(
        id_habilitar_curso_ 	int,
        id_curso 			int,
        ciclo 				VARCHAR(100),
        id_docente_SIIF		int,
        cupo_max			int,
        seccion				char
    )
    BEGIN
        if (existeHabilitar_curso(id_habilitar_curso_)) then
            SELECT '(El Habilitar Curso, ya existe)';
        else 
            -- validando nombres
            if (ValidarEntero(prerrequisito_credito_))then
                if (ValidarEntero(credito_que_otorga_))then
                    INSERT INTO curso (id_curso,nombre ,prerrequisito_credito , credito_que_otorga ,carrera ,obligatorio  )
                    VALUES(id_curso_,nombre_,prerrequisito_credito_,credito_que_otorga_,carrera_,obligatorio_);
                else 
                    select '(credito_que_otorga Invalido)';
                end if;
            else 
                select '(prerrequisito_credito Invalido)';
            end if;

        end if;
    END $$
DELIMITER ;



CALL HabilitarCurso(1112, 'VD', 152, 2, 'A'); -- Habilita Mate 1 con Samayoa con cupo 2 ok
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

23:59:38	call CrearCarrera('carrera')	
Error Code: 1093. You can't specify target table 'carrera' for update in FROM clause	0.0011 sec

