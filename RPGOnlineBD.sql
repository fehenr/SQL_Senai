CREATE DATABASE RpgOnlineDB

USE RpgOnlineDB

CREATE TABLE Usuarios (
	usuarioID INT PRIMARY KEY IDENTITY
	,email VARCHAR(100) UNIQUE NOT NULL
	,senha VARCHAR(255) NOT NULL
	)

CREATE TABLE Classes(
	classesID INT PRIMARY KEY IDENTITY
	,nomeClasse VARCHAR(50) UNIQUE NOT NULL 
	,descricao VARCHAR(255)
	)

CREATE TABLE Personagens(
	personagemID VARCHAR (100) UNIQUE NOT NULL
	,nomePersonagem VARCHAR (15) UNIQUE NOT NULL 
	,usuarioID INT FOREIGN KEY REFERENCES Usuarios(usuarioID)
	,classesID INT FOREIGN KEY REFERENCES Classes(classesID)
	)

CREATE TABLE Habilidades (
	habilidadesID INT PRIMARY KEY IDENTITY
	,nomeHabilidade VARCHAR (100) UNIQUE NOT NULL
	)

CREATE TABLE ClasseHabilidades (
	classesID INT FOREIGN KEY REFERENCES Classes(classesID)
	,habilidadesID INT FOREIGN KEY REFERENCES Habilidades(habilidadesID)
	)

--DML (manipulação de dados)
INSERT INTO Usuarios VALUES ('Email@email.com', '123456')
INSERT INTO Classes VALUES ('Gatuno', 'Descrição do Gatuno')
INSERT INTO Habilidades VALUES ('Facas do abismo'), ('Roubar')
INSERT INTO Personagens (NomePersonagem, UsuarioId, classesID) VALUES ('Velociraptor' , 1 , 1)
INSERT INTO ClasseHabilidades (classesID, habilidadesID) VALUES (1, 1) , (1, 2)

INSERT INTO Usuarios VALUES ('Email2@email2.com' , '123456')
INSERT INTO Classes VALUES ('Cavaleiro' , 'Descrição do Cavaleiro')
INSERT INTO Habilidades VALUES ('Escudo supremo')
INSERT INTO Personagens (NomePersonagem, UsuarioId, classesID) VALUES ('Tanker' , 2 , 2)
INSERT INTO ClasseHabilidades (classesID, habilidadesID) VALUES (2, 2) , (2, 3)

--DQL (seleção e junção de dados em tabelas especificas)

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Habilidades
SELECT * FROM Personagens
SELECT * FROM ClasseHabilidades


SELECT * FROM Personagens
INNER JOIN Classes
ON Personagens.classesID = Classes.classesID

SELECT P.nomePersonagem, C.nome AS 'Classe', C.descricao FROM Personagens AS P
INNER JOIN Classes AS C 
ON P.classesID = C.classesID

--DML Atividade03UC10
INSERT INTO Usuarios VALUES ('email3@email.com','123456')
INSERT INTO Classes VALUES ('Paladino','Descrição do Paladino')
INSERT INTO Habilidades VALUES ('Escudo Divino'),('Martelo Celestial')
INSERT INTO Personagens (nomePersonagem, usuarioID, classesID) VALUES ('Lancer', 3, 3)

INSERT INTO Usuarios VALUES ('email1@email.com','123456')
INSERT INTO Classes VALUES ('Mago','Descrição do Mago')
INSERT INTO Habilidades VALUES ('Bola de fogo'),('Cura')
INSERT INTO Personagens (nomePersonagem, usuarioID, classesID) VALUES ('SameBug', 4, 6)

UPDATE  Usuarios
SET Senha = 654321
WHERE usuarioID = 4


INSERT INTO Usuarios VALUES ('email4@email.com','123456')

DELETE FROM Usuarios WHERE usuarioID = 5 

CREATE LOGIN Jogador
WITH PASSWORD = '123456'

CREATE USER Jogador FOR LOGIN Jogador

GRANT SELECT TO Jogador 

SELECT * FROM Personagens