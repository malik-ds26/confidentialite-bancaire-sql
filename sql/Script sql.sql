#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        id                Int    NOT NULL ,
        Nom               Varchar (50) NOT NULL ,
        Prenom            Varchar (50) NOT NULL ,
        Email             Varchar (50) NOT NULL ,
        Numero_telephone  Int NOT NULL ,
        Lettre_de_gestion Char (5) NOT NULL
	,CONSTRAINT Client_PK PRIMARY KEY (id)
)


#------------------------------------------------------------
# Table: CompteBancaire
#------------------------------------------------------------

CREATE TABLE CompteBancaire(
        id             Int    NOT NULL ,
        Solde          Float NOT NULL ,
        Type_Compte    Varchar (50) NOT NULL ,
        Date_Ouverture Varchar(50) NOT NULL ,
        id_Client      Int NOT NULL
	,CONSTRAINT CompteBancaire_PK PRIMARY KEY (id)

	,CONSTRAINT CompteBancaire_Client_FK FOREIGN KEY (id_Client) REFERENCES Client(id)
)


#------------------------------------------------------------
# Table: Employe
#------------------------------------------------------------

CREATE TABLE Employe(
        id               Int    NOT NULL ,
        Nom              Varchar (50) NOT NULL ,
        Prenom           Varchar (50) NOT NULL ,
        Email            Varchar (50) NOT NULL ,
        Numero_Telephone Int NOT NULL ,
        Role             Varchar (50) NOT NULL
	,CONSTRAINT Employe_PK PRIMARY KEY (id)
)


#------------------------------------------------------------
# Table: Transaction_Bancaire
#------------------------------------------------------------

CREATE TABLE Transaction_Bancaire(
        id                Int    NOT NULL ,
        Montant           Float NOT NULL ,
        Date_Transaction  Varchar(50) NOT NULL ,
        id_compte         Int NOT NULL ,
        id_Client         Int ,
        id_CompteBancaire Int
	,CONSTRAINT Transaction_AK UNIQUE (id_compte)
	,CONSTRAINT Transactione_PK PRIMARY KEY (id)

	,CONSTRAINT Transaction_FK FOREIGN KEY (id_Client) REFERENCES Client(id)
	,CONSTRAINT Transaction0_FK FOREIGN KEY (id_CompteBancaire) REFERENCES CompteBancaire(id)
);


#------------------------------------------------------------
# Table: Gere
#------------------------------------------------------------
CREATE TABLE Gere(
    id         Int NOT NULL,
    id_Employe Int NOT NULL,
    CONSTRAINT Gere_PK PRIMARY KEY (id, id_Employe),
    CONSTRAINT Gere_CompteBancaire_FK FOREIGN KEY (id) REFERENCES CompteBancaire(id),
    CONSTRAINT Gere_Employe0_FK FOREIGN KEY (id_Employe) REFERENCES Employe(id)
) 
------Insertion des examples 

------CLient
INSERT INTO Client (id, Nom, Prenom, Email, Numero_telephone, Lettre_de_gestion) 
VALUES 
(1, 'Dupont', 'Jean', 'jean.dupont@mail.com', 1234567890, 'A');

INSERT INTO Client (id, Nom, Prenom, Email, Numero_telephone, Lettre_de_gestion) 
VALUES (2, 'Martin', 'Sophie', 'sophie.martin@mail.com', 9876543210, 'B');

INSERT INTO Client (id, Nom, Prenom, Email, Numero_telephone, Lettre_de_gestion) 
VALUES (3, 'Durand', 'Luc', 'luc.durand@mail.com', 4567891230, 'C');

INSERT INTO Client (id, Nom, Prenom, Email, Numero_telephone, Lettre_de_gestion) 
VALUES (4, 'Petit', 'Marie', 'marie.petit@mail.com', 1478523690, 'D');

INSERT INTO Client (id, Nom, Prenom, Email, Numero_telephone, Lettre_de_gestion) 
VALUES (5, 'Moreau', 'Paul', 'paul.moreau@mail.com', 3216549870, 'E');
----Compte bancaire

INSERT INTO CompteBancaire (id, Solde, Type_Compte, Date_Ouverture, id_Client) 
VALUES (1, 1500.50, 'Courant', '2022-01-15', 1);

INSERT INTO CompteBancaire (id, Solde, Type_Compte, Date_Ouverture, id_Client) 
VALUES (2, 5000.00, 'Epargne', '2023-03-20', 2);

INSERT INTO CompteBancaire (id, Solde, Type_Compte, Date_Ouverture, id_Client) 
VALUES (3, 3200.75, 'Courant', '2021-11-10', 3);

INSERT INTO CompteBancaire (id, Solde, Type_Compte, Date_Ouverture, id_Client) 
VALUES (4, 10000.00, 'Epargne', '2020-07-22', 4);

INSERT INTO CompteBancaire (id, Solde, Type_Compte, Date_Ouverture, id_Client) 
VALUES (5, 750.00, 'Courant', '2022-09-30', 5);

-----Employe
INSERT INTO Employe (id, Nom, Prenom, Email, Numero_Telephone, Role) 
VALUES (1, 'Lemoine', 'Pierre', 'pierre.lemoine@banque.com', 1122334455, 'Directrice');

INSERT INTO Employe (id, Nom, Prenom, Email, Numero_Telephone, Role) 
VALUES (2, 'Dubois', 'Laura', 'laura.dubois@banque.com', 2233445566, 'Adjoint');

INSERT INTO Employe (id, Nom, Prenom, Email, Numero_Telephone, Role) 
VALUES (3, 'Roux', 'Nicolas', 'nicolas.roux@banque.com', 3344556677, 'Adjoint');

INSERT INTO Employe (id, Nom, Prenom, Email, Numero_Telephone, Role) 
VALUES (4, 'Blanc', 'Julien', 'julien.blanc@banque.com', 4455667788, 'Employee');

INSERT INTO Employe (id, Nom, Prenom, Email, Numero_Telephone, Role) 
VALUES (5, 'Boulanger', 'Emma', 'emma.boulanger@banque.com', 5566778899, 'Employee');

----Transaction_Bancaire

INSERT INTO Transaction_Bancaire (id, Montant, Date_Transaction, id_compte, id_Client, id_CompteBancaire) 
VALUES (1, 250.75, '2023-05-10', 1, 1, 1);

INSERT INTO Transaction_Bancaire (id, Montant, Date_Transaction, id_compte, id_Client, id_CompteBancaire) 
VALUES (2, -300.00, '2023-06-12', 2, 2, 2);

INSERT INTO Transaction_Bancaire (id, Montant, Date_Transaction, id_compte, id_Client, id_CompteBancaire) 
VALUES (3, 1500.00, '2022-12-01', 3, 3, 3);

INSERT INTO Transaction_Bancaire (id, Montant, Date_Transaction, id_compte, id_Client, id_CompteBancaire) 
VALUES (4, -500.50, '2023-01-20', 4, 4, 4);

INSERT INTO Transaction_Bancaire (id, Montant, Date_Transaction, id_compte, id_Client, id_CompteBancaire) 
VALUES (5, 2000.00, '2023-08-15', 5, 5, 5);


------Gere

INSERT INTO Gere (id, id_Employe) 
VALUES (1, 1);

INSERT INTO Gere (id, id_Employe) 
VALUES (2, 2);

INSERT INTO Gere (id, id_Employe) 
VALUES (3, 3);

INSERT INTO Gere (id, id_Employe) 
VALUES (4, 4);

INSERT INTO Gere (id, id_Employe) 
VALUES (5, 5);
