/*1) Fazer em SQL Server os seguintes algoritmos:*/
/*a) Dado um n�mero inteiro. Calcule e mostre o seu fatorial. (N�o usar entrada superior a 12)*/
DECLARE @valor	INT,
		@fat	INT;

SET @valor = 6;
SET @fat = 1;
WHILE(@valor>1)
BEGIN
	SET @fat = @fat * @valor;
	SET @valor = @valor -1;
END
PRINT(@fat);

/*b) Dados A, B, e C de uma equa��o do 2o grau da f�rmula AX2+BX+C=0. Verifique e mostre a
exist�ncia de ra�zes reais e se caso exista, calcule e mostre. Caso n�o existam, exibir mensagem.*/

DECLARE @a INT, @b INT, @c INT;
DECLARE @delta INT;
SET @a = 3;
SET @b = 2;
SET @c = 1;

SET @delta = @b*@b -(4*@a*@c);

IF(@delta<0)
BEGIN
	print('Nao existe raizes reais');
END
ELSE
BEGIN
	print('Existe raizes reais');
END

/*c) Calcule e mostre quantos anos ser�o necess�rios para que Ana seja maior que Maria sabendo
que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.*/

DECLARE @ana INT, @maria INT, @anos INT;

SET @ana = 110;
SET @maria = 150;
SET @anos = 1;

WHILE(@ana<@maria)
BEGIN
	SET @ana = @ana + 3;
	SET @maria = @maria + 2;
	SET @anos = @anos +1;
END
print(@anos)

/*d) Seja a seguinte s�rie: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...
Escreva uma aplica��o que a escreva N termos*/

DECLARE @x INT, @y INT,@n INT;
SET @n=14;
SET @x=1;
SET @y=4;
WHILE(@n>0)
BEGIN
	print(@x);
	SET @n =@n - 1;

	IF(@n>0)
	BEGIN
		print(@y);
	END
	
	SET @n =@n - 1;

	IF(@n>0)
	BEGIN
		print(@y);
	END
	SET @x=@x+1;
	SET @y=@y+1;

	SET @n =@n - 1;
END

/*e) Considerando a tabela abaixo, gere uma database, a tabela e crie um algoritmo para inserir
uma massa de dados, com 50 registros, para fins de teste, com as regras estabelecidas (N�o
usar constraints na cria��o da tabela)
Produto
Codigo Nome Valor Vencimento
INT (PK) VARCHAR(30) DECIMAL(7,2) DATE

� C�digo inicia em 50001 e incrementa de 1 em 1
� Nome segue padr�o simples: Produto 1, Produto 2, Produto 3, etc.
� Valor, gerar um n�mero aleat�rio* entre 10.00 e 100.00
� Vencimento, gerar um n�mero aleat�rio* entre 3 e 7 e, usando a fun��o espec�fica para
soma de datas no SQL Server, somar o valor gerado � data de hoje.

* Fun��o RAND() gera n�meros aleat�rios entre 0 e 0,9999...*/
DROP DATABASE teste;
DROP TABLE produto;

CREATE DATABASE teste;
CREATE TABLE produto(
		codigo		INT,
		nome		VARCHAR(30),
		valor		DECIMAL(7,2),
		vencimento	DATE
		PRIMARY KEY(codigo))

DECLARE @reg INT,@codigo INT, @produto AS VARCHAR(30),@val INT, @vencimento DATE,@datahoje DATE, @soma INT;
SET @reg = 50;
SET @codigo = 50000;
SET @produto = 'Produto ';
SET @datahoje = GETDATE();

WHILE(@reg>0)
BEGIN
	SET @reg=@reg-1;
	SET @codigo = @codigo+1;
	SET @produto = 'Produto ';
	SET @produto = @produto+CAST(50 - @reg AS VARCHAR(2))
	SET @val = RAND()*(100000-10000+1)+10000
	SET @soma = RAND()*(7-3+1)+3;
	SET @vencimento = DATEADD(year,@soma, @datahoje);

	INSERT INTO produto VALUES 
	(@codigo, @produto, @val, @vencimento)
END

SELECT * FROM produto;


/*f) Considerando a tabela abaixo, gere uma database, a tabela e crie um algoritmo para inserir
uma massa de dados, com 50 registros, para fins de teste, com as regras estabelecidas (N�o
usar constraints na cria��o da tabela)
Livro
ID T�tulo Qtd_P�ginas Qtd_Estoque
INT (PK) VARCHAR(30) INT INT*/

CREATE DATABASE biblioteca

CREATE TABLE livro(
	id			INT,
	titulo		VARCHAR(30),
	qtd_paginas	INT,
	qtd_estoque	INT
	)

DECLARE @id INT, @titulo AS VARCHAR(30), @qtd_paginas INT, @qtd_estoque INT
SET @id = 10000

WHILE(@id<10050)
BEGIN 
	SET @id=@id+1;
	SET @titulo = 'Livro '
	SET @titulo = @titulo + CAST(@id-10000 AS VARCHAR(5))
	SET @qtd_paginas = RAND()*(1200-40+1)+40;
	SET @qtd_estoque = RAND()*(15-2+1)+2;
	
	INSERT INTO livro VALUES(@id, @titulo,@qtd_paginas,@qtd_estoque);
END

SELECT * FROM livro
