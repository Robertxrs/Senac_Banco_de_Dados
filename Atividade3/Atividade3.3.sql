--  o usuário user_relatorio
CREATE USER 'user_relatorio'@'localhost' IDENTIFIED BY 'senha_do_usuario';


CREATE ROLE role_user_relatorio;

-- permissão SELECT em todas as tabelas da base de dados uc4atividades
GRANT SELECT ON uc4atividades.* TO role_user_relatorio;

--  role ao usuário user_relatorio
GRANT role_user_relatorio TO 'user_relatorio'@'localhost';

--  usuário user_funcionario
CREATE USER 'user_funcionario'@'localhost' IDENTIFIED BY 'senha_do_usuario';

-- role para o usuário user_funcionario
CREATE ROLE role_user_funcionario;

-- permissão SELECT, INSERT, UPDATE e DELETE nas tabelas venda, cliente e produto da base de dados uc4atividades
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.venda TO role_user_funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.cliente TO role_user_funcionario;
GRANT SELECT, INSERT, UPDATE, DELETE ON uc4atividades.produto TO role_user_funcionario;

-- role ao usuário user_funcionario
GRANT role_user_funcionario TO 'user_funcionario'@'localhost';
