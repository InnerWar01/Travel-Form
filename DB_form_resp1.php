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
	<link rel="stylesheet" href="<?php require "path.php";?>\assets\css\DB_form_resp1.css">
</head>
	
<body>

<div id="sum_container">

	<div id="sumHeader">
		<img id="sum_img" src="<?php require "path.php";?>\assets\img\DB_travel.jpg" alt="Image kangoroo">
	</div>
	
<div id="sum_content">
	<form action="DB_fini.php">
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
			
			echo "<span>Vous avez choisi: </span>" . $_SESSION["choix"] ."<br>";
			
			$sql = "SELECT Prix_Indicatif, Ville_Départ, Ville_Arrivée, Durée_Voyage, Code_Voyage 
					FROM VOYAGE 
					WHERE nom_voyage = '{$_SESSION['choix']}'";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
				// output data of each row
				while($row = $result->fetch_assoc()) {
					$code = $row["Code_Voyage"];
					$_SESSION["code"] = $code;
					$n = $row["Prix_Indicatif"] * (int)$_SESSION["quantity"];
					$_SESSION["n"] = $n;
					echo "<span>Prix Total: </span>" . $n . " €<br>";
					echo "<span>Ville de départ: </span>" . $row["Ville_Départ"] . "<br>";
					echo "<span>Ville d'arrivée: </span>" . $row["Ville_Arrivée"] . "<br>";
					echo "<span>Durée du voyage: </span>" . $row["Durée_Voyage"] . "<br>";
				} 
			} else {
					echo "0 results";
			}
			
			$sql = "SELECT Rang, Ville_Etape, Type_Transport, Nombre_Jours, Nom_Guide, Prénom_Guide, Nom_Hotel 
					FROM VOYAGE_ETAPE NATURAL JOIN GUIDE NATURAL JOIN PAYS NATURAL JOIN REGION NATURAL JOIN HOTEL
					WHERE Code_Voyage = '{$code}'";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
				// output data of each row
				echo "<div id='table'>
					  <table>
						<tr>
							<th>Etape</th>
							<th>Ville</th>
							<th>Type de transport</th>
							<th>Durée</th>
							<th>Guide</th>
							<th>Hôtel</th>
						</tr>";
				while($row = $result->fetch_assoc()) {
					echo "<tr>
							<td>" . $row["Rang"] . "</td>";
					echo   "<td>" . $row["Ville_Etape"] . "</td>";
					echo   "<td>" . $row["Type_Transport"] . "</td>";
					echo   "<td>" . $row["Nombre_Jours"] . "</td>";
					echo   "<td>" . $row["Nom_Guide"] . " " . $row["Prénom_Guide"] . "</td>";
					echo   "<td>" . $row["Nom_Hotel"] . "</td>
						  </tr>";
				}
				echo "</table>
					  </div>";
			} else {
					echo "0 results";
			}
			
		$conn->close();
		?>
		</fieldset>
		<input type="submit"  id="book" value="Réserver">
	</form>
</div>
</div>

</body>
</html>