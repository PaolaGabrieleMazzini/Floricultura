CREATE TABLE IF NOT EXISTS `Flores` (
	`id_flor` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` int NOT NULL,
	`cor` varchar(30) NOT NULL,
	`estacao` varchar(20) NOT NULL,
	`preco` decimal(3,2) NOT NULL,
	PRIMARY KEY (`id_flor`)
);
CREATE TABLE IF NOT EXISTS `Floristas` (
	`id_florista` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`especialidade` varchar(50) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	PRIMARY KEY (`id_florista`)
);
CREATE TABLE IF NOT EXISTS `Clientes` (
	`id_cliente` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(100) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`cidade` varchar(50) NOT NULL,
	`data_cadastro` int AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (`id_cliente`)
);
CREATE TABLE IF NOT EXISTS `Arranjos` (
	`id_arranjo` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome_arranjo` varchar(50) NOT NULL,
	`id_flor` int NOT NULL,
	`preco` decimal(4,2) NOT NULL,
	`id_florista` int NOT NULL,
	PRIMARY KEY (`id_arranjo`)
);
CREATE TABLE IF NOT EXISTS `Pedidos` (
	`id_pedido` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_cliente` int NOT NULL,
	`id_arranjo` int NOT NULL,
	`data_pedido` date NOT NULL,
	`status` varchar(30) NOT NULL,
	PRIMARY KEY (`id_pedido`)
);
ALTER TABLE `Arranjos` ADD CONSTRAINT `Arranjos_fk2` FOREIGN KEY (`id_flor`) REFERENCES `Flores`(`id_flor`);
ALTER TABLE `Arranjos` ADD CONSTRAINT `Arranjos_fk4` FOREIGN KEY (`id_florista`) REFERENCES `Floristas`(`id_florista`);
ALTER TABLE `Pedidos` ADD CONSTRAINT `Pedidos_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes`(`id_cliente`);
ALTER TABLE `Pedidos` ADD CONSTRAINT `Pedidos_fk2` FOREIGN KEY (`id_arranjo`) REFERENCES `Arranjos`(`id_arranjo`);

-- Flores
INSERT INTO Flores (nome, cor, estacao, preco) VALUES
('Rosa', 'Vermelha', 'Primavera', 5.50),
('Lírio', 'Branco', 'Verão', 7.00),
('Margarida', 'Amarela', 'Primavera', 3.25),
('Orquídea', 'Roxa', 'Outono', 12.90),
('Girassol', 'Amarelo', 'Verão', 8.75);

-- Floristas
INSERT INTO Floristas (nome, especialidade, telefone, cidade) VALUES
('Ana Souza', 'Arranjos Românticos', '16999990001', 'Taquaritinga'),
('Carlos Lima', 'Eventos', '16999990002', 'Araraquara'),
('Juliana Rocha', 'Buquês', '16999990003', 'Ribeirão Preto');

-- Clientes
INSERT INTO Clientes (nome, telefone, cidade, data_cadastro) VALUES
('Marcos Silva', '16988880001', 'Taquaritinga', '2025-01-10'),
('Fernanda Alves', '16988880002', 'Matão', '2025-02-15'),
('Pedro Santos', '16988880003', 'Araraquara', '2025-03-20'),
('Camila Costa', '16988880004', 'Ribeirão Preto', '2025-04-05');

-- Arranjos
INSERT INTO Arranjos (nome_arranjo, id_flor, preco, id_florista) VALUES
('Buquê de Rosas', 1, 45.00, 1),
('Arranjo Elegante', 2, 60.00, 2),
('Buquê Primavera', 3, 35.00, 3),
('Orquídea Especial', 4, 90.00, 1),
('Girassol Radiante', 5, 55.00, 2);

-- Pedidos
INSERT INTO Pedidos (id_cliente, id_arranjo, data_pedido, status) VALUES
(1, 1, '2025-06-01', 'Entregue'),
(2, 3, '2025-06-02', 'Em preparo'),
(3, 2, '2025-06-03', 'Entregue'),
(4, 5, '2025-06-04', 'Pendente'),
(1, 4, '2025-06-05', 'Enviado');

SELECT * FROM Flores;
SELECT * FROM Floristas;
SELECT * FROM Clientes;
SELECT * FROM Arranjos;
SELECT * FROM Pedidos;
SELECT
    p.id_pedido,
    p.data_pedido,
    p.status,

    c.nome AS cliente,
    c.telefone AS telefone_cliente,
    c.cidade AS cidade_cliente,

    a.nome_arranjo,
    a.preco AS valor_arranjo,

    f.nome AS flor,
    f.cor,
    f.estacao,

    fl.nome AS florista,
    fl.especialidade,
    fl.cidade AS cidade_florista

FROM Pedidos p
INNER JOIN Clientes c
    ON p.id_cliente = c.id_cliente
INNER JOIN Arranjos a
    ON p.id_arranjo = a.id_arranjo
INNER JOIN Flores f
    ON a.id_flor = f.id_flor
INNER JOIN Floristas fl
    ON a.id_florista = fl.id_florista;

SELECT
    p.id_pedido,
    c.nome AS cliente,
    a.nome_arranjo,
    f.nome AS flor,
    fl.nome AS florista,
    a.preco,
    p.data_pedido,
    p.status
FROM Pedidos p
INNER JOIN Clientes c ON p.id_cliente = c.id_cliente
INNER JOIN Arranjos a ON p.id_arranjo = a.id_arranjo
INNER JOIN Flores f ON a.id_flor = f.id_flor
INNER JOIN Floristas fl ON a.id_florista = fl.id_florista
WHERE p.id_pedido = 1;
