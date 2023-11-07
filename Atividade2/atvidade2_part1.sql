use hospital_robert;

INSERT INTO especialidade (nome) VALUES
("Pediatria"),
('Clínico Geral'),
('Gastroenterologia'),
('Neurologia'),
('Cardiologia'),
('Oftalmologia'),
('Ortopedia'),
('Urologia'),
("Dermatologia");

INSERT INTO tipo_quarto (valor_diaria, descricao) VALUES
(100.00, 'Apartamento'),
(80.00, 'Quarto Duplo'),
(50.00, 'Enfermaria');

INSERT INTO medico (nome, endereco, telefone, email) VALUES
('Dr. João Silva', 'Rua A, 123', '00 9999-9999', 'joao.silva@gmail.com'),
('Dr. Melissa Cardozo', 'Rua B, 500', '00 9999-9999', 'melissa.cardozo@gmail.com'),
('Dr. Leticia Queiroz', 'Rua C, 203', '00 9999-9999', 'leticia.queiroz@gmail.com'),
('Dr. João Martins', 'Rua D, 726', '00 9999-9999', 'joao.martins@gmail.com'),
('Dr. Jorge Henrique', 'Rua E, 155', '00 9999-9999', 'henrique.jorge@gmail.com'),
('Dr. Ricardo Nascimento', 'Rua F, 4654', '00 9999-9999', 'ricardo.nascimento@gmail.com'),
('Dr. Matheus Santos', 'Rua G, 1023', '00 9999-9999', 'matheus.santos@gmail.com'),
('Dr. Cristina Silva', 'Rua H, 489', '00 9999-9999', 'cristina.silva@gmail.com'),
('Dr. Maria Santos', 'Rua I, 315', '00 9999-9999', 'maria.santos@gmail.com'),
('Dr. Pedro Rocha', 'Rua K, 789', '00 9999-9999', 'pedro.rocha@gmail.com');

INSERT INTO convenio (nome, cnpj, tempo_carencia) VALUES
('Convênio 1', '12345678901234', '24'),
('Convênio 2', '98765432109876', '36'),
('Convênio 3', '45678901234567', '48'),
('Convênio 4', '65467845678994', '48'),
('Convênio 5', '56672315966231', '24'),
('Convênio 6', '79987213154568', '48');

INSERT INTO paciente (nome, data_nasc, rg, cpf, telefone, endereco, email, convenio_id) VALUES
('Ana Oliveira', '1990-05-10', '12345678', '12345678901', '11112222', 'Av.Caze, 789', 'ana.oliveira@gmail.com',1),
('Carlos Santos', '1985-09-15', '87654321', '98765432109', '33334444', 'Av.Morais, 321', 'carlos.santos@gmail.com',3),
('Laura Silva', '1990-03-15', '123456789', '98765432101', '987654321', 'Rua das Flores, 123', 'laura.silva@example.com', 5),
('Rafael Santos', '1985-09-25', '987654321', '12345678901', '123456789', 'Avenida dos Sonhos, 456', 'rafael.santos@example.com', 4),
('Carolina Oliveira', '1992-07-10', '654321987', '10293847562', '456789123', 'Rua das Estrelas, 789', 'carolina.oliveira@example.com', 6),
('Mariana Costa', '1988-12-03', '789654123', '19283746501', '789123456', 'Avenida das Maravilhas, 789', 'mariana.costa@example.com', 3),
('Rodrigo Almeida', '1995-06-20', '321987654', '56789012301', '321456789', 'Rua dos Sonhos, 456', 'rodrigo.almeida@example.com', 1),
('Leticia Santos', '1993-02-08', '987123654', '10928374650', '654789123', 'Avenida das Flores, 789', 'leticia.santos@example.com', 4),
('Gustavo Lima', '1991-11-17', '456987123', '51234567890', '987123456', 'Rua das Maravilhas, 123', 'gustavo.lima@example.com', 2),
('Mariana Lima', '1992-03-20', '65432178', '45678901234', '5555-6666', 'Av.Salmo, 567', 'mariana.lima@gmail.com',5);

