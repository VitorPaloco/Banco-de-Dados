-- 3)

-- a)
SELECT
	Nome,
	Email,
	Cidade
FROM ALUNO
	LEFT JOIN ENDERECO ON IDEndereco = ID_Endereco
WHERE Cidade = 'Londrina';

+-------------------+------------------+----------+
| Nome              | Email            | Cidade   |
+-------------------+------------------+----------+
| João Victor       | joao@edu.com     | Londrina |
| Maria Luiza       | maria@edu.com    | Londrina |
| Carlos Santos     | carlos@edu.com   | Londrina |
| Lucas Oliveira    | lucas@edu.com    | Londrina |
| Fernanda Costa    | fernanda@edu.com | Londrina |
| Paulo Souza       | paulo@edu.com    | Londrina |
| Cristina Oliveira | cristina@edu.com | Londrina |
| Fernando Oliveira | fernando@edu.com | Londrina |
| Rafaela Almeida   | rafaela@edu.com  | Londrina |
| Bruno Silva       | bruno@edu.com    | Londrina |
| Vinicius Martins  | vinicius@edu.com | Londrina |
| Isadora Lima      | isadora@edu.com  | Londrina |
| Julia Almeida     | julia@edu.com    | Londrina |
| Leonardo Lima     | leonardo@edu.com | Londrina |
+-------------------+------------------+----------+

-- b)
SELECT
	DiaSemana,
	OrdemAula,
	Nome
FROM SEMANA
	LEFT JOIN MATERIA ON ID_Materia = IDMateria
ORDER BY IDSemana;

+---------------+-----------+-----------+
| DiaSemana     | OrdemAula | Nome      |
+---------------+-----------+-----------+
| Segunda-Feira | 1ª aula   | Ciências  |
| Segunda-Feira | 2ª aula   | História  |
| Segunda-Feira | 3ª aula   | Geografia |
| Segunda-Feira | 4ª aula   | Inglês    |
| Terça-Feira   | 1ª aula   | Ciências  |
| Terça-Feira   | 2ª aula   | História  |
| Terça-Feira   | 3ª aula   | Geografia |
| Terça-Feira   | 4ª aula   | Inglês    |
| Quarta-Feira  | 1ª aula   | Ciências  |
| Quarta-Feira  | 2ª aula   | História  |
| Quarta-Feira  | 3ª aula   | Geografia |
| Quarta-Feira  | 4ª aula   | Inglês    |
| Quinta-Feira  | 1ª aula   | Ciências  |
| Quinta-Feira  | 2ª aula   | História  |
| Quinta-Feira  | 3ª aula   | Geografia |
| Quinta-Feira  | 4ª aula   | Inglês    |
| Sexta-Feira   | 1ª aula   | Ciências  |
| Sexta-Feira   | 2ª aula   | História  |
| Sexta-Feira   | 3ª aula   | Geografia |
| Sexta-Feira   | 4ª aula   | Inglês    |
+---------------+-----------+-----------+

-- c)
SELECT
	T0.DiaSemana AS 'DIA',
	T0.OrdemAula AS 'AULA',
	T1.Nome AS 'MATERIA',
	T2.Nome AS 'PROFESSOR'
FROM SEMANA T0
	INNER JOIN MATERIA T1 ON T0.ID_Materia = T1.IDMateria
	INNER JOIN PROFESSOR T2 ON T2.ID_Materia = T1.IDMateria
ORDER BY T0.IDSemana;

