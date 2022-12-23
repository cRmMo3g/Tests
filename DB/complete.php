<?php 
//--- Ievadāmās informācijas atēlošana JSON formātā
include('DBconfig.php');
error_reporting(0); // Kļūdu slēpšana: 0 / Atēlošana: 1
$username = $_POST['firstName']?? 'NA'; // Piešķiram mainīgajam NA vērtību, ja nav datu.
    if ($username === 'NA') { // pārbaudām mainīgā vārtību vai pienāk ievades dati 
        echo 'Nav datu, ko iesūtīt'; // Attēlojam, ja mainīgajam nav sesijas datu
    }else{
if(!$con){ // Savienojuma pārbaude
  die('Nav savienojuma ar My Sql:' .mysql_error());
}
if(mysqli_connect_error()){ // Savienojums pārtrūka ?
  echo mysqli_connect_error(); // kļūdas paziņojums
  exit(); // Iziet no savienojuma
}
else{ // ievadāmo vērtību lauks
	 $username = $_POST['firstName']; // Mainīgā iegūšana no sesijas
	 $category = $_POST['category'];
	 $correct = $_POST['correct'];
	 $sql = "INSERT INTO user_confirm_tests (username, tests_id, count_correct)  VALUES ('$username', '$category', '$correct')"; //Kādus un kur, Ievada datus iekš MYSQL mainīgo vērtības
	 mysqli_query($con, $sql); // Izpildās ievade

   $con->close();  // Savienojuma pārtraukšana
}}

   
?>
