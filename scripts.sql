create database bd_games default character set utf8 collate utf8_general_ci;
use bd_games;
create table usuarios (
usuario varchar(10) not null,
nome varchar(30) not null,
senha varchar(60) not null,
tipo varchar(10) not null default 'editor',
primary key(usuario)
) engine=InnoDB default charset=utf8;
use bd_games;
create table generos (
cod int(11) not null,
genero varchar(20) not null,
primary key(cod)
) engine=InnoDB default charset=utf8;
use bd_games;
create table produtoras (
cod int(11) not null,
produtora varchar(20) not null,
pais varchar(15) not null,
primary key(cod)
) engine=InnoDB default charset=utf8;
use bd_games;
create table jogos (
cod int(11) not null,
nome varchar(40) not null,
genero int(11) not null,
produtora int(11) not null,
descricao text not null,
nota decimal(4,2) not null,
capa varchar(40) default null,
primary key(cod),
foreign key(genero) references generos(cod),
foreign key(produtora) references produtoras(cod)
) engine=InnoDB default charset=utf8;
use bd_games;
describe generos;
use bd_games;
insert into generos values(1, 'Ação'),(2,'Aventura'),(3,'Terror'),(4,'Plataforma'),(5,'Estratégia'),(6,'RPG'),(7,'Esporte'),(8,'Corrida'),(9,'Tabuleiro'),(10,'Puzzle'),(11,'Luta'),(12,'Musical');
use bd_games;
select * from generos;
use bd_games;
insert into produtoras (cod, produtora, pais) values
(1,'Microsoft', 'EUA'),
(2,'Tencent','China'),
(3,'Nintendo','Japão'),
(4,'Sony','Japão'),
(5,'Activision','EUA'),
(6,'EA','EUA'),
(7,'Sega','Japão'),
(8,'Namco Bandai','Japão'),
(9,'Konami','Japão'),
(10,'Ubisoft','EUA'),
(11,'Valve','EUA'),
(12,'Square Enix','Japão'),
(13,'Take Two','EUA'),
(14,'Capcom','Japão');
use bd_games;
select * from produtoras;
use bd_games;
insert into jogos (cod, nome, genero, produtora, descricao, nota, capa) values
(1,'Mario Odissey',2,3,'Super Mario Odyssey é um jogo de plataforma desenvolvido pela Nintendo Entertainment Planning & Development e publicado pela Nintendo. Foi lançado mundialmente em 27 de outubro de 2017 exclusivamente para o Nintendo Switch. É o oitavo jogo de plataforma tridimensional na série principal Super Mario, retornando para o projeto de fases mais livres visto em Super Mario 64 e Super Mario Sunshine. No jogo, o icônico chapéu de Mario torna-se um personagem próprio.','9.50','mario.png'),
(2,'Call of Dutty: Black Ops',1,5,'Call of Duty: Black Ops é um jogo eletrônico de tiro em primeira pessoa. O jogador assume o papel de um veterano de guerra que pode manejar diversas armas diferentes (sendo capaz de carregar consigo apenas duas de cada vez), lançar granadas de mão e utilizar vários tipos de equipamento.','3.50','cod.png'),
(3,'League of Legends',1,2,'É um jogo eletrônico do gênero multiplayer online battle arena (MOBA). No jogo, duas equipes de cinco jogadores batalham em um combate jogador contra jogador (PvP), com cada equipe ocupando e defendendo sua metade do mapa. Cada um dos dez jogadores controla um personagem, conhecido como campeão, com habilidades únicas e diferentes estilos de jogo. Durante uma partida, os campeões se tornam mais poderosos ao coletarem pontos de experiência, ganharem ouro e comprarem itens a fim de derrotar a equipe adversária. No modo principal, Summoners Rift, o objetivo primário é avançar até a base inimiga e destruir uma grande estrutura localizada em seu centro, sob o nome de Nexus.','8.50','lol.png'),
(4,'Donkey Kong Tro',2,3,'Donkey Kong Country: Tropical Freeze é um jogo eletrônico de plataforma desenvolvido pela Retro Studios em colaboração com a Monster Games e publicado pela Nintendo para o Wii U. Tropical Freeze é uma sequência direta de Donkey Kong Country Returns e foi lançado em 2014. Um porte para Nintendo Switch foi lançado em maio de 2018.','8.00','donkey.png'),
(5,'Sonic the Hedgehog',2,7,'Quase todos os jogos da série apresentam um ouriço antropomórfico azul chamado Sonic como o personagem do jogador central e protagonista. Os jogos detalham a tentativa de Sonic e seus aliados de salvar o mundo de várias ameaças, principalmente o gênio do mal Dr. Ivo "Eggman" Robotnik, o antagonista principal da série. O objetivo principal de Robotnik é governar o mundo; para conseguir isso, ele geralmente tenta destruir Sonic e adquirir as poderosas Esmeraldas do Caos.','8.50','sonic.png'),
(6,'God of War',1,4,'God of War foi lançado pela primeira vez na América do Norte em 22 de março de 2005, para o PlayStation 2. Após dez anos a serviço dos deuses do Olimpo, o espartano Kratos é encarregado por Atena de encontrar a Caixa de Pandora; a chave para derrotar Ares, o deus da guerra, que está destruindo a cidade de Atenas. Uma série de flashbacks revelam que Kratos já foi o servo de Ares, que salvou o espartano e seu exército da aniquilação em uma batalha, mas o enganou para matar sua família, o que forçou sua metamorfose de "Fantasma de Esparta". Kratos eventualmente encontra a Caixa de Pandora, e depois de finalmente matar Ares, ele ascende ao Monte Olimpo para se tornar o novo deus da guerra.','9.50','gow.png'),
(7,'Counter-Strike',1,11,'O jogo é baseado em rodadas nas quais equipes de contraterroristas e terroristas combatem-se até a eliminação completa de um dos times, e tem como objetivo principal plantar e desarmar bombas, ou sequestrar e salvar reféns.','9.00','cs.png'),
(8,'Resident Evil 6',3,14,'A história é contada a partir das perspectivas de Chris Redfield, membro e fundador da BSAA traumatizado por ter falhado em uma missão; Leon S. Kennedy, um sobrevivente de Raccoon City e agente especial do governo; Jake Muller, filho ilegítimo de Albert Wesker e associado de Sherry Birkin; e Ada Wong, uma agente solitária com ligações aos ataques bio-terroristas pela Neo-Umbrella.','7.50','resident.png'),
(9,'Grand Theft Auto V',2,13,'A jogabilidade é mostrada em uma perspectiva de primeira ou terceira pessoa e o mundo pode ser atravessado a pé ou com veículos. Os jogadores controlam três protagonistas e podem alternar entre eles durante e fora das missões. A história é centrada em sequências de assaltos, com muitas missões envolvendo a jogabilidade de tiro e direção. Um sistema de procurado define a resposta e agressividade das forças da lei contra os crimes cometidos pelo jogador. O modo multijogador, Grand Theft Auto Online, permite que até trinta jogadores explorem o mundo e entrem em partidas competitivas ou cooperativas.','9.50','gta.png'),
(10,'Metal Gear Solid V: The Phantom Pain',6,9,'A acção acontece em 1984, nove anos depois de Ground Zeroes, e segue o mercenário Punished Venom Snake, à medida que este se aventura na África (no decorrer da Guerra Civil Angolana, na fronteira Angola-Zaire) e no Afeganistão durante a Guerra Soviética-Afegã, para procurar vingança sobre as pessoas que destruíram as suas forças e que quase o mataram durante os eventos ocorridos em Ground Zeroes.','8.50','metal.png'),
(11,'Assassins Creed III',1,10,'O enredo decorre de uma história fictícia dentro de eventos reais e segue a batalha ancestral entre os Assassinos, que lutam pela liberdade, e os Templários, que desejam controlar a humanidade. A trama se desenrola no século XXI onde Desmond Miles, o protagonista da série, com a ajuda de uma máquina conhecida como Animus, revive as memórias dos seus ancestrais para o ajudar a descobrir uma maneira de prevenir o Apocalipse de 2012. A história principal se desenrola antes, durante e depois da Revolução Americana entre 1765 e 1783 e segue o ancestral de Desmond, de ascendência mohawk e inglesa, Ratonhnhaké:ton,também conhecido como Connor, enquanto ele luta contra as tentativas dos Templários de controlar a nova nação.','7.50','assassin.png');
select * from jogos;
use bd_games;
insert into usuarios (usuario, nome, senha, tipo) values
('admin','Gustavo Guanabara','admin','admin'),
('teste','João da Silva','teste','editor');
select * from usuarios;