+---------------+---------+------------------+------------------+
| DIA           | AULA    | MATERIA          | PROFESSOR        |
+---------------+---------+------------------+------------------+
| Segunda-Feira | 1ª aula | Português        | Amanda Silva     |
| Segunda-Feira | 2ª aula | Matemática       | Fernanda Sousa   |
| Segunda-Feira | 3ª aula | História         | Mariana Costa    |
| Segunda-Feira | 4ª aula | Ciências         | Ricardo Oliveira |
| Terça-Feira   | 1ª aula | Matemática       | Fernanda Sousa   |
| Terça-Feira   | 2ª aula | Português        | Amanda Silva     |
| Terça-Feira   | 3ª aula | Inglês           | Patrícia Santos  |
| Terça-Feira   | 4ª aula | Ciências         | Ricardo Oliveira |
| Quarta-Feira  | 1ª aula | Geografia        | Roberto Lima     |
| Quarta-Feira  | 2ª aula | História         | Mariana Costa    |
| Quarta-Feira  | 3ª aula | Matemática       | Fernanda Sousa   |
| Quarta-Feira  | 4ª aula | Português        | Amanda Silva     |
| Quinta-Feira  | 1ª aula | Matemática       | Fernanda Sousa   |
| Quinta-Feira  | 2ª aula | Artes            | Lucas Ferreira   |
| Quinta-Feira  | 3ª aula | Português        | Amanda Silva     |
| Quinta-Feira  | 4ª aula | Ciências         | Ricardo Oliveira |
| Sexta-Feira   | 1ª aula | Matemática       | Fernanda Sousa   |
| Sexta-Feira   | 2ª aula | Ensino Religioso | Pedro Dias       |
| Sexta-Feira   | 3ª aula | Inglês           | Patrícia Santos  |
| Sexta-Feira   | 4ª aula | Educação Física  | Ana Carilia      |
+---------------+---------+------------------+------------------+

-- d)
SELECT
	IDMateria,
	Nome,
	IFNULL(Data, 'Sem Aula') AS Data
FROM MATERIA 
	LEFT OUTER JOIN AULA ON ID_Materia = IDMateria
ORDER BY 1;

+-----------+------------------+------------+
| IDMateria | Nome             | Data       |
+-----------+------------------+------------+
|         1 | Matemática       | Sem Aula   |
|         2 | Português        | Sem Aula   |
|         3 | Ciências         | 2024-03-21 |
|         4 | História         | Sem Aula   |
|         5 | Geografia        | Sem Aula   |
|         6 | Inglês           | Sem Aula   |
|         7 | Artes            | Sem Aula   |
|         8 | Educação Física  | Sem Aula   |
|         9 | Ensino Religioso | Sem Aula   |
+-----------+------------------+------------+

-- e)
SELECT
    NomeTurma AS 'TURMA',
	Ano AS 'ANO'
FROM TURMA 
WHERE IDTurma IN (
    SELECT ID_Turma
    FROM ALUNO
    WHERE Nome = 'João Victor'
);

+-------+------+
| TURMA | ANO  |
+-------+------+
| 1B    | 2005 |
+-------+------+

-- f)
SELECT
    T0.NomeTurma AS 'TURMA',
    T0.Ano AS 'ANO',
    COUNT(T1.IDAluno) AS 'QUANTIDADE'
FROM TURMA T0
	LEFT JOIN ALUNO T1 ON T0.IDTurma = T1.ID_Turma
WHERE T0.IDTurma IN (
    SELECT ID_Turma
    FROM ALUNO
    WHERE Nome = 'João Victor'
)
GROUP BY 
	T0.NomeTurma, 
	T0.Ano;

SELECT
	ROUND(AVG(CargaHoraria), 1) AS 'Média CargaHoraria',
	SUM(CargaHoraria) AS 'Total',
FROM MATERIA;

SELECT
	MAX(CargaHoraria),
	Nome
FROM MATERIA
GROUP BY Nome;

+-------+------+------------+                                    
| TURMA | ANO  | QUANTIDADE |
+-------+------+------------+
| 1B    | 2005 |          5 |
+-------+------+------------+

+--------------------+-------+
| Média CargaHoraria | Total |
+--------------------+-------+
|               39.4 |   355 |
+--------------------+-------+

+--------------------+--------------------+
| MaximaCargaHoraria | MinimaCargaHoraria |
+--------------------+--------------------+
|                 60 |                 15 |
+--------------------+--------------------+

