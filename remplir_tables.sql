/*on a remplit les tables selon les exemples donn�s dans l'enonce de tp*/
/*TABLE commande*/
INSERT INTO commande VALUES ('886','01/02/2019','oui','4329,00','5036,40');
INSERT INTO commande VALUES ('887','02/02/2019','oui','4650,00','5026,40');
INSERT INTO commande VALUES ('888','03/02/2019','oui','3256,00','5224,50');

/*TABLE client*/
INSERT INTO client VALUES('1', 'BENTAJER', 'Mhanech II Tetouan','ahmed@mail.com','2/11/2019','885');
INSERT INTO client VALUES('2', 'ESSEGHIRI', 'Res Naoufal app 8,Maarif, Casablanca','youssef@mail.com','27/10/2018','886');
INSERT INTO client VALUES('3', 'HOUTY','Settat','karim@mail.com','20/11/2018','887');

/*TABLE region*/
INSERT INTO region VALUES('1','Tanger-T�touan-Al Hoce�ma','1');
INSERT INTO region VALUES('2','R�gion d_Oriental','2');
INSERT INTO region VALUES('3','R�gion de F�s-Mekn�s','3');

/*TABLE produit*/
INSERT INTO produit VALUES ('A01','Barrette Memoire 2 Go','150','0,12');
INSERT INTO produit VALUES ('A02','Barrette Memoire 4Go','240','0,12');
INSERT INTO produit VALUES ('B15','Carte Graphique AMD Radeon RX 570 Pulse, 4Go','2349','0,2');
INSERT INTO produit VALUES ('A11','Carte Son Asus Xonar DG','750','0,12');
INSERT INTO produit VALUES ('C80','Disque Externe Toshiba usb 3.0 1000Go','546','0,33');

/*TABLE categorie*/
INSERT INTO categorie VALUES ('1','RAM','A01');
INSERT INTO categorie VALUES ('2','DISQUE DUR EXTERNE','C80');
INSERT INTO categorie VALUES ('4','CARTE SON','A11');
INSERT INTO categorie VALUES ('5','CARTE GRAPHIQUE','B15');

/*TABLE concerne*/
INSERT INTO concerne VALUES ('10','886','A01');
INSERT INTO concerne VALUES ('2','886','A02');
INSERT INTO concerne VALUES ('1','886','B15');

/*TABLE catalogue*/
INSERT INTO catalogue VALUES ('1','2','A01');
INSERT INTO catalogue VALUES ('2','2','A02');
INSERT INTO catalogue VALUES ('3','2','B15');

