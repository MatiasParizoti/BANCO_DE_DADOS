-- Tabela para armazenar informações dos passageiros
CREATE TABLE Passageiro (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    DataNascimento DATE,
    Telefone1 VARCHAR(15),
    Telefone2 VARCHAR(15),
    Rua VARCHAR(100),
    Numero INT,
    CEP VARCHAR(10),
    Complemento VARCHAR(50),
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    Estado VARCHAR(2)
);

-- Tabela para armazenar informações das rotas
CREATE TABLE Rota (
    CodigoRota INT PRIMARY KEY,
    Origem VARCHAR(50),
    Destino VARCHAR(50)
);

-- Tabela para armazenar informações dos voos
CREATE TABLE Voo (
    NumeroVoo INT PRIMARY KEY,
    CodigoRota INT,
    HorarioPartida DATETIME,
    HorarioChegada DATETIME,
    AviaoDesignado VARCHAR(50),
    FOREIGN KEY (CodigoRota) REFERENCES Rota(CodigoRota)
);

-- Tabela para armazenar informações das reservas
CREATE TABLE Reserva (
    NumeroReserva INT PRIMARY KEY,
    CPFPassageiro VARCHAR(11),
    NumeroVoo INT,
    NumeroAssento INT,
    FOREIGN KEY (CPFPassageiro) REFERENCES Passageiro(CPF),
    FOREIGN KEY (NumeroVoo) REFERENCES Voo(NumeroVoo)
);
-- Inserção de dados na tabela Passageiro
INSERT INTO Passageiro (CPF, Nome, DataNascimento, Telefone1, Telefone2, Rua, Numero, CEP, Complemento, Bairro, Cidade, Estado)
VALUES
    ('12345678901', 'João Silva', '1990-05-15', '123456789', '987654321', 'Rua A', 123, '12345-678', 'Apto 456', 'Centro', 'CidadeA', 'SP'),
    ('98765432109', 'Maria Oliveira', '1985-08-20', '987654321', '111222333', 'Rua B', 456, '54321-876', 'Casa 789', 'BairroX', 'CidadeB', 'RJ'),
    ('23456789012', 'Pedro Santos', '2000-02-10', '555666777', NULL, 'Rua C', 789, '98765-432', 'Sala 101', 'BairroY', 'CidadeC', 'MG');

-- Inserção de dados na tabela Rota
INSERT INTO Rota (CodigoRota, Origem, Destino)
VALUES
    (1, 'AeroportoA', 'AeroportoB'),
    (2, 'AeroportoB', 'AeroportoC'),
    (3, 'AeroportoC', 'AeroportoA');

-- Inserção de dados na tabela Voo
INSERT INTO Voo (NumeroVoo, CodigoRota, HorarioPartida, HorarioChegada, AviaoDesignado)
VALUES
    (101, 1, '2023-12-10 08:00:00', '2023-12-10 10:00:00', 'Boeing 737'),
    (202, 2, '2023-12-11 14:30:00', '2023-12-11 16:30:00', 'Airbus A320'),
    (303, 3, '2023-12-12 18:45:00', '2023-12-12 20:45:00', 'Boeing 747');

-- Inserção de dados na tabela Reserva
INSERT INTO Reserva (NumeroReserva, CPFPassageiro, NumeroVoo, NumeroAssento)
VALUES
    (1, '12345678901', 101, 15),
    (2, '98765432109', 202, 22),
    (3, '23456789012', 303, 8);