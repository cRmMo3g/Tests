<?php

// --- Datubāzes konfigurācija

header("Access-Control-Allow-Origin: *"); //HTTP pielaide datubāzei, iestatītais - pieejams visiem:
$host = "localhost"; // Links uz Mysql
$user = "root"; // MYSQL lietotājs
$password = "1234"; // Mysql parole
$dbname = "tests";  // Datubāzes nosaukums (izmantojamā)
$con = mysqli_connect($host, $user, $password,$dbname); // Datubāzes savienošana

// ---
 

 
