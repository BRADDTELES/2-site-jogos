SELECT * FROM bd_games.jogos;
SELECT * FROM jogos j JOIN generos g ON j.genero = g.cod;
SELECT j.cod, j.nome, g.genero, j.descricao, j.nota, j.capa FROM jogos j JOIN generos g ON j.genero = g.cod;
SELECT j.cod, j.nome, g.genero, p.produtora, p.pais, j.descricao, j.nota, j.capa FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod;
SELECT j.cod, j.nome, g.genero, p.produtora, j.capa FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod;
SELECT j.cod, j.nome, g.genero, p.produtora, j.capa FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod ORDER BY nome;
SELECT j.cod, j.nome, g.genero, p.produtora, j.capa FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod ORDER BY produtora;
SELECT j.cod, j.nome, g.genero, p.produtora, j.capa, j.nota FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod ORDER BY nota DESC;
SELECT j.cod, j.nome, g.genero, p.produtora, j.capa, j.nota FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod ORDER BY nota ASC;