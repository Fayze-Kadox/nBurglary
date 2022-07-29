CREATE TABLE `nBurglary` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `price` INT(11) NOT NULL,
    `difficulty` INT(11) NOT NULL,
    `dog` VARCHAR(60) NOT NULL,
    `pospoint` VARCHAR(255) NOT NULL,
    `builder` VARCHAR(60) NOT NULL,
    `properties` VARCHAR(255) NOT NULL,
    `posenter` VARCHAR(255) NOT NULL,
    `time` INT(11) NOT NULL,
    `timereload` VARCHAR(255) NOT NULL,
     PRIMARY KEY (`id`)
);


INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('tv', 'Télévision', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('vase', 'Vase', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('radio', 'Radio', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('console', 'Console', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('dj', 'Table de Mixage', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('lampe', 'Lampe', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('enceinte', 'Enceinte', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('tableau', 'Tableau', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('parfum', 'Parfum', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('ordi', 'Ordinateur', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('imprimante', 'Imprimante', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('telescope', 'Telescope', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('telephone', 'Téléphone', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('bouteille', 'Bouteille', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('bijoux', 'Bijoux', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('livre', 'Livre', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('vetement', 'Vêtement', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('mirroir', 'Mirroir', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('produit', 'Produit', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('huile', 'Huile', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('bois', 'Bois', '1', '0', '1');
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('echelle', 'Echelle', '1', '0', '1');

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES ('burglary_lockpick', 'Outils de Cambriolage', '1', '0', '1');

