----------------------------------------- 3)

----------------------------------------- a)

SELECT
	Nome,
	Email,
	Cidade
FROM ALUNO
	LEFT JOIN ENDERECO ON IDEndereco = ID_Endereco
WHERE Cidade = 'Londrina';

----------------------------------------- b)

SELECT
	DiaSemana,
	OrdemAula,
	Nome
FROM SEMANA
	LEFT JOIN MATERIA ON ID_Materia = IDMateria
ORDER BY IDSemana;

----------------------------------------- c)

SELECT
	T0.DiaSemana AS 'DIA',
	T0.OrdemAula AS 'AULA',
	T1.Nome AS 'MATERIA',
	T2.Nome AS 'PROFESSOR'
FROM SEMANA T0
	INNER JOIN MATERIA T1 ON T0.ID_Materia = T1.IDMateria
	INNER JOIN PROFESSOR T2 ON T2.ID_Materia = T1.IDMateria
ORDER BY T0.IDSemana;

----------------------------------------- d)

SELECT
	IDMateria,
	Nome,
	IFNULL(Data, 'Sem Aula') AS Data
FROM MATERIA 
	LEFT OUTER JOIN AULA ON ID_Materia = IDMateria
ORDER BY 1;

----------------------------------------- e)

SELECT
    NomeTurma AS 'TURMA',
	Ano AS 'ANO'
FROM TURMA 
WHERE IDTurma IN (
    SELECT ID_Turma
    FROM ALUNO
    WHERE Nome = 'João Victor'
);


----------------------------------------- f)

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
	SUM(CargaHoraria) AS 'Total'
FROM MATERIA;

SELECT
	MAX(CargaHoraria) AS 'MaiorCargaHoraria',
	MIN(CargaHoraria) AS 'MenorCargaHoraria'
FROM MATERIA;


----------------------------------------- g)

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

----------------------------------------- h)

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


SELECT 
	IDAluno, 
	Nome,
	NomeTurma
FROM ALUNO
	LEFT JOIN TURMA ON ID_Turma = IDTurma

INTERSECT

SELECT 
	IDAluno, 
	Nome,
	NomeTurma
FROM ALUNO
	LEFT JOIN TURMA ON ID_Turma = IDTurma
WHERE Representante = 'S'
ORDER BY NomeTurma;


-- O MySQL não aceita a função "Minus", então tentei fazer algo parecido com outra função
SELECT 
	IDAluno, 
	Nome
FROM ALUNO
WHERE IDAluno IN (
	SELECT IDAluno FROM ALUNO WHERE IDAluno NOT IN (SELECT ID_Aluno FROM CHAMADA)
	);





