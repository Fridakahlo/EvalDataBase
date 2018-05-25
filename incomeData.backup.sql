INSERT INTO bathrooms  
VALUES (1,'douche'),
        (2,'baignoire'),
        (3,'douche et baignoire');

INSERT INTO categories 
VALUES (NULL , 'matériel'),
	   (NULL , 'bien être'),
	   (NULL , 'repas'),
	   (NULL , 'spécial');
	
INSERT INTO states 
VALUES (NULL , 'en cours'),
	   (NULL , 'paiement effectué'),
	   (NULL , 'annulé'),
	   (NULL , 'en attente de confimation');

INSERT INTO beds
VALUES (NULL , 'simple'),
	   (NULL , 'double queen'),
	   (NULL , 'double king');

INSERT INTO guests
VALUES (NULL , 'Pedro', 'Sanchez', '05.35.24.23.65', 'pedrosanchez@gmail.com', '21 Place de la Fontaine 12345 Golinhac, France', 'pedroparamo'),
	   (NULL , 'Maria', 'Krotz', '04.45.24.33.66', 'mariakrotz@aol.com', '35 Loet Av 67456 Munich, Alemagne', 'ilovihi'),
	   (NULL , 'Itoki', 'Chen', '55.34.67.99.27', 'itokichen@yuyuzu.com', '89 Avazuni St 36866 Sichuan, Chine', 'kakunitzu'),
	   (NULL , 'Laurence', 'Lapierre', '06.35.24.23.65', 'laurencelapierre@gmail.com', '46 Av. Fleuri 34567 Metz', 'loloveutpas'),
	   (NULL , 'Selena', 'Williams', '01.96.37.67.90', 'selenawilliams@yahoo.com', '1 Malibu avenue 56789 California', 'iamthebest');

INSERT INTO services
VALUES (NULL , 'Petit Déjeuner en chambre', 'PDJ Continental', 25, 1, 3),
	   (NULL , 'Minibar', '2 paquets de snacks, eau plate et petillant, chocolat, vin blanc et mousseaux, gin et vodka', 85, 2, 3),
	   (NULL , 'Bouteille de Champagne', 'Roederer Brut 75 cl et corbeille de fraises', 140, 1, 3),
	   (NULL , 'Pret ordinateur portable', 'HP 234 avec connexion internet et programmes de base', 20, 1, 1),
	   (NULL , 'Massage', '45 min realisé au wellness', 75, 1, 2),
	   (NULL , 'Scort Boy', 'Mission de 2 hr', 245, 2, 4),
	   (NULL , 'Resevation de voiture', 'Categorie a choisir par le client', 25, 2, 4);

INSERT INTO rooms
VALUES (NULL , 'Moscou', 28.5, 2, 1, 'Mer', 1, 225, 3, 3),
       (NULL , 'Paris', 18.5, 1, 1, 'Montagne', 2, 180.5, 1, 1),
       (NULL , 'Rio', 22.5, 2, 2, 'Mer', 1, 200, 2, 2),
       (NULL , 'Tokio', 15.7, 1, 2, 'Montagne', 2, 165.6, 1, 2),
       (NULL , 'Dublin', 25, 2, 3, 'Mer', 2, 215, 2, 3),
       (NULL , 'Oslo', 19.5, 1, 3, 'Montagne', 1, 190, 3, 1);
	   
INSERT INTO bookings
VALUES (NULL , '2018/08/25', '2018/09/05', 3, 2),
       (NULL , '2018/08/25', '2018/10/05', 3, 2),
       (NULL , '2018/07/12', '2018/07/18', 2, 3),
       (NULL , '2018/05/23', '2018/05/30', 1, 1),
       (NULL , '2018/06/01', '2018/06/15', 4, 4),
       (NULL , '2018/06/04', '2018/09/06', 5, 2),
       (NULL , '2018/07/22', '2018/07/28', 2, 4),
       (NULL , '2018/08/05', '2018/08/12', 5, 1),
       (NULL , '2018/09/09', '2018/09/14', 4, 2);

INSERT INTO bookings_services
VALUES (1, 2),
       (2, 6),
       (3, 3),
       (5, 4),
       (6, 1),
       (8, 5),
       (9, 7),
       (3, 2),
       (1, 6),
       (3, 7),
       (6, 4);

INSERT INTO bookings_rooms
VALUES (1, 2),
       (2, 6),
       (3, 3),
       (5, 4),
       (6, 1),
       (8, 5),
       (9, 3),
       (3, 2),
       (1, 6),
       (3, 1),
       (6, 4);
       