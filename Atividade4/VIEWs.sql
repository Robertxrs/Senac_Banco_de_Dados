use atividade31;

/***Criação da view vendas_pagas_dinheiro_view***/
CREATE VIEW vendas_pagas_dinheiro_view AS
SELECT v.data AS data_da_venda, v.valor_total,
p.nome AS nome_produto, iv.quantidade, iv.valor_unitario,
c.nome AS nome_cliente, c.cpf, c.telefone FROM venda v
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON p.id = iv.produto_id
JOIN cliente c ON c.id = v.cliente_id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;
EXPLAIN SELECT * FROM vendas_pagas_dinheiro_view;

/***Criação da view vendas_por_fabricante_view***/
CREATE VIEW vendas_por_fabricante_view AS
SELECT p.nome AS nome_produto, iv.quantidade, v.data AS data_da_venda
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON v.id = iv.venda_id
WHERE p.fabricante = 'lar'
ORDER BY p.nome;
EXPLAIN SELECT * FROM vendas_por_fabricante_view;

/***Criação da view vendas_por_cliente_view***/
CREATE VIEW vendas_por_cliente_view AS
SELECT c.nome AS nome_cliente, p.nome AS nome_produto,
SUM(iv.subtotal) AS valor_total_vendas, SUM(iv.quantidade) AS quantidade_total
FROM cliente c
JOIN venda v ON c.id = v.cliente_id
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON p.id = iv.produto_id
GROUP BY c.nome, p.nome
ORDER BY c.nome, p.nome;
EXPLAIN SELECT * FROM vendas_por_cliente_view;
