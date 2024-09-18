<?php

require_once 'param.php';
require_once 'DBConnex.php';
require_once 'UtilisateurDAO.php';

print(json_encode(UtilisateurDAO::GetServeurUser()));