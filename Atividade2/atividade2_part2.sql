ALTER TABLE medico MODIFY em_atividade ENUM('sim', 'não');
UPDATE medico SET em_atividade = 'sim' WHERE id IN (1, 2, 3);
UPDATE medico SET em_atividade = 'não' WHERE id NOT IN (1, 2, 3);

UPDATE internacao
JOIN quarto ON internacao.quarto_id = quarto.id
JOIN tipo_quarto ON quarto.tipo_id = tipo_quarto.id
SET internacao.data_alta = DATE_ADD(internacao.data_entrada, INTERVAL 3 DAY)
WHERE tipo_quarto.descricao = 'Enfermaria';

DELETE FROM consulta
WHERE convenio_id = (
    SELECT MAX(id) FROM convenio
);
DELETE FROM convenio
WHERE id = (
    SELECT id
    FROM (
        SELECT MAX(id) AS id
        FROM convenio
    ) AS subquery
);
