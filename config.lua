-----
----
---         This code is owned by Nathan </>#0001 and may not be used outside of this resource, resale of resource is prohibited
---
----
-----

Config = {}

Config.Command = "cambriolage"

Config.Identifier = 'license' -- license, steam, discord

Config.Admins = {
    'license:yourlicense'
}

Config.Policejob = 'police' -- job name
Config.Ambulancejob = 'ambulance' -- job name

Config.Trigger = "" -- Trigger exemple: (__::Korioz::__)

Config.Loot1 = {
	{ item = 'tv', name = "une télévision", coord = vector3(257.12,-995.91,-100.0), marker = true, price = 100 },
    { item = 'vase', name = "un vase", coord = vector3(265.76,-999.49,-100.0), marker = true, price = 100 },
    { item = 'radio', name = "une radio", coord = vector3(263.47,-995.62,-100.0), marker = true, price = 100},
    { item = 'console', name = "une console", coord = vector3(262.91,-1002.68,-100.0), marker = true},
    { item = 'dj', name = "une table de Mixage", coord = vector3(261.39,-1002.58,-100.0), marker = true},
    { item = 'lampe', name = "une lampe", coord = vector3(262.91,-1002.68,-100.0), marker = true},
}

Config.Loot2 = {
	{ item = 'tv', name = "une télévision", coord = vector3(-606.21,41.92,96.41), marker = true},
    { item = 'enceinte', name = "une enceinte", coord = vector3(-601.91,44.71,96.41), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(-598.2,48.67,96.04), marker = true},
    { item = 'parfum', name = "du parfum", coord = vector3(-597.48,51.97,96.01), marker = true},
    { item = 'ordi', name = "un ordinateur", coord = vector3(-625.04,50.19,96.61), marker = true},
    { item = 'imprimante', name = "une imprimante", coord = vector3(-625.87,55.37,96.61), marker = true},
    { item = 'telescope', name = "un téléscope", coord = vector3(-612.61,39.67,96.61), marker = true},
    { item = 'telephone', name = "un téléphone", coord = vector3(-617.9,42.51,96.61), marker = true},
    { item = 'vase', name = "un vase", coord = vector3(-601.91,45.83,96.41), marker = true},
}

Config.Loot3 = {
	{ item = 'tableau', name = "un tableau", coord = vector3(-1456.86,-523.03,55.94), marker = true},
    { item = 'telephone', name = "un téléphone", coord = vector3(-1459.92,-533.76,54.54), marker = true},
    { item = 'enceinte', name = "une enceinte", coord = vector3(-1468.64,-544.88,54.54), marker = true},
    { item = 'tv', name = "une télévision", coord = vector3(-1478.85,-532.67,54.54), marker = true},
    { item = 'vase', name = "un vase", coord = vector3(-1470.64,-534.51,49.73), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(-1459.26,-520.33,52.14), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(-1457.99,-522.25,52.14), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(-1456.56,-524.25,52.14), marker = true},
    { item = 'bouteille', name = "une bouteille de whisky", coord = vector3(-1471.01,-532.89,54.54), marker = true},
    { item = 'telescope', name = "un téléscope", coord = vector3(-1477.51,-536.66,54.54), marker = true},
}

Config.Loot4 = {
	{ item = 'tableau', name = "un tableau", coord = vector3(-680.67,586.96,144.39), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(-670.77,592.88,144.18), marker = true},
    { item = 'enceinte', name = "une enceinte", coord = vector3(-672.2,581.63,143.98), marker = true},
    { item = 'tv', name = "une télévision", coord = vector3(-664.84,585.21,143.98), marker = true},
    { item = 'telescope', name = "un téléscope", coord = vector3(-663.73,582.27,143.98), marker = true},
    { item = 'bijoux', name = "des bijoux", coord = vector3(-670.49,579.96,140.58), marker = true},
    { item = 'ordi', name = "un ordinateur", coord = vector3(-675.28,588.75,136.78), marker = true},
    { item = 'imprimante', name = "une imprimante", coord = vector3(-678.62,584.76,136.78), marker = true},
    { item = 'vase', name = "une vase", coord = vector3(-681.44,590.95,136.78), marker = true},
    { item = 'lampe', name = "une lampe", coord = vector3(-664.69,584.81,140.61), marker = true},
    { item = 'livre', name = "des livres", coord = vector3(-682.19,595.95,136.78), marker = true},
    { item = 'vase', name = "un vase", coord = vector3(-679.57,595.89,136.78), marker = true},
}

