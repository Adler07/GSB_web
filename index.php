<?php
session_start();
$user = $_SESSION['id_role'];
if (isset($user)){
    if ($user == 3) {
        header("Location: dashboardVisiteur.php");
        exit;
    } else if ($user == 2) {
        header("Location: dashboardComptable.php");
        exit;
    } else if ($user == 1) {
        header("Location: dashboardAdmin.php");
        exit;
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link href="assets\styleConnexion.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark p-3 shadow">
    <div class="container-fluid">
            <img src="assets\images\Fichier 1.png" alt="Logo" width="150" height="auto" class="d-inline-block align-text-center">
        <span class="navbar-text ms-3 fs-4 text-white">GSB - "La recherche pour un monde meilleur"</span>
    </div>
</nav>
<div class="d-flex justify-content-center align-items-center min-vh-100">
    <form action="connexion.php" method="post" 
          class="form-container rounded-4 shadow-lg p-5 d-flex flex-column align-items-center w-50">
        <h2 class="mb-4 text-center text-white">Connexion</h2>
        <div class="mb-4 w-75">
            <label class="form-label fs-5 text-white">Email :</label>
            <input type="email" name="email" class="form-control p-3 rounded bg-dark text-white" placeholder="Votre email" required>
        </div>
        <div class="mb-4 w-75">
            <label class="form-label fs-5 text-white">Mot de passe :</label>
            <input type="password" name="mdp" class="form-control p-3 rounded bg-dark text-white" placeholder="Votre mot de passe" required>
        </div>
        <button type="submit" name="confirmer" class="btn btn-primary mt-4 py-3 px-5 w-50 text-white">Se connecter</button>
    </form>
</div>
<footer class="footer py-4 d-flex justify-content-center gap-5">
    <p class="m-0 text-white">© Galaxy Swiss Bourdin 2024</p>
    <a href="#" class="text-decoration-none text-white">Mentions légales</a>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>