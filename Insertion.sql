INSERT INTO client VALUES (1,'BENTAJER','Mhannech II tetouan',1,'Tanger-Tetouan-Al Houceima','2/11/2019','ahmed@gmail.com');
INSERT INTO client VALUES (2,'ESGHIRI','Res Naoufal app8 Maarif Casablanca',2,'Region de l oriental','27/10/2018','youssef@gmail.com');
INSERT INTO client VALUES (3,'Houty','Settat',2,'Région de l oriental','20/11/2018','karim@gmail.com');

INSERT INTO produit VALUES ('A01','Barrette Memoire 2Go',150);
INSERT INTO produit VALUES ('A02','Barrette Memoire 4Go',240);
INSERT INTO produit VALUES ('B15','Carte Graphique AMD Radeon RX570 Pulse 4GO',2349);
INSERT INTO produit VALUES ('A11','Carte son Asus Xonar',750);
INSERT INTO produit VALUES ('C80','Disque Externe Toshiba usb 3.0 1000Go',546);

INSERT INTO catalogue VALUES (1,'RAM',1,'MEMOIRE','A01',0.12);
INSERT INTO catalogue VALUES (2,'DISQUE DUR EXTERNE',3,'DISQUE','A02',0.12);
INSERT INTO catalogue VALUES (3,'DISQUE DUR INTERNE',3,'DISQUE','B15',0.20);
INSERT INTO catalogue VALUES (4,'CARTE SON',2,'CARTE','A11',0.12);
INSERT INTO catalogue VALUES (5,'CARTE GRAPHIQUE',2,'CARTE','C80',0.33);

INSERT INTO commande VALUES (1,10,1500,1680,1,'A01');
INSERT INTO commande VALUES (2,2,480,537.7,2,'A02');
INSERT INTO commande VALUES (3,1,2349,2818.8,3,'A01');

INSERT INTO employe VALUES (1,'ahmed',0604054535,1);
INSERT INTO employe VALUES (2,'salah',0658679874,2);
INSERT INTO employe VALUES (3,'youssef',0602134568,3);
