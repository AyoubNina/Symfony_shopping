-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 13 jan. 2022 à 19:34
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `achat`
--

DROP TABLE IF EXISTS `achat`;
CREATE TABLE IF NOT EXISTS `achat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` double NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `achat`
--

INSERT INTO `achat` (`id`, `id_utilisateur`, `id_produit`, `quantite`, `prix`, `numero`) VALUES
(1, 2, 34, 2, 70, 0),
(2, 2, 31, 1, 47, 0),
(3, 2, 34, 2, 70, 0),
(4, 2, 31, 1, 47, 0),
(5, 2, 38, 1, 73, 1),
(6, 2, 37, 2, 75, 1),
(7, 2, 36, 1, 140, 1),
(8, 2, 35, 1, 130, 1),
(9, 2, 41, 1, 43, 1),
(10, 2, 34, 1, 70, 1),
(11, 2, 35, 1, 130, 1),
(12, 2, 34, 1, 70, 1),
(13, 2, 34, 1, 70, 1),
(14, 2, 42, 3, 48, 1),
(15, 2, 46, 0, 33, 1),
(16, 2, 37, 1, 75, 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `nom`, `prenom`, `email`, `message`) VALUES
(2, 'maalej', 'anas', 'anasmaalej@gmail.com', 'bonjour, comment je peux acheter vos produits directement? '),
(3, 'frikha', 'khouloud', 'khouloudfrikha@gmail.com', 'bonjour, est ce que vous assuez la livraison?'),
(4, 'barhoumi', 'molka', 'molkabarhoumi@gmail.com', 'votre numero de telephone svp'),
(5, 'ben mohamed', 'sana', 'sana1995@gmail.com', 'la taille de la robe blanche svp'),
(6, 'belkefi', 'fatma', 'fatma2000@gmail.com', 'bonsoir, ou se trouve votre local ? merci de me repondre'),
(7, 'zribi', 'leila', 'leila1975@gmail.com', 'je veux acheter le bonnet noir'),
(8, 'chakroun', 'saloua', 'salouachakroun@gmail.com', 'salut, comment je peux avoir ma commande? '),
(9, 'frikha', 'hejer', 'hejerfr@gmail.com', 'votre numero de telephone svp? comment je peux vous contacter?'),
(10, 'maalej', 'mouna', 'mounamaalej@gmail.com', 'bonsoir, vous avez de belles vetements, est ce que vous faites des remises?'),
(11, 'abbes', 'jaweher', 'jaweherabbes@gmail.com', 'bravo pour le site, vous avez de belles produits');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211204120818', '2021-12-04 12:08:44', 387),
('DoctrineMigrations\\Version20211204162103', '2021-12-04 16:21:19', 588),
('DoctrineMigrations\\Version20211211122045', '2021-12-11 12:21:28', 5162),
('DoctrineMigrations\\Version20211218181523', '2021-12-18 18:16:15', 425),
('DoctrineMigrations\\Version20211218203638', '2021-12-18 20:37:05', 987),
('DoctrineMigrations\\Version20211220200444', '2021-12-20 21:10:33', 461),
('DoctrineMigrations\\Version20211220211021', '2021-12-20 21:10:33', 266),
('DoctrineMigrations\\Version20220109170415', '2022-01-09 17:04:28', 783),
('DoctrineMigrations\\Version20220109213429', '2022-01-09 21:34:39', 783),
('DoctrineMigrations\\Version20220109221215', '2022-01-09 22:12:25', 650);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `code`, `label`, `image`, `description`, `prix`) VALUES
(31, 230, 'pull', 'pull_marron.png', 'Un choix unique de Pull marron chocolat femme disponible dans notre magasin.', 47),
(34, 2056, 'Baskets', 'chaussure.png', 'A petit pied unique, chaussure unique ! Cette basket rose au look streetwear et à l\'allure sportive fera fureur dans la cour de récré !', 70),
(35, 5268, 'doudoune', 'doudoune.png', 'Un choix unique de Doudoune rose femme disponible dans notre magasin. ', 130),
(36, 15, 'Bottes', 'botte.png', 'Bottes cuissardes plates noir femme', 140),
(37, 1453, 'Robe', 'robe.png', 'Robe pull droite col montant gris clair femme', 75),
(38, 2054, 'sac jaune foncé', 'sac.png', 'Sac besace avec perforations Forme arrondie Bandoulière Rabat fermé par 1 bouton-pression aimanté sur l\'avant 1 compartiment principal 1 poche zippée à l\'intérieur Détails perforés sur le rabat Le + mode : ses perforations', 73),
(39, 5423, 'chemise verte', 'chemise_verte.png', 'Un col V flatteur, des petits boutons recouverts et une belle fluidité : ce chemisier a tout pour plaire. Facile à associer, il apporte une touche d\'élégance à une tenue.', 63),
(40, 4265, 'pantallon bleu ciel', 'pantallon_bleu_ciel.png', 'Détails produit : Modèle : PETRA Composition : 97% Coton 3% Elasthanne Coupe : regular', 75),
(41, 3652, 'tshirt', 'tshirt.png', 'Forme du col: Col rond Niveau de transparence: Légère Motif / Couleur: Couleur unie Référence: NI121D0KT-J11', 43),
(42, 1205, 'echarpe', 'echarpe.png', 'Écharpe en tricot jacquard laine mélangée; motif animalier avec bords contrastants; dimensions : 50 cm x 200 cm.', 48),
(43, 4752, 'bonnet', 'bonnet.png', 'Composition: 52% polyester, 25% acrylique, 20% polyamide, 3% élasthanne Matière: Côtelé, Fausse fourrure', 25),
(44, 2036, 'bonnet noir', 'bonnet_noir.png', 'Composition: 50% polyester, 50% acrylique Matière: Tricot / Maille Conseils d\'entretien: Lavage à la main, nettoyage chimique possible', 20),
(45, 5689, 'cape', 'cape.png', 'Longueur des manches: Manches trois-quarts Longueur des manches: 48 cm en taille One Size Longueur totale: 70 cm en taille One Size', 83),
(46, 2560, 'gants orange', 'gants.png', 'Composition: 100% cuir Doublure: 100% polyester Conseils d\'entretien: Nettoyage spécial cuir', 33),
(47, 1234, 'chemise jaune', 'chemise_jaune.png', 'Chemise manches longues Coupe droite Col italien Manches longues Fermeture boutonnée sur l\'avant Empiècements volantés aux épaules et aux poignets Effet velours côtelé Le + mode : ses volants', 65);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D1C63B3E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `email`, `roles`, `password`, `nom`, `prenom`) VALUES
(1, 'mahmoud.maalej@gmail.com', '[]', '$2y$13$2ZD.xVimbH7c22mcqHsEde3KsCYbQ.uBplBlZKA7ZphXliDpmWLTa', 'MAALEJ', 'Mahmoud'),
(2, 'khouloudfrikha@gmail.com', '[]', '$2y$13$E1JtKFBO.h9dtBWeFy6ovuyicdc7DhChLm5pSRj0xPboBKw.MG8CW', 'FRIKHA', 'Khouloud'),
(3, 'melekmaalej@gmail.com', '[]', '$2y$13$d79uzSCz3bootXaBpJiP1uXLfTBD.e3g3564QoIZ6MDi/lCPZ38k2', 'maalej', 'melek'),
(4, 'zef@zfzfz', '[]', '$2y$13$0RZg2szMTwaxjUv3KShlaetqT/PKtuma38ZR6ZovCjSd1pYgHItVi', 'zezf', 'zefzfe'),
(5, 'mahmoud.maaledj@gmail.com', '[]', '$2y$13$N78D5ZoKyu9clLHuU25QduCZcW06HJAV4TCeNwU.MMaqYb4bV1hS.', 'dadedz', 'fzefzfe'),
(6, 'anasmaalej@gmail.com', '[]', '$2y$13$Pi3bBwrGgiyl0VuFcmLDyOMwxHq1G05tRswWswG2izjLhP5dMmn76', 'maalej', 'anas'),
(7, 'inesmaalej@gmail.com', '[]', '$2y$13$uTVpmAyH2fMyYw8LOXlwnezMywkoXOaKNa/6hba6HidaT2/s8igDK', 'maalej', 'ines'),
(8, 'imenbarhoumi@gmail.com', '[]', '$2y$13$xDEHy2lRO9R2Oo5BONXlFeFQ045zb6mxlZF3/ur6cb.qjKCoPUP7.', 'barhoumi', 'imen'),
(9, 'ali12@gmail.com', '[]', '$2y$13$5/.A9LaN0BnziV6b/YAmjel.sd6YAVJZKoCZ/7oJ1gdXm12mIMF0C', 'ali12', 'zefzfe');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
