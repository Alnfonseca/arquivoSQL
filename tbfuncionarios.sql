-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/10/2023 às 21:01
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dblojaabc`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbfuncionarios`
--

CREATE TABLE `tbfuncionarios` (
  `codFunc` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cpf` char(14) DEFAULT NULL,
  `dNasc` date DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cep` char(9) DEFAULT NULL,
  `numero` char(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbfuncionarios`
--

INSERT INTO `tbfuncionarios` (`codFunc`, `nome`, `email`, `cpf`, `dNasc`, `endereco`, `cep`, `numero`, `bairro`, `estado`, `cidade`) VALUES
(1, 'alan Fonseca', 'alan', '132.646.848-84', '2023-10-05', 'Rua Puruba', '     -', '34', 'Cidade Ipava', 'SP', 'São Paulo'),
(2, 'Jose Afonso', 'jse@gmail.com', '654.606.532-40', '2023-10-05', 'Rua Puruba', '     -', '90', 'Cidade Ipava', 'SP', 'São Paulo'),
(3, 'alan', 'alan@gmail.com', '656.156.545-46', '2023-10-06', 'Rua Puruba', 'alan@gmai', '21', 'Cidade Ipava', 'SP', 'São Paulo'),
(4, 'Roberto', 'rob@gmail.com', '684.465.165-46', '2023-10-06', 'Rua Puruba', '04950-090', '100', 'Cidade Ipava', 'SP', 'São Paulo');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbfuncionarios`
--
ALTER TABLE `tbfuncionarios`
  ADD PRIMARY KEY (`codFunc`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbfuncionarios`
--
ALTER TABLE `tbfuncionarios`
  MODIFY `codFunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
