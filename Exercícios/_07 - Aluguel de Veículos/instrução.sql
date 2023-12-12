1)
criei la meu chapa ;)
----------------------------------------------------------------
2-3)
CREATE TABLE "tb_cliente" (
	"cliente_id"	INTEGER,
	"nome"	TEXT NOT NULL,
	"cnh"	TEXT,
	"telefone"	TEXT,
	PRIMARY KEY("cliente_id" AUTOINCREMENT)
);
CREATE TABLE "tb_veiculo" (
	"veiculo_id"	INTEGER,
	"modelo"	TEXT NOT NULL,
	"ano"	TEXT NOT NULL,
	"placa"	TEXT NOT NULL,
	"disponibilidade"	TEXT NOT NULL,
	PRIMARY KEY("veiculo_id" AUTOINCREMENT)
);
CREATE TABLE "tb_aluguel" (
	"aluguel_id"	INTEGER,
	"data_inicio"	TEXT NOT NULL,
	"data_fim"	TEXT NOT NULL,
	"cliente_id"  INTEGER NOT NULL,
	"veiculo_id"	INTEGER NOT NULL,
	PRIMARY KEY("aluguel_id" AUTOINCREMENT)
	CONSTRAINT "cliente_id" FOREIGN KEY("cliente_id") REFERENCES "tb_cliente"("cliente_id")
	CONSTRAINT "veiculo_id" FOREIGN KEY("veiculo_id") REFERENCES "tb_veiculo"("veiculo_id")
);

----------------------------------------------------------------
4)
INSERT INTO tb_cliente(nome, cnh, telefone )
VALUES
    ('Leandro',     'cl328nr',    '9-9210-6384'),
	('Adriano',    '0ch9u43h8',   '9-4366-6384'),
	('José',       'fu3njnu32',   '9-9210-6224'),
	('Lindomar',   '3nu2nf912',   '9-9343-6334'),
	('Alice',      'c392u4',      '9-9990-6444'),
	('Vanessa',    'cn3283r5j',   '9-3310-6384'),
	('Livia',      'c4n3843',     '9-9240-6384'),
	('Maria Clara', 'cj34ncj3',   '9-9210-6312'),
	('Igor',       'c9n382',      '9-9210-6384'),
    ('Mariana',    'c3i204hf',    '9-9590-6224');
    
    INSERT INTO tb_veiculo(modelo, ano, placa,disponibilidade )
VALUES
    ('Fiat Uno',          '3/04/2015',    'ABC-1234', 'disponível'),
	('Ford K',            '3/04/2016',   'DEF-2345' , 'alugado'),
	('Volkswagen Gol',    '3/04/2017',   'GHI-3456', 'disponível'),
	('Chevrolet',         '3/04/2018',   'JKF-4567', 'alugado'),
	('Honda',             '3/04/2019',      'GUV-5678', 'disponível'),
	('Toyota',            '3/04/2020',   'WYZ-6789', 'alugado'),
	('Hyundai',           '3/04/2021',     'MNJ-7890' ,'disponível'),
	('Renaolt',           '3/04/2022',   'MSN-8901', 'alugado'),
	('Nissan',            '3/04/2023',      'IOL-7598', 'disponível'),
    ('Peugeot',           '3/04/2024',    'GAY-3425', 'alugado');
    
    INSERT INTO tb_aluguel (data_inicio, data_fim, cliente_id, veiculo_id)
VALUES
    ('21/08/1990', '22/10/2015', 1, 2),
	('2/06/1990', '28/10/2015', 2, 3),
	('1/04/1990', '24/10/2015', 3, 4),
	('6/03/1990', '20/10/2015', 4, 5),
	('9/02/1990', '10/10/2015', 5, 6),
	('11/01/1990', '30/10/2015', 6, 7),
	('22/07/1990', '23/10/2015', 7, 8),
	('24/09/1990', '26/10/2015', 8, 9),
	('26/10/1990', '31/10/2015', 9, 10),
	('16/12/1990', '21/10/2015', 10, 1);

