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
	<title>DataBaseForm</title> 
	<link rel="stylesheet" href="form.css">
</head>

<body>

<?php

			$servername = "localhost";
			$username = "root";
			$password = "1991";
			$dbname = "travel_agency";

			// Create connection
			$conn = new mysqli($servername, $username, $password, $dbname);
			// Check connection
			if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
			}
			
// define variables and set to empty values
$nomErr = $prénomErr = $civilitéErr = $adresseErr = $emailErr = $villeErr = $paysErr = "";
$nom = $prénom = $civilité = $adresse = $email = $ville = $pays = $tel = $voyage = $quantity = $budget = $date_deb = "";

if($_SERVER["REQUEST_METHOD"] == "POST") {
	
	$valid = true;
	
	if ($_POST["civilité"] == "null") {
		 $civErr = "Entrez votre civilité.";
		 $valid = false;
	   } else {
		 $civilité = test_input($_POST["civilité"]);
	   }
	 
	$nom = test_input($_POST["nom"]);
	if (!preg_match("/^[a-zA-Z]*$/", $nom)) {
		$nomErr = "Only letters and white space allowed";
		$valid = false;
	}
	
	$prénom = test_input($_POST["prénom"]);
	if (!preg_match("/^[a-zA-Z]*$/", $prénom)) {
		$prénomErr = "Only letters and white space allowed";
		$valid = false;
	}
	
	$email = test_input($_POST["email"]);
	if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
		$emailErr = "Invalid email format";
		$valid = false;
	}
	
	$adresse = test_input($_POST["adresse"]);
	
	$ville = test_input($_POST["ville"]);
	if (!preg_match("/^[a-zA-Z]*$/", $ville)) {
		$villeErr = "Only letters and white space allowed";
		$valid = false;
	}
	
	$pays = test_input($_POST["pays"]);
	if (!preg_match("/^[a-zA-Z]*$/", $pays)) {
		$paysErr = "Only letters and white space allowed";
		$valid = false;
	}
	
	$tel = test_input($_POST["tel"]);
	$budget = test_input($_POST["budget"]);
	$quantity = test_input($_POST["quantity"]);
	
	if($valid){
		$sql = "INSERT INTO `CLIENT` (`Nom_Client`, `Prénom_Client`, `Civilité_Client`, `Adresse_Client`, `Ville_Client`, `Pays_Client`, `Mail_Client`, `Tel_Client`)
				VALUES ('{$_SESSION['nom']}', '{$_SESSION['prénom']}', '{$_SESSION['civilité']}', '{$_SESSION['adresse']}', '{$_SESSION['ville']}', '{$_SESSION['pays']}', '{$_SESSION['email']}', '{$_SESSION['tel']}')";
			
			
			if ($conn->query($sql) === TRUE) {
				$last_id = $conn->insert_id;
				$_SESSION["id"] = $last_id;
				//echo "New record created successfully. Last inserted id is: " . $last_id;
			} else {
				echo "Error: " . $sql . "<br>" . $conn->error;
			}
			$conn->close();
			
		$_SESSION['civilité'] = $_POST['civilité'];
		$_SESSION['nom'] = $_POST['nom'];
		$_SESSION['prénom'] = $_POST['prénom'];
		$_SESSION['email'] = $_POST['email'];
		$_SESSION['adresse'] = $_POST['adresse'];
		$_SESSION['ville'] = $_POST['ville'];
		$_SESSION['pays'] = $_POST['pays'];
		$_SESSION['tel'] = $_POST['tel'];
		$_SESSION['budget'] = $_POST['budget'];
		$_SESSION['quantity'] = $_POST['quantity'];
		header('Location: ..\DB_form_resp.php');
	}
}

function test_input($data) {
	$data = trim($data);
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
} 
?>

<div id="form_container">

<div id="formHeader">
	<img id="form_img" src="DB_Europe_Banner.gif" alt="Image formulaire">
</div>

<div id="form-content">

<form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
	<fieldset>
		<legend>Informations Personnelles</legend>
		<select name="civilité" value="<?php echo $civilité ?>" required>
			<option value="null"></option>
			<option value="Monsieur" <?php if ($civilité == "Monsieur") echo "selected";?>>M</option>
			<option value="Madame" <?php if ($civilité == "Madame") echo "selected";?>>Mme</option>
			<option value="Mlle" <?php if ($civilité == "Mlle") echo "selected";?>>Mlle</option>
		</select>
		<br>
		<input type="text" name="prénom" placeholder="Prénom" value="<?php echo $prénom;?>" required>
		<span class="error"><?php echo $prénomErr; ?></span>
		<br>
		<input type="text" name="nom" placeholder="Nom" value="<?php echo $nom;?>" required>
		<span class="error"><?php echo $nomErr; ?></span>
		<br>
		<input type="text" name="adresse" placeholder="Adresse" value="<?php echo $adresse;?>" required>
		<span class="error"><?php echo $adresseErr; ?></span>
		<br>
		<input type="text" name="ville" placeholder="Ville" value="<?php echo $ville;?>" required>
		<span class="error"><?php echo $villeErr; ?></span>
		<br>
		<input type="text" name="pays" placeholder="Pays" value="<?php echo $pays;?>" required>
		<span class="error"><?php echo $paysErr; ?></span>
		<br>
		<input type="email" name="email" placeholder="Email" value="<?php echo $email;?>" required>
		<span class="error"><?php echo $emailErr; ?></span>
		<br>
		<input type="text" name="tel" maxlength="11" placeholder="Numéro de téléphone" value="<?php echo $tel;?>" required>
		<br>
	</fieldset>
	<hr>
	<fieldset>
		<legend>Votre Voyage</legend>
		<input type="number" name="budget" max="5000" placeholder="Budget" value="<?php echo $budget;?>" required>
		<input type='number' name='quantity' min='1' max='4' placeholder='Nombre de voyageurs' value='<?php echo $quantity;?>' required>
	</fieldset>
	<input type="submit" value="Valider" id="submit">
</form>

</div>
</div>

</body>
</html>