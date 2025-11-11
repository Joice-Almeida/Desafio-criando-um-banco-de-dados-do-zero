--
--
-- INSERÇÃO DE DADOS NAS TABELAS 
--
--    

SHOW TABLES;
DESC Cliente;
select * from Cliente;
INSERT INTO Cliente ( Nome, CPF, Telefone, Endereco) VALUES
( 'João Silva', '123.456.789-00', '(71) 99999-1111', 'Rua das Flores, 123'),
( 'Maria Oliveira', '987.654.321-00', '(71) 98888-2222', 'Av. Brasil, 456'),
( 'Carlos Souza', '321.654.987-00', '(71) 97777-3333', 'Rua Bahia, 789');



DESC Veiculo;
select * from Veiculo;
INSERT INTO Veiculo (idcliCliente,Placa, Modelo, Marca, Ano, Cor) VALUES
(1,'ABC1D23', 'Civic', 'Honda', 2018, 'Preto'),
(2,'XYZ9K87', 'Onix', 'Chevrolet', 2020, 'Branco'),
(3,'JKL3M21', 'HB20', 'Hyundai', 2019, 'Prata');


DESC ordemServico;

select idordemServico from ordemServico;
INSERT INTO ordemServico (idordemServico, DataEntrada, DataSaida, valorTotal, statusServico, Placa) VALUES
(101, '2025-11-01', '2025-11-03', 450.00, 'Concluída', 'ABC1D23'),
(102, '2025-11-05', NULL, 0.00, 'Em andamento', 'XYZ9K87');


DESC Servico;
select * from Servico;
INSERT INTO Servico ( Descricao, Preco) VALUES
('Troca de óleo', 120.00),
('Alinhamento e balanceamento', 150.00),
( 'Revisão geral', 300.00);


DESC Funcionario;
select * from Funcionario;
INSERT INTO Funcionario ( nomeFuncionario, Cargo, Especialidade, Telefone) VALUES
( 'Pedro Lima', 'Mecânico', 'Motor', '(71) 91234-5678'),
('Ana Costa', 'Mecânica', 'Suspensão', '(71) 92345-6789');


DESC Peca;
select * from Peca;
INSERT INTO Peca ( NomePeca, Fabricante, precoUnitario, quantidadeEstoque) VALUES
( 'Filtro de óleo', 'Bosch', 35.00, 50),
('Pastilha de freio', 'Cobreq', 80.00, 30),
('Correia dentada', 'Gates', 120.00, 20);


DESC itemServico;
select * from itemServico;
INSERT INTO itemServico (idordServico,idservServico, Quantidade, Total) VALUES
(101, 1, 1, 120.00),
(101, 2, 1, 150.00);



DESC itemPeca;               
Select * from itemPeca;
INSERT INTO itemPeca (idpordServico,idpPeca, Quantidade,Total) VALUES
(101, 1, 1, 35.00),
(101, 2, 1, 80.00);



DESC Execucao;

INSERT INTO Execucao (ideordServico, ideFuncionario, tipoServico, DataExecucao, Observacoes) VALUES
(101, 1, 'Troca de óleo', '2025-11-01', 'Realizado com sucesso'),
(102, 2, 'Alinhamento', '2025-11-02', 'Cliente solicitou ajuste fino');


