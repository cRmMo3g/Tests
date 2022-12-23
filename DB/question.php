<?php 
// --- Datu attēlošana JSON formātā - Jautājumi
include('DBconfig.php'); // Dabubāzes konfigurācijas pievienošana
$response = array(); // Mainīgā mainīgajam masīva vērtība

// --- Datubāzes savienojuma pārbaude, ja nav savienojuma (dati)
if (!$con) {
    die("Savienojums neizdevās: " . mysqli_connect_error());
    die("Nav savienojuma");
  }
 
  $sql = "SELECT * FROM question"; // Datu atlase no tabulas

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
      $response[$i]['group_id'] = json_decode($row['tests_id']);
      $response[$i]['question'] = $row['question'];
      $response[$i]['answers'] = json_decode($row['answer']);
      $i++;
  }
  }
echo json_encode($response, JSON_PRETTY_PRINT); // Datu atēlošana
$con->close(); // Savienojuma pārtraukšana

?>
