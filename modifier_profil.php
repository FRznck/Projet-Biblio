<?php
include "connect.php";
if(isset($_POST["bout"])){
    $idu = $_POST["idu"];
    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $mail = $_POST["mail"];
    $niveau = $_POST["niveau"];
    $req = "update users set nom='$nom',
                            prenom='$prenom',
                            mail='$mail',
                            niveau='$niveau'
            where idu=$idu";
    mysqli_query($id,$req);
    header("location:listeUsers.php");

}


$idu = $_GET['idu'];
$query = "SELECT * FROM users WHERE idu = '$idu'";
$result = mysqli_query($id, $query);
$ligne = mysqli_fetch_assoc($result);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Vous êtes entrain de modifier un livre <?=$ligne["nom"]?></h1><hr>
    <form action="" method="post">
        <input type="text" name="nom" placeholder="Nom :" value="<?=$ligne["nom"]?>" required><br></required><br>
        <input type="text" name="prenom" placeholder="Prénom :" value="<?=$ligne["prenom"]?>" required><br></required><br>
        <input type="email" name="mail" placeholder="Mail :" value="<?=$ligne["mail"]?>" required><br></required><br>
        <input type="text" name="niveau" placeholder="Niveau :" value="<?=$ligne["niveau"]?>" required><br></required><br>
        <input type="hidden" name="idu" value="<?=$ligne["idu"]?>">
        <input type="submit" value="Modifier" name="bout"><br>
    </form><hr>
</body>
</html>