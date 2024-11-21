<?php
$id = mysqli_connect("localhost","root","", "bibliotheque");

if (isset($_POST["supprimer"])) {
    $email = isset($_POST["supprimer"]) ? $_POST["supprimer"] : $_POST["change_role"];

    if (isset($_POST["supprimer"])) {
        $email = $_POST["supprimer"];
        $req = "DELETE FROM utilisateurs WHERE email = '$email'";
        if (mysqli_query($id, $req)) {
            echo '<div class="message">Vous avez supprimé cet utilisateur.</div>';
        } else {
            echo "Erreur de suppression: " . mysqli_error($id);
        }
    }
//petite erreur lorsqu'on change le rôle, il change tout////à revoir vite fait***

}

if(isset($_POST["bout"])){
    $role = $_POST["role"];

   $req = "UPDATE utilisateurs SET role = '$role'";

   if (mysqli_query($id, $req)) {
    echo '<div class="message">Vous avez modifié le rôle de cet utilisateur.</div>';
    } else {
    echo "Erreur de modification: " . mysqli_error($id);
    }

}


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des utilisateurs</title>
</head>
<body>
<h1>Liste de tous les membres inscrits</h1>

<main>
        <table>
            <tr>
                <th>Nom</th>
                <th>Prénoms</th>
                <th>Email</th>
                <th>Rôle actuel</th>
            </tr>
            <?php
            $req = "SELECT nom,prenom,email,role FROM utilisateurs";
            $res = mysqli_query($id, $req);
            while ($ligne = mysqli_fetch_assoc($res)) {
                echo "<tr>";    
                echo "<td>" .$ligne['nom']. "</td>";
                echo "<td>" .$ligne['prenom']. "</td>";
                echo "<td>" .$ligne['email']. "</td>";
                echo "<td>" .$ligne['role']. "</td>";
                echo "<td>
                        <form action='' method='post'>
                                            <button type='submit' name='supprimer' value='" . $ligne['email'] . "'>supprimer</button>
                              
                                            <select name='role' id=''>
                                            <option value='' disabled selected>Définir un rôle</option>
                                            <option value='admin' name='admin'>Admin</option>
                                            <option value='membre' name='membre'>Membre</option>
                                            </select>
                                            <button type='submit' name='bout'>Valider</button>
                                           
                                    

                           
                          

                        </form>
                      </td>";
                echo "</tr>";
            }
            ?>
        </table>
    </main>

</body>
</html>