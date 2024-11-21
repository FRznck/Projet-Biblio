<?php
include "connect.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Liste des utilisateurs inscrits</h1><hr>
    <table>
        <tr>
            <th> # </th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            
            <th><img src="modif.jfif" width="30"></th>
            <th><img src="sup.jfif" width="30"></th>
        </tr>
    <?php
    
    $req = "SELECT * FROM utilisateurs";
    $res = mysqli_query($id, $req);
    while($ligne = mysqli_fetch_assoc($res)){
        echo "<tr>
                <td>".$ligne['id_utilisateur'] . "</td>
                <td>".$ligne['nom'] . "</td>
                <td>".$ligne['prenom'] . "</td>
                <td>".$ligne['email'] . "</td>
<td><a href='modifier_profil.php?idu=".$ligne["id_utilisateur"]."'><img src='modif.jfif' width='23'></a></td>
<td><a href='sup.php?idu=".$ligne["idu"]."'><img src='sup.jfif' width='23'></a></td>
               
            </tr>";
    }
    ?>
    </table>
</body>
</html>