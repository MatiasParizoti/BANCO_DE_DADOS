CREATE TABLE flor (
    codigo INTEGER PRIMARY KEY,
    nome_cientifico TEXT NOT NULL,
    nome_popular TEXT NOT NULL,
    preco REAL NOT NULL
);

CREATE TABLE estoque_flores (
    codigo INTEGER PRIMARY KEY,
    quantidade INTEGER NOT NULL,
    cores_disponiveis TEXT NOT NULL,
    FOREIGN KEY(codigo) REFERENCES flor(codigo)
);

CREATE TABLE clientes (
    nome TEXT NOT NULL,
    CPF TEXT PRIMARY KEY,
    telefone TEXT NOT NULL,
    endereco_entrega TEXT NOT NULL
);

CREATE TABLE pedidos (
    numero_pedido INTEGER PRIMARY KEY,
    data_de_realizacao TEXT NOT NULL,
    valor_total REAL NOT NULL
);

-- Insert 10 records into the "clientes" table
INSERT INTO "clientes" ("nome", "CPF", "telefone", "endereco_entrega") VALUES
    ('João Silva', '111.222.333-44', '(11) 1234-5678', 'Rua A, 123'),
    ('Maria Oliveira', '222.333.444-55', '(22) 9876-5432', 'Avenida B, 456'),
    ('Carlos Pereira', '333.444.555-66', '(33) 5555-6666', 'Rua C, 789'),
    ('Ana Souza', '444.555.666-77', '(44) 8765-4321', 'Avenida D, 987'),
    ('Lucas Santos', '555.666.777-88', '(55) 2345-6789', 'Rua E, 543'),
    ('Fernanda Lima', '666.777.888-99', '(66) 4321-8765', 'Avenida F, 876'),
    ('Rodrigo Costa', '777.888.999-00', '(77) 9876-5432', 'Rua G, 234'),
    ('Camila Rocha', '888.999.000-11', '(88) 3456-7890', 'Avenida H, 678'),
    ('Gustavo Oliveira', '999.000.111-22', '(99) 6543-2109', 'Rua I, 123'),
    ('Juliana Mendes', '123.456.789-00', '(10) 9876-5432', 'Avenida J, 345');