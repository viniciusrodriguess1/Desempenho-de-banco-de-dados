-- Listar todos os livros com seus autores
SELECT L.Titulo, A.Nome AS Autor 
FROM Livro L 
JOIN Autor A ON L.ID_Autor = A.ID_Autor;

-- Listar todos os empréstimos e os usuários correspondentes
SELECT E.ID_Emprestimo, U.Nome AS Usuario, L.Titulo 
FROM Emprestimo E 
JOIN Usuario U ON E.ID_Usuario = U.ID_Usuario
JOIN Livro L ON E.ID_Livro = L.ID_Livro;

-- Listar todos os livros e suas categorias
SELECT L.Titulo, C.Nome AS Categoria 
FROM Livro L 
JOIN Livro_Categoria LC ON L.ID_Livro = LC.ID_Livro
JOIN Categoria C ON LC.ID_Categoria = C.ID_Categoria;

-- Listar todos os livros emprestados (não devolvidos)
SELECT L.Titulo, U.Nome AS Usuario 
FROM Emprestimo E 
JOIN Livro L ON E.ID_Livro = L.ID_Livro
JOIN Usuario U ON E.ID_Usuario = U.ID_Usuario
WHERE E.Data_Devolucao IS NULL;

-- Listar todos os autores e seus livros publicados
SELECT A.Nome AS Autor, L.Titulo 
FROM Autor A 
JOIN Livro L ON A.ID_Autor = L.ID_Autor;
-- Listar livros publicados após o ano 2000
SELECT Titulo, Ano_Publicacao 
FROM Livro 
WHERE Ano_Publicacao > 2000;

-- Listar usuários que fizeram mais de um empréstimo
SELECT U.Nome, COUNT(E.ID_Emprestimo) AS Total_Emprestimos 
FROM Usuario U 
JOIN Emprestimo E ON U.ID_Usuario = E.ID_Usuario 
GROUP BY U.Nome 
HAVING COUNT(E.ID_Emprestimo) > 1;

-- Listar categorias com a quantidade de livros associados
SELECT C.Nome AS Categoria, COUNT(LC.ID_Livro) AS Quantidade_Livros 
FROM Categoria C 
JOIN Livro_Categoria LC ON C.ID_Categoria = LC.ID_Categoria 
GROUP BY C.Nome 
ORDER BY Quantidade_Livros DESC;
