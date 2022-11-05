DROP DATABASE IF EXISTS bases1;
CREATE DATABASE bases1;
USE bases1;

CREATE TABLE player(
	username VARCHAR(25),
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    nivel INTEGER,
    PRIMARY KEY(username)
);

CREATE TABLE bitacora(
	fecha_hora DATETIME,
    descripcion VARCHAR(100),
    tabla VARCHAR(25)
);

/********************** Trigger bitácora **********************/
DELIMITER $$
    CREATE TRIGGER bitacora
    AFTER INSERT ON player
    FOR EACH ROW
    BEGIN
        INSERT INTO bitacora VALUES ()
END; $$

/********************** Validar letras **********************/
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

/********************** Existe usuario **********************/
DELIMITER $$
DROP FUNCTION IF EXISTS ExisteUsuario $$ CREATE FUNCTION ExisteUsuario(
    username VARCHAR(25)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN

DECLARE existe BOOLEAN;
SELECT EXISTS (SELECT 1 FROM player p WHERE p.username = username) INTO existe;
-- return the boolean  
RETURN (existe);
END $$

/********************** Crear jugador **********************/
DELIMITER $$
DROP PROCEDURE IF EXISTS AddPlayer $$ CREATE PROCEDURE AddPlayer(
    IN username_in VARCHAR(25),
    IN nombre_in VARCHAR(100),
    IN fecha_nacimiento_in DATE
)
add_player:BEGIN

/* YA EXISTE */
IF (ExisteUsuario(username_in)) THEN
    SELECT 'USUARIO YA EXISTENTE.' AS ERROR;
    LEAVE add_player;
END IF;

/* VALIDAR LETRAS */
IF (NOT ValidarLetras(nombre_in)) THEN
    SELECT 'EL NOMBRE SOLO DEBE CONTENER LETRAS.' AS ERROR;
    LEAVE add_player;
END IF;

/* FECHA INCONGRUENTE */
IF (SELECT TIMESTAMPDIFF(YEAR, fecha_nacimiento_in, CURDATE()) < 18) THEN
    SELECT 'DEBE SER MAYOR DE EDAD PARA PODER REGISTRARSE.' AS ERROR;
    LEAVE add_player;
END IF;

INSERT INTO player (username, nombre, fecha_nacimiento, nivel)
VALUES (username_in, nombre_in, fecha_nacimiento_in, 0);

/* MENSAJE */
SELECT CONCAT("Jugador '", username_in, "' registrado.") AS MENSAJE;
END $$


/********************** Actualizar nivel **********************/
DELIMITER $$
DROP PROCEDURE IF EXISTS UpdateLevel $$ CREATE PROCEDURE UpdateLevel(
    IN username_in VARCHAR(25),
    IN cantidad INT
)
update_level:BEGIN

-- Declaro una variable auxiliar al inicio
DECLARE nivel_aux INT;

/* NO EXISTE */
IF (NOT ExisteUsuario(username_in)) THEN
    SELECT 'USUARIO NO EXISTE.' AS ERROR;
    LEAVE update_level;
END IF;

-- Le asigno el valor original
SELECT nivel INTO nivel_aux FROM player WHERE username = username_in;
-- Le sumo la cantidad (podría ser un número negativo y estaría bajando de nivel)
SET nivel_aux = nivel_aux + cantidad;

UPDATE player SET nivel = nivel_aux WHERE username = username_in;

/* MENSAJE */
SELECT CONCAT(username_in, " ahora es nivel ", nivel_aux) AS MENSAJE;
END $$



/********************** Llamar procesos **********************/
DELIMITER ;
CALL AddPlayer('ldecast', 'Luis Danniel Castellanos Galindo', '2001-01-25');
CALL UpdateLevel('ldecast', 1);

SELECT * FROM player;
TRUNCATE player;
