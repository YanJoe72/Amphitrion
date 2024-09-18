<?php

class PlatDAO{

    public static function allPlat(){
		try{
			$sql = "select IDPLAT, NOMPLAT, DESCRIPTIONPLAT from PLAT;";
			$requetePrepa = DBConnex::getInstance()->prepare($sql);
			$requetePrepa->execute();
			$reponse = $requetePrepa->fetchAll(PDO::FETCH_ASSOC);
		}catch(Exception $e){
			$reponse = "";
		}
		return $reponse;
	}

	public static function creerPlat($id, $categorie, $nom, $description){

		$requetePrepa = DBConnex::getInstance()->prepare("insert into PLAT (IDPLAT, IDCATEGORIE, NOMPLAT, DESCRIPTIONPLAT) values (:id, :categorie, :nom, :description);");
		$requetePrepa->bindParam(":id", $id);
		$requetePrepa->bindParam(":categorie", $categorie);
		$requetePrepa->bindParam(":nom", $nom);
		$requetePrepa->bindParam(":description", $description);
		$requetePrepa->execute();
		
		

	}

}