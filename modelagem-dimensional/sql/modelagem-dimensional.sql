CREATE TABLE `DimProfessor`(
    `idProfessor` INT NOT NULL,
    `NomeProfessor` VARCHAR(100) NULL,
    PRIMARY KEY(`idProfessor`)
);
CREATE TABLE `DimDepartamento`(
    `idDepartamento` INT NOT NULL,
    `NomeDepartamento` VARCHAR(45) NULL,
    `Campus` VARCHAR(45) NULL,
    `NomeProfessorCoordenador` VARCHAR(100) NULL,
    PRIMARY KEY(`idDepartamento`)
);
CREATE TABLE `DimCurso`(
    `idCurso` INT NOT NULL,
    `NomeCurso` VARCHAR(100) NULL,
    `NomeDepartamentoResponsavel` VARCHAR(45) NULL,
    PRIMARY KEY(`idCurso`)
);
CREATE TABLE `DimDisciplina`(
    `idDisciplina` INT NOT NULL,
    `NomeDisciplina` VARCHAR(100) NULL,
    PRIMARY KEY(`idDisciplina`)
);
CREATE TABLE `DimData`(
    `SK_Data` INT NOT NULL,
    `Data` DATE NULL,
    `Ano` INT NULL,
    `Semestre` INT NULL,
    `Mes` INT NULL,
    `NomeMes` VARCHAR(20) NULL,
    `Dia` INT NULL,
    `DiaDaSemana` INT NULL,
    `NomeDiaDaSemana` VARCHAR(20) NULL,
    PRIMARY KEY(`SK_Data`)
);
CREATE TABLE `FatoOfertaDisciplina`(
    `idProfessor` INT NULL,
    `idDepartamento` INT NULL,
    `idCurso` INT NULL,
    `idDisciplina` INT NULL,
    `SK_Data` INT NULL,
    `Quantidade` INT NULL
);
ALTER TABLE
    `FatoOfertaDisciplina` ADD CONSTRAINT `fatoofertadisciplina_sk_data_foreign` FOREIGN KEY(`SK_Data`) REFERENCES `DimData`(`SK_Data`);
ALTER TABLE
    `FatoOfertaDisciplina` ADD CONSTRAINT `fatoofertadisciplina_iddepartamento_foreign` FOREIGN KEY(`idDepartamento`) REFERENCES `DimDepartamento`(`idDepartamento`);
ALTER TABLE
    `FatoOfertaDisciplina` ADD CONSTRAINT `fatoofertadisciplina_idcurso_foreign` FOREIGN KEY(`idCurso`) REFERENCES `DimCurso`(`idCurso`);
ALTER TABLE
    `FatoOfertaDisciplina` ADD CONSTRAINT `fatoofertadisciplina_iddisciplina_foreign` FOREIGN KEY(`idDisciplina`) REFERENCES `DimDisciplina`(`idDisciplina`);
ALTER TABLE
    `FatoOfertaDisciplina` ADD CONSTRAINT `fatoofertadisciplina_idprofessor_foreign` FOREIGN KEY(`idProfessor`) REFERENCES `DimProfessor`(`idProfessor`);