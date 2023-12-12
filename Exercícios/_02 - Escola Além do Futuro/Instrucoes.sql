-- Tabela de Alunos
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(11) UNIQUE,
    rg VARCHAR(20),
    data_nascimento DATE,
    endereco VARCHAR(255)
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY,
    codigo_identificacao VARCHAR(10),
    nome_curso VARCHAR(255),
    carga_horaria INT
);

-- Tabela de Professores
CREATE TABLE Professores (
    id_professor INT PRIMARY KEY,
    numero_registro INT,
    nome_professor VARCHAR(255),
    especialidade VARCHAR(255),
    contato VARCHAR(20)
);

-- Tabela de Matriculas
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    numero_matricula_curso INT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Tabela de Quadro de Notas
CREATE TABLE QuadroNotas (
    id_quadro_notas INT PRIMARY KEY,
    id_matricula INT,
    n1 FLOAT,
    n2 FLOAT,
    n3 FLOAT,
    n4 FLOAT,
    FOREIGN KEY (id_matricula) REFERENCES Matriculas(id_matricula)
);

-- Relacionamento entre Professores e Cursos
CREATE TABLE MinistraCurso (
    id_professor INT,
    id_curso INT,
    FOREIGN KEY (id_professor) REFERENCES Professores(id_professor),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
    PRIMARY KEY (id_professor, id_curso)
);
