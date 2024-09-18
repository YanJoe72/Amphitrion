<?php

require_once 'param.php';
require_once 'DBConnex.php';
require_once 'TableDAO.php';

print(json_encode(TableDAO::GetAllTables()));