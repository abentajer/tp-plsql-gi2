/*on a remplit les tables selon les exemples donn�s dans l'enonce de tp*/
/*TABLE commande*/
INSERT INTO COMMANDE VALUES ('886','01/02/2019','oui','4329,00','5036,40','2');
INSERT INTO COMMANDE VALUES ('887','02/02/2019','oui','4650,00','5026,40','1');
INSERT INTO COMMANDE VALUES ('888','03/02/2019','oui','3256,00','5224,50','3');

/*TABLE client*/
INSERT INTO CLIENT VALUES('1', 'BENTAJER', 'Mhanech II Tetouan','ahmed@mail.com','2/11/2019','1');
INSERT INTO CLIENT VALUES('2', 'ESSEGHIRI', 'Res Naoufal app 8,Maarif, Casablanca','youssef@mail.com','27/10/2018','2');
INSERT INTO CLIENT VALUES('3', 'HOUTY','Settat','karim@mail.com','20/11/2018','2');

/*TABLE region*/
INSERT INTO REGION VALUES('1','Tanger-T�touan-Al Hoce�ma');
INSERT INTO REGION VALUES('2','R�gion d_Oriental');
INSERT INTO REGION VALUES('3','R�gion de F�s-Mekn�s');
INSERT INTO REGION VALUES(4,'R�gion Rabat-Sal�-K�nitra');
INSERT INTO REGION VALUES(5,'R�gion Bni Mellal-Kh�nifra');
INSERT INTO REGION VALUES(6,'R�gion de Casablanca-Settat');
INSERT INTO REGION VALUES(7,'R�gion de Marrakech-Safi');

/*TABLE produit*/
INSERT INTO PRODUIT VALUES ('A01','Barrette Memoire 2 Go',150,'12%',1,1);
INSERT INTO PRODUIT VALUES ('A02','Barrette Memoire 4Go','240','12%',1,1);
INSERT INTO PRODUIT VALUES ('B15','Carte Graphique AMD Radeon RX 570 Pulse, 4Go','2349','20%',2,5);
INSERT INTO PRODUIT VALUES ('A11','Carte Son Asus Xonar DG','750','12%',2,4);
INSERT INTO PRODUIT VALUES ('C80','Disque Externe Toshiba usb 3.0 1000Go','546','33%',3,2);

/*TABLE categorie*/
INSERT INTO CATEGORIE VALUES ('1','RAM');
INSERT INTO CATEGORIE VALUES ('2','DISQUE DUR EXTERNE');
INSERT INTO CATEGORIE VALUES ('3','DISQUE DUR INTERNE');
INSERT INTO CATEGORIE VALUES ('4','CARTE SON');
INSERT INTO CATEGORIE VALUES ('5','CARTE GRAPHIQUE');

/*TABLE contenir*/
INSERT INTO CONTENIR VALUES (10,'A01','886');
INSERT INTO CONTENIR VALUES (2,'A02','886');
INSERT INTO CONTENIR VALUES (1,'B15','886');
INSERT INTO CONTENIR VALUES (20,'A01','123');

/*Table famille*/

INSERT INTO FAMILLE VALUES(1,'MEMOIRE');
INSERT INTO FAMILLE VALUES(2,'CARTE');
INSERT INTO FAMILLE VALUES(3,'DISQUE');

