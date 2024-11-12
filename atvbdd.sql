1. Listar alunos ordenados por nome e data de nascimento
SELECT nome, data_nascimento
FROM alunos
ORDER BY nome ASC, data_nascimento ASC;
2. Listar professores e suas especialidades em ordem decrescente
SELECT nome, especialidade
FROM professores
ORDER BY nome DESC;
3. Listar disciplinas ordenadas por carga horária
SELECT nome, carga_horaria
FROM disciplinas
ORDER BY carga_horaria DESC;
4. Contar o número de alunos em cada status de matrícula
SELECT status_matricula, COUNT(*) AS numero_de_alunos
FROM alunos
GROUP BY status_matricula;
5. Listar cursos com a soma total da carga horária de suas disciplinas
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total
FROM cursos c
JOIN disciplinas d ON c.id = d.id_curso
GROUP BY c.nome;
6. Contar quantos professores estão lecionando mais de 3 turmas
SELECT p.nome
FROM professores p
JOIN turmas t ON p.id = t.id_professor
GROUP BY p.nome
HAVING COUNT(t.id) > 3;
7. Listar os alunos matriculados em mais de uma disciplina
SELECT a.nome, COUNT(ma.id_disciplina) AS disciplinas
FROM alunos a
JOIN matriculas ma ON a.id = ma.id_aluno
GROUP BY a.nome
HAVING COUNT(ma.id_disciplina) > 1
ORDER BY disciplinas DESC;
8. Listar cursos com mais de 2000 horas de carga horária
SELECT c.nome AS curso, SUM(d.carga_horaria) AS carga_horaria_total
FROM cursos c
JOIN disciplinas d ON c.id = d.id_curso
GROUP BY c.nome
HAVING SUM(d.carga_horaria) > 2000;
9. Contar o número total de turmas e listar por professor
SELECT p.nome AS professor, COUNT(t.id) AS numero_de_turmas
FROM professores p
JOIN turmas t ON p.id = t.id_professor
GROUP BY p.nome
ORDER BY numero_de_turmas DESC;
10. Listar disciplinas e a média da carga horária por curso
SELECT c.nome AS curso, AVG(d.carga_horaria) AS carga_horaria_media
FROM cursos c
JOIN disciplinas d ON c.id = d.id_curso
GROUP BY c.nome;
11. Exibir os alunos e seus respectivos status de matrícula, ordenados pelo status e pela data de matrícula
SELECT a.nome, a.status_matricula, a.data_matricula
FROM alunos a
ORDER BY a.status_matricula, a.data_matricula DESC;
12. Exibir a idade dos alunos ordenados da maior para a menor idade
SELECT nome, TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM alunos
ORDER BY idade DESC;
13. Exibir as disciplinas e o número de alunos matriculados em cada uma
SELECT d.nome AS disciplina, COUNT(ma.id_aluno) AS numero_de_alunos
FROM disciplinas d
JOIN matriculas ma ON d.id = ma.id_disciplina
GROUP BY d.nome
ORDER BY numero_de_alunos DESC;
14. Listar as turmas com o nome dos professores e disciplinas, ordenadas por horário
SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM turmas t
JOIN professores p ON t.id_professor = p.id
JOIN disciplinas d ON t.id_disciplina = d.id
ORDER BY t.horario;
15. Contar quantas disciplinas têm carga horária superior a 80 horas
SELECT COUNT(*) AS disciplinas_com_mais_80h
FROM disciplinas
WHERE carga_horaria > 80;
16. Listar os cursos e a quantidade de disciplinas que cada curso possui
SELECT c.nome AS curso, COUNT(d.id) AS numero_de_disciplinas
FROM cursos c
JOIN disciplinas d ON c.id = d.id_curso
GROUP BY c.nome;
17. Exibir os professores que têm mais de 2 disciplinas com carga horária superior a 100 horas
SELECT p.nome
FROM professores p
JOIN disciplinas d ON p.id = d.id_professor
WHERE d.carga_horaria > 100
GROUP BY p.nome
HAVING COUNT(d.id) > 2;
18. Listar disciplinas que tenham pelo menos 5 alunos matriculados
SELECT d.nome
FROM disciplinas d
JOIN matriculas ma ON d.id = ma.id_disciplina
GROUP BY d.nome
HAVING COUNT(ma.id_aluno) >= 5;
19. Exibir o número de alunos por status, ordenando pelos status com mais alunos
SELECT status_matricula, COUNT(*) AS numero_de_alunos
FROM alunos
GROUP BY status_matricula
ORDER BY numero_de_alunos DESC;
20. Listar professores e a soma da carga horária das disciplinas que lecionam
SELECT p.nome AS professor, SUM(d.carga_horaria) AS carga_horaria_total
FROM professores p
JOIN disciplinas d ON p.id = d.id_professor
GROUP BY p.nome
ORDER BY carga_horaria_total DESC;