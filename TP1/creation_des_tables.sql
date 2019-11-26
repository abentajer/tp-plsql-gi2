create table region(
	id_region int primary key not null,
	libelle varchar(40));


create table client(
	id_client int primary key not null,
	nom varchar(50),
	adress_vill varchar(100),
	region int references region(id_region),
	date_contact date,
	email varchar(50),
	observation varchar(100));

create table commande(
	id_commande int primary key not null,
	date_commande date,
	date_livraison date,
	emloiyee varchar(40),
	id_client int references client(id_client),
	regler varchar(3));

create table categorie(
	codecat int, 
	libelle varchar(30), PRIMARY KEY(codecat));


create table famille(
	codefam int, 
	libelle varchar(30), PRIMARY KEY(codefam));

create table catalogue(
	ref varchar(10),
	libelle varchar(150),
	categorie int,
	famille int, 
	PU int, 
	TVA float, 
	PRIMARY KEY(ref), 
	FOREIGN KEY(categorie) REFERENCES categorie(codecat), 
	FOREIGN KEY(famille) REFERENCES famille(codefam));

create table m_commande(
	id_mc int primary key not null,
	ref varchar(10) references catalogue(ref),
	qte int,
	num_commande int references commande(id_commande),
	pu_HT float,
	prix_HT float,
	prix_TTC float);
create table historique(
	id_h int, id_cmd int, PRIMARY KEY(id_h),
	FOREIGN KEY(id_cmd) REFERENCES commande(id_commande));