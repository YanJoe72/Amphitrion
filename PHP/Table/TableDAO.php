<?php


class TableDAO {
    public static function GetAllTables(){
        try{
            $sql = "select DATES, IDSERVICE, NUMTABLES, IDUTILISATEUR,CAPACITETABLE from TABLES;";
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->execute();
            $reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $reponse = "problème avec la connexion BDD";
        }
        return $reponse;
    }

    public static function AjouterTable( $date ,  $idservice , $numtable , $iduser , $capaciteTable){
        try{
            $sql = "INSERT into TABLES VALUES ( DATENOW(), :IDSERVICE, :NUMTABLES, :IDUTILISATEUR,:CAPACITETABLE );";
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->bindParam('IDSERVICE',$idservice);
            $requetePrepa->bindParam('NUMTABLES',$numtable);
            $requetePrepa->bindParam('IDUTILISATEUR',$iduser);
            $requetePrepa->bindParam('CAPACITETABLE',$capaciteTable);
            $requetePrepa->execute();
            $reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $reponse = "problème avec la connexion BDD";
        }
        return $reponse;
    }

    public static function SupprimerTable($numtable){
        try{
            $sql = "DELETE from TABLES WHERE NUMTABLES=:NUMTABLES );";
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->bindParam('NUMTABLES',$numtable);
            $requetePrepa->execute();
            $reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $reponse = "problème avec la connexion BDD";
        }
        return $reponse;
    }

    public static function ModifierTable( $date ,  $idservice , $numtable , $iduser , $capaciteTable){
        try{
            $sql = "UPDATE TABLES set (DATE= DATE.NOWW(),IDSERVICE=:IDSERVICE, IDUTILISATEUR=:IDUTILISATEUR , CAPACITETABLE=:CAPACITETABLE )";
            $requetePrepa = DBConnex::getInstance()->prepare($sql);
            $requetePrepa->bindParam('IDSERVICE',$idservice);
            $requetePrepa->bindParam('IDUTILISATEUR',$iduser);
            $requetePrepa->bindParam('CAPACITETABLE',$capaciteTable);
            $requetePrepa->execute();
            $reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
        }catch(Exception $e){
            $reponse = "problème avec la connexion BDD";
        }
        return $reponse;
    }


}
