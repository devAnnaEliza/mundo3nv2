CREATE TABLE Usuarios (
  PessoaID INTEGER  NOT NULL  ,
  UsuarioID INTEGER  NOT NULL   IDENTITY ,
  Login VARCHAR(20)    ,
  Senha VARCHAR(20)      ,
PRIMARY KEY(PessoaID, UsuarioID));
GO




CREATE TABLE Produtos (
  ProdutoID INTEGER  NOT NULL   IDENTITY ,
  Nome VARCHAR(255)    ,
  Quantidade INTEGER    ,
  PrecoVenda DECIMAL(10, 2)      ,
PRIMARY KEY(ProdutoID));
GO




CREATE TABLE Pessoas (
  PessoaID INTEGER  NOT NULL   IDENTITY ,
  Usuarios_UsuarioID INTEGER  NOT NULL  ,
  Usuarios_PessoaID INTEGER  NOT NULL  ,
  Nome VARCHAR(255)    ,
  TipoPessoa ENUM   DEFAULT ('Fisica', 'Juridica') ,
  CPF VARCHAR(20)    ,
  CNPJ VARCHAR(20)      ,
PRIMARY KEY(PessoaID)  ,
  FOREIGN KEY(Usuarios_PessoaID, Usuarios_UsuarioID)
    REFERENCES Usuarios(PessoaID, UsuarioID));
GO


CREATE INDEX Pessoas_FKIndex1 ON Pessoas (Usuarios_PessoaID, Usuarios_UsuarioID);
GO


CREATE INDEX IFK_Rel_01 ON Pessoas (Usuarios_PessoaID, Usuarios_UsuarioID);
GO


