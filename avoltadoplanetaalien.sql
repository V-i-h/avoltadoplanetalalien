CREATE DATABASE avoltadoplanetaalien;
USE avoltadoplanetaalien;

CREATE TABLE verbo (
    id INT PRIMARY KEY auto_increment,
    nomeverbo VARCHAR(40),
    fk_bloom_id INT
);
insert into verbo(nomeverbo,fk_bloom_id) values
('Listar','1'),('Relembrar','1'),('Reconhecer','1'),('Identificar','1'),('Localizar','1'),('Descrever','1'),('Citar','1'),('Esquematizar','2'),('Relacionar','2'),('Explicar','2')
,('Demonstrar','2'),('Parafasear','2'),('Associar','2'),('Converter','2'),('Utilizar','3'),('Implementar','3'),('Modificar','3'),('Experimentar','3'),('Calcular','3'),('Demonstrar','3')
,('Classificar','3'),('Resolver','4'),('Categorizar','4'),('Difenciar','4'),('Comparar','4'),('Explicar','4'),('Integrar','4'),('Investigar','4'),('Defender','5'),('Delimitar','5'),('Estimar','5')
,('Selecionar','5'),('Justificar','5'),('Comparar','5'),('Explicar','5'),('Elaborar','6'),('Desenhar','6'),('Produzir','6'),('Prototipar','6'),('Traçar','6'),('Idear','6'),('Inventar','6');

update verbo set nomeverbo ='identificar' where id=8;
select * from verbo;

truncate table verbo;

CREATE TABLE bloom (
    id INT PRIMARY KEY auto_increment,
    nome VARCHAR(40)
);

insert into bloom(nome) values ('Memorizar'),('Compreender'),('Aplicar'),('Analisar'),('Avaliar'),('Criar'); 

select * from bloom;
 
CREATE TABLE historia (
    id INT PRIMARY KEY auto_increment,
    titulo VARCHAR(150),
    descricao LONGTEXT,
    final VARCHAR(200)
);

insert  into historia (titulo,descricao,final) values
('História do Jogo – Planeta Alien (A Revolta do Furão)',
'No ano de 3250 a terra foi destruída por alienígenas do Planeta Alien. Esses extraterrestes
eram desenvolvedores de tecnologia avançada em seu planeta, mas aprenderam com os
humanos a linguagem de marcação HTML, a linguagem de estilização CSS e a linguagem de
programação Java Script.
Antes de destruir a terra por inteiro, escolheu um casal de cada Mamífero e fez uma mutação
genética com a tecnologia do planeta Alien e as tecnologias aprendidas no planeta Terra:
HTML, CSS e Java Script.
Todos os Mamíferos mutantes, aceitaram tranquilamente a mutação genética, mas um e
apenas um, chamado de Furão Mutante Guerreiro, não aceitou. Ele foi levado para o Planeta
Alien, mas a sua memória ainda continuou na terra. Um dia essas memórias se misturaram
com sua mutação genética e ele se revoltou contra os aliens.
A revolta fez nascer missões. E cada missão ganha um nível de força que o torna mais poderoso
aumentando a possibilidade de destruir mais aliens e assim salvar também os seus amigos
terrestres','Ao final de todas as missões, todos os “Aliens” serão destruídos e o Furão irá resgatar seus
amigos e construir um novo planeta com justiça e paz.');
select * from  historia;



CREATE TABLE competencia (
    id INT PRIMARY KEY auto_increment,
    descricao LONGTEXT,
    fk_verbo_id INT
);

insert into competencia(descricao,fk_verbo_id)values
('identificar as tags html para matar um inimigo','4'),('Classificar os principais seletores para avançar para o proximo nível','21'),('Esquematizar os scripts em javascript','8'),('Investigar os exceptions','28'),('Localizar as conditions','5'),('Demonstrar os lopps','21'),('Produzir um array',38),('Reconhecer as functions','3'),('Descrever os objects','6')
,('Elaborar um database','36');

select * from competencia;


CREATE TABLE etapa (
    id INT PRIMARY KEY auto_increment,
    instrucao LONGTEXT,
    ponto INT,
    tipo NCHAR(1),
    fk_verbo_id INT
);

insert into etapa (instrucao,ponto,tipo) values
('O furão deve identificar as 10  tags html que estão escondidas no Planeta Alien','10','H'),
('O furão deve Classificar os selectores que estão no caminho até a nave','20','C');
select * from etapa;


CREATE TABLE Missao (
    id INT PRIMARY KEY auto_increment,
    hash nchar(22),
    titulo VARCHAR(80),
    forca INT,
    fk_competencia_id INT,
    fk_etapa_id INT
);
  insert into Missao(titulo,forca) values
  ('Encontrar Tags','1'),
  ('Encontrar Selectores',' 2'),
  ('Encontrar Scripts','3'),
  ('Encontrar Exceptions','  4'),
  ('Encontrar Conditions','  5'),
  ('Encontrar Loops', ' 6'),
  ('Encontrar Arrays', '7'),
 ('Encontrar Functions','  8'),
  ('Encontrar Objects', '9'),
  ('Encontrar Databases',' 10');
  select * from missao;
truncate table missao;

CREATE TABLE MissaoHistoria (
    id INT PRIMARY KEY auto_increment,
    fk_Missao_id INT,
    fk_historia_id INT
);
 
ALTER TABLE competencia ADD CONSTRAINT FK_competencia_2
    FOREIGN KEY (fk_verbo_id)
    REFERENCES verbo (id)
    ON DELETE CASCADE;
 
ALTER TABLE verbo ADD CONSTRAINT FK_verbo_2
    FOREIGN KEY (fk_bloom_id)
    REFERENCES bloom (id)
    ON DELETE CASCADE;
 
ALTER TABLE etapa ADD CONSTRAINT FK_etapa_2
    FOREIGN KEY (fk_verbo_id)
    REFERENCES verbo (id)
    ON DELETE CASCADE;
 
ALTER TABLE Missao ADD CONSTRAINT FK_Missao_2
    FOREIGN KEY (fk_competencia_id)
    REFERENCES competencia (id)
    ON DELETE CASCADE;
 
ALTER TABLE Missao ADD CONSTRAINT FK_Missao_3
    FOREIGN KEY (fk_etapa_id)
    REFERENCES etapa (id)
    ON DELETE CASCADE;
 
ALTER TABLE MissaoHistoria ADD CONSTRAINT FK_MissaoHistoria_2
    FOREIGN KEY (fk_Missao_id)
    REFERENCES Missao (id)
    ON DELETE CASCADE;
 
ALTER TABLE MissaoHistoria ADD CONSTRAINT FK_MissaoHistoria_3
    FOREIGN KEY (fk_historia_id)
    REFERENCES historia (id)
    ON DELETE CASCADE;