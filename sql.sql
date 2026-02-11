-- Client
CREATE TABLE Client (
    id_client INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20),
    matricule_conseiller INT,
    FOREIGN KEY (matricule_conseiller) REFERENCES Conseiller(matricule)
);
--  Compte
CREATE TABLE Compte (
    iban VARCHAR(34) PRIMARY KEY,
    solde DECIMAL(6,2) NOT NULL,
    type ENUM('Courant', 'Epargne') NOT NULL,
    id_client INT NOT NULL,
FOREIGN KEY (id_client) REFERENCES Client(id_client)
        
);



-- Transactions
CREATE TABLE Transactions (
    id_transaction INT PRIMARY KEY,
    montant DECIMAL(6,2) NOT NULL,
    date_transaction DATE NOT NULL,
    iban VARCHAR(34) NOT NULL,
    FOREIGN KEY (iban) REFERENCES Compte(iban)
        
);

--  Conseiller
CREATE TABLE Conseiller (
    matricule INT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);
-- ///////////////////////////insertion
--::Conseiller
INSERT INTO Conseiller (matricule, nom)
VALUES (444, 'Ali');

--//Client
INSERT INTO Client (id_client, nom, prenom, telephone, matricule_conseiller)
VALUES (1, 'omar', 'karim', '0612345678', 444);

--//Compte

INSERT INTO Compte (iban, solde, type, id_client)
VALUES ('14758662892', 1000.11, 'Courant', 1);

--///////////////////////////////////////////REquete de selection
--transactions:
SELECT * FROM Transactions;

--Les clients :
SELECT * FROM Client
ORDER BY nom ASC;

--les comptes 
SELECT * FROM Compte
WHERE type = 'Epargne';

--Update

--update phone
UPDATE Client
SET telephone = '0611111111'
WHERE id_client = 1;

--update solde
UPDATE Compte
SET solde = 7500.00
WHERE iban = '14758662892';

--rename conseiller
UPDATE Conseiller
SET nom = 'otman'
WHERE matricule = 444;



--deletee

--transatcions
DELETE FROM Transactions
WHERE id_transaction = 1;

--compte
DELETE FROM Compte
WHERE iban = '14758662892';

--client
DELETE FROM Client
WHERE id_client = 1;

--//*Alter tables

/--//add colone
ALTER TABLE Client
ADD COLUMN adresse VARCHAR(255);

--/change type of solde
ALTER TABLE Compte
MODIFY COLUMN solde DECIMAL(18,2) NOT NULL;

--//add status
ALTER TABLE Compte
ADD COLUMN statut ENUM('Active', 'blocked');


--//delete table

--/consieller
DROP TABLE Conseiller;


----///////////////B. Requêtes Spécifiques (Obligatoires)///////////////::
