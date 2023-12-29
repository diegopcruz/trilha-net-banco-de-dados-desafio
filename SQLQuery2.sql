-- Etapa 1 - Buscar o nome e ano dos filmes
SELECT 
	Nome, 
	Ano 
FROM Filmes


-- Etapa 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
SELECT 
	Nome, 
	Ano, 
	Duracao 
FROM Filmes 
ORDER BY Ano


-- Etapa 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a dura��o
SELECT 
	Nome, 
	Ano, 
	Duracao 
FROM Filmes 
WHERE Nome= 'De Volta para o Futuro' 


-- Etapa 4 - Buscar os filmes lan�ados em 1997
SELECT 
	Nome, 
	Ano, 
	Duracao 
FROM Filmes 
WHERE Ano = 1997


-- Etapa 5 - Buscar os filmes lan�ados AP�S o ano 2000
SELECT 
	Nome, 
	Ano, 
	Duracao 
FROM Filmes 
WHERE Ano > 2000


-- Etapa 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT 
	Nome, 
	Ano, 
	Duracao 
FROM Filmes 
WHERE Duracao > 100 AND Duracao < 150 
ORDER BY Duracao


-- Etapa 7 - Buscar a quantidade de filmes lan�adas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT 
	Ano, 
	COUNT(*) as Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY Quantidade DESC


-- Etapa 8 - Buscar os Atores do g�nero masculino, retornando o PrimeiroNome, UltimoNome
SELECT 
	*	
FROM Atores
WHERE Genero = 'M'


-- Etapa 9 - Buscar os Atores do g�nero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT 
	*	
FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome


-- Etapa 10 - Buscar o nome do filme e o g�nero
SELECT
	Filmes.Nome,
	Generos.Genero
FROM 
((FilmesGenero INNER JOIN Filmes ON FilmesGenero.IdFilme = Filmes.Id) INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id)


-- Etapa 11 - Buscar o nome do filme e o g�nero do tipo "Mist�rio"
SELECT 
	Filmes.Nome,
	Generos.Genero
FROM
((FilmesGenero
INNER JOIN Filmes ON FilmesGenero.IdFilme = Filmes.Id)
INNER JOIN Generos ON FilmesGenero.IdGenero = Generos.Id)
WHERE Generos.Genero = 'Mist�rio'


-- Etapa 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT
	Filmes.Nome,
	Atores.PrimeiroNome,
	Atores.UltimoNome,
	ElencoFilme.Papel
FROM
	((ElencoFilme
	
INNER JOIN Filmes ON ElencoFilme.IdFilme = Filmes.Id)
INNER JOIN Atores ON ElencoFilme.Id = Atores.Id)
INNER JOIN Generos ON ElencoFilme.IdAtor = Generos.Id