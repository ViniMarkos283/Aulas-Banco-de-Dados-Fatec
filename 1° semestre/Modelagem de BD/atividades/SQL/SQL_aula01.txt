-- DDL  CREATE DROP ALTER 
/*
CREATE DATABASE Aula01
DROP DATABASE Aula01
 
CRUD - 4 operações básicas = DML 
Create - insert
Read  - Select
Update - update
Delete - delete 
*/
 
CREATE DATABASE Aula01
 
USE Aula01
 
CREATE TABLE UF (
cd_UF    INT		  NOT null,
nm_UF    VARCHAR (35) NOT NULL,
abr_UF   CHAR(2)      NOT NULL,
CONSTRAINT pk_UF PRIMARY KEY (cd_UF)
)
 
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (10,'Acre','AC')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (11,'Alagoas','AL')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (12,'Amazonas','AM')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (13,'Amapá','AP')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (14,'Bahia','BA')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (15,'Ceará','CE')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (16,'Distrito Federal','DF')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (17,'Espirito Santo','ES')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (18,'Goiás','GO')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (19,'Maranhão','MA')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (20,'Mato Grosso','MT')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (21,'Mato Grosso do Sul','MS')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (22,'Minas Gerais','MG')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (23,'Pará','PA')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (24,'Paraíba','PB')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (25,'Paraná','PR')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (26,'Pernambuco','PE')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (27,'Piauí','PI')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (28,'Rio de Janeiro','RJ')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (29,'Rio Grando do Norte','RN')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (30,'Rio Grando do Sul','RS')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (31,'Rondonia','RO')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (32,'Roraima','RR')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (33,'Santa Catarina','SC')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (34,'São Paulo','SP')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (35,'Sergipe','SE')
INSERT INTO UF (cd_UF, nm_UF, abr_UF) VALUES (36,'Tocantins','TO')
 
 
USE Aula01
 
CREATE TABLE Municipio (
cd_Municipio	INT		  NOT NULL,
nm_Municipio	VARCHAR(40)  NOT NULL,
vlr_AreaM2		DECIMAL(10,2),        -- 999999,9999
cd_UFMunicipio  INT NOT NULL,
qtde_habitantes BIGINT,
CONSTRAINT pk_Municipio			PRIMARY KEY (cd_Municipio),
CONSTRAINT fk_Municipio_UF		FOREIGN KEY (cd_UFMunicipio) REFERENCES UF (cd_uf)
)

 
INSERT INTO Municipio VALUES (36,'João Pessoa',211.50,24,833932);
INSERT INTO Municipio VALUES (37,'Campina Grande', 591.70,24,419379);
INSERT INTO Municipio VALUES (38,'Santa Rita',706.40,24,149910);
INSERT INTO Municipio VALUES (39,'Patos',472892.00,24,32277);
INSERT INTO Municipio VALUES (40,'Bayeux',27705.00,24,103165);

SELECT * FROM Municipio
 
 
/*
ALTER TABLE Municipio add  qt_habitantes bigint
ALTER TABLE Municipio alter column nm_municipio varchar(45) 
ALTER TABLE Municipio DROP COLUMN qt_habitantes
 
EXEMPLO:
INSERT INTO Municipio VALUES (34001,'Santo André',40000,34,438787457)
*/
 
CREATE TABLE Bairro (
cd_bairro			INT NOT NULL IDENTITY(340010,1),
nm_bairro			VARCHAR(30) NOT NULL,
cd_MunicipioBairro	INT NOT NULL,
CONSTRAINT pk_Bairro PRIMARY KEY (cd_bairro),
CONSTRAINT fk_BairroMunicipio FOREIGN KEY (cd_MunicipioBairro) REFERENCES Municipio (cd_Municipio)
)
 
/*João pessoa*/
INSERT INTO Bairro VALUES ( 'Agua Fria',36)
INSERT INTO Bairro VALUES ( 'Aeroclube',36)
INSERT INTO Bairro VALUES ( 'Cabo Branco',36)
INSERT INTO Bairro VALUES ( 'Castelo Branco',36)
INSERT INTO Bairro VALUES ( 'Jaguaribe',36)
INSERT INTO Bairro VALUES ( 'Jardim Esther',36)
INSERT INTO Bairro VALUES ( 'Paratibe',36)
INSERT INTO Bairro VALUES ( 'Portal do Sol',36)
INSERT INTO Bairro VALUES ( 'Trincheiras',36)
INSERT INTO Bairro VALUES ( 'Tambaú',36)
 
/*Campina Grande*/
INSERT INTO Bairro VALUES ( 'Araxa',37)
INSERT INTO Bairro VALUES ( 'Cuités',37)
INSERT INTO Bairro VALUES ( 'Jeremias',37)
INSERT INTO Bairro VALUES ( 'Castelo Branco',37)
INSERT INTO Bairro VALUES ( 'Mirante',37)
INSERT INTO Bairro VALUES ( 'Nova Brasilia',37)
INSERT INTO Bairro VALUES ( 'Cruzeiro',37)
INSERT INTO Bairro VALUES ( 'Itararé',37)
INSERT INTO Bairro VALUES ( 'Bela Vista',37)
INSERT INTO Bairro VALUES ( 'Pedregal',37)
 
/*Santa Rita*/
INSERT INTO Bairro VALUES ( 'Aguiarlandia',38)
INSERT INTO Bairro VALUES ( 'Teixeirao',38)
INSERT INTO Bairro VALUES ( 'Heitel Santiago',38)
INSERT INTO Bairro VALUES ( 'Tibiri',38)
INSERT INTO Bairro VALUES ( 'Acude',38)
INSERT INTO Bairro VALUES ( 'Alto das Populares',38)
INSERT INTO Bairro VALUES ( 'Multirao',38)
INSERT INTO Bairro VALUES ( 'Varzea nova',38)
INSERT INTO Bairro VALUES ( 'Bairro do onze',38)
INSERT INTO Bairro VALUES ( 'Paulo VI',38)
 
/*Patos*/
INSERT INTO Bairro VALUES ( 'Novo Horizonte',39)
INSERT INTO Bairro VALUES ( 'Santo Antonio',39)
INSERT INTO Bairro VALUES ( 'Sao sebastiao',39)
INSERT INTO Bairro VALUES ( 'Sete Casas',39)
INSERT INTO Bairro VALUES ( 'Nova Conquista',39)
INSERT INTO Bairro VALUES ( 'Bivar Olinto',39)
INSERT INTO Bairro VALUES ( 'Monte Castelo',39)
INSERT INTO Bairro VALUES ( 'Jardim Magnolia',39)
INSERT INTO Bairro VALUES ( 'Noe Trajano',39)
INSERT INTO Bairro VALUES ( 'Liberdade',39)
 
/*Bayeux*/
INSERT INTO Bairro VALUES ( 'Alto da Boa Vista',40)
INSERT INTO Bairro VALUES ( 'Imaculada',40)
INSERT INTO Bairro VALUES ( 'Jardim Sao Severino',40)
INSERT INTO Bairro VALUES ( 'Jardim Sao Vicente',40)
INSERT INTO Bairro VALUES ( 'Mario Andreazza',40)
INSERT INTO Bairro VALUES ( 'Rio do Meio',40)
INSERT INTO Bairro VALUES ( 'Sao Bento',40)
INSERT INTO Bairro VALUES ( 'Jardim Aeroporto',40)
INSERT INTO Bairro VALUES ( 'Centro',40)
INSERT INTO Bairro VALUES ( 'Brasilia',40)
 
 
SELECT * FROM Bairro