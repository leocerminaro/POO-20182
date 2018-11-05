DROP SCHEMA PUBLIC CASCADE

CREATE TABLE CategoriaLivro (CODIGO INT GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY, NOME VARCHAR(64) NOT NULL);

CREATE TABLE Usuario (CODIGO INT GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY, NOME VARCHAR(64) NOT NULL,  SEXO BOOLEAN NOT NULL, ENDERECO VARCHAR(128) NOT NULL, TELEFONE VARCHAR(11) NOT NULL, CATEGORIAUSUARIO INT NOT NULL, LOGIN VARCHAR(32) NOT NULL, SENHA VARCHAR(32) NOT NULL, DELETADO BOOLEAN DEFAULT FALSE);

CREATE TABLE Multa (CODIGO INT GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY, CODIGOUSUARIO INT NOT NULL, DESCRICAO VARCHAR(64) NOT NULL, VALOR DOUBLE NOT NULL, DELETADO BOOLEAN DEFAULT FALSE, FOREIGN KEY(CODIGOUSUARIO) REFERENCES Usuario(CODIGO));

CREATE TABLE Livro (CODIGO INT GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY,  TITULO VARCHAR(64) NOT NULL, PRIORIDADE INT NOT NULL, ANO INT NOT NULL, DISPONIBILIDADE BOOLEAN DEFAULT TRUE, DELETADO BOOLEAN DEFAULT FALSE);

CREATE TABLE Emprestimo (CODIGO INT GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY, DATAEMPRESTIMO DATE NOT NULL, DATADEVOLUCAO DATE DEFAULT NULL, CODIGOLIVRO INT NOT NULL, CODIGOUSUARIO INT NOT NULL, DELETADO BOOLEAN DEFAULT FALSE, FOREIGN KEY(CODIGOLIVRO) REFERENCES Livro(CODIGO), FOREIGN KEY(CODIGOUSUARIO) REFERENCES Usuario(CODIGO));

CREATE TABLE Autor (CODIGO INT GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY, NOME VARCHAR(64) NOT NULL, DELETADO BOOLEAN DEFAULT FALSE);

CREATE TABLE LivroAutor (CODIGOLIVRO INT, CODIGOAUTOR INT, PRIMARY KEY(CODIGOLIVRO, CODIGOAUTOR), FOREIGN KEY(CODIGOLIVRO) REFERENCES Livro(CODIGO), FOREIGN KEY(CODIGOAUTOR) REFERENCES Autor(CODIGO));

CREATE TABLE LivroCategoria (CODIGOLIVRO INT, CODIGOCATEGORIA INT, PRIMARY KEY(CODIGOLIVRO, CODIGOCATEGORIA), FOREIGN KEY(CODIGOLIVRO) REFERENCES Livro(CODIGO), FOREIGN KEY(CODIGOCATEGORIA) REFERENCES CategoriaLivro(CODIGO));
