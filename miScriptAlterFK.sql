ALTER TABLE `mibasededatos`.`grupos` 
CHANGE COLUMN `id_grupo` `id_grupo` INT(11) NOT NULL AUTO_INCREMENT ;
ALTER TABLE `mibasededatos`.`actividades` 
CHANGE COLUMN `id_actividad` `id_actividad` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `mibasededatos`.`usuarios_grupos` 
ADD INDEX `nombre2_idx` (`id_grupo` ASC);
ALTER TABLE `mibasededatos`.`usuarios_grupos` 
ADD CONSTRAINT `usuario_fk`
  FOREIGN KEY (`id_usuario`)
  REFERENCES `mibasededatos`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `grupo_fk`
  FOREIGN KEY (`id_grupo`)
  REFERENCES `mibasededatos`.`grupos` (`id_grupo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mibasededatos`.`actividades_grupos` 
ADD INDEX `gruposFK_idx` (`id_grupo` ASC);
ALTER TABLE `mibasededatos`.`actividades_grupos` 
ADD CONSTRAINT `actividadFK`
  FOREIGN KEY (`id_actividad`)
  REFERENCES `mibasededatos`.`actividades` (`id_actividad`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `gruposFK`
  FOREIGN KEY (`id_grupo`)
  REFERENCES `mibasededatos`.`grupos` (`id_grupo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mibasededatos`.`evaluaciones` 
ADD INDEX `actividad1FK_idx` (`id_actividad` ASC),
ADD INDEX `usuario2FK_idx` (`id_usuario_evaluado` ASC),
ADD INDEX `grupo1FK_idx` (`idGrupo` ASC);
ALTER TABLE `mibasededatos`.`evaluaciones` 
ADD CONSTRAINT `usuario1FK`
  FOREIGN KEY (`id_usuario_evaluador`)
  REFERENCES `mibasededatos`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `actividad1FK`
  FOREIGN KEY (`id_actividad`)
  REFERENCES `mibasededatos`.`actividades` (`id_actividad`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `usuario2FK`
  FOREIGN KEY (`id_usuario_evaluado`)
  REFERENCES `mibasededatos`.`user` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `grupo1FK`
  FOREIGN KEY (`idGrupo`)
  REFERENCES `mibasededatos`.`grupos` (`id_grupo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
