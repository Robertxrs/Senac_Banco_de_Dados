use atividade31;

/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/
explain SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D';

/***script ajustado**/
CREATE INDEX idx_venda_tipo_pagamento ON venda (tipo_pagamento);
EXPLAIN SELECT v.data AS data_da_venda, v.valor_total, p.nome AS nome_produto, iv.quantidade, iv.valor_unitario,
c.nome AS nome_cliente, c.cpf, c.telefone
FROM venda v INNER JOIN item_venda iv ON v.id = iv.venda_id
INNER JOIN produto p ON p.id = iv.produto_id
INNER JOIN cliente c ON c.id = v.cliente_id WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/
explain SELECT * FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%';
 
/***script ajustado***/
CREATE INDEX idx_produto_fabricante ON produto (fabricante);
EXPLAIN SELECT p.nome AS nome_produto, iv.quantidade, v.data AS data_da_venda
FROM produto p
INNER JOIN item_venda iv ON p.id = iv.produto_id
INNER JOIN venda v ON v.id = iv.venda_id
WHERE p.fabricante = 'lar'
ORDER BY p.nome;

/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
explain SELECT SUM(iv.subtotal), SUM(iv.quantidade) FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome;

/***script ajustado***/
CREATE INDEX idx_cliente_id ON cliente (id);
CREATE INDEX idx_venda_cliente_id ON venda (cliente_id);
CREATE INDEX idx_produto_id ON produto (id);
EXPLAIN SELECT c.nome AS nome_cliente, p.nome AS nome_produto,
SUM(iv.subtotal) AS valor_total_vendas, SUM(iv.quantidade) AS quantidade_total
FROM cliente c INNER JOIN venda v ON c.id = v.cliente_id
INNER JOIN item_venda iv ON v.id = iv.venda_id
INNER JOIN produto p ON p.id = iv.produto_id
GROUP BY c.nome, p.nome
ORDER BY c.nome, p.nome;