Config.Loot5 = {
	{ item = 'tv', name = "une télévision", coord = vector3(151.29,-1004.5,-99.99), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(153.99,-1002.36,-99.99), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(155.12,-1004.59,-99.41), marker = true},
    { item = 'telephone', name = "un téléphone", coord = vector3(154.8,-1005.86,-99.99), marker = true},
    { item = 'vetement', name = "des vetements", coord = vector3(151.86,-1001.77,-99.99), marker = true},
    { item = 'mirroir', name = "un mirroir", coord = vector3(152.42,-1000.32,-99.99), marker = true},
}

Config.Loot6 = {
	{ item = 'produit', name = "des produits", coord = vector3(1003.1,-3112.12,-39.99), marker = true},
    { item = 'ordi', name = "un ordinateur", coord = vector3(994.43,-3100.03,-39.99), marker = true},
    { item = 'huile', name = "de l'huile", coord = vector3(998.63,-3090.69,-39.99), marker = true},
    { item = 'telephone', name = "un téléphone", coord = vector3(994.98,-3098.22,-39.99), marker = true},
    { item = 'vetement', name = "des vetements", coord = vector3(994.27,-3102.87,-39.99), marker = true},
    { item = 'huile', name = "de l'huile", coord = vector3(1024.56,-3090.6,-39.99), marker = true},
}

Config.Loot7 = {
	{ item = 'ordi', name = "un ordinateur", coord = vector3(1049.13,-3100.6,-39.99), marker = true},
    { item = 'bois', name = "du bois", coord = vector3(1070.88,-3107.94,-39.99), marker = true},
    { item = 'echelle', name = "une echelle", coord = vector3(1048.55,-3105.22,-39.99), marker = true},
}

Config.Loot8 = {
	{ item = 'ordi', name = "un ordinateur", coord = vector3(1088.44,-3101.22,-39.99), marker = true},
    { item = 'produit', name = "du produit", coord = vector3(1104.59,-3102.14,-39.99), marker = true},
    { item = 'huile', name = "de l'huile", coord = vector3(1088.31,-3103.02,-39.99), marker = true},
}

Config.Loot9 = {
	{ item = 'status', name = "une status", coord = vector3(-1903.6,-571.89,18.11), marker = true},
    { item = 'vase', name = "un vase", coord = vector3(-1904.71,-571.03,18.11), marker = true},
    { item = 'ordi', name = "un ordinateur", coord = vector3(-1912.35,-570.49,18.11), marker = true},
    { item = 'tableau', name = "un tableau", coord = vector3(-1902.29,-573.99,18.11), marker = true},
    { item = 'livre', name = "des livres", coord = vector3(-1910.14,-570.75,18.11), marker = true},
}

-- Chien
Config.Ped = "a_c_rottweiler"

Config.PedPosition = vector3(-815.28, -1346.78, 4.15)

Config.PedHeading = 45.00


--- Revendeur
Config.Ped2 = "cs_terry"

Config.PedPosition2 = vector3(-1345.06,-722.41,23.95)

Config.PedHeading2 = 122.20

-- Position du Shop

Config.ShopPosition = vector3(-1345.65,-722.88,25.00)

-- Interaction du Shop

Config.ShopInterator = {
	{ item = 'tv', name = "Télévision", price = "464"},
    { item = 'vase', name = "Vase", price = "455"},
    { item = 'radio', name = "Télévision", price = "87"},
    { item = 'console', name = "Console", price = "54"},
    { item = 'dj', name = "Table de Mixage", price = "897"},
    { item = 'lampe', name = "Lampe", price = "7864"},
    { item = 'enceinte', name = "Enceinte", price = "786"},
    { item = 'tableau', name = "Tableau", price = "57"},
    { item = 'parfum', name = "Parfum", price = "786"},
    { item = 'ordi', name = "Ordinateur", price = "45"},
    { item = 'imprimante', name = "Imprimante", price = "85"},
    { item = 'telescope', name = "Telescope", price = "85"},
    { item = 'telephone', name = "Téléphone", price = "7"},
    { item = 'bouteille', name = "Bouteille", price = "7577"},
    { item = 'bijoux', name = "Bijoux", price = "77568"},
    { item = 'livre', name = "Livre", price = "787"},
    { item = 'vetement', name = "Vêtement", price = "86767"},
    { item = 'mirroir', name = "Mirroir", price = "748"},
    { item = 'produit', name = "Produit", price = "546"},
    { item = 'huile', name = "Huile", price = "7575"},
    { item = 'bois', name = "Bois", price = "466"},
    { item = 'echelle', name = "Echelle", price = "88667"},
}

Config.CrochetagePrice = 5600 -- Prix du crochetage

Config.ArgentSale = true -- Argent sale ?