CREATE DATABASE infobicis
USE infobicis
SHOW TABLES 

DROP TABLE IF EXISTS `Perfiles`;
CREATE TABLE `Perfiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `perfil` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `Usuarios`;
CREATE TABLE `Usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `telefono` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `estatus` INT(11) NOT NULL DEFAULT '1',
  `fechaRegistro` DATE DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `UsuarioPerfil`;
CREATE TABLE `UsuarioPerfil` (
  `idUsuario` INT(11) NOT NULL,
  `idPerfil` INT(11) NOT NULL,
  UNIQUE KEY `Usuario_Perfil_UNIQUE` (`idUsuario`, `idPerfil`),
  KEY `fk_Usuarios1_idx` (`idUsuario`),
  KEY `fk_Perfiles1_idx` (`idPerfil`),
  CONSTRAINT `fk_Usuarios1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`id`),
  CONSTRAINT `fk_Perfiles1` FOREIGN KEY (`idPerfil`) REFERENCES `Perfiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ReporteBicicleta`;
CREATE TABLE `ReporteBicicleta` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
    `num_serie` VARCHAR(30) NOT NULL,
    `modelo` VARCHAR(50) NOT NULL,
    `descripcion` TEXT NOT NULL,
    `detalles` TEXT,
    `imagen` VARCHAR(250) NOT NULL,
    `fecha` DATE NOT NULL,
    `idUsuario` INT(11) NOT NULL, 
    PRIMARY KEY (`id`),
    KEY `fk_reportebicicleta_usuario1_idx` (`idUsuario`),
    CONSTRAINT `fk_reportebicicleta_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;