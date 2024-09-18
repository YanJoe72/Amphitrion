<?php

require_once '../param.php';
require_once '../DBConnex.php';
require_once 'PlatDAO.php';


$_POST['IDPLAT'] = 10;
$_POST['IDCATEGORIE'] = 2;
$_POST['NOMPLAT'] = "Test3";
$_POST['DESCRIPTIONPLAT'] = "fezfezf";

PlatDAO::creerPlat($_POST['IDPLAT'], $_POST['IDCATEGORIE'], $_POST['NOMPLAT'], $_POST['DESCRIPTIONPLAT']);