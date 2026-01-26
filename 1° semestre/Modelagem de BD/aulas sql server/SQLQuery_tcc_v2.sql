
--use master drop database tcc 
--CREATE DATABASE TCC



use tcc

CREATE TABLE GENERO (
cd_genero int not null,
ds_genero varchar(20) not null,
abr_genero char(3) not null,
CONSTRAINT pk_genero PRIMARY KEY (cd_genero)
)

INSERT INTO GENERO VALUES (10,'Feminino','F')
INSERT INTO GENERO VALUES (20,'masculino','M')
INSERT INTO GENERO VALUES (30,'Não informado','NF')

CREATE TABLE NACIONALIDADE (
cd_Nacionalidade int not null,
ds_Nacionalidade varchar(25) not null,
abr_Nacionalidade char(4) not null,
CONSTRAINT pk_Nacionalidade PRIMARY KEY (cd_Nacionalidade)
)
INSERT INTO NACIONALIDADE VALUES (1,'Brasileira','BRL')
INSERT INTO NACIONALIDADE VALUES (2,'Norte Americana','USA')
INSERT INTO NACIONALIDADE VALUES (3,'Chilena','CHL')
INSERT INTO NACIONALIDADE VALUES (4,'Chinesa','CHN')
INSERT INTO NACIONALIDADE VALUES (5,'Canadense','CAN')
INSERT INTO NACIONALIDADE VALUES (6,'Argentina','ARG')


SELECT * FROM NACIONALIDADE

CREATE TABLE TITULACAO (
cd_Titulacao int not null,
ds_Titulacao varchar(25) not null,
abr_Titulacao char(4) not null,
CONSTRAINT pk_Titulacao PRIMARY KEY (cd_Titulacao)
)
INSERT INTO Titulacao VALUES (1,'Especialista','Esp.')
INSERT INTO Titulacao VALUES (2,'Mestre','Me.')
INSERT INTO Titulacao VALUES (3,'Mestra','Ma.')
INSERT INTO Titulacao VALUES (4,'Doutor','Dr.')
INSERT INTO Titulacao VALUES (5,'Doutora','Dra.')
INSERT INTO Titulacao VALUES (6,'Livre Docente','LD.')

CREATE TABLE PROFESSOR (
cd_Professor			int not null,
nm_Professor			varchar(30) not null,
dt_Nascimento			smalldatetime not null,
cd_Titulacaoprof		int not null,
cd_Nacionalidadeprof	int not null,
cd_Generoprof			int not null,
CONSTRAINT pk_Professor				PRIMARY KEY (cd_professor),
CONSTRAINT fk_ProfessorGenero		FOREIGN KEY (cd_Generoprof)			REFERENCES Genero (cd_Genero),
CONSTRAINT fk_ProfessorNac   		FOREIGN KEY (cd_Nacionalidadeprof)	REFERENCES Nacionalidade (cd_Nacionalidade),
CONSTRAINT fk_ProfessorTitulacao	FOREIGN KEY (cd_Titulacaoprof)		REFERENCES Titulacao (cd_Titulacao)
)

INSERT INTO PROFESSOR VALUES (1005,'Jacy','1958-01-01',4,1,10)
INSERT INTO PROFESSOR VALUES (1010,'Adilson','1960-01-01',4,1,20)
INSERT INTO PROFESSOR VALUES (1020,'Delcínio','1955-01-01',4,1,20)
INSERT INTO PROFESSOR VALUES (1030,'Claudia','1955-01-01',2,1,10)
INSERT INTO PROFESSOR VALUES (1040,'Yan Chen','1965-01-01',3,4,20)
INSERT INTO PROFESSOR VALUES (1050,'Jediane','1975-01-01',2,4,10)
INSERT INTO PROFESSOR VALUES (1051,'Douglas','1975-01-01',2,4,20)

SELECT * FROM PROFESSOR

CREATE TABLE ALUNO (
cd_Aluno			int not null,
nm_Aluno			varchar(30) not null,
dt_Aluno			smalldatetime not null,
cd_NacionalidadeAluno	int not null,
cd_GeneroAluno			int not null,
cd_TCC                  int not null, -- a FK add após add TCC
CONSTRAINT pk_Aluno				PRIMARY KEY (cd_Aluno),
CONSTRAINT fk_AlunoGenero		FOREIGN KEY (cd_GeneroAluno)			REFERENCES Genero (cd_Genero),
CONSTRAINT fk_AlunoNac   		FOREIGN KEY (cd_NacionalidadeAluno)	REFERENCES Nacionalidade (cd_Nacionalidade),
)

