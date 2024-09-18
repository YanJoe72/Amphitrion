<?php 

class UtilisateurDAO{
	public static function authentification($login , $mdp){
		try{
			$sql = "select NOM, PRENOM, STATUT from UTILISATEUR
			where login= :login and mdp = :mdp " ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$mdp =  md5($mdp);
			$requetePrepa->bindParam("login", $login);
			$requetePrepa->bindParam("mdp", $mdp);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetch(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "";
		}
		return $reponse;
	}

	public static function GetServeurUser(){
		try{
			$sql = "select *  from UTILISATEUR
			where STATUT = 'serveur'  " ;
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetch(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "";
		}
		return $reponse;
	}
}
?>
