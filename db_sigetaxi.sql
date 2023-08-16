-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/08/2023 às 00:46
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
-- Banco de dados: `sigtaxi`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperado`
--

CREATE TABLE `sig_cooperado` (
  `cod_cooperado` int(11) NOT NULL,
  `cod_cooperativa` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `apelido` varchar(20) NOT NULL,
  `nome_completo` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(25) NOT NULL,
  `cnh` varchar(30) DEFAULT NULL,
  `cat` varchar(5) DEFAULT NULL,
  `inss` varchar(30) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `nacionalidade` varchar(20) NOT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `data_nascimento` date NOT NULL,
  `data_inscricao` date NOT NULL,
  `pai` varchar(255) DEFAULT NULL,
  `mae` varchar(255) DEFAULT NULL,
  `conjugue` varchar(255) DEFAULT NULL,
  `filhos` varchar(255) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperado`
--

INSERT INTO `sig_cooperado` (`cod_cooperado`, `cod_cooperativa`, `tipo`, `status`, `apelido`, `nome_completo`, `cpf`, `rg`, `cnh`, `cat`, `inss`, `estado_civil`, `nacionalidade`, `genero`, `data_nascimento`, `data_inscricao`, `pai`, `mae`, `conjugue`, `filhos`, `imagem`) VALUES
(1, 1, 'Externo', 1, 'João', 'João Gonzaga', '111.111.111-11', '1545451 pc/pa', '5456454646546', 'AB', '3546546', 'Solteiro', 'BRASILEIRO', 'Masculino', '1993-08-15', '2019-04-11', 'João Gonzagas', 'Maria Gonzaga', '', '', 'uploads/cooperados/4a7785e6175b33536204ce244fa701fd.jpg'),
(2, 1, 'Externo', 0, 'Pedro', 'Pedro Vieira', '222.222.222-22', '1545451 pc/pa', '5456454646546', 'AB', '3546546', 'Solteiro', 'BRASILEIRO', 'Masculino', '1950-01-15', '2019-04-11', 'Carlos Viera', 'Lucia Viera', '', '', 'uploads/cooperados/a32a06a793c79380f15bb4f9228180f3.jpg'),
(3, 1, 'Auxiliar', 0, 'Roberto', 'Roberto Alves', '333.333.333-33', '1545451 pc/pa', '5456454646546', 'AB', '', 'CASADO', 'BRASILEIRO', 'Masculino', '1954-04-15', '2019-04-11', 'Carlos Viera Alves', 'Maria Alves', 'Thaise Pedrosa', '', 'uploads/cooperados/7eb7d3144f37a58713fd9ab942c1bac3.jpg'),
(4, 1, 'Permissionário', 1, 'Carlos', 'Carlos Arthur Rodrigues', '444.444.444-44', '1545451 pc/pa', '6545646', 'AB', '5544441', 'Solteiro', 'BRASILEIRO', 'Masculino', '1933-09-15', '2019-04-11', '', '', '', '', 'uploads/cooperados/853b90a2f4075217d6d64d14421dba34.jpg'),
(5, 1, 'Auxiliar', 1, 'Rogerio', 'Rogerio Gonzaga', '555.555.555-55', '1545451 pc/pa', '5456454646546', 'AB', '5544441', 'Solteiro', 'BRASILEIRO', 'Masculino', '1954-02-19', '2019-04-11', '', '', '', '', 'uploads/cooperados/dc691328146d30de2ca1fc20114b84b8.jpg'),
(6, 1, 'Permissionário', 1, 'Bean', 'Mr Bean Alves', '666.666.666-66', '1545451 pc/pa', '5456454646546', 'AB', '3546546', 'CASADO', 'BRASILEIRO', 'Masculino', '1954-02-19', '2019-04-11', 'Carlos Bean Alves', 'Lucia Bean Alves', 'Maria Rodrigues Alves', '', 'uploads/cooperados/dfa3e6a3ae6c66238f1c60d438624c2c.jpg'),
(7, 1, 'Permissionário', 1, 'Carla', 'Carla Nascimento', '777.777.777-77', '1545451 pc/pa', '5456454646546', 'AB', '3546546', 'Casada', 'BRASILEIRA', 'Masculino', '2014-08-15', '2019-04-11', 'Carlos nascimento', 'Lucia Alves nacimento', 'Roberto Gaspar', '', 'uploads/cooperados/f2afae4c938dd267c9d54f10aabcceff.jpg'),
(8, 1, 'Permissionário', 1, 'JOAB', 'JOAB TORRES ALENCAR', '444.444.444-42', '2222222222 PC/PA', '12321312321', 'AB', '', 'Casado', 'Brasileiro', 'Masculino', '1993-08-15', '2023-08-01', 'JOSE FELICIO ALENCAR', 'MARIA LUCIA DE ABREU TORRES', '', '', 'uploads/cooperados/6033c6ff4494eb28125d0290e8aae426.jpg');

