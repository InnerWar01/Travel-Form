<?php 
	session_start([
    'cookie_lifetime' => 86400,
    'read_and_close'  => true,]);
?>

<!DOCTYPE html>
<html lang="fr">

<head>
	<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DataBase</title> 
	<link rel="stylesheet" href="<?php require "path.php";?>\assets\css\DB_form_resp.css">
</head>
	
<body>

<?php

// define variables and set to empty values
$choix = $date_deb = $diffErr = $date = "";

if($_SERVER["REQUEST_METHOD"] == "POST") {
	
	$valid = true;

	$choix = test_input($_POST["choix"]);
	$date_deb = test_input($_POST["date_deb"]);
	
	date_default_timezone_set("Europe/Paris");
	$date = date('m/d/Y h:i:s a', time());
	$date1 = strtotime($date_deb);
	$date2 = strtotime($date);
	
	if($date1 < $date2) 
	{
		$diffErr = "Erreur! La date de début est inférieure à la date currente!";
		$valid = false;
	}
	
	if($valid){
		$_SESSION["choix"] = $_POST["choix"];
		$_SESSION["date_deb"] = $_POST["date_deb"];
		header('Location: DB_form_resp1.php');
	}
}

function test_input($data) {
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}
?>
<div id="sum_container">

<div id="sumHeader">
	<img id="sum_img" src="<?php require "path.php";?>\assets\img\DB_car_travel.jpg" alt="Image kangoroo">
</div>

<div id="sum_content">

	<form action="" method="post">
	<fieldset>
		<legend>Récapitulatif</legend>
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

			echo "<span>Nom: </span>" .$_SESSION["nom"]."<br>";
			echo "<span>Prénom: </span>" .$_SESSION["prénom"]."<br>";
			echo "<span>Adresse: </span>" . $_SESSION["adresse"] . $_SESSION["ville"] . " " . $_SESSION["pays"] . "<br>";
			echo "<span>E-mail: </span>" .$_SESSION["email"]. "<br>";
			echo "<span>Téléphone: +</span>" . $_SESSION["tel"] . "<br>";
			echo "<span>Nombre de voyageurs: </span>" . $_SESSION["quantity"] . "<br>";
			
			$sql = "SELECT Nom_Voyage 
					FROM voyage 
					WHERE Prix_Indicatif*'{$_SESSION['quantity']}' <= '{$_SESSION['budget']}'";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
				// output data of each row
				echo "<span>Voyages disponibles: </span><br>";
				while($row = $result->fetch_assoc()) {
					echo "<input type='radio' class='check' name='choix' value='{$row['Nom_Voyage']}' required>{$row['Nom_Voyage']}<br>";
				} 
			} else {
					echo "<span>Voyages disponibles: 0</span><br>";
			}
		$conn->close(); 
		?>
	<span>Date de départ</span>
	<input type='date' name='date_deb' value='<?php echo $date_deb;?>' required>
	<span class='error'><?php echo $diffErr;?></span>
	<br>
	</fieldset>
	<input type="submit" id="submit" value="Valider">
	</form>
</div>
</div>

</body>
</html>