----------------------------------------------------------------
5)

- SELECT * FROM tb_cliente WHERE telefone = "9-3310-6384"
- SELECT * FROM tb_cliente WHERE cnh = "c9n382"
- SELECT nome,cnh FROM tb_cliente; 
----------------------------------------------------------------
6)
- SELECT * FROM tb_veiculo WHERE ano = "3/04/2017"
- SELECT * FROM tb_veiculo WHERE veiculo_id = 2
- SELECT * FROM tb_veiculo WHERE disponibilidade = "alugado"
----------------------------------------------------------------
7)
SELECT 
		tb_cliente.nome,
		tb_cliente.cnh, 
		
		tb_veiculo.modelo, 
		tb_veiculo.placa, 
		tb_veiculo.disponibilidade, 
		
		tb_aluguel.aluguel_id,
		tb_aluguel.data_inicio,
		tb_aluguel.data_fim

	FROM 
		tb_aluguel
	INNER JOIN 
		tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
	INNER JOIN 
		tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id;

----------------------------------------------------------------
8)
SELECT 
		tb_cliente.nome,
		tb_cliente.cnh, 
		
		tb_veiculo.modelo, 
		tb_veiculo.placa, 
		tb_veiculo.disponibilidade, 
		
		tb_aluguel.aluguel_id,
		tb_aluguel.data_inicio,
		tb_aluguel.data_fim

	FROM 
		tb_aluguel
	INNER JOIN 
		tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
	INNER JOIN 
		tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
	WHERE
		tb_veiculo.disponibilidade = "disponivel";


----------------------------------------------------------------
9)
SELECT 
		tb_cliente.nome,
		tb_cliente.cnh, 
		
		tb_veiculo.modelo, 
		tb_veiculo.placa, 
		tb_veiculo.disponibilidade, 
		
		tb_aluguel.aluguel_id,
		tb_aluguel.data_inicio,
		tb_aluguel.data_fim

	FROM 
		tb_aluguel
	INNER JOIN 
		tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
	INNER JOIN 
		tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
	WHERE
		tb_veiculo.disponibilidade = "alugado";

----------------------------------------------------------------
10)
	UPDATE tb_cliente
	SET nome = 'renan'
	WHERE cliente_id = 5;
	
	UPDATE tb_cliente
	SET nome = 'matheus'
	WHERE cliente_id = 6;
	
	UPDATE tb_cliente
	SET nome = 'nunes'
	WHERE cliente_id = 7;
	
	UPDATE tb_cliente
	SET nome = 'joão'
	WHERE cliente_id = 8;
	
	UPDATE tb_cliente
	SET nome = 'marcelo'
	WHERE cliente_id = 9;
----------------------------------------------------------------
11)
	UPDATE tb_veiculo
	SET modelo = 'Gol'
	WHERE veiculo_id = 5;
	
	UPDATE tb_veiculo
	SET modelo = 'Gol Azul'
	WHERE veiculo_id = 6;
	
	UPDATE tb_veiculo
	SET modelo = 'Gol Amarelo'
	WHERE veiculo_id = 7;
	
	UPDATE tb_veiculo
	SET modelo = 'Gol Vermelho'
	WHERE veiculo_id = 8;
	
	UPDATE tb_veiculo
	SET modelo = 'Gol Verde'
	WHERE veiculo_id = 9;
----------------------------------------------------------------
12)
	UPDATE tb_aluguel
	SET data_inicio = '26/10/1990'
	WHERE aluguel_id = 5;
	
	UPDATE tb_aluguel
	SET data_inicio = '27/10/1990'
	WHERE aluguel_id = 6;
	
	UPDATE tb_aluguel
	SET data_inicio = '28/10/1990'
	WHERE aluguel_id = 7;
	
	UPDATE tb_aluguel
	SET data_inicio = '29/10/1990'
	WHERE aluguel_id = 8;
	
	UPDATE tb_aluguel
	SET data_inicio = '30/10/1990'
	WHERE aluguel_id = 9;