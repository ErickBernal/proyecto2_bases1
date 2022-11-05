#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#
DELIMITER $$
CREATE FUNCTION calcularBeneficio(coste FLOAT, precio FLOAT) RETURNS DECIMAL(9,2)
BEGIN
    DECLARE beneficio DECIMAL(9,2);
    SET beneficio = precio - coste;
    RETURN beneficio;
END$$
DELIMITER ;


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- comprobar que solo se acepte letras en una cadena
DELIMITER $$
    DROP FUNCTION IF EXISTS ValidarLetras $$ CREATE FUNCTION ValidarLetras(
        cadena VARCHAR(100)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN
        DECLARE valido BOOLEAN;
        /* VALIDAR CON REGEXP */
        IF (SELECT REGEXP_INSTR(cadena, '[^a-zA-Z ]') = 0) THEN
            SELECT TRUE INTO valido;
        ELSE
            SELECT FALSE INTO valido;
        END IF;
        -- return the boolean  
        RETURN (valido);
END $$
DELIMITER ;

-- probando insercion
    ValidarLetras('cadena');

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- comprobando correos
DELIMITER $$
    DROP FUNCTION IF EXISTS ValidarCorreo $$ CREATE FUNCTION ValidarCorreo(
        cadena VARCHAR(100)
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN
        DECLARE valido BOOLEAN;
        /* VALIDAR CON REGEXP */
        IF (SELECT REGEXP_INSTR(cadena, '[0-9a-zA-Z_]+@[0-9a-zA-Z_]+\.com') = 1) THEN
            SELECT TRUE INTO valido;
        ELSE
            SELECT FALSE INTO valido;
        END IF;
        -- return the boolean  
        RETURN (valido);
END $$
DELIMITER ;

-- probando insercion
    ValidarCorreo('cadena');


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- existe estudiante
DELIMITER $$
    DROP FUNCTION IF EXISTS existeEstudiante $$ 
    CREATE FUNCTION existeEstudiante(
        id bigint
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN

    DECLARE existe BOOLEAN;
    SELECT EXISTS (SELECT 1 FROM estudiante p WHERE p.carnet = id) INTO existe;
    -- return the boolean  
    RETURN (existe);
    END $$
DELIMITER ;
-- comprobacion
select existeEstudiante(10345);

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- comprobando correos
DELIMITER $$
    DROP FUNCTION IF EXISTS ValidarEntero $$ 
    CREATE FUNCTION ValidarEntero(
        cadena int
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN
        DECLARE valido BOOLEAN;
        /* VALIDAR CON REGEXP */
        IF (SELECT REGEXP_INSTR(cadena, '[0-9]+') = 1) THEN
            SELECT TRUE INTO valido;
        ELSE
            SELECT FALSE INTO valido;
        END IF;
        -- return the boolean  
        RETURN (valido);
    END $$
DELIMITER ;

-- probando insercion
  select  ValidarEntero(123); -- 1 = ok
  select  ValidarEntero(-123); -- 0 = Error

#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- existe estudiante
DELIMITER $$
    DROP FUNCTION IF EXISTS existeDocente $$ 
    CREATE FUNCTION existeDocente(
        id bigint
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN

    DECLARE existe BOOLEAN;
    SELECT EXISTS (SELECT 1 FROM docente p WHERE p.id_docente_SIIF = id) INTO existe;
    -- return the boolean  
    RETURN (existe);
    END $$
DELIMITER ;
-- comprobacion
select existeDocente(10345);
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- existe curso
DELIMITER $$
    DROP FUNCTION IF EXISTS existeCurso $$ 
    CREATE FUNCTION existeCurso(
        id bigint
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN

    DECLARE existe BOOLEAN;
    SELECT EXISTS (SELECT 1 FROM curso p WHERE p.id_curso = id) INTO existe;
    -- return the boolean  
    RETURN (existe);
    END $$
DELIMITER ;
-- comprobacion
select existeCurso(10345);
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- existe curso
DELIMITER $$
    DROP FUNCTION IF EXISTS existeHabilitar_curso $$ 
    CREATE FUNCTION existeHabilitar_curso(
        id bigint
    )
    RETURNS BOOLEAN
    DETERMINISTIC
    BEGIN

    DECLARE existe BOOLEAN;
    SELECT EXISTS (SELECT 1 FROM habilitar_curso p WHERE p.id_habilitar_curso = id) INTO existe;
    -- return the boolean  
    RETURN (existe);
    END $$
DELIMITER ;
-- comprobacion
select existeHabilitar_curso(10345);
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
