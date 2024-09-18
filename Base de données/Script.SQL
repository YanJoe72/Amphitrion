# -----------------------------------------------------------------------------
#       TABLE : UTILISATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISATEUR
 (
   IDUTILISATEUR VARCHAR(4) NOT NULL  ,
   LOGIN VARCHAR(32) NULL  ,
   MDP VARCHAR(32) NULL  ,
   NOM VARCHAR(32) NULL  ,
   PRENOM VARCHAR(32) NULL  ,
   STATUT VARCHAR(32) NULL  
   , PRIMARY KEY (IDUTILISATEUR) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       TABLE : TABLES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TABLES
 (
   DATES DATE NOT NULL  ,
   IDSERVICE VARCHAR(4) NOT NULL  ,
   NUMTABLES VARCHAR(5) NOT NULL  ,
   IDUTILISATEUR VARCHAR(4) NOT NULL  ,
   CAPACITETABLE VARCHAR(5) NULL  
   , PRIMARY KEY (DATES,IDSERVICE,NUMTABLES) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE TABLES
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_TABLES_SERVICE
     ON TABLES (IDSERVICE ASC);

CREATE  INDEX I_FK_TABLES_DATES
     ON TABLES (DATES ASC);

CREATE  INDEX I_FK_TABLES_UTILISATEUR
     ON TABLES (IDUTILISATEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : COMMANDE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMANDE
 (
   IDCOMMANDE VARCHAR(4) NOT NULL  ,
   DATES DATE NOT NULL  ,
   IDSERVICE VARCHAR(4) NOT NULL  ,
   NUMTABLES VARCHAR(5) NOT NULL  ,
   HEURECOMMANDE VARCHAR(32) NULL  ,
   ETATCOMMANDE VARCHAR(4) NULL  
   , PRIMARY KEY (IDCOMMANDE) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMMANDE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMMANDE_TABLES
     ON COMMANDE (DATES ASC,IDSERVICE ASC,NUMTABLES ASC);

# -----------------------------------------------------------------------------
#       TABLE : PLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PLAT
 (
   IDPLAT CHAR(5) NOT NULL  ,
   IDCATEGORIE CHAR(5) NOT NULL  ,
   NOMPLAT CHAR(32) NULL  ,
   DESCRIPTIONPLAT CHAR(32) NULL  
   , PRIMARY KEY (IDPLAT) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PLAT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PLAT_CATEGORIE
     ON PLAT (IDCATEGORIE ASC);

# -----------------------------------------------------------------------------
#       TABLE : SERVICE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SERVICE
 (
   IDSERVICE VARCHAR(4) NOT NULL  ,
   TYPESERVICE BOOL NULL  
   , PRIMARY KEY (IDSERVICE) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       TABLE : DATES
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATES
 (
   DATES DATE NOT NULL  
   , PRIMARY KEY (DATES) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       TABLE : CATEGORIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CATEGORIE
 (
   IDCATEGORIE VARCHAR(5) NOT NULL  ,
   NOMCATEGORIE VARCHAR(32) NULL  
   , PRIMARY KEY (IDCATEGORIE) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       TABLE : PROPOSERPLAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROPOSERPLAT
 (
   IDPLAT VARCHAR(5) NOT NULL  ,
   IDSERVICE VARCHAR(4) NOT NULL  ,
   DATES DATE NOT NULL  ,
   QUANTITEPROPOSEE INTEGER NULL  ,
   PRIXVENTE INTEGER NULL  
   , PRIMARY KEY (IDPLAT,IDSERVICE,DATES) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PROPOSERPLAT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PROPOSERPLAT_PLAT
     ON PROPOSERPLAT (IDPLAT ASC);

CREATE  INDEX I_FK_PROPOSERPLAT_SERVICE
     ON PROPOSERPLAT (IDSERVICE ASC);

CREATE  INDEX I_FK_PROPOSERPLAT_DATES
     ON PROPOSERPLAT (DATES ASC);

# -----------------------------------------------------------------------------
#       TABLE : COMPOSER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMPOSER
 (
   IDPLAT VARCHAR(5) NOT NULL  ,
   IDCOMMANDE VARCHAR(4) NOT NULL  ,
   INFOCOMPLEMENTAIRE VARCHAR(32) NULL  ,
   QUANTIE INTEGER NULL  ,
   ETATPLAT VARCHAR(32) NULL  
   , PRIMARY KEY (IDPLAT,IDCOMMANDE) 
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE COMPOSER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_COMPOSER_PLAT
     ON COMPOSER (IDPLAT ASC);

CREATE  INDEX I_FK_COMPOSER_COMMANDE
     ON COMPOSER (IDCOMMANDE ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE TABLES 
  ADD FOREIGN KEY FK_TABLES_SERVICE (IDSERVICE)
      REFERENCES SERVICE (IDSERVICE) ;


ALTER TABLE TABLES 
  ADD FOREIGN KEY FK_TABLES_DATES (DATES)
      REFERENCES DATES (DATES) ;


ALTER TABLE TABLES 
  ADD FOREIGN KEY FK_TABLES_UTILISATEUR (IDUTILISATEUR)
      REFERENCES UTILISATEUR (IDUTILISATEUR) ;


ALTER TABLE COMMANDE 
  ADD FOREIGN KEY FK_COMMANDE_TABLES (DATES,IDSERVICE,NUMTABLES)
      REFERENCES TABLES (DATES,IDSERVICE,NUMTABLES) ;


ALTER TABLE PLAT 
  ADD FOREIGN KEY FK_PLAT_CATEGORIE (IDCATEGORIE)
      REFERENCES CATEGORIE (IDCATEGORIE) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_PLAT (IDPLAT)
      REFERENCES PLAT (IDPLAT) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_SERVICE (IDSERVICE)
      REFERENCES SERVICE (IDSERVICE) ;


ALTER TABLE PROPOSERPLAT 
  ADD FOREIGN KEY FK_PROPOSERPLAT_DATES (DATES)
      REFERENCES DATES (DATES) ;


ALTER TABLE COMPOSER 
  ADD FOREIGN KEY FK_COMPOSER_PLAT (IDPLAT)
      REFERENCES PLAT (IDPLAT) ;


ALTER TABLE COMPOSER 
  ADD FOREIGN KEY FK_COMPOSER_COMMANDE (IDCOMMANDE)
      REFERENCES COMMANDE (IDCOMMANDE) ;

