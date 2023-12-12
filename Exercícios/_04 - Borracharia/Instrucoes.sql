-- Tabela para armazenar informações dos pneus
CREATE TABLE Pneu (
    NumeroSerie VARCHAR(20) PRIMARY KEY,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Dimensoes VARCHAR(20),
    QuantidadeEstoque INT
);

-- Tabela para armazenar informações dos clientes
CREATE TABLE Cliente (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Telefone VARCHAR(15),
    Endereco VARCHAR(200)
);

-- Tabela para armazenar informações dos serviços
CREATE TABLE Servico (
    NumeroOrdemServico INT PRIMARY KEY,
    CPFFuncionario VARCHAR(11), -- Assumindo que o serviço é realizado por um funcionário, você pode ajustar conforme necessário
    CPFCliente VARCHAR(11),
    DataRealizacao DATE,
    Valor DECIMAL(10, 2),
    FOREIGN KEY (CPFFuncionario) REFERENCES Funcionario(CPF),
    FOREIGN KEY (CPFCliente) REFERENCES Cliente(CPF)
);

-- Tabela para armazenar informações sobre a troca de pneus em um serviço
CREATE TABLE TrocaPneu (
    NumeroOrdemServico INT,
    NumeroSeriePneu VARCHAR(20),
    PRIMARY KEY (NumeroOrdemServico, NumeroSeriePneu),
    FOREIGN KEY (NumeroOrdemServico) REFERENCES Servico(NumeroOrdemServico),
    FOREIGN KEY (NumeroSeriePneu) REFERENCES Pneu(NumeroSerie)
);
-- Inserção de dados na tabela Pneu
INSERT INTO Pneu (NumeroSerie, Marca, Modelo, Dimensoes, QuantidadeEstoque)
VALUES
    ('ABC123', 'Michelin', 'Pilot Sport 4', '225/45R18', 20),
    ('DEF456', 'Bridgestone', 'Ecopia', '195/65R15', 15),
    ('GHI789', 'Pirelli', 'P Zero', '255/40R20', 10);

-- Inserção de dados na tabela Cliente
INSERT INTO Cliente (CPF, Nome, Telefone, Endereco)
VALUES
    ('12345678901', 'Carlos Silva', '987654321', 'Rua A, 123, BairroX, CidadeA, SP'),
    ('98765432109', 'Ana Oliveira', '555666777', 'Rua B, 456, BairroY, CidadeB, RJ'),
    ('23456789012', 'Fernanda Santos', '111222333', 'Rua C, 789, BairroZ, CidadeC, MG');

-- Inserção de dados na tabela Servico
INSERT INTO Servico (NumeroOrdemServico, CPFFuncionario, CPFCliente, DataRealizacao, Valor)
VALUES
    (1, '11122233344', '12345678901', '2023-12-10', 150.00),
    (2, '22233344455', '98765432109', '2023-12-11', 200.00),
    (3, '33344455566', '23456789012', '2023-12-12', 120.00);

-- Inserção de dados na tabela TrocaPneu
INSERT INTO TrocaPneu (NumeroOrdemServico, NumeroSeriePneu)
VALUES
    (1, 'ABC123'),
    (2, 'DEF456'),
    (3, 'GHI789');