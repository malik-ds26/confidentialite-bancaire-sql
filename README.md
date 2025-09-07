# 🔐 Gestion de la confidentialité – Base de données bancaire (SQL)

Projet SQL de **gestion de comptes bancaires** avec **modèle de données**, **contraintes** et **politique d’accès par rôles** (Directrice, Adjoint, Employé, Client).

- **Schéma & données d’exemple** : création des tables Client, CompteBancaire, Employe, Transaction_Bancaire, Gere + insertions. :contentReference[oaicite:0]{index=0}  
- **Rôles & permissions** : création des rôles et GRANT d’accès adaptés (lecture, écriture, suppression, etc.). :contentReference[oaicite:1]{index=1}  
- **Contexte & besoins** : objectifs, user stories et modélisation (rapport PDF). :contentReference[oaicite:2]{index=2}

---

## 🧱 Schéma (résumé)

**Tables principales** (extraits) :  
- `Client(id, Nom, Prenom, Email, Numero_telephone, Lettre_de_gestion)` – PK: `id`.  
- `CompteBancaire(id, Solde, Type_Compte, Date_Ouverture, id_Client)` – PK: `id`, FK → `Client(id)`.  
- `Employe(id, Nom, Prenom, Email, Numero_Telephone, Role)` – PK: `id`.  
- `Transaction_Bancaire(id, Montant, Date_Transaction, id_compte, id_Client, id_CompteBancaire)` – PK: `id`, `UNIQUE(id_compte)`, FK → `Client(id)`, FK → `CompteBancaire(id)`.  
- `Gere(id, id_Employe)` – PK composite `(id, id_Employe)`, FK → `CompteBancaire(id)`, FK → `Employe(id)`. :contentReference[oaicite:3]{index=3}

Des **inserts d’exemple** sont fournis pour chaque table (clients, comptes, employés, transactions, gestion). :contentReference[oaicite:4]{index=4}

---

## 👥 Rôles & permissions

Rôles : `Directrice`, `Adjoint`, `Employee`, `Client`. Exemple de GRANT :  
- Directrice : `SELECT, UPDATE` sur `Client`, et `SELECT, UPDATE, DELETE, INSERT` sur `CompteBancaire` & `Transaction_Bancaire`.  
- Adjoint : `SELECT, UPDATE` sur `Client`, `CompteBancaire`, `Transaction_Bancaire`.  
- Employé : `SELECT` sur `CompteBancaire`, `SELECT, UPDATE` sur `Client` et `Transaction_Bancaire`.  
- Client : `SELECT` sur ses comptes/transactions (exemple global fourni). :contentReference[oaicite:5]{index=5}

> Les rôles & besoins d’accès découlent des **user stories** du rapport (Directrice, Adjoint, Employé, Client). :contentReference[oaicite:6]{index=6}

---

## 🚀 Prérequis

- **MySQL 8.0+** (recommandé) ou MariaDB (à adapter si besoin).
- Un utilisateur MySQL ayant les droits de création de base/objets.

---


