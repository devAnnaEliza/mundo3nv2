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
  PrecoVenda DECIMAL(10, 2)    ,
  PessoaID INTEGER      ,
PRIMARY KEY(ProdutoID));
GO




CREATE TABLE PessoaFisica (
  idPessoaFisica INTEGER  NOT NULL   IDENTITY ,
  CPF VARCHAR(20)      ,
PRIMARY KEY(idPessoaFisica));
GO




CREATE TABLE PessoaJuridica (
  idPessoaJuridica INTEGER  NOT NULL   IDENTITY ,
  CNPJ VARCHAR(20)      ,
PRIMARY KEY(idPessoaJuridica));
GO




CREATE TABLE Pessoas (
  PessoaID INTEGER  NOT NULL   IDENTITY ,
  Usuarios_UsuarioID INTEGER  NOT NULL  ,
  Usuarios_PessoaID INTEGER  NOT NULL  ,
  PessoaJuridica_idPessoaJuridica INTEGER  NOT NULL  ,
  PessoaFisica_idPessoaFisica INTEGER  NOT NULL  ,
  Nome VARCHAR(255)    ,
  TipoPessoa ENUM   DEFAULT ('Fisica', 'Juridica') ,
  CPF VARCHAR(20)    ,
  CNPJ VARCHAR(20)      ,
PRIMARY KEY(PessoaID, Usuarios_UsuarioID, Usuarios_PessoaID)      ,
  FOREIGN KEY(Usuarios_PessoaID, Usuarios_UsuarioID)
    REFERENCES Usuarios(PessoaID, UsuarioID),
  FOREIGN KEY(PessoaFisica_idPessoaFisica)
    REFERENCES PessoaFisica(idPessoaFisica),
  FOREIGN KEY(PessoaJuridica_idPessoaJuridica)
    REFERENCES PessoaJuridica(idPessoaJuridica));
GO


CREATE INDEX Pessoas_FKIndex1 ON Pessoas (Usuarios_PessoaID, Usuarios_UsuarioID);
GO
CREATE INDEX Pessoas_FKIndex2 ON Pessoas (PessoaFisica_idPessoaFisica);
GO
CREATE INDEX Pessoas_FKIndex3 ON Pessoas (PessoaJuridica_idPessoaJuridica);
GO


CREATE INDEX IFK_Rel_01 ON Pessoas (Usuarios_PessoaID, Usuarios_UsuarioID);
GO
CREATE INDEX IFK_Rel_03 ON Pessoas (PessoaFisica_idPessoaFisica);
GO
CREATE INDEX IFK_Rel_04 ON Pessoas (PessoaJuridica_idPessoaJuridica);
GO