-- g)
SELECT
    T0.Nome AS 'REPRESENTANTE',
    T1.NomeTurma AS 'TURMA',
    T1.Ano AS 'ANO',
    COUNT(T2.IDAluno) AS 'QUANTIDADE ALUNOS'
FROM ALUNO T0 
	LEFT JOIN TURMA T1 ON T0.ID_Turma = T1.IDTurma
	LEFT JOIN ALUNO T2 ON T1.IDTurma = T2.ID_Turma
WHERE T0.Representante = 'S'
GROUP BY 
	T0.Nome,
	T1.NomeTurma,
	T1.Ano
ORDER BY T1.NomeTurma;

SELECT 
	Tipo, 
	COUNT(*) AS Total_Alunos
FROM ALUNO
GROUP BY Tipo
HAVING TIPO IN ('CEL', 'RES');

+---------------+-------+------+------------+
| REPRESENTANTE | TURMA | ANO  | QUANTIDADE |
+---------------+-------+------+------------+
| Carlos Santos | 1A    | 2005 |          5 |
| Mateus Lima   | 1B    | 2005 |          5 |
| Laura Souza   | 2A    | 2004 |          5 |
| Julia Almeida | 2B    | 2004 |          5 |
| Ricardo Souza | 3A    | 2003 |          5 |
| Maria Luiza   | 3B    | 2003 |          5 |
+---------------+-------+------+------------+

+------+--------------+
| Tipo | Total_Alunos |
+------+--------------+
| CEL  |           10 |
| RES  |           11 |
+------+--------------+

-- h)
SELECT 
	T0.Nome AS 'ALUNO',
	T1.Presenca AS 'PRESENÇA'
FROM ALUNO T0
	INNER JOIN CHAMADA T1 ON T0.IDAluno = T1.ID_Aluno

UNION

SELECT 
	T0.Nome AS 'PROFESSOR',
	T1.Nome AS 'MATERIA'
FROM PROFESSOR T0
	LEFT JOIN MATERIA T1 ON T0.ID_Materia = T1.IDMateria
	LEFT JOIN AULA T2 ON T1.IDMateria = T2.ID_Materia
WHERE T1.IDMateria = 2

UNION

SELECT
	NomeTurma AS 'TURMA',
	Ano AS 'ANO'
FROM TURMA
WHERE IDTurma = 1;


SELECT
	Tipo, 
	COUNT(*) AS Total_Alunos,
	NULL AS 'Tipo',
	NULL AS 'Total_Professores'
FROM ALUNO
GROUP BY Tipo

UNION ALL

SELECT 
	NULL,
	NULL,
	Tipo, 
	COUNT(*) AS Total_Professores
FROM PROFESSOR
GROUP BY Tipo;

+-------------------+-----------+
| ALUNO             | PRESENÇA  |
+-------------------+-----------+
| João Victor       | S         |
| Maria Luiza       | S         |
| Ana Silva         | S         |
| Carlos Santos     | S         |
| Lucas Oliveira    | S         |
| Fernanda Costa    | S         |
| Mateus Lima       | N         |
| Juliana Almeida   | N         |
| Gabriel Martins   | S         |
| Mariana Silva     | N         |
| Paulo Souza       | S         |
| Cristina Oliveira | S         |
| Rodrigo Santos    | N         |
| Aline Pereira     | S         |
| Fernando Oliveira | S         |
| Patrícia Lima     | S         |
| Rafaela Almeida   | N         |
| Vinicius Martins  | N         |
| Beatriz Silva     | S         |
| Ricardo Souza     | S         |
| Amanda Silva      | Português |
| 1A                | 2005      |
+-------------------+-----------+

+------+--------------+------+-------------------+
| Tipo | Total_Alunos | Tipo | Total_Professores |
+------+--------------+------+-------------------+
| CEL  |           10 | NULL |              NULL |
| RES  |           11 | NULL |              NULL |
| COM  |            9 | NULL |              NULL |
| NULL |         NULL | CEL  |                 5 |
| NULL |         NULL | COM  |                 2 |
| NULL |         NULL | RES  |                 2 |
+------+--------------+------+-------------------+
