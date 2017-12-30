<?php 
	session_start([
    'cookie_lifetime' => 86400,
    'read_and_close'  => true,]);
?>

<html lang="fr">

<head>
	<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Résumé</title> 
	<link rel="stylesheet" href="<?php require "path.php";?>\assets\css\DB_fini.css">
</head>

<body>

<div id="container">
	<h4>On vous remercie pour votre réservation <?php echo " " . $_SESSION["civilité"] . " " . $_SESSION["nom"] . " " . $_SESSION["prénom"] . ".<br>"; ?> 
		La feuille récapitulative vous sera envoyé sur votre messagerie. 
		On vous remercie de nous choisir et on vous souhaite un très bon sejour.</h4>
	<div id="container-img">
		<img id="fin_img" src="<?php require "path.php";?>\assets\img\DB_quote.jpg" alt="Image travel">
	</div>
</div>

<?php

	$servername = "localhost";
	$username = "#";
	$password = "#";
	$dbname = "travel_agency";

	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
	}

	$sql = "INSERT INTO `RESERVATION` (`Date_Départ`, `Nb_Places_Réservées`, `Num_Client`, `Code_Voyage`)
			VALUES ('{$_SESSION['date_deb']}', '{$_SESSION['quantity']}', '{$_SESSION['id']}', '{$_SESSION['code']}')";
	if ($conn->query($sql) === TRUE) {
		$last_id = $conn->insert_id;
		//echo "New record created successfully. Last inserted id is: " . $last_id;
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}

	date_default_timezone_set("Europe/Paris");
	$date = date('Y/m/d');

	$sql = "INSERT INTO `PAIEMENT` (`Montant_Paiement`, `Date_Paiement`, `Num_Client`, `Code_Voyage`)
			VALUES ('{$_SESSION['n']}', '{$date}', '{$_SESSION['id']}', '{$_SESSION['code']}')";
	if ($conn->query($sql) === TRUE) {
		$last_id = $conn->insert_id;
		//echo "New record created successfully. Last inserted id is: " . $last_id;
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}
	
	$conn->close();
// remove all session variables
session_unset(); 

// destroy the session 
session_destroy(); 
?>
	
</body>
</html>