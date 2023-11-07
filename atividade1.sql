USE hospital_robert;


SELECT *
FROM consulta
WHERE YEAR(data) = 2020 AND convenio_id IS NULL;

SELECT AVG(valor_consulta) AS valor_medio
FROM consulta
WHERE YEAR(data) = 2020 AND convenio_id IS NULL;

SELECT *
FROM consulta
WHERE YEAR(data) = 2020 AND convenio_id IS NOT NULL;

SELECT AVG(valor_consulta) AS valor_medio
FROM consulta
WHERE YEAR(data) = 2020 AND convenio_id IS NOT NULL;


SELECT *
FROM internacao
WHERE data_alta > data_pre_alta;

SELECT r.*
FROM receita r
JOIN (
    SELECT id
    FROM consulta
    ORDER BY data, hora
    LIMIT 1
) c ON r.receita_medic = c.id;


SELECT *
FROM consulta
WHERE convenio_id IS NULL
ORDER BY valor_consulta DESC
LIMIT 1;

SELECT *
FROM consulta
WHERE convenio_id IS NULL
ORDER BY valor_consulta ASC
LIMIT 1;


SELECT i.*, q.numero, (DATEDIFF(i.data_alta, i.data_entrada) + 1) * t.valor_diaria AS total_internacao
FROM internacao i
JOIN quarto q ON i.quarto_id = q.id
JOIN tipo_quarto t ON q.tipo_id = t.id;


SELECT i.data_entrada, i.procedimento, q.numero
FROM internacao i
JOIN quarto q ON i.quarto_id = q.id
JOIN tipo_quarto t ON q.tipo_id = t.id
WHERE t.descricao = 'Apartamento';


SELECT p.nome AS nome_paciente, c.data AS data_consulta, c.especialidade_desejada
FROM paciente p
JOIN consulta c ON p.id = c.paciente_id
WHERE TIMESTAMPDIFF(YEAR, p.data_nasc, c.data) < 18 AND c.especialidade_desejada != 'Pediatria'
ORDER BY c.data;


SELECT p.nome AS nome_paciente, m.nome AS nome_medico, i.data_entrada, i.procedimento
FROM paciente p
JOIN internacao i ON p.id = i.paciente_id
JOIN quarto q ON i.quarto_id = q.id
JOIN medico m ON i.enfermeiro_id = m.id
JOIN medico_especialista me ON m.id = me.id_medic
JOIN especialidade e ON me.id_especialidade = e.id
WHERE e.nome = 'gastroenterologia' AND q.tipo_id = (
    SELECT id
    FROM tipo_quarto
    WHERE descricao = 'Enfermaria'
);

SELECT m.nome, m.crm, COUNT(c.id) AS quantidade_consultas
FROM medico m
LEFT JOIN consulta c ON m.id = c.medico_id
GROUP BY m.id;

SELECT e.nome, e.cre, COUNT(i.id) AS numero_internacoes
FROM enfermeiro e
JOIN internacao i ON e.id = i.enfermeiro_id
GROUP BY e.id
HAVING COUNT(i.id) > 1;


SELECT p.nome AS nome_paciente, m.nome AS nome_medico, c.data AS data_consulta
FROM paciente p
JOIN consulta c ON p.id = c.paciente_id
JOIN medico m ON c.medico_id = m.id
JOIN medico_especialista me ON m.id = me.id_medic
JOIN especialidade e ON me.id_especialidade = e.id
WHERE p.convenio_id IS NOT NULL AND e.id = (
    SELECT id_especialidade
    FROM medico_especialista
    WHERE id_medic = m.id
)
LIMIT 0, 1000;

SELECT p.nome AS nome_paciente, m.nome AS nome_medico, c.data AS data_consulta
FROM paciente p
JOIN consulta c ON p.id = c.paciente_id
JOIN medico m ON c.medico_id = m.id
JOIN medico_especialista me ON m.id = me.id_medic
JOIN especialidade e ON me.id_especialidade = e.id
WHERE p.convenio_id IS NOT NULL AND e.id = (
    SELECT id_especialidade
    FROM medico_especialista
    WHERE id_medic = m.id
)
LIMIT 0, 1000;

