-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.3.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for works
CREATE DATABASE IF NOT EXISTS `works` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `works`;

-- Dumping structure for table works.address
CREATE TABLE IF NOT EXISTS `address` (
  `add_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) DEFAULT NULL,
  `country` smallint(6) DEFAULT NULL CHECK (`country` between 0 and 271),
  `number` varchar(30) DEFAULT NULL,
  `street` varchar(150) DEFAULT NULL,
  `zipcode` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.address: ~22 rows (approximately)
INSERT INTO `address` (`add_id`, `city`, `country`, `number`, `street`, `zipcode`) VALUES
	(1, 'South Tony', 188, '540 Cedrick Ridges', 'Elma Motorway', '37723'),
	(2, 'Corwinberg', 92, '5324 Agnes Cliff', 'Roland Tunnel', '25601'),
	(3, 'Labadieton', 108, '7228 Sawayn Valley', 'Adrian Street', '26484'),
	(4, 'Gutkowskistad', 199, '050 O\'Conner Spurs', 'Lera Hills', '94498'),
	(5, 'Sandrachester', 26, '0247 Reilly Greens', 'Grimes Park', '08366'),
	(6, 'Louannberg', 265, '169 Henry Lights', 'Rolf Shoal', '46503'),
	(7, 'West Arlindabury', 101, '7015 Metz Route', 'Leffler Harbors', '26725'),
	(8, 'Veumport', 155, '6065 Buckridge Tunnel', 'Hickle Branch', '18230'),
	(9, 'Galinahaven', 148, '584 Koss Loaf', 'McDermott Flats', '54319'),
	(10, 'Abshiretown', 175, '90768 Christiansen Drive', 'Reilly Trail', '21003'),
	(11, 'Lashandastad', 17, '579 Stokes Union', 'Rosy Corners', '06800'),
	(12, 'Lake Joaquinshire', 120, '98347 Dooley Gardens', 'Isaiah Valleys', '02832'),
	(13, 'Pfannerstillfurt', 18, '6383 Eartha Glens', 'Werner Squares', '26244'),
	(14, 'Justinemouth', 162, '668 Lang Hill', 'Sang Tunnel', '48026'),
	(15, 'Sipesstad', 34, '03377 Cruickshank Cliff', 'Mueller Well', '20622'),
	(16, 'Thompsontown', 29, '377 Kuhn Ferry', 'Lizabeth Rest', '85517'),
	(17, 'Lake Zackfurt', 150, '51749 Kiley Garden', 'Lowe Light', '19634'),
	(18, 'Angelburgh', 266, '67837 Grant Ridges', 'Nicolas Land', '71434'),
	(19, 'Ferryview', 129, '0658 Yong Forges', 'Miller Mountain', '77331'),
	(20, 'Gerlachfort', 227, '50081 Marine Springs', 'Tremblay Fords', '49062'),
	(21, 'Ho Chi Minh City', 258, '350', 'Nguyen Van Luong', '727214'),
	(22, 'Ho Chi Minh City', 258, '350', 'Nguyen Van Luong', '727214');

-- Dumping structure for table works.candidate
CREATE TABLE IF NOT EXISTS `candidate` (
  `can_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dob` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `add_id` bigint(20) NOT NULL,
  PRIMARY KEY (`can_id`),
  UNIQUE KEY `UKqfut8ruekode092nlkipgl09g` (`email`),
  UNIQUE KEY `UK9i5yt1gvm0chg5e10qkns7tll` (`phone`),
  UNIQUE KEY `UKt80xy3wrb06a2a4s1su9asjt6` (`add_id`),
  CONSTRAINT `FKpp1pcm1idkj1sthlhaqm06gct` FOREIGN KEY (`add_id`) REFERENCES `address` (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.candidate: ~20 rows (approximately)
INSERT INTO `candidate` (`can_id`, `dob`, `email`, `full_name`, `phone`, `add_id`) VALUES
	(1, '1981-08-16', 'wilburn.ondricka@gmail.com', 'Yan Hodkiewicz', '(858) 478-3083 x6840', 1),
	(2, '1966-09-24', 'kristopher.towne@hotmail.com', 'Magda Schinner Group', '(813) 941-7666 x7390', 2),
	(3, '1971-10-30', 'luther.reichel@yahoo.com', 'Malia Lebsack', '(858) 501-8963 x7459', 3),
	(4, '1967-12-06', 'seth.schuppe@yahoo.com', 'Johnsie Crist', '(507) 651-7589 x7208', 4),
	(5, '1960-10-01', 'alvin.funk@gmail.com', 'Velda McClure', '(330) 830-0272 x1284', 5),
	(6, '1960-01-16', 'damon.ortiz@yahoo.com', 'Annita Beatty', '(330) 464-0383', 6),
	(7, '1962-05-26', 'carlton.greenfelder@gmail.com', 'Dr. Pam Block', '(617) 571-9815', 7),
	(8, '1969-03-02', 'efren.murphy@hotmail.com', 'Daysi Larson', '(570) 252-8465', 8),
	(9, '1960-12-29', 'chance.boehm@gmail.com', 'Arlie Wintheiser', '(301) 253-2673', 9),
	(10, '2001-02-26', 'toni.quigley@hotmail.com', 'Ms. Gaynelle Boehm', '(351) 601-7457 x9654', 10),
	(11, '1995-01-04', 'andrea.gusikowski@gmail.com', 'Dr. Ben Waelchi', '(734) 484-3571', 11),
	(12, '1960-09-28', 'magdalena.gleason@hotmail.com', 'Millard Hegmann', '(763) 765-3641 x1267', 12),
	(13, '1971-01-27', 'virgina.waters@gmail.com', 'Simona Zieme Group', '(417) 954-4014 x3795', 13),
	(14, '1994-03-21', 'darrick.carter@yahoo.com', 'Miss Signe Cartwright', '(206) 612-3381 x3722', 14),
	(15, '1973-09-13', 'karlene.stanton@hotmail.com', 'Ronnie Harris', '(770) 202-7521', 15),
	(16, '1981-03-13', 'ariel.bednar@yahoo.com', 'Zandra Lehner and Sons', '(302) 920-0212', 16),
	(17, '1995-01-09', 'elfriede.sporer@yahoo.com', 'Melaine Lakin', '(936) 269-0989', 17),
	(18, '1995-12-06', 'darrel.smith@gmail.com', 'Lynn Kulas', '(406) 650-1169', 18),
	(19, '1991-05-12', 'lazaro.dickens@hotmail.com', 'Mabelle Greenfelder', '(631) 774-6970 x5468', 19),
	(20, '2001-12-23', 'lurline.mohr@gmail.com', 'Darnell Kertzmann', '(303) 763-0990 x0297', 20);

-- Dumping structure for table works.candidate_skill
CREATE TABLE IF NOT EXISTS `candidate_skill` (
  `can_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  `more_infos` varchar(1000) DEFAULT NULL,
  `skill_level` tinyint(4) NOT NULL CHECK (`skill_level` between 0 and 4),
  PRIMARY KEY (`can_id`,`skill_id`),
  KEY `FKb7cxhiqhcah7c20a2cdlvr1f8` (`skill_id`),
  CONSTRAINT `FKb0m5tm3fi0upa3b3kjx3vrlxs` FOREIGN KEY (`can_id`) REFERENCES `candidate` (`can_id`),
  CONSTRAINT `FKb7cxhiqhcah7c20a2cdlvr1f8` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.candidate_skill: ~20 rows (approximately)
INSERT INTO `candidate_skill` (`can_id`, `skill_id`, `more_infos`, `skill_level`) VALUES
	(1, 1, 'Nemo error corporis rem accusantium repellat recusandae qui non nam accusamus quo maiores molestiae.', 1),
	(2, 2, 'Sequi expedita aspernatur cum ducimus asperiores asperiores laboriosam ut dignissimos dolor.', 2),
	(3, 3, 'Illum pariatur sequi aut expedita dignissimos nobis beatae qui sit est facilis consequatur dolor reprehenderit.', 3),
	(4, 4, 'Harum excepturi illo enim quibusdam et et aperiam qui quasi quibusdam odio.', 4),
	(5, 5, 'Nobis sed sit magni adipisci architecto pariatur consequatur veniam quaerat magnam.', 2),
	(6, 6, 'Ut itaque a rerum dolorum alias enim pariatur reprehenderit maxime aliquam quia a.', 0),
	(7, 7, 'Repellat nulla dolores omnis ab consequatur quidem quaerat quisquam in est nisi eum natus.', 1),
	(8, 8, 'Et consequatur voluptatum eaque natus dolor voluptatum eos culpa et illum.', 2),
	(9, 9, 'Est corrupti et dolores illo voluptatem et et eos minima modi praesentium nisi aut ducimus.', 3),
	(10, 10, 'Facere fugiat in consequuntur dolorum aperiam voluptas aspernatur quas quis enim rerum.', 1),
	(11, 11, 'Rem vero quia inventore sed exercitationem quo molestias sint recusandae impedit.', 4),
	(12, 12, 'Non et ratione amet dolor voluptatem aspernatur quod aut aut et culpa id exercitationem nihil.', 4),
	(13, 13, 'Minus maiores aliquam ut nemo earum maiores architecto consectetur enim voluptate incidunt.', 1),
	(14, 14, 'Labore quia sapiente tenetur quia occaecati sint est et veritatis a eligendi.', 2),
	(15, 15, 'Quae aut pariatur laboriosam optio non ut velit accusantium modi.', 4),
	(16, 16, 'Nam dolorem nisi nesciunt expedita iste corrupti accusamus odit cum.', 1),
	(17, 17, 'Consequatur quasi quis dolore et veritatis voluptas non quia autem.', 2),
	(18, 18, 'Asperiores est quos deserunt nihil earum magni veritatis sint dicta suscipit aut eos tenetur.', 4),
	(19, 19, 'Eligendi debitis est maiores non eos ut nulla blanditiis accusamus aliquid eos ipsam nobis.', 3),
	(20, 20, 'Nostrum voluptas illo et officiis quisquam voluptas sit qui reprehenderit impedit enim incidunt accusamus.', 0);

-- Dumping structure for table works.company
CREATE TABLE IF NOT EXISTS `company` (
  `com_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `about` varchar(2000) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `comp_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `web_url` varchar(255) DEFAULT NULL,
  `add_id` bigint(20) NOT NULL,
  PRIMARY KEY (`com_id`),
  UNIQUE KEY `UK6shnfufxk9y1hav2atbeyaon2` (`add_id`),
  CONSTRAINT `FKi35520i7yexo7ftktc8157xjr` FOREIGN KEY (`add_id`) REFERENCES `address` (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.company: ~20 rows (approximately)
INSERT INTO `company` (`com_id`, `about`, `email`, `comp_name`, `phone`, `web_url`, `add_id`) VALUES
	(1, 'Mollitia consequatur et dolores esse velit voluptatem sint est nihil sed in libero et.', 'thad.christiansen@gmail.com', 'Connelly and Sons', '(781) 954-7295', 'https://www.stanton-metz.co/#rerum', 1),
	(2, 'Officia consequatur quisquam et quas explicabo qui eum est aliquam mollitia aperiam ea.', 'marilyn.hermann@yahoo.com', 'Sporer, Jaskolski and McGlynn', '(228) 940-1627', 'https://www.adell-tromp.io/dolore/quicorrupti', 2),
	(3, 'Sit perferendis nostrum velit veniam veritatis vel aut facere autem praesentium ducimus nihil non.', 'latoya.adams@hotmail.com', 'Marquardt-Fisher', '(760) 440-1359 x4785', 'https://www.manuel-champlin.com/voluptatem/nonvel?eum=quo&dolor=est#rerum', 3),
	(4, 'Possimus ratione adipisci totam eius pariatur ut dolorem ipsam harum nemo voluptas expedita.', 'shane.vandervort@yahoo.com', 'Kuhic-Hansen', '(862) 978-4382', 'https://www.gordon-blick.info/', 4),
	(5, 'Sit at non fugiat non minima vel quod harum quo porro.', 'providencia.hartmann@gmail.com', 'Durgan-Bernhard', '(712) 949-8170 x3152', 'https://www.clyde-hirthe.io:16381/id/laborum#reiciendis', 5),
	(6, 'Reiciendis ad voluptatum provident aut voluptas quod cumque odio corrupti consequuntur debitis et ut id.', 'ramiro.champlin@yahoo.com', 'Parker, Abbott and Conroy', '(949) 307-5266 x9145', 'https://www.myrtice-abernathy.biz/aperiam#ea', 6),
	(7, 'Qui quia enim blanditiis ipsam odit illum delectus aliquam et laudantium eligendi.', 'roosevelt.reynolds@yahoo.com', 'Corkery, Hills and Leannon', '(440) 313-5589 x9706', 'http://www.ron-treutel.org:16485/?provident=repudiandae&unde=doloribus', 7),
	(8, 'Vel rerum iure facere facere aut dolores atque non dolorem dolor adipisci molestiae.', 'floyd.goldner@yahoo.com', 'Keebler Inc', '(772) 252-7218 x7727', 'http://www.debera-stoltenberg.net/?ipsum=commodi&praesentium=similique#dolor', 8),
	(9, 'Veritatis ipsum aut consequuntur rem rerum velit voluptatem iste perspiciatis repellendus temporibus.', 'nathanial.considine@yahoo.com', 'Lebsack and Sons', '(347) 319-9605 x3897', 'https://www.stefan-krajcik.info:23274/voluptates/repellat', 9),
	(10, 'Occaecati tempora dolores qui aut itaque qui voluptatum reprehenderit aliquid sequi veniam qui explicabo quos.', 'cherryl.bogisich@gmail.com', 'Hessel-Heaney', '(310) 586-4043 x4535', 'https://www.ellamae-schoen.biz:32612/voluptatem/quiset?porro=dolores&autem=consequatur', 10),
	(11, 'Ut sed ullam dignissimos occaecati non nemo cumque officiis odit numquam vero modi possimus.', 'lucas.stiedemann@yahoo.com', 'Keeling-Kozey', '(971) 910-5620', 'https://www.eustolia-becker.biz:19483/quibusdam/quiaatque?velit=tempore&id=error', 11),
	(12, 'In quia et enim et molestiae deleniti cumque est voluptas quas et.', 'alberto.tremblay@hotmail.com', 'Kohler, Bosco and Mills', '(541) 520-4873', 'https://www.hayden-wunsch.name/similique/alias?at=id&odio=perferendis#commodi', 12),
	(13, 'Repellendus et eius delectus consectetur ipsam ut voluptatem doloremque vitae iusto.', 'jonell.oreilly@yahoo.com', 'Emard-Bosco', '(912) 947-2433', 'http://www.chasidy-leuschke.info:7057/?enim=aliquid&itaque=sint#omnis', 13),
	(14, 'Quod quasi expedita dolor dolores iste repudiandae cum enim corporis et qui eligendi eum et.', 'rosy.konopelski@yahoo.com', 'Jacobson, Kerluke and Greenholt', '(540) 985-4622', 'http://www.jeffrey-marvin.co/voluptatum?deleniti=quam&adipisci=corrupti#itaque', 14),
	(15, 'Qui quidem fugiat quidem quisquam vel sit est nisi sed neque dolores at nihil unde.', 'jule.rolfson@hotmail.com', 'Orn-Turcotte', '(248) 256-2766 x0539', 'http://www.lawerence-pacocha.com/?dolor=atque&minima=qui', 15),
	(16, 'Sed porro mollitia tenetur est occaecati aut expedita sit eveniet enim et.', 'kenton.mclaughlin@yahoo.com', 'Metz, MacGyver and Gleason', '(323) 914-2639 x8438', 'http://www.norris-braun.name:64764/voluptates/eumet', 16),
	(17, 'Tempora ratione eum nesciunt enim dolorem quam nesciunt qui dolorem.', 'duncan.brakus@yahoo.com', 'Stehr-Grant', '(716) 940-8116 x9843', 'http://www.josefina-conn.com:1103/ex/veronam?perferendis=non&suscipit=ratione#eveniet', 17),
	(18, 'Labore qui laudantium provident est sed molestiae ut eos sed in labore nihil tempora.', 'michel.strosin@yahoo.com', 'Lindgren and Sons', '(971) 801-9899', 'http://www.angeles-romaguera.name/animi/invelit?natus=quia&modi=vitae', 18),
	(19, 'Itaque nisi sint fugit libero voluptatem rerum illum et et minus molestiae.', 'edison.leannon@yahoo.com', 'Dicki LLC', '(229) 501-7168 x4664', 'https://www.keren-gusikowski.net:52628/#ut', 19),
	(20, 'Maiores dolorum repudiandae quis dignissimos est qui aliquam reprehenderit dolor.', 'sheldon.jaskolski@hotmail.com', 'Mraz-Luettgen', '(860) 201-7049 x8977', 'https://www.theressa-hoeger.com/in?molestiae=modi&quos=aut#itaque', 20);

-- Dumping structure for table works.experience
CREATE TABLE IF NOT EXISTS `experience` (
  `exp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company` varchar(120) NOT NULL,
  `from_date` date NOT NULL,
  `role` varchar(100) NOT NULL,
  `to_date` date NOT NULL,
  `work_desc` varchar(400) NOT NULL,
  `can_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`exp_id`),
  KEY `FK8d5oqe0wxh52v352i04qnuady` (`can_id`),
  CONSTRAINT `FK8d5oqe0wxh52v352i04qnuady` FOREIGN KEY (`can_id`) REFERENCES `candidate` (`can_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.experience: ~55 rows (approximately)
INSERT INTO `experience` (`exp_id`, `company`, `from_date`, `role`, `to_date`, `work_desc`, `can_id`) VALUES
	(1, 'Padberg Inc', '2024-04-03', 'Dynamic Planner', '2024-04-15', 'Sed amet dolor.', 1),
	(2, 'Jerde, Jacobs and Wilkinson', '2024-10-12', 'Government Assistant', '2024-10-28', 'Quae laboriosam earum sed voluptatibus voluptatem enim.', 1),
	(3, 'Bernhard Inc', '2024-05-16', 'Forward Sales Technician', '2024-06-02', 'Ut magnam dolores iusto voluptatibus sit modi earum.', 1),
	(4, 'Gorczany-Ankunding', '2024-09-17', 'Future Mining Executive', '2024-10-04', 'Voluptas rerum et.', 2),
	(5, 'Veum, Stiedemann and Ritchie', '2024-02-17', 'Marketing Officer', '2024-03-03', 'Enim ea sed qui.', 3),
	(6, 'Maggio LLC', '2024-07-25', 'District Real-Estate Liaison', '2024-07-27', 'Omnis et modi omnis cum animi.', 3),
	(7, 'Metz Inc', '2024-11-10', 'Human Sales Manager', '2024-11-21', 'Sunt et magni sed nihil cumque eos dolorem.', 3),
	(8, 'Monahan Group', '2024-10-16', 'Lead Assistant', '2024-10-26', 'Natus tenetur doloribus explicabo reprehenderit fuga voluptatum autem.', 4),
	(9, 'Balistreri LLC', '2024-07-13', 'Education Supervisor', '2024-08-10', 'Nobis explicabo aut.', 4),
	(10, 'Lang, Schmidt and Stark', '2024-10-11', 'Manufacturing Engineer', '2024-10-21', 'Est voluptas ut distinctio ipsam quia.', 4),
	(11, 'Thiel, Kohler and Legros', '2024-09-28', 'Regional Administration Technician', '2024-09-29', 'Laborum nobis reiciendis adipisci inventore consequatur natus earum.', 5),
	(12, 'Runolfsdottir-Leannon', '2024-06-29', 'Marketing Manager', '2024-07-13', 'Officia voluptatem magni itaque placeat nisi autem.', 6),
	(13, 'Rutherford, Aufderhar and Bernier', '2024-04-18', 'Chief Officer', '2024-04-19', 'Maxime id assumenda accusamus.', 6),
	(14, 'Champlin LLC', '2024-03-27', 'Construction Specialist', '2024-04-10', 'Nihil non enim saepe quasi voluptatem necessitatibus.', 7),
	(15, 'Rippin-Nicolas', '2024-08-20', 'Forward Producer', '2024-08-28', 'Illo quia maxime optio aut asperiores eos.', 8),
	(16, 'Ullrich Group', '2024-04-13', 'Real-Estate Liaison', '2024-05-04', 'Ea laudantium et voluptas.', 8),
	(17, 'Durgan, Homenick and Hauck', '2024-07-20', 'Marketing Administrator', '2024-08-16', 'Libero rem accusantium.', 9),
	(18, 'Predovic, Kutch and Hand', '2024-06-25', 'Technology Specialist', '2024-07-15', 'A et vel quo molestias.', 9),
	(19, 'Herman, Kassulke and Lowe', '2024-11-04', 'Manufacturing Planner', '2024-11-23', 'Provident commodi recusandae modi qui.', 9),
	(20, 'Sawayn LLC', '2023-12-18', 'Dynamic Administration Architect', '2023-12-23', 'Et unde sed et consequuntur harum consectetur voluptas.', 9),
	(21, 'Aufderhar-Jenkins', '2024-05-20', 'Banking Producer', '2024-06-10', 'Dolor voluptatem non beatae quo consectetur.', 9),
	(22, 'Legros Group', '2024-03-21', 'Advertising Planner', '2024-03-28', 'At deleniti perferendis.', 10),
	(23, 'Thompson and Sons', '2024-11-19', 'Chief Accounting Executive', '2024-12-03', 'Asperiores temporibus nesciunt ex ducimus enim.', 11),
	(24, 'Mohr, Pollich and Dare', '2024-07-07', 'Central Consulting Technician', '2024-07-10', 'Quidem itaque voluptas sit laboriosam ut a.', 11),
	(25, 'Wilkinson, Buckridge and Mayert', '2024-11-30', 'Global Education Director', '2024-12-28', 'Magnam magni cum tempora vel aliquam.', 11),
	(26, 'Wyman, White and Durgan', '2024-08-14', 'Regional Education Analyst', '2024-08-19', 'Eius molestiae numquam rerum.', 11),
	(27, 'Mosciski, Wyman and Daniel', '2024-08-16', 'Chief Planner', '2024-08-30', 'Id suscipit placeat aut magni aliquid.', 12),
	(28, 'Haag, Wilkinson and Hermann', '2024-10-06', 'Chief Designer', '2024-10-29', 'Enim aut illum voluptate et omnis nihil.', 12),
	(29, 'Denesik and Sons', '2024-03-16', 'Customer Construction Manager', '2024-04-13', 'Optio aliquid fuga non omnis et ipsum.', 12),
	(30, 'Gutkowski, Rohan and Kunde', '2024-09-19', 'Lead Accounting Architect', '2024-10-02', 'Qui ipsam sint.', 12),
	(31, 'Prosacco-Schmeler', '2024-07-15', 'National Construction Developer', '2024-07-29', 'Dolores suscipit modi quaerat ut molestiae aspernatur ipsum.', 12),
	(32, 'Predovic, Crona and Dicki', '2024-10-06', 'Forward Sales Consultant', '2024-10-31', 'Vero vel dolores qui eum expedita dicta tempora.', 13),
	(33, 'Orn, Bauch and McCullough', '2024-05-29', 'Legacy Consulting Facilitator', '2024-06-02', 'Accusamus nihil aut quaerat adipisci dignissimos sed.', 14),
	(34, 'Armstrong, Flatley and Cremin', '2024-06-20', 'District Hospitality Representative', '2024-06-29', 'Optio optio blanditiis possimus aliquid quibusdam.', 14),
	(35, 'Dare-Renner', '2024-01-21', 'Human Banking Manager', '2024-02-04', 'Voluptatem quos odio natus fuga qui dolores harum.', 15),
	(36, 'Torp and Sons', '2024-07-14', 'Legal Developer', '2024-08-11', 'Eos magni aut et dolorum doloribus.', 16),
	(37, 'Watsica, Satterfield and Koepp', '2024-05-10', 'Direct Liaison', '2024-05-21', 'Consequuntur possimus veritatis repellat rerum animi quo.', 16),
	(38, 'Heidenreich, Keebler and Waters', '2024-10-15', 'Customer Facilitator', '2024-10-20', 'Quia tenetur sed distinctio omnis consequatur consequatur.', 16),
	(39, 'Mayer-Bashirian', '2024-09-04', 'Forward Government Coordinator', '2024-09-22', 'Magnam est explicabo dolorum.', 16),
	(40, 'Daniel, Morissette and Padberg', '2024-08-16', 'Internal Hospitality Liaison', '2024-08-24', 'Officia voluptas id deleniti.', 16),
	(41, 'Denesik Group', '2024-10-04', 'Real-Estate Coordinator', '2024-10-21', 'Eligendi tempore aut qui.', 17),
	(42, 'Ernser, Mitchell and Pagac', '2024-08-16', 'Forward Strategist', '2024-09-14', 'Voluptatem non quia molestiae magni nobis aut ducimus.', 17),
	(43, 'Maggio, Herzog and Miller', '2024-01-05', 'National Technology Manager', '2024-01-17', 'Ratione fugiat qui inventore est.', 17),
	(44, 'Bailey-Schultz', '2024-03-22', 'Administration Producer', '2024-04-09', 'Recusandae sapiente quis consequatur doloribus sed.', 18),
	(45, 'Strosin-Bernier', '2024-07-02', 'Legacy Consultant', '2024-07-07', 'Dicta totam unde ipsam sed.', 18),
	(46, 'Leffler, Fritsch and Carter', '2024-07-19', 'Healthcare Producer', '2024-08-01', 'Dolorem incidunt in laborum.', 18),
	(47, 'Schaefer and Sons', '2024-11-14', 'Education Producer', '2024-12-10', 'Nesciunt ipsa voluptatem fugit minus.', 18),
	(48, 'Toy Group', '2024-01-07', 'National Real-Estate Director', '2024-01-15', 'Blanditiis perspiciatis tenetur.', 18),
	(49, 'Durgan-Brown', '2024-07-31', 'Advertising Orchestrator', '2024-08-21', 'Quia in omnis et sed.', 19),
	(50, 'Block-Bartell', '2024-05-23', 'Construction Planner', '2024-06-08', 'Et qui consectetur ea aut dignissimos atque.', 19),
	(51, 'Muller, Hoppe and Waelchi', '2024-04-27', 'Legal Officer', '2024-05-12', 'Expedita et sunt fuga qui perferendis eum.', 20),
	(52, 'Carroll-Hyatt', '2024-01-27', 'International Manufacturing Specialist', '2024-02-04', 'Quia nam eum.', 20),
	(53, 'Jerde-Walter', '2024-07-05', 'Dynamic Consulting Administrator', '2024-07-15', 'Similique corrupti rerum rerum culpa distinctio.', 20),
	(54, 'Bergstrom, Christiansen and Spinka', '2024-11-25', 'Marketing Coordinator', '2024-12-23', 'Dolorum ad provident facilis asperiores.', 20),
	(55, 'Ferry, Hills and Powlowski', '2023-12-13', 'Banking Associate', '2023-12-18', 'Error aut ex cupiditate quis ut sunt.', 20);

-- Dumping structure for table works.job
CREATE TABLE IF NOT EXISTS `job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_desc` varchar(2000) NOT NULL,
  `job_name` varchar(255) NOT NULL,
  `com_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `FKexhlpi1dtnhxnftqe4udd1ucg` (`com_id`),
  CONSTRAINT `FKexhlpi1dtnhxnftqe4udd1ucg` FOREIGN KEY (`com_id`) REFERENCES `company` (`com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.job: ~20 rows (approximately)
INSERT INTO `job` (`job_id`, `job_desc`, `job_name`, `com_id`) VALUES
	(1, 'Voluptate voluptates odit minima quia rerum adipisci nobis possimus assumenda.', 'Producer', 1),
	(2, 'Veniam dolorem ad nostrum est similique praesentium amet quia cupiditate occaecati voluptatem.', 'Consultant', 2),
	(3, 'Consequuntur aliquam voluptatem voluptas fugiat facere voluptate est pariatur omnis quia facere.', 'Manager', 3),
	(4, 'Rerum ut omnis minima saepe incidunt maiores ratione omnis et et et.', 'Agent', 4),
	(5, 'Dolore consequatur eos et reprehenderit et autem ad omnis vero saepe voluptas autem voluptatem tempora.', 'Assistant', 5),
	(6, 'Sapiente cupiditate dolorum beatae consectetur laudantium adipisci fugit ut ut sed mollitia perspiciatis doloribus voluptatem.', 'Associate', 6),
	(7, 'Commodi reiciendis dolorem quis atque nesciunt provident ut qui voluptas est ut id id.', 'Planner', 7),
	(8, 'Sint esse dolorum amet est ut sunt qui et consequatur culpa.', 'Consultant', 8),
	(9, 'Totam officia unde voluptate quia consequuntur quos aut repellendus sunt earum.', 'Consultant', 9),
	(10, 'Molestias quasi et quae est cupiditate qui quia labore eum explicabo rerum et dolor.', 'Associate', 10),
	(11, 'Quia officia ut itaque minus aperiam velit repellendus sit voluptatem voluptas odit veniam.', 'Technician', 11),
	(12, 'Perferendis ut voluptatem perferendis aut quae nihil laudantium soluta iusto aut atque.', 'Producer', 12),
	(13, 'Est consectetur porro delectus dolores soluta enim aperiam deserunt qui illo.', 'Supervisor', 13),
	(14, 'Et nesciunt quia ullam molestias facilis quos non itaque mollitia itaque beatae sed aliquam.', 'Coordinator', 14),
	(15, 'Ut voluptatem et voluptatum vero eaque accusantium cum quidem reprehenderit consequatur.', 'Technician', 15),
	(16, 'Et pariatur est officia dolor tenetur cumque culpa voluptatem quaerat qui sit ad velit.', 'Producer', 16),
	(17, 'Fugit tenetur labore veritatis dolorem ullam doloremque dolor tenetur et autem.', 'Supervisor', 17),
	(18, 'Itaque sunt et voluptatum inventore earum doloribus dignissimos alias et quasi officia sit.', 'Planner', 18),
	(19, 'Ut iusto aut corporis a voluptate ullam amet quisquam iste laudantium.', 'Liaison', 19),
	(20, 'In exercitationem dolor totam eos et ut eum libero ut expedita possimus voluptates corporis accusamus.', 'Consultant', 20);

-- Dumping structure for table works.job_skill
CREATE TABLE IF NOT EXISTS `job_skill` (
  `job_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  `more_infos` varchar(1000) DEFAULT NULL,
  `skill_level` tinyint(4) NOT NULL CHECK (`skill_level` between 0 and 4),
  PRIMARY KEY (`job_id`,`skill_id`),
  KEY `FKj33qbbf3vk1lvhqpcosnh54u1` (`skill_id`),
  CONSTRAINT `FK9ix4wg520ii2gu2felxdhdup6` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `FKj33qbbf3vk1lvhqpcosnh54u1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.job_skill: ~20 rows (approximately)
INSERT INTO `job_skill` (`job_id`, `skill_id`, `more_infos`, `skill_level`) VALUES
	(1, 1, 'Delectus eum nostrum nobis est voluptas cum at officiis sequi quis aut.', 1),
	(2, 2, 'Est quia consectetur qui aut ut natus ea voluptas fugiat dolor et beatae.', 2),
	(3, 3, 'Officia voluptatem voluptas aliquam quaerat earum saepe molestiae earum consequatur odio alias.', 2),
	(4, 4, 'Suscipit et cumque excepturi quia est id omnis dolore ullam a vero officia eos.', 3),
	(5, 5, 'Occaecati praesentium quibusdam omnis possimus exercitationem eveniet porro est voluptas quas quibusdam velit et.', 3),
	(6, 6, 'Commodi cumque qui autem possimus quasi magnam facere voluptatem sint sunt voluptatem qui necessitatibus.', 2),
	(7, 7, 'Est reiciendis tempore aliquam sunt reprehenderit odio tempore modi quos sit.', 3),
	(8, 8, 'Excepturi id aliquam cupiditate unde hic doloremque error voluptates cumque velit distinctio repellat.', 3),
	(9, 9, 'Consectetur et itaque voluptatem tenetur consequatur qui impedit accusantium voluptas.', 0),
	(10, 10, 'Blanditiis neque sunt ab quaerat aut sint beatae eos quaerat ad.', 1),
	(11, 11, 'Necessitatibus maiores repudiandae vero blanditiis ratione qui officiis ut repudiandae.', 2),
	(12, 12, 'Est aspernatur libero culpa eveniet commodi doloremque a aut earum sequi est.', 3),
	(13, 13, 'Consequatur omnis provident magni harum quis voluptas cupiditate saepe vero quia maxime qui sapiente.', 2),
	(14, 14, 'Dignissimos aliquam dolore dolor illum fugit architecto iste voluptas recusandae accusamus aut dolores consequatur et.', 4),
	(15, 15, 'Necessitatibus voluptas quasi magni id commodi voluptate aut quia ea id delectus nam amet in.', 4),
	(16, 16, 'Corporis tempora nulla animi aliquam totam natus impedit laboriosam deleniti.', 3),
	(17, 17, 'Aut iste temporibus nobis sit consequuntur et aperiam natus hic.', 2),
	(18, 18, 'Dolore esse cum autem hic laudantium deserunt earum dolor ut temporibus dolore consequatur.', 1),
	(19, 19, 'Aut ut nostrum iure ipsum iure quaerat minima excepturi sed qui.', 3),
	(20, 20, 'Enim et voluptates qui velit quis consequatur itaque non nobis ab quaerat.', 2);

-- Dumping structure for table works.skill
CREATE TABLE IF NOT EXISTS `skill` (
  `skill_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `skill_desc` varchar(300) NOT NULL,
  `skill_name` varchar(150) NOT NULL,
  `skill_type` tinyint(4) NOT NULL CHECK (`skill_type` between 0 and 2),
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table works.skill: ~21 rows (approximately)
INSERT INTO `skill` (`skill_id`, `skill_desc`, `skill_name`, `skill_type`) VALUES
	(1, 'Delectus distinctio sed optio debitis et recusandae sequi inventore et.', 'Organisation', 0),
	(2, 'Maiores in eos quia a occaecati cumque.', 'Fast learner', 2),
	(3, 'Necessitatibus quidem repudiandae sed corrupti velit voluptas deserunt praesentium ab.', 'Networking skills', 1),
	(4, 'Nemo dicta aut repudiandae rerum quis blanditiis aut dolor.', 'Proactive', 1),
	(5, 'Soluta praesentium corporis qui sit sit.', 'Networking skills', 2),
	(6, 'Similique odit commodi sed quas aliquam perspiciatis quis esse placeat odio.', 'Networking skills', 1),
	(7, 'Eos qui iure enim deleniti et quia consequuntur in ipsa.', 'Networking skills', 2),
	(8, 'Quis repellat sed optio eius exercitationem vel accusantium voluptatem.', 'Teamwork', 2),
	(9, 'Magni omnis ab quia et modi dolores iste enim consequatur ducimus voluptatem ipsum.', 'Leadership', 1),
	(10, 'Minima eos ex in inventore ad neque quia porro consequatur.', 'Proactive', 0),
	(11, 'Minima voluptas tenetur et laborum voluptatem nemo iste est molestiae.', 'Problem solving', 1),
	(12, 'Et molestiae neque cum architecto laboriosam esse maiores eos blanditiis.', 'Problem solving', 1),
	(13, 'Dignissimos fuga voluptate quisquam ut suscipit et in sed consequatur dolor.', 'Teamwork', 0),
	(14, 'Suscipit et quis recusandae molestiae corrupti voluptatem deserunt.', 'Technical savvy', 2),
	(15, 'Dolor non dolore a quos at voluptatibus ipsam adipisci explicabo.', 'Self-motivated', 0),
	(16, 'Expedita dolores perferendis voluptas ullam sint occaecati recusandae eum totam nulla.', 'Work under pressure', 2),
	(17, 'Nemo ad provident quia ab ducimus sint excepturi.', 'Leadership', 1),
	(18, 'Facilis omnis eos impedit sed non.', 'Organisation', 0),
	(19, 'Et aut non at tempore ut commodi tempore autem.', 'Communication', 0),
	(20, 'Sint eveniet autem voluptatem cupiditate ut quibusdam earum sit nihil.', 'Technical savvy', 2),
	(21, 'Python is a versatile, high-level programming language known for its simplicity and readability', 'Python', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
