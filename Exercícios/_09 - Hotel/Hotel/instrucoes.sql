	CREATE TABLE "tb_quarto"(
	"id_quarto" INTEGER,
	"tipo" TEXT NOT NULL,
	"preo_diaria" TEXT NOT NULL,
	"status" TEXT NOT NULL, 
	PRIMARY KEY ("id_quarto" AUTOINCREMENT)

);


	CREATE TABLE "tb_hospede"(
	"id_hospede" INTEGER,
	"nome" TEXT NOT NULL,
	"documento" INTEGER,
	"telefone" TEXT, 
	PRIMARY KEY ("id_hospede" AUTOINCREMENT)

);

	
	CREATE TABLE "tb_reserva"(
	"id_reserva" INTEGER,
	"id_quarto" INTEGER,
	"id_hospede" INTEGER,
	"data_entrada" TEXT NOT NULL, 
	"data_saida" TEXT NOT NULL,
	PRIMARY KEY ("id_reserva" AUTOINCREMENT),
	CONSTRAINT "id_quarto" FOREIGN KEY("id_quarto") REFERENCES "tb_quarto"("id_quarto"),
	CONSTRAINT "id_hospede" FOREIGN KEY("id_hospede") REFERENCES "tb_hospede"("id_hospede")

);



INSERT INTO tb_quarto (tipo, preo_diaria, status) 
VALUES
    ('Quarto Simples', '100.00', 'Disponível'),
    ('Quarto Simples', '100.00', 'Disponível'),
    ('Quarto Duplo', '150.00', 'Manutenção'),
    ('Quarto Duplo', '150.00', 'Manutenção'),
    ('Quarto Suíte', '200.00', 'Disponível'),
    ('Quarto Suíte', '200.00', 'Disponível'),
    ('Quarto Familiar', '250.00', 'Ocupado'),
    ('Quarto Familiar', '250.00', 'Ocupado');


INSERT INTO tb_hospede (nome, documento, telefone) 
VALUES
    ('João da Silva', 123456789, '987654321'),
    ('Maria Souza', 987654321, '123456789'),
    ('Carlos Oliveira', 567891234, '321456987'),
    ('Ana Santos', 345678912, '654987321'),
    ('Pedro Almeida', 789123456, '321987654'),
    ('Mariana Lima', 567891234, '987123456'),
    ('José Pereira', 234567891, '654321987'),
    ('Amanda Costa', 912345678, '987321654');

INSERT INTO tb_reserva (id_quarto, id_hospede, data_entrada, data_saida) 
VALUES
    (1, 1, '2022-01-01', '2022-01-03'),
    (2, 2, '2022-01-02', '2022-01-05'),
    (3, 3, '2022-01-03', '2022-01-06'),
    (4, 4, '2022-01-04', '2022-01-07'),
    (5, 5, '2022-01-05', '2022-01-08'),
    (6, 6, '2022-01-06', '2022-01-09'),
    (7, 7, '2022-01-07', '2022-01-10'),
    (8, 8, '2022-01-08', '2022-01-11'),
    (9, 1, '2022-01-09', '2022-01-12'),
    (10, 3, '2022-01-10', '2022-01-13');

SELECT * FROM tb_hospede WHERE documento = 567891234;

SELECT * FROM tb_hospede WHERE id_hospede= 1;


SELECT * FROM tb_quarto WHERE tipo = "Quarto Simples";
SELECT * FROM tb_quarto WHERE preo_diaria >= 200.00;

SELECT 
	tb_hospede.nome,
    tb_hospede.documento,
	tb_quarto.tipo,
	tb_quarto.preo_diaria,
	tb_quarto.status,
	tb_reserva.id_reserva,
	tb_reserva.data_entrada,
	tb_reserva.data_saida
	
	FROM tb_reserva
	
	INNER JOIN
			tb_quarto ON tb_reserva.id_reserva = tb_quarto.id_quarto
	INNER JOIN 
			tb_hospede ON tb_reserva.id_reserva = tb_hospede.id_hospede;


SELECT 
	tb_hospede.nome,
    tb_hospede.documento,
	tb_quarto.tipo,
	tb_quarto.preo_diaria,
	tb_quarto.status,
	tb_reserva.id_reserva,
	tb_reserva.data_entrada,
	tb_reserva.data_saida

	FROM tb_reserva
	
	INNER JOIN
			tb_quarto ON tb_reserva.id_reserva = tb_quarto.id_quarto
	INNER JOIN 
			tb_hospede ON tb_reserva.id_reserva = tb_hospede.id_hospede
			
	WHERE status = "Ocupado" GROUP BY id_reserva ORDER BY id_reserva 




UPDATE tb_reserva
SET data_saida = '2022-01-11'
WHERE id_reserva = 6;

UPDATE tb_reserva
SET data_saida = '2022-01-12'
WHERE id_reserva = 7;

UPDATE tb_reserva
SET data_saida = '2022-01-13'
WHERE id_reserva = 8;

UPDATE tb_reserva
SET data_saida = '2022-01-15'
WHERE id_reserva = 9;

UPDATE tb_reserva
SET data_saida = '2022-01-20'
WHERE id_reserva = 10;

UPDATE tb_quarto
SET status = "Ocupado"
WHERE id_quarto = 1;

UPDATE tb_quarto
SET status = "Ocupado"
WHERE id_quarto = 2;

UPDATE tb_quarto
SET status = "Ocupado"
WHERE id_quarto = 9;

UPDATE tb_quarto
SET status = "Ocupado"
WHERE id_quarto = 10;

UPDATE tb_quarto
SET status = "Ocupado"
WHERE id_quarto = 6;


DELETE FROM tb_reserva WHERE id_reserva= 1;

DELETE FROM tb_reserva WHERE id_reserva= 2;


DELETE FROM tb_reserva WHERE id_reserva= 3;


DELETE FROM tb_reserva WHERE id_reserva= 4;

DELETE FROM tb_reserva WHERE id_reserva= 5;




SELECT count(*) FROM tb_quarto WHERE status = "Disponível";