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