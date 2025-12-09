CREATE DATABASE if not exists banco;
use banco;

CREATE TABLE if not exists clientes (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idade INT UNSIGNED NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    sexo CHAR(1) NOT NULL CHECK (sexo IN ('M', 'F', 'O', 'P')),
    total_compras DECIMAL(10, 2) DEFAULT 0,
    vip BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if not exists produtos (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT UNSIGNED NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE if not exists compras (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT UNSIGNED NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

CREATE TABLE if not exists itens_compra (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    compra_id INT UNSIGNED NOT NULL,
    produto_id INT UNSIGNED NOT NULL,
    quantidade INT UNSIGNED NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL, 
    FOREIGN KEY (compra_id) REFERENCES compras(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
