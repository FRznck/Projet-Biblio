<?php
session_start();
include "connect.php";

if(isset($_POST['bout'])){
    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];
    $email = $_POST['email'];
    $mot_de_passe = $_POST['mot_de_passe'];
    
    $req = "INSERT INTO utilisateurs (nom,prenom,email,role,mot_de_passe)
                VALUES ('$nom','$prenom','$email','membre','$mot_de_passe')";
    $res = mysqli_query($id,$req);
    echo "<h3>Inscruption réussie, connectez vous....";
    header("refresh:3;url=index.php");
    
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
<p>Le Grimoire Infini</p>   
    <h1>S'inscrire</h1>
    <form action="#" method="post">
            <input type="text" name="nom" placeholder="Nom">
            <input type="text" name="prenom" placeholder="prénom">  
            <input type="email" name="email" placeholder="email">
            <input type="password" placeholder="Mot de passe"  name="mot_de_passe" required>
            <button type="submit" name="bout">S'inscrire</button>
  <div class="links">
        <a href="#">Mot de passe oublié ?</a>
        <a href="index.php">Se connecter</a>
      </div>
    </form>
  </div>
</body>
</html>
