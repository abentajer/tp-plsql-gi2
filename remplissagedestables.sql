INSERT INTO region VALUES ('1','Tanger-Tétouan-Al Hoceïma ');
INSERT INTO region VALUES ('2','Région de l Oriental ');
INSERT INTO region VALUES ('3','Région de Fès-Meknès  ');
INSERT INTO region VALUES ('4','Région de Rabat-Salé-Kénitra ');
INSERT INTO region VALUES ('5','Région de Béni Mellal-Khénifra  ');
INSERT INTO region VALUES ('6','Région de Casablanca-Settat');
INSERT INTO region VALUES ('7','Région de Marrakech-Safi ');



INSERT INTO famille VALUES ('1','MEMOIRE ');
INSERT INTO famille VALUES ('2','CARTE ');
INSERT INTO famille VALUES ('3','DISQUE');



INSERT INTO categorie VALUES ('1','RAM ');
INSERT INTO categorie VALUES ('2','DISQUE DUR EXTERNE ');
INSERT INTO categorie VALUES ('3','DISQUE DUR INTERNE');
INSERT INTO categorie VALUES ('4','CARTE SON ');
INSERT INTO categorie VALUES ('5','CARTE GRAPIQUE');

INSERT INTO produit VALUES ('A01','Barrette Memoire 2Go',150 , 12,'1','1');
INSERT INTO produit VALUES ('A02','Barrette Memoire 4Go',240 , 12,'1','1');
INSERT INTO produit VALUES ('B15','Carte Graphique AMD Radeon RX 570 Pulse, 4Go ',2349 , 20,'5','2');
INSERT INTO produit VALUES ('A11','Carte son Asus Xonar DG',750 , 12,'4','2');
INSERT INTO produit VALUES ('C80','Disque Externe Toshiba usb 3.0 1000Go',546 , 33,'2','3');

INSERT INTO client VALUES ('1','BENTAJER','Mhannech II, Tetouan ' , '2/11/2019','ahmed@mail.com ',' A passé une grosse commande en janvier 2018 ; depuis, plus rien. Penser à reprendre contact ','1');
INSERT INTO client VALUES ('2','ESSEGHIRI','Res Naoufal app 8, Maarif, Casablanca  ' , '27/10/2018','youssef@mail.com ' , 'Client contactée grâce à M. Houty ' ,'2');
INSERT INTO client VALUES ('3','Houty','Settat ' , '20/11/2018','karim@mail.com ',' Client fidèle qui passe des commandes régulièrement (environ une par mois)','2');

INSERT INTO employe VALUES ('1','AHMADI','Morad');

INSERT INTO commande VALUES ('886','1/2/2019','Regle','1','2');

INSERT INTO concerne VALUES (10,'886','A01');
INSERT INTO concerne VALUES (2,'886','A02');
INSERT INTO concerne VALUES (1,'886','B15');