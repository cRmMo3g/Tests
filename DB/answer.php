<?php 
//--- Ievadāmās informācijas atēlošana JSON formātā
include('DBconfig.php');
error_reporting(1); // Kļūdu slēpšana: 0 / Atēlošana: 1
$username = $_POST['firstName']?? 'NA'; // Piešķiram mainīgajam NA vērtību, ja nav datu.
    if ($username === 'NA') { // Pārbaudām vai mainīgajam ir sesijas dati
        echo 'Nav datu, ko iesūtīt'; // Attēlejam ja datu mainīgajam nav
    }else{

if(mysqli_connect_error()){ // Savienojums pārtrūka ?
  echo mysqli_connect_error(); // kļūdas paziņojums
  exit(); // Iziet no savienojuma
}
else{ // ievadāmo vērtību lauks
		$username = $_POST['firstName']; // // Mainīgā iegūšana no sesijas
		$question = $_POST['question'];
		$answer = $_POST['answer'];
		$category = $_POST['category'];
		$correct = $_POST['correct'];
		$sql = "INSERT INTO user_answer (username, question, answer, category, correct) VALUES ('$username', '$question', '$answer', '$category', '$correct')"; //Kādus un kur, Ievada datus iekš MYSQL mainīgo vērtības
		mysqli_query($con, $sql); // Izpildās ievade

   $con->close(); // savienojuma pārtraukšana
}
}
   
?>