--
-- Acionadores `sig_cooperado`
--
DELIMITER $$
CREATE TRIGGER `tg_remove_cooperado` BEFORE DELETE ON `sig_cooperado` FOR EACH ROW BEGIN
DELETE FROM sig_cooperado_carteira WHERE cod_cooperado = OLD.cod_cooperado;
DELETE FROM sig_cooperado_contato WHERE cod_cooperado = OLD.cod_cooperado;
DELETE FROM sig_cooperado_endereco WHERE cod_cooperado = OLD.cod_cooperado;
DELETE FROM sig_cooperado_historico WHERE cod_cooperado = OLD.cod_cooperado;
DELETE FROM sig_cooperado_mensalidade WHERE cod_cooperado = OLD.cod_cooperado;
DELETE FROM sig_cooperado_veiculo WHERE cod_cooperado = OLD.cod_cooperado;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperado_carteira`
--

CREATE TABLE `sig_cooperado_carteira` (
  `cod` int(11) NOT NULL,
  `cod_cooperado` int(11) NOT NULL,
  `data_inicial` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperado_carteira`
--

INSERT INTO `sig_cooperado_carteira` (`cod`, `cod_cooperado`, `data_inicial`, `data_validade`) VALUES
(1, 1, '2019-04-11', '2020-04-01'),
(2, 2, '2019-04-11', '2020-04-01'),
(3, 3, '2019-04-11', '2020-04-01'),
(4, 4, '2019-04-11', '2020-04-01'),
(5, 5, '2019-04-11', '2020-04-01'),
(6, 6, '2019-04-11', '2020-04-01'),
(7, 7, '2019-04-11', '2020-04-01'),
(8, 8, '2023-08-01', '2024-08-01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperado_contato`
--

CREATE TABLE `sig_cooperado_contato` (
  `cod_contato` int(11) NOT NULL,
  `cod_cooperado` int(11) NOT NULL,
  `celular_1` varchar(20) DEFAULT NULL,
  `celular_2` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperado_contato`
--

INSERT INTO `sig_cooperado_contato` (`cod_contato`, `cod_cooperado`, `celular_1`, `celular_2`, `email`) VALUES
(1, 1, '(93) 99999-9999', '(92) 99999-9999', 'email@mail.com'),
(2, 2, '(92) 99999-9999', '(93) 99999-9999', 'bugados01@gmail.com'),
(3, 3, '(93) 99999-9999', '(92) 99999-9999', 'bugados01@gmail.com'),
(4, 4, '(93) 99999-9999', '', 'bugados01@gmail.com'),
(5, 5, '', '', ''),
(6, 6, '(93) 99999-9999', '(92) 99999-9999', 'email@mail.com'),
(7, 7, '', '(99) 99999-9999', 'email@mail.com'),
(8, 8, '(93) 99204-7173', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperado_endereco`
--

CREATE TABLE `sig_cooperado_endereco` (
  `cod_endereco` int(11) NOT NULL,
  `cod_cooperado` int(11) NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cep` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperado_endereco`
--

INSERT INTO `sig_cooperado_endereco` (`cod_endereco`, `cod_cooperado`, `logradouro`, `numero`, `bairro`, `complemento`, `cidade`, `estado`, `cep`) VALUES
(1, 1, '15 rua', '1554', 'Liberdade', '', 'Itaituba', 'PA', ''),
(2, 2, '15 rua', '1002', 'Bom remédio', '', 'Itaituba', 'PA', '68484-444'),
(3, 3, '15 rua', '1002', 'Bom remédio', '', 'Itaituba', 'PA', '68484-444'),
(4, 4, '15 rua', '1554', 'Bom remédio', '', 'Itaituba', 'PA', '68484-444'),
(5, 5, '', '', '', '', 'Itaituba', 'PA', ''),
(6, 6, '10 rua', '1554', 'Bom remédio', '', 'Itaituba', 'PA', '68484-444'),
(7, 7, '10 rua', '1554', 'Liberdade', '', 'Itaituba', 'PA', '68484-444'),
(8, 8, '16 rua', '1065', 'são tome', '', 'Itaituba', 'PA', '68180-390');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperado_historico`
--

CREATE TABLE `sig_cooperado_historico` (
  `cod_historico` int(11) NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `cod_cooperado` int(11) NOT NULL,
  `descricao_historico` text DEFAULT NULL,
  `data_historico` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperado_historico`
--

INSERT INTO `sig_cooperado_historico` (`cod_historico`, `cod_usuario`, `cod_cooperado`, `descricao_historico`, `data_historico`) VALUES
(1, 6, 2, 'ficou inativo', '2019-04-11 09:27:29'),
(2, 6, 7, 'quitou suas mensalidades', '2019-04-11 09:29:29');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperado_mensalidade`
--

CREATE TABLE `sig_cooperado_mensalidade` (
  `cod_mensalidade` int(11) NOT NULL,
  `cod_cooperado` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `janeiro` double UNSIGNED DEFAULT NULL,
  `fevereiro` double UNSIGNED DEFAULT NULL,
  `marco` double UNSIGNED DEFAULT NULL,
  `abril` double UNSIGNED DEFAULT NULL,
  `maio` double UNSIGNED DEFAULT NULL,
  `junho` double UNSIGNED DEFAULT NULL,
  `julho` double UNSIGNED DEFAULT NULL,
  `agosto` double UNSIGNED DEFAULT NULL,
  `setembro` double UNSIGNED DEFAULT NULL,
  `outubro` double UNSIGNED DEFAULT NULL,
  `novembro` double UNSIGNED DEFAULT NULL,
  `dezembro` double UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperado_mensalidade`
--

INSERT INTO `sig_cooperado_mensalidade` (`cod_mensalidade`, `cod_cooperado`, `ano`, `janeiro`, `fevereiro`, `marco`, `abril`, `maio`, `junho`, `julho`, `agosto`, `setembro`, `outubro`, `novembro`, `dezembro`) VALUES
(1, 7, 2018, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0),
(2, 1, 2019, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0),
(3, 2, 2019, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0),
(4, 3, 2018, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10),
(5, 3, 2019, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0),
(6, 4, 2017, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10),
(7, 4, 2018, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 5, 2019, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 6, 2017, 20, 20, 20, 2, 20, 20, 20, 20, 20, 20, 20, 20),
(10, 6, 2018, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperado_veiculo`
--

CREATE TABLE `sig_cooperado_veiculo` (
  `cod_veiculo` int(11) NOT NULL,
  `cod_cooperado` int(11) NOT NULL,
  `nz` varchar(20) DEFAULT NULL,
  `veiculo` varchar(20) DEFAULT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `ano_modelo` varchar(15) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperado_veiculo`
--

INSERT INTO `sig_cooperado_veiculo` (`cod_veiculo`, `cod_cooperado`, `nz`, `veiculo`, `cor`, `placa`, `ano_modelo`, `imagem`) VALUES
(1, 1, 'nz 5544', 'Gol 2.0', 'Branco', 'asd 4455', '2012/2013', NULL),
(2, 2, 'nz 5544', 'Gol 2.0', 'Branco', 'asd 4455', '2012/2013', NULL),
(3, 3, 'nz 5544 aux', '', '', '', '', NULL),
(4, 4, 'nz 0010', 'Fiat Mobi', 'Branco', 'nas 44444', '2012/2013', NULL),
(5, 5, 'nz 0010 aux', '', '', '', '', NULL),
(6, 6, 'nz 0050', 'voyage', 'branco', 'asd 555', '2012/2013', NULL),
(7, 7, 'nz 0041', 'Siena Fiat', 'Branco', 'ass 4545', '2012/2013', NULL),
(8, 8, '', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_cooperativa`
--

CREATE TABLE `sig_cooperativa` (
  `cod` int(11) NOT NULL,
  `nome_siglas` varchar(20) DEFAULT NULL,
  `nome_completo` varchar(200) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `cep` varchar(11) DEFAULT NULL,
  `telefone` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url_site` varchar(255) NOT NULL,
  `nome_presidente` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_cooperativa`
--

INSERT INTO `sig_cooperativa` (`cod`, `nome_siglas`, `nome_completo`, `cnpj`, `endereco`, `cep`, `telefone`, `email`, `url_site`, `nome_presidente`) VALUES
(1, 'STCAVRI', 'SINDICATO DOS TAXISTAS E CONDUTORES AUTONOMOS DE VEICULOS RODOVIARIOS DE ITAITUBA', '10.220.200/0001-03', 'AVENIDA NOVA DA SANTANA, N°549, BAIRRO CENTRO - ITAITUBA - PARÁ - BRASIL', '68180-030', '(93) 3518-3725', 'sindicato-Itaituba-stcavri@hotmail.com', '', 'TIMOTEO CORONEL');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_despesa`
--

CREATE TABLE `sig_despesa` (
  `cod` int(11) NOT NULL,
  `cod_cooperativa` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` double UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_despesa`
--

INSERT INTO `sig_despesa` (`cod`, `cod_cooperativa`, `descricao`, `valor`, `data`, `data_cadastro`) VALUES
(2, 1, 'Contas Fíxas', 10000, '2023-08-02', '2023-08-02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_investimento`
--

CREATE TABLE `sig_investimento` (
  `cod` int(11) NOT NULL,
  `cod_cooperativa` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` double UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_investimento`
--

INSERT INTO `sig_investimento` (`cod`, `cod_cooperativa`, `descricao`, `valor`, `data`, `data_cadastro`) VALUES
(2, 1, 'Teste', 5000, '2023-08-01', '2023-08-02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_lucro`
--

CREATE TABLE `sig_lucro` (
  `cod` int(11) NOT NULL,
  `cod_cooperativa` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `valor` double UNSIGNED NOT NULL,
  `data` date DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_lucro`
--

INSERT INTO `sig_lucro` (`cod`, `cod_cooperativa`, `descricao`, `valor`, `data`, `data_cadastro`) VALUES
(3, 1, 'Mensalidade de sócio', 20000, '2023-08-02', '2023-08-02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sig_usuario`
--

CREATE TABLE `sig_usuario` (
  `cod_usuario` int(11) NOT NULL,
  `cod_cooperativa` int(11) NOT NULL,
  `nome_usuario` varchar(20) NOT NULL,
  `sobrenome_usuario` varchar(100) NOT NULL,
  `usuario_usuario` varchar(30) NOT NULL,
  `email_usuario` varchar(100) NOT NULL,
  `senha_usuario` varchar(32) NOT NULL,
  `cargo_usuario` varchar(45) NOT NULL,
  `genero_usuario` varchar(10) DEFAULT NULL,
  `nivel_acesso_usuario` int(1) UNSIGNED NOT NULL,
  `status_usuario` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `imagem_usuario` varchar(255) DEFAULT NULL,
  `data_cadastro_usuario` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `sig_usuario`
--

INSERT INTO `sig_usuario` (`cod_usuario`, `cod_cooperativa`, `nome_usuario`, `sobrenome_usuario`, `usuario_usuario`, `email_usuario`, `senha_usuario`, `cargo_usuario`, `genero_usuario`, `nivel_acesso_usuario`, `status_usuario`, `imagem_usuario`, `data_cadastro_usuario`) VALUES
(6, 1, 'Usuário', 'Admin', 'admin', 'bugados01@gmail.com', 'c996d7b593437305e45bf727fc545b4a', 'Administrador', 'M', 4, 1, 'uploads/usuarios/user_masculino.png', '2018-04-05'),
(7, 1, 'Joab', 'Torres', 'joab.alencar', 'joabtorres1508@gmail.com', '47cafbff7d1c4463bbe7ba972a2b56e3', 'Participante', 'M', 3, 1, 'uploads/usuarios/2c23bf0890952d6f5542a0b40c4bba13.jpg', '2019-04-11');

--
-- Acionadores `sig_usuario`
--
DELIMITER $$
CREATE TRIGGER `tg_remove_usuario` BEFORE DELETE ON `sig_usuario` FOR EACH ROW BEGIN
DELETE FROM sig_cooperado_historico WHERE cod_usuario = OLD.cod_usuario;
END
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `sig_cooperado`
--
ALTER TABLE `sig_cooperado`
  ADD PRIMARY KEY (`cod_cooperado`);

--
-- Índices de tabela `sig_cooperado_carteira`
--
ALTER TABLE `sig_cooperado_carteira`
  ADD PRIMARY KEY (`cod`,`cod_cooperado`);

--
-- Índices de tabela `sig_cooperado_contato`
--
ALTER TABLE `sig_cooperado_contato`
  ADD PRIMARY KEY (`cod_contato`);

--
-- Índices de tabela `sig_cooperado_endereco`
--
ALTER TABLE `sig_cooperado_endereco`
  ADD PRIMARY KEY (`cod_endereco`);

--
-- Índices de tabela `sig_cooperado_historico`
--
ALTER TABLE `sig_cooperado_historico`
  ADD PRIMARY KEY (`cod_historico`);

--
-- Índices de tabela `sig_cooperado_mensalidade`
--
ALTER TABLE `sig_cooperado_mensalidade`
  ADD PRIMARY KEY (`cod_mensalidade`);

--
-- Índices de tabela `sig_cooperado_veiculo`
--
ALTER TABLE `sig_cooperado_veiculo`
  ADD PRIMARY KEY (`cod_veiculo`,`cod_cooperado`);

--
-- Índices de tabela `sig_cooperativa`
--
ALTER TABLE `sig_cooperativa`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `sig_despesa`
--
ALTER TABLE `sig_despesa`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `sig_investimento`
--
ALTER TABLE `sig_investimento`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `sig_lucro`
--
ALTER TABLE `sig_lucro`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `sig_usuario`
--
ALTER TABLE `sig_usuario`
  ADD PRIMARY KEY (`cod_usuario`),
  ADD UNIQUE KEY `usuario_usuario_UNIQUE` (`usuario_usuario`),
  ADD UNIQUE KEY `email_usuario_UNIQUE` (`email_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `sig_cooperado`
--
ALTER TABLE `sig_cooperado`
  MODIFY `cod_cooperado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `sig_cooperado_carteira`
--
ALTER TABLE `sig_cooperado_carteira`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `sig_cooperado_contato`
--
ALTER TABLE `sig_cooperado_contato`
  MODIFY `cod_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `sig_cooperado_endereco`
--
ALTER TABLE `sig_cooperado_endereco`
  MODIFY `cod_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `sig_cooperado_historico`
--
ALTER TABLE `sig_cooperado_historico`
  MODIFY `cod_historico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `sig_cooperado_mensalidade`
--
ALTER TABLE `sig_cooperado_mensalidade`
  MODIFY `cod_mensalidade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `sig_cooperado_veiculo`
--
ALTER TABLE `sig_cooperado_veiculo`
  MODIFY `cod_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `sig_cooperativa`
--
ALTER TABLE `sig_cooperativa`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sig_despesa`
--
ALTER TABLE `sig_despesa`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sig_investimento`
--
ALTER TABLE `sig_investimento`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `sig_lucro`
--
ALTER TABLE `sig_lucro`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sig_usuario`
--
ALTER TABLE `sig_usuario`
  MODIFY `cod_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
