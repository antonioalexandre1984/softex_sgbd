CREATE TABLE clientes (
  id INT PRIMARY KEY,
  nome VARCHAR(50),
  email VARCHAR(50),
  telefone VARCHAR(20)
);


CREATE TRIGGER trigger_clientes
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
  INSERT INTO log_clientes (id, acao) VALUES (NEW.id, 'insercao');
END;


Nesse exemplo, a trigger é acionada após a inserção de uma nova linha na tabela clientes, e insere um registro na tabela log_clientes, registrando a ação realizada.

Execute o comando desejado para acionar a trigger, por exemplo:

INSERT INTO clientes (id, nome, email, telefone) VALUES (1, 'Fulano', 'fulano@exemplo.com', '1234567890');
Esse comando insere um novo cliente na tabela clientes, e a trigger acionada registra a ação na tabela log_clientes.