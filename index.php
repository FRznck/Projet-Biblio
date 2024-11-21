<?php
session_start();
include "connect.php";

if(isset($_POST["bout"])){
  $email = $_POST["email"];
  $mot_de_passe = $_POST['mot_de_passe'];
  $req = "select * from utilisateurs
          where email = '$email'";
          $res = mysqli_query($id,$req);
  if(mysqli_num_rows($res) > 0){
      $_SESSION["mail"] = $mail;
      $row = mysqli_fetch_assoc($res);
      $_SESSION["nom"] = $row["nom"];
      $_SESSION["prenom"] = $row["prenom"];
      $_SESSION["rôle"] = $row["mail"];
     
      if ($mail == "admin@gmail.com" && $mdp == "admin123") {
          header("Location:admin/AcceuilADMIN.php"); // Page pour l'administrateur
      } else {
          header("Location:user/AccueilUSER.php"); // Page pour les autres utilisateurs
      }
      exit();
  } else {
      $erreur = "<p class='error'>Erreur de mot de passe ou de login !!!</p>";
  }

}
?> 


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="index.css">
  <title>Bibliothèque - Connexion</title>
</head>
<body>
  <div class="grid"></div>
  <div class="container">
    <h1>Connexion</h1>
    <form action="#" method="post">
      <input type="email" placeholder="email" name="email" required>
      <input type="password" placeholder="Mot de passe" name="mot_de_passe" required>
      <button type="submit" name="bout">Se connecter</button>
      <div class="links">
        <a href="#">Mot de passe oublié ?</a>
        <a href="inscription.php">Créer un compte</a>
      </div>
    </form>
  </div>
</body>
</html>
