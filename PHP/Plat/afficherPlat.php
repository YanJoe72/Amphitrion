<?php

require_once '../param.php';
require_once '../DBConnex.php';
require_once 'PlatDAO.php';

print(json_encode(PlatDAO::allPlat()));