INSERT INTO ALUNO VALUES (9090,'Ana Paula','2000-10-10',1,10,15)
INSERT INTO ALUNO VALUES (9091,'Juca','1999-01-10',1,20,15)
INSERT INTO ALUNO VALUES (9092,'Mariana','1985-02-02',1,10,15)

INSERT INTO ALUNO VALUES (9095,'Cassio','1998-03-03',3,20,16)
INSERT INTO ALUNO VALUES (9096,'João','1997-04-04',5,20,16)

INSERT INTO ALUNO VALUES (9098,'Julia','2001-05-03',2,10,17)
INSERT INTO ALUNO VALUES (9099,'Camila','2001-10-04',4,10,17)

INSERT INTO ALUNO VALUES (9100,'Julia K','2001-10-05',1,10,18)
INSERT INTO ALUNO VALUES (9101,'Talita','2002-12-04',5,10,18)
INSERT INTO ALUNO VALUES (9102,'Luciana','1999-07-09',1,10,18)



CREATE TABLE AlunoEmail (
cd_AlunoEmail			int not null identity(1,1),
cd_Aluno			    int not null,
ds_EmailAluno           varchar(100) not  null,
CONSTRAINT pk_AlunoEmail				PRIMARY KEY (cd_AlunoEmail),
CONSTRAINT fk_AlunoEmail_aluno      	FOREIGN KEY (cd_Aluno) REFERENCES Aluno (cd_Aluno)
)

