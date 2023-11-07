USE hospital_robert;

CREATE TABLE convenio (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cnpj VARCHAR(30) NOT NULL,
    tempo_carencia TIME NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE tipo_quarto (
    id INT NOT NULL AUTO_INCREMENT, 
    valor_diaria DECIMAL(10) NOT NULL,
    descricao VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE especialidade (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50),
    PRIMARY KEY (id)
);

CREATE TABLE medico (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(120) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(12) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE paciente (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    data_nasc DATETIME NOT NULL,
    rg VARCHAR(45) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(12) NOT NULL,
    endereco VARCHAR(45) NOT NULL,
    email VARCHAR(255),
    convenio_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (convenio_id) REFERENCES convenio (id)
);

CREATE TABLE quarto (
    id INT NOT NULL AUTO_INCREMENT,
    numero VARCHAR(10) NOT NULL,
    paciente_id INT NOT NULL,
    tipo_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (paciente_id) REFERENCES paciente (id),
    FOREIGN KEY (tipo_id) REFERENCES tipo_quarto (id)
);

CREATE TABLE enfermeiro (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    cre VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE internacao (
    id INT NOT NULL AUTO_INCREMENT,
    data_entrada DATE NOT NULL,
    data_pre_alta DATE,
    data_alta DATETIME NOT NULL,
    procedimento VARCHAR(255) NOT NULL,
    enfermeiro_id INT,
    quarto_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro (id),
    FOREIGN KEY (quarto_id) REFERENCES quarto (id)
);

CREATE TABLE consulta (
    id INT NOT NULL AUTO_INCREMENT,
    data DATETIME NOT NULL,
    hora TIME NOT NULL,
    valor_consulta REAL NOT NULL,
    numero_carterinha VARCHAR(45) NOT NULL,
    especialidade_desejada VARCHAR(45) NOT NULL,
    medico_id INT NOT NULL,
    paciente_id INT NOT NULL,
    convenio_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (medico_id) REFERENCES medico (id),
    FOREIGN KEY (paciente_id) REFERENCES paciente (id),
    FOREIGN KEY (convenio_id) REFERENCES convenio (id)
);

CREATE TABLE medico_especialista (
    id_medic INT NOT NULL,
    id_especialidade INT NOT NULL,
    FOREIGN KEY (id_medic) REFERENCES medico (id),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade (id)
);

CREATE TABLE receita (
    id INT NOT NULL AUTO_INCREMENT,
    receita_medic INT NOT NULL,
    receita varchar(255) not null,
    PRIMARY KEY (id),
    FOREIGN KEY (receita_medic) REFERENCES consulta (id)
);
ALTER TABLE receita
ADD receita VARCHAR(400) NOT NULL AFTER id;