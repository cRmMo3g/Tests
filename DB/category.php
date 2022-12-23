<?php 
// --- Datu attēlošana JSON formātā - Jautājumi
include('DBconfig.php'); // Dabubāzes konfigurācijas pievienošana
$response = array(); // mainīgajam masīva vērtība
// --- Datubāzes savienojuma pārbaude, ja nav savienojuma (dati)
if (!$con) {
    die("Savienojums neizdevās: " . mysqli_connect_error());
    die("Nav savienojuma");
  }
  $sql = "SELECT * FROM tests_cat";
// Startējam SQL datus (iegūstam)
  $result = mysqli_query($con,$sql);
// SQL datu kļuda, savienojumā (parbaude)
if (!$result) {
  die(mysqli_error($con));

}{
  header('Content-Type: application/json; charset=utf-8'); // Piešķiram izvadāmo informāciju JSON skatā
  $i = 0; // Sākumvērtība
  while ($row = mysqli_fetch_assoc($result)) {  // izvadāmā informācija
    $response[$i]['id'] = json_decode($row['id']);
    $response[$i]['category'] = $row['name'];
    $i++;
  }
  }
echo json_encode($response, JSON_PRETTY_PRINT); // Datu atēlošana
$con->close(); // Savienojuma pārtraukšana

?>