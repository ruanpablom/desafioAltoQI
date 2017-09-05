-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 05, 2017 at 04:16 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `altoqi_sv`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `answer` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `answer`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5'),
(6, '6'),
(7, '7'),
(8, '8'),
(9, '9'),
(10, '10'),
(11, 'Muito Satisfeito'),
(12, 'Satisfeito'),
(13, 'Indiferente'),
(14, 'Insatisfeito'),
(15, 'Muito Insatisfeito'),
(16, 'Não Possuo o Software'),
(17, 'Não sei avaliar'),
(18, 'Nunca tive esse tipo de suporte'),
(19, 'Nunca fui atendido por esse departamento'),
(20, 'Muito importante'),
(21, 'Importante'),
(22, 'Pouco importante'),
(23, 'Irrelevante'),
(24, 'Prefiro não avaliar'),
(25, '0');

-- --------------------------------------------------------

--
-- Table structure for table `answer_question`
--

CREATE TABLE `answer_question` (
  `id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer_question`
--

INSERT INTO `answer_question` (`id`, `answer_id`, `question_id`) VALUES
(1, 11, 1),
(2, 12, 1),
(3, 13, 1),
(4, 14, 1),
(5, 15, 1),
(6, 16, 1),
(7, 17, 1),
(8, 11, 2),
(9, 12, 2),
(10, 13, 2),
(11, 14, 2),
(12, 15, 2),
(13, 17, 2),
(14, 11, 3),
(15, 12, 3),
(16, 13, 3),
(17, 14, 3),
(18, 15, 3),
(19, 18, 3),
(20, 17, 3),
(21, 11, 4),
(22, 12, 4),
(23, 13, 4),
(24, 14, 4),
(25, 15, 4),
(26, 19, 4),
(27, 17, 4),
(28, 20, 5),
(29, 21, 5),
(30, 22, 5),
(31, 23, 5),
(32, 24, 5),
(33, 25, 6),
(34, 1, 6),
(35, 2, 6),
(36, 3, 6),
(37, 4, 6),
(38, 5, 6),
(39, 6, 6),
(40, 7, 6),
(41, 8, 6),
(42, 9, 6),
(43, 10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `surveyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `description`, `surveyID`) VALUES
(1, 'Dentre os sistemas da AltoQi, qual seu grau de satisfação em relação a cada um deles?', 1),
(2, 'Qual seu grau de satisfação em relação ao serviço de entrega de produtos da AltoQi:', 1),
(3, 'Dentre os tipos de suporte que a AltoQi oferece, qual seu grau de satisfação em relação a eles?', 1),
(4, 'Dentre os departamentos, qual seu grau de satisfação quanto ao atendimento de cada um?', 1),
(5, 'Tendo em vista o fácil acesso ao material digital (tutoriais) do software, qual o grau de importância no recebimento de material impresso, contendo embalagem e guia rápido?', 1),
(6, 'Em uma escala de 0 a 10, qual sua propensão em indicar a AltoQi para colegas?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_topic`
--

CREATE TABLE `question_topic` (
  `id` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `topic` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_topic`
--

INSERT INTO `question_topic` (`id`, `questionId`, `topic`) VALUES
(1, 1, 'Eberick'),
(2, 1, 'Eberick Pré-moldado'),
(3, 1, 'QiHidrossanitário'),
(4, 1, 'QiIncêndio'),
(5, 1, 'QiGás'),
(6, 1, 'QiAlvenaria'),
(7, 1, 'QiElétrico'),
(8, 1, 'QiSPDA'),
(9, 1, 'QiEditor de Armaduras'),
(10, 2, 'Tempo'),
(11, 2, 'Qualidade da embalagem'),
(12, 2, 'Informações de rastreamento'),
(13, 3, 'Suporte de Utilização'),
(14, 3, 'Suporte de Instalação'),
(15, 4, 'Comercial'),
(16, 4, 'Financeiro / Cobrança'),
(17, 4, 'Suporte'),
(18, 4, 'Central de Atendimento'),
(19, 4, 'SAC'),
(20, 4, 'Cursos'),
(21, 5, ''),
(22, 6, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey`
--

INSERT INTO `survey` (`id`, `title`, `description`) VALUES
(1, 'Pesquisa de Satisfação', 'Com o objetivo de desenvolver produtos customizados a sua demanda de projetos e atendê-lo cada vez melhor, pedimos que responda a nossa pesquisa de satisfação:');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_answer_topic`
--

CREATE TABLE `user_answer_topic` (
  `id` int(11) NOT NULL,
  `question_topic_id` int(11) NOT NULL,
  `question_answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_question_comment`
--

CREATE TABLE `user_question_comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `coment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer_question`
--
ALTER TABLE `answer_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `surveyID` (`surveyID`);

--
-- Indexes for table `question_topic`
--
ALTER TABLE `question_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questionId` (`questionId`);

--
-- Indexes for table `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_answer_topic`
--
ALTER TABLE `user_answer_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_topic_id` (`question_topic_id`),
  ADD KEY `question_answer_id` (`question_answer_id`);

--
-- Indexes for table `user_question_comment`
--
ALTER TABLE `user_question_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `answer_question`
--
ALTER TABLE `answer_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `question_topic`
--
ALTER TABLE `question_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_answer_topic`
--
ALTER TABLE `user_answer_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_question_comment`
--
ALTER TABLE `user_question_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer_question`
--
ALTER TABLE `answer_question`
  ADD CONSTRAINT `answer_question_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`),
  ADD CONSTRAINT `answer_question_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`surveyID`) REFERENCES `survey` (`id`);

--
-- Constraints for table `question_topic`
--
ALTER TABLE `question_topic`
  ADD CONSTRAINT `question_topic_ibfk_1` FOREIGN KEY (`questionId`) REFERENCES `question` (`id`);

--
-- Constraints for table `user_answer_topic`
--
ALTER TABLE `user_answer_topic`
  ADD CONSTRAINT `user_answer_topic_ibfk_1` FOREIGN KEY (`question_topic_id`) REFERENCES `question_topic` (`id`),
  ADD CONSTRAINT `user_answer_topic_ibfk_2` FOREIGN KEY (`question_answer_id`) REFERENCES `answer_question` (`id`);

--
-- Constraints for table `user_question_comment`
--
ALTER TABLE `user_question_comment`
  ADD CONSTRAINT `user_question_comment_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `user_question_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