INSERT INTO AlunoEmail VALUES (9090,'AnaPaula@gmail.com')
INSERT INTO AlunoEmail VALUES (9090,'AnaPaula@yahoo.com')
INSERT INTO AlunoEmail VALUES (9091,'Juca@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9091,'Juca@gmail.com')
INSERT INTO AlunoEmail VALUES (9092,'Mariana@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9095,'Cassio@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9096,'João@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9098,'Julia@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9098,'Julia@gmail.com')
INSERT INTO AlunoEmail VALUES (9099,'Camila@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9100,'JuliaK@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9100,'JuliaK@live.com')
INSERT INTO AlunoEmail VALUES (9101,'Talita@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9101,'Talita@gmail.com')
INSERT INTO AlunoEmail VALUES (9102,'Luciana@fatec.sp.gov.br')
INSERT INTO AlunoEmail VALUES (9102,'Luciana@gmail.com')

select * from AlunoEmail
CREATE TABLE TCC (
cd_TCC						int not null,
ds_tituloTCC				Varchar(100)  not null,
nr_AnoInicio				int not null,
nr_AnoFim					int not null,
vlr_Nota					dec(5,2) not null,
cd_ProfessorOrientador		int not null,
cd_ProfessorCoOrientador	int not null,
CONSTRAINT pk_TCC				PRIMARY KEY (cd_TCC),
CONSTRAINT fk_TCCProfOri        FOREIGN KEY (cd_ProfessorOrientador)
                                REFERENCES Professor (cd_Professor),
CONSTRAINT fk_TCCProfCoOri        FOREIGN KEY (cd_ProfessorCoOrientador)
                                REFERENCES Professor (cd_Professor)
)





INSERT INTO TCC Values  (15,'Aplicação IOT para Presença Alunos Fatec',2022,2023,9.6, 1051,1040)

INSERT INTO TCC Values  (16,'Aplicação Mobile para Siga',2022,2023,9.0, 1040,1030)

INSERT INTO TCC Values  (17,'Aplicação Mobile Aplicação de provas Fatec SBC',2022,2023,9.1, 1030,1020)

INSERT INTO TCC Values  (18,'Criação de novo Portal Fatec SBC',2022,2023,9.1, 1020,1010)


SELECT * FROM tcc

CREATE TABLE TCCFases (
cd_TCCFases					int not null identity(1000,1),
cd_TCC						int not null,
dt_Inicio					smalldatetime,
dt_Fim						smalldatetime,
vlr_Nota					dec(5,2),
ds_Titulo					varchar(100),
ds_Descricao				varchar(100),
CONSTRAINT pk_TCCFases PRIMARY KEY (cd_TCCFases),
CONSTRAINT fk_TCCFases FOREIGN KEY (cd_TCC) REFERENCES TCC (cd_TCC)
)

INSERT INTO TCCFases Values  (15,'01-02-2022','30-03-2022',7,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (15,'01-02-2022','30-03-2022',7,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (15,'01-04-2022','30-04-2022',8,'metodologia','Elaboração metodologia')
INSERT INTO TCCFases Values  (15,'01-05-2022','30-05-2022',8,'introducao','Elaboração introducao')
INSERT INTO TCCFases Values  (15,'01-06-2022','30-06-2022',9,'Qualificação TG1','banca Remota')
INSERT INTO TCCFases Values  (15,'01-08-2022','30-09-2022',9,'Desenvolvimento','Desenvolvimento projeto prático')
INSERT INTO TCCFases Values  (15,'01-10-2022','30-10-2022',9,'Finalização Projeto','finalização projeto prático')
INSERT INTO TCCFases Values  (15,'01-11-2022','30-11-2022',9,'bancas','Banca')

INSERT INTO TCCFases Values  (16,'01-02-2022','30-03-2022',9,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (16,'01-02-2022','30-03-2022',9,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (16,'01-04-2022','30-04-2022',7,'metodologia','Elaboração metodologia')
INSERT INTO TCCFases Values  (16,'01-05-2022','30-05-2022',7,'introducao','Elaboração introducao')
INSERT INTO TCCFases Values  (16,'01-06-2022','30-06-2022',8,'Qualificação TG1','banca Remota')
INSERT INTO TCCFases Values  (16,'01-08-2022','30-09-2022',8,'Desenvolvimento','Desenvolvimento projeto prático')
INSERT INTO TCCFases Values  (16,'01-10-2022','30-10-2022',9,'Finalização Projeto','finalização projeto prático')
INSERT INTO TCCFases Values  (16,'01-11-2022','30-11-2022',9,'bancas','Banca')


INSERT INTO TCCFases Values  (17,'01-02-2022','30-03-2022',6,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (17,'01-02-2022','30-03-2022',6,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (17,'01-04-2022','30-04-2022',7,'metodologia','Elaboração metodologia')
INSERT INTO TCCFases Values  (17,'01-05-2022','30-05-2022',7,'introducao','Elaboração introducao')
INSERT INTO TCCFases Values  (17,'01-06-2022','30-06-2022',9,'Qualificação TG1','banca Remota')
INSERT INTO TCCFases Values  (17,'01-08-2022','30-09-2022',9,'Desenvolvimento','Desenvolvimento projeto prático')
INSERT INTO TCCFases Values  (17,'01-10-2022','30-10-2022',8,'Finalização Projeto','finalização projeto prático')
INSERT INTO TCCFases Values  (17,'01-11-2022','30-11-2022',8,'bancas','Banca')

INSERT INTO TCCFases Values  (18,'01-02-2022','30-03-2022',5,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (18,'01-02-2022','30-03-2022',5,'Fundamentação Teórica','Elaboração Fundamentaçãoteórica')
INSERT INTO TCCFases Values  (18,'01-04-2022','30-04-2022',6,'metodologia','Elaboração metodologia')
INSERT INTO TCCFases Values  (18,'01-05-2022','30-05-2022',6,'introducao','Elaboração introducao')
INSERT INTO TCCFases Values  (18,'01-06-2022','30-06-2022',7,'Qualificação TG1','banca Remota')
INSERT INTO TCCFases Values  (18,'01-08-2022','30-09-2022',7,'Desenvolvimento','Desenvolvimento projeto prático')
INSERT INTO TCCFases Values  (18,'01-10-2022','30-10-2022',9,'Finalização Projeto','finalização projeto prático')
INSERT INTO TCCFases Values  (18,'01-11-2022','30-11-2022',9,'bancas','Banca')



-- adiciona FK TCC em aluno 
ALTER TABLE ALUNO add Constraint fk_AlunoTCC FOREIGN KEY (cd_TCC) REFEREnCES TCC (cd_TCC)

select * from TCCFases