-- Chama no Codiguera rs by andrei e laura

CREATE DATABASE RPG;

CREATE TABLE RPG.Item (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(255) NOT NULL,
    Nivel int NOT NULL,
    Durabilidade decimal NOT NULL
);

CREATE TABLE RPG.Recompensa (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Item int NOT NULL,
    Experiencia decimal NOT NULL,
    FOREIGN KEY (Item) REFERENCES RPG.Item(ID)
);

CREATE TABLE RPG.Classe (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(25) NOT NULL
);

CREATE TABLE RPG.Raca (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(25) NOT NULL
);

CREATE TABLE RPG.Atributos (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nivel varchar(25) NOT NULL,
    Experiencia decimal NOT NULL,
    Vida decimal NOT NULL,
    Mana decimal NOT NULL,
    Armadura decimal NOT NULL,
    Inteligencia decimal NOT NULL,
    Sorte decimal NOT NULL,
    Forca decimal NOT NULL,
    Destreza decimal NOT NULL,
    Percepcao decimal NOT NULL,
    Carisma decimal NOT NULL
);

CREATE TABLE RPG.Guild (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(25) NOT NULL,
    Tamanho int NOT NULL
);

CREATE TABLE RPG.Inventario (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Tamanho int,
    Item int NOT NULL,
    FOREIGN KEY (Item) REFERENCES RPG.Item(ID)
);

CREATE TABLE RPG.Quest (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(25),
    Prazo datetime NOT NULL,
    Descricao varchar(255) NOT NULL,
    Recompensa int,
    Progresso decimal,
    FOREIGN KEY (Recompensa) REFERENCES RPG.Recompensa(ID)
);

CREATE TABLE RPG.Skill (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(25),
    Cooldown decimal NOT NULL,
    Descricao varchar(100) NOT NULL,
    Custo decimal NOT NULL,
    Nivel int NOT NULL,
    Experiencia decimal NOT NULL
);

CREATE TABLE RPG.Personagem (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(25),
    Classe int NOT NULL,
    Raca int NOT NULL,
    Atributos int NOT NULL,
    Guild int NOT NULL,
    Inventario int NOT NULL,
    Quest int NOT NULL,
    Skill int NOT NULL,
    FOREIGN KEY (Classe) REFERENCES RPG.Classe(ID),
    FOREIGN KEY (Raca) REFERENCES RPG.Raca(ID),
    FOREIGN KEY (Atributos) REFERENCES RPG.Atributos(ID),
    FOREIGN KEY (Guild) REFERENCES RPG.Guild(ID),
    FOREIGN KEY (inventario) REFERENCES RPG.Inventario(ID),
    FOREIGN KEY (Quest) REFERENCES RPG.Quest(ID),
    FOREIGN KEY (Skill) REFERENCES RPG.Skill(ID)
);

CREATE TABLE RPG.Conta (
	ID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Email varchar(255) UNIQUE,
    Usuario varchar(30) NOT NULL UNIQUE,
    Senha varchar(30) NOT NULL,
    Dt_nascimento date,
    Personagem int NOT NULL,
    FOREIGN KEY (Personagem) REFERENCES RPG.Personagem(ID)
);

-- ALTER TABLE RPG.Item
-- MODIFY COLUMN Nivel int;

-- ALTER TABLE RPG.Atributos
-- RENAME COLUMN Carisca to Carisma;

INSERT INTO RPG.Item (
	Nome,
    Nivel,
    Durabilidade
) VALUES (
	"Espada Gurthang",
    10,
    100
);

INSERT INTO RPG.Classe (
	Nome
) VALUES (
	"Paladino"
);

INSERT INTO RPG.Raca (
	Nome
) VALUES (
	"Elfo"
);

INSERT INTO RPG.Atributos (
	Nivel,
    Experiencia,
    Vida,
    Mana,
    Armadura,
    Inteligencia,
    Sorte,
    Forca,
    Destreza,
    Percepcao,
    Carisma
) VALUES (
	10,
    100,
    100,
    100,
    50,
    50,
    40,
    100,
    40,
    60,
    1
);

INSERT INTO RPG.Guild (
	Nome,
    Tamanho
) VALUES (
	"Highlanders",
    5
);

INSERT INTO RPG.Skill (
	Nome,
    Cooldown,
    Custo,
    Nivel,
    Experiencia,
    Descricao
) VALUES (
	"Bola de Fogo",
    2,
    20,
    5,
    40,
    "Botafogo, Botafogo Campeão desde 1910."
);