INSERT INTO consulta (data, hora, valor_consulta, numero_carterinha, especialidade_desejada, medico_id, paciente_id, convenio_id)
VALUES
('2021-04-20', '09:00:00', 150.00, '12345', 'Pediatria', 1, 1, 5),
('2021-06-10', '14:30:00', 200.00, '54321', 'Clínico Geral', 6, 3, 2),
('2018-07-31', '11:50:00', 200.00, '98765', 'Neurologia', 10, 6, 4),
('2019-05-05', '16:45:00', 220.00, '24680', 'Gastroenterologia', 4, 4, 3),
('2022-11-30', '10:30:00', 190.00, '13579', 'Clínico Geral', 5, 3, 4),
('2019-08-22', '13:00:00', 150.00, '86420', 'Oftalmologia', 6, 8, 2),
('2021-04-05', '15:45:00', 200.00, '97531', 'Dermatologia', 7, 2, 1),
('2020-09-18', '12:30:00', 180.00, '24680', 'Gastroenterologia', 8, 9, 3),
('2018-12-26', '16:00:00', 220.00, '86420', 'Ortopedia', 9, 7, 4),
('2022-04-14', '9:15:00', 190.00, '13579', 'Oftalmologia', 10, 10, 1);

INSERT INTO receita (receita, receita_medic) VALUES
('Paracetamol 500mg - 1 comprimido a cada 6 horas', 1),
('Ibuprofeno 400mg - 1 comprimido a cada 8 horas', 1),
('Dipirona 500mg - 1 comprimido a cada 6 horas', 4),
('Omeprazol 20mg - 1 comprimido ao dia', 4),
('Creme hidratante para pele seca - Aplicar 2 vezes ao dia', 7),
('Sabonete líquido suave para pele sensível - Usar durante o banho', 7),
('Dipirona 500mg - 1 comprimido a cada 6 horas', 6),
('Dipirona 500mg - 1 comprimido a cada 12 horas', 2),
('Paracetamol 500mg - 1 comprimido a cada 8 horas', 3);

INSERT INTO quarto (numero, tipo_id,paciente_id) VALUES
('101', 1,2),
('102', 3,3),
('126', 2,7),
('201', 2,6);

-- Povoamento da tabela de internações
INSERT INTO internacao (data_entrada, data_pre_alta, data_alta, procedimento, enfermeiro_id, quarto_id)
VALUES
('2021-02-01', '2021-02-10', '2021-02-15', 'Cirurgia', 1, 1),
('2021-03-15', '2021-03-30', '2021-04-02', 'Tratamento', 1, 2),
('2021-03-3', '2021-04-29', '2021-04-02', 'Cirurgia', 2, 1),
('2021-03-25', '2021-06-21', '2021-04-02', 'Tratamento', 3, 3),
('2021-03-19', '2021-05-24', '2021-04-02', 'Cirurgia', 4, 4),
('2021-03-16', '2022-02-2', '2021-04-02', 'Tratamento', 2, 2),
('2022-01-10', '2022-01-20', '2022-01-25', 'Cirurgia', 4, 3);

-- Povoamento da tabela de enfermeiros
INSERT INTO enfermeiro (nome, cpf, cre) VALUES
('Raquel', '12345678901', '12345'),
('Ricardo', '98765432109', '54321'),
('Leticia', '46574321546', '79845'),
('Henrique', '45678901234', '67890');

UPDATE internacao SET enfermeiro_id = 1 WHERE id IN (1, 4);
UPDATE internacao SET enfermeiro_id = 2 WHERE id IN (2, 5);
UPDATE internacao SET enfermeiro_id = 3 WHERE id IN (3, 6);
UPDATE internacao SET enfermeiro_id = 4 WHERE id = 7;

UPDATE paciente SET convenio_id = 1 WHERE id IN (1, 2, 3);
UPDATE paciente SET convenio_id = 2 WHERE id IN (4, 5);
UPDATE paciente SET convenio_id = 3 WHERE id IN (6, 7, 8);
UPDATE paciente SET convenio_id = 4 WHERE id IN (9, 10);

UPDATE consulta SET convenio_id = 1 WHERE id IN (1, 3, 6, 7, 10);
UPDATE consulta SET convenio_id = 2 WHERE id IN (2, 5);
UPDATE consulta SET convenio_id = 3 WHERE id = 4;
UPDATE consulta SET convenio_id = 4 WHERE id = 8;

