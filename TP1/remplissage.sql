insert into region values(0, 'tanger-tetouan-al hoceima');
insert into region values(1, 'Region de l Oriental');
insert into region values(2, 'Region de Fes-Meknes');
insert into region values(3, 'Region de Rabat-Sale-Kenitra');
insert into region values(4, 'Region de Beni Mellal-Khenifra');
insert into region values(5, 'Region de Casablanca-Settat');
insert into region values(6, 'Region de Marrakech-Safi');

insert into client values(0, 'BENTAJER', 'Mhannech II Tetouan', 1, TO_DATE('20191102','yyyymmdd'),'ahmed@mail.com','A passe une grosse commande en janvier 2018 depuis plus rien. Penser areprendre contact');
insert into client values(1, 'ESSEGHIRI', 'Res Naoufal app 8 Maarif Casablanca', 2, TO_DATE('20181027','yyyymmdd'),'youssef@mail.com','Client contactée grace a M. Houty de Casablanca. Remise de 10 sur .');
insert into client values(2, 'Houty', 'settat', 2, TO_DATE('20181120','yyyymmdd'),'karim@mail.com','Client fidèle qui passe des commandes régulièrement (environ une par mois).');


insert into commande values(0,TO_DATE('20190201','yyyymmdd'),TO_DATE('20190206','yyyymmdd'),'hamid' , 1,'oui');


insert into categorie (codecat,libelle) VALUES(1,'RAM');
insert into categorie (codecat,libelle) VALUES(2,'DISQUE DUR EXTERNE');
insert into categorie (codecat,libelle) VALUES(3,'DISQUE DUR INTERNE');
insert into categorie (codecat,libelle) VALUES(4,'CARTE SON');
insert into categorie (codecat,libelle) VALUES(5,'CARTE GRAPHIQUE');

insert into famille(codefam,libelle)VALUES(1,'MEMOIRE');
insert into famille(codefam,libelle)VALUES(2,'CARTE');
insert into famille(codefam,libelle)VALUES(3,'DISQUE');

insert into catalogue (ref,libelle,categorie,famille,PU,TVA) VALUES ('A01','Barrette Memoire 2Go',1,1,150,0.12);
insert into catalogue (ref,libelle,categorie,famille,PU,TVA) VALUES ('A02','Barrette Memoire 4Go',1,1,240,0.12);
insert into catalogue (ref,libelle,categorie,famille,PU,TVA) VALUES ('B15','Carte Graphique AMD Radeon RX 570 Pulse, 4Go',5,2,2349,0.2);
insert into catalogue (ref,libelle,categorie,famille,PU,TVA) VALUES ('A11','Carte son Asus Xonar DG',4,2,750,0.12);
insert into catalogue (ref,libelle,categorie,famille,PU,TVA) VALUES ('C80','Disque Externe Toshiba usb 3.0 1000Go',2,3,546,0.33);

insert into m_commande values(0 , 'A01', 10, 0, 150, 1500, 1680);
insert into m_commande values(1 , 'A02', 2, 0, 240, 480, 537.6);
insert into m_commande values(2 , 'B15', 1, 0, 2349, 2349, 1680);