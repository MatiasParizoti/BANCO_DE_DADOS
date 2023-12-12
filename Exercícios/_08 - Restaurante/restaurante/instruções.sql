1)
/////////////////////
2/3)
CREATE TABLE tb_prodtudo (
    produto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    tipo TEXT,
    preco TEXT,
	descricao TEXT
),

CREATE TABLE tb_mesas (
    mesa_id INTEGER PRIMARY KEY AUTOINCREMENT,
    numero TEXT NOT NULL,
    capacidade TEXT
);
CREATE TABLE tb_pedidos (
    pedido_id INTEGER PRIMARY KEY AUTOINCREMENT,
    mesa_id TEXT NOT NULL,
    produto_id TEXT,
    quantidade TEXT,
	total TEXT,
	FOREIGN KEY (produto_id) REFERENCES tb_produto (produto_id),
    FOREIGN KEY (mesa_id) REFERENCES tb_mesas (mesa_id)
);

/////////////////////
4)
INSERT INTO tb_produto(nome, tipo, preco,descricao)
 VALUES

    ('café gelado', 'bebidas', '20R$','500ml'),
    ('Bolo do Souza', 'sobremesa', '20R$','200g'),
    ('Roscquinha', 'sobremesa', '20R$','chocolate'),
    ('sorvete', 'sobremesa', '20R$','morango'),
    ('agua', 'bebidas', '20R$','1L'),
    ('café quente', 'bebidas', '20R$','500ml'),
    ('hamburguer', 'lanches', '20R$','vegano'),
    ('sucos', 'bebidas', '20R$','abacaxi');


INSERT INTO tb_mesas(numero, capacidade)
 VALUES

    ('3', '4' ),
    ('5', '6'),
    ('23', '4'),
    ('132', '5'),
    ('5', '2'),
    ('7', '4'),
    ('35', '4'),
    ('64', '5');

INSERT INTO tb_pedidos(mesa_id, produto_id,quantidade,total)
 VALUES
	(1,1,2,43),
    (2,2,2,21),
	(3,3,1,12),
	(4,4,3,15),
	(5,5,56,874),
	(6,6,21,34),
	(7,7,1,12),
	(8,8,3,1);
/////////////////////
5)
SELECT * FROM tb_produto WHERE nome = "sorvete";

SELECT * FROM tb_mesas WHERE numero= "3";

SELECT nome,tipo,preco FROM tb_produto ;
/////////////////////
6)
SELECT * FROM tb_mesas WHERE capacidade = "4";
SELECT * FROM tb_mesas WHERE capacidade > "3";
/////////////////////
7)
SELECT 
	tb_produto.nome,
	tb_produto.tipo,
	tb_produto.preco,
	tb_mesas.numero,
	tb_mesas.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.total

	FROM 
		tb_pedidos
	INNER JOIN 
		tb_produto ON tb_produto.produto_id = tb_pedidos.produto_id
	INNER JOIN 
		tb_mesas ON tb_mesas.mesa_id = tb_pedidos.mesa_id;

/////////////////////
8)
SELECT 
	tb_produto.nome,
	tb_produto.tipo,
	tb_produto.preco,
	tb_mesas.numero,
	tb_mesas.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.total

	FROM 
		tb_pedidos
	INNER JOIN 
		tb_produto ON tb_produto.produto_id = tb_pedidos.produto_id
	INNER JOIN 
		tb_mesas ON tb_mesas.mesa_id = tb_pedidos.mesa_id
		WHERE
		tb_pedidos.total = '3R$'
/////////////////////
9)
SELECT 
	tb_produto.nome,
	tb_produto.tipo,
	tb_produto.preco,
	tb_mesas.numero,
	tb_mesas.capacidade,
	tb_pedidos.pedido_id,
	tb_pedidos.quantidade,
	tb_pedidos.total

	FROM 
		tb_pedidos
	INNER JOIN 
		tb_produto ON tb_produto.produto_id = tb_pedidos.produto_id
	INNER JOIN 
		tb_mesas ON tb_mesas.mesa_id = tb_pedidos.mesa_id
		WHERE
		tb_pedidos.quantidade > 5
/////////////////////
10)
UPDATE tb_produto
		SET nome = 'agua com gás'
		WHERE produto_id = 2;


UPDATE tb_produto
		SET descricao = '2L'
		WHERE produto_id = 2;


UPDATE tb_produto
		SET preco = '30R$'
		WHERE produto_id = 2;


UPDATE tb_produto
		SET tipo = 'bebidas'
		WHERE produto_id = 2;

UPDATE tb_produto
		SET tipo = 'sobremesa'
		WHERE produto_id = 5;
/////////////////////
11)

UPDATE tb_mesas
		SET capacidade = '2'
		WHERE mesa_id = 2;

UPDATE tb_mesas
		SET capacidade = '5'
		WHERE mesa_id = 1;

UPDATE tb_mesas
		SET capacidade = '10'
		WHERE mesa_id = 5;

UPDATE tb_mesas
		SET numero= '2'
		WHERE mesa_id = 2;


UPDATE tb_mesas
		SET numero= '12'
		WHERE mesa_id = 8;
/////////////////////
12)

DELETE FROM tb_pedidos WHERE mesa_id = "1"


DELETE FROM tb_pedidos WHERE quantidade= "3"

DELETE FROM tb_pedidos WHERE produto_id = "1"

DELETE FROM tb_pedidos WHERE total = "20"

DELETE FROM tb_pedidos WHERE pedido_id = "5"



////////////////////////////////////////////////
novos comandos
Sum:
SELECT sum(total)AS "Valor Total dos Pedidos" FROM tb_pedido;

Count:
SELECT count(produto_id) FROM tb_produtos;

Between:
SELECT * FROM tb_mesa WHERE mesa_id BETWEEN 2 AND 5;

Order by:
SELECT * FROM tb_produtos ORDER BY descricao ASC;



