CREATE DATABASE IF NOT EXISTS oficina_mecanica; -- CRIAÇÃO DO BANCO

USE oficina_mecanica; -- SELECIONANDO O BANCOclienteveiculo


--
--
-- CRIAÇÃO DAS TABELAS 
--
--


CREATE TABLE Cliente (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(20) NOT NULL,
    CPF CHAR(11) NOT NULL,
    Telefone VARCHAR(16),
    Endereco VARCHAR(45),
    CONSTRAINT unique_cpf UNIQUE(CPF)
    
  );  
  
CREATE TABLE Veiculo (
	idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    idcliCliente INT,
    Marca VARCHAR(20),
    Placa CHAR(9) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Ano INT,
    Cor VARCHAR(15),
    CONSTRAINT unique_placa UNIQUE(Placa),
    CONSTRAINT fk_cliente_veiculo FOREIGN KEY (idcliCliente) REFERENCES Cliente (idCliente)
    );
    
   
 CREATE TABLE ordemServico (
	idordemServico INT PRIMARY KEY AUTO_INCREMENT,
    idvVeiculo INT,
    DataEntrada DATE NOT NULL,
    DataSaida DATE NOT NULL,
    statusServico VARCHAR(30),
    Placa CHAR(9) NOT NULL,
    valorTotal DECIMAL(10,2),
    CONSTRAINT unique_placa_servico UNIQUE (Placa),
	CONSTRAINT fk_veiculo_ordemServico FOREIGN KEY (idvVeiculo) REFERENCES Veiculo (idVeiculo)
    );
    
    
CREATE TABLE Peca (
	idPeca INT PRIMARY KEY AUTO_INCREMENT,
    nomePeca VARCHAR(45) NOT NULL,
    Fabricante VARCHAR(20) NOT NULL,
    quantidadeEstoque INT NOT NULL,
    precoUnitario DECIMAL(10,2)
    );
    

CREATE TABLE Servico (
	idServico INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(255) NOT NULL,
    Preco DECIMAL(10,2)
   ); 
    
CREATE TABLE Funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeFuncionario VARCHAR(50) NOT NULL,
    Especialidade VARCHAR(50),
    Cargo VARCHAR(50),
    Telefone VARCHAR(16)
    );
    

CREATE TABLE itemServico (
	idordServico INT ,
    idservServico INT,
    Quantidade INT NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idordServico,idservServico),
   CONSTRAINT fk_ordemServico_item FOREIGN KEY (idordServico) REFERENCES ordemServico (idordemServico),
   CONSTRAINT fk_servico_item FOREIGN KEY (idservServico) REFERENCES  Servico (idServico)
    );
    
    
CREATE TABLE Execucao (
	ideordServico INT,
    ideFuncionario INT,
    tipoServico VARCHAR(100),
    DataExecucao DATE,
    Observacoes TEXT,
    PRIMARY KEY (ideordServico,ideFuncionario),
    CONSTRAINT fk_servico_execucao FOREIGN KEY (ideordServico) REFERENCES ordemServico (idordemServico),
    CONSTRAINT fk_funcionario_execucao FOREIGN KEY (ideFuncionario) REFERENCES Funcionario (idFuncionario)
    
    );
    
    
    
CREATE TABLE itemPeca (
	idpPeca INT,
    idpordServico INT,
    Quantidade INT,
    Total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idpPeca,idpordServico),
    CONSTRAINT fk_peca_item FOREIGN KEY (idpPeca) REFERENCES Peca (idPeca),
    CONSTRAINT fk_ordem_servico_item FOREIGN KEY (idpordServico) REFERENCES ordemServico (idordemServico)
    );
    
    