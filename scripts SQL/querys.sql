
--
--
-- QUERYS
--
-- 

-- CALCAULAR O TOTAL GASTO EM UMA ORDEM DE SERVIÇO
SELECT os.idordemServico,
       SUM(isv.Total + IFNULL(ip.Total, 0)) AS Total_Gasto
FROM ordemServico os
LEFT JOIN itemServico isv ON os.idordemServico = isv.idordServico
LEFT JOIN itemPeca ip ON os.idordemServico = ip.idpordServico
WHERE os.idordemServico = 101
GROUP BY os.idordemServico;



-- VERIFICAR SERVIOS FEITO POR UM FUNCIONARIO ESPECIFICO
SELECT f.NomeFuncionario, s.Descricao, e.tipoServico, e.DataExecucao
FROM Execucao e
INNER JOIN Funcionario f ON e.ideFuncionario = f.idFuncionario
INNER JOIN Servico s ON e.ideordServico = s.idServico
WHERE f.idFuncionario = 1;


-- VERIFICAR PEÇAS UTILIZADAS EM ORDEM ESPECIFICA
SELECT os.idordemServico, p.NomePeca, ip.Quantidade, ip.Total
FROM ordemServico os
INNER JOIN itemPeca ip ON os.idordemServico = ip.idpordServico
INNER JOIN Peca p ON ip.idpPeca = p.idPeca
WHERE os.idordemServico = 101;

-- VERIFICAR SERVIÇOS FEITOS 
SELECT os.idordemServico, s.Descricao, isv.Quantidade, isv.Total
FROM ordemServico os
INNER JOIN itemServico isv ON os.idordemServico = isv.idordServico
INNER JOIN Servico s ON isv.idordServico = s.idServico
WHERE os.idordemServico = 101;


-- SERVIÇOS EM ANDAMENTO
SELECT idordemServico, DataEntrada, Placa, statusServico
FROM ordemServico
WHERE statusServico = 'Em andamento';

-- LISTAR CLIENTES SEUS VEICULOS
SELECT c.Nome, v.Placa, v.Modelo, v.Marca
FROM Cliente c
INNER JOIN Veiculo v ON c.idCliente = v.idcliCliente;1'