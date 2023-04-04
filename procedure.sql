CREATE PROCEDURE GERAR_RELATORIO_COMPRAS_DIARIAS AS 
	BEGIN
	SELECT
	    DATEPART(DAY, data_compra) as dia,
	    COUNT(*) as quantidade_compras
	FROM tabela_compras
	WHERE
	    data_compra = CONVERT(date, GETDATE())
	GROUP BY
	    DATEPART(DAY, data_compra)
	END Nessa procedure,
	é feita uma consulta na tabela de compras para selecionar as compras realizadas no dia corrente.É utilizado a função DATEPART para extrair o dia da data de compra e o GETDATE para obter a data corrente.Em seguida,
	é realizada uma contagem da quantidade de compras realizadas e agrupado por dia.O resultado dessa consulta é o relatório diário de quantidade de produtos comprados.
