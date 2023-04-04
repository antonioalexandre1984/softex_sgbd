CREATE FUNCTION FN_TOTAL_CLIENTES_DIA(@DATA DATE) RETURNS 
INT AS 
	BEGIN DECLARE @total_clientes INT
	SELECT
	    @total_clientes = COUNT(*)
	FROM clientes
	WHERE
	    CAST(data_cadastro AS DATE) = @data
	RETURN @total_clientes
	END
