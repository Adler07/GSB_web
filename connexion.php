<?php 
session_start(); 
$user_status = $_SESSION['statut'];
$user_role = $_SESSION['id_role'];

if (isset($user_role)){
    if ($user_role == 3) {
        header("Location: dashboardVisiteur.php");
        exit;
    } else if ($user_role == 2) {
        header("Location: dashboardComptable.php");
        exit;
    } else if ($user_role == 1) {
        header("Location: dashboardAdmin.php");
        exit;
    } 
}

if ($user_status == "Inactif"){
    header("Location: index.php");
}

$host = 'collaiw225.mysql.db';
$dbname = 'collaiw225';
$username = 'collaiw225';
$password = '1234Azer';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") { 
    $email = $_POST["email"];
    $password = $_POST["mdp"];

    $stmt = $pdo->prepare("
        SELECT u.id, u.email, u.pass, u.prenom, u.nom, u.statut, r.id_role, r.nom_role 
        FROM utilisateur u
        INNER JOIN role r ON u.id_role = r.id_role
        WHERE u.email = :email
    ");
    $stmt->execute(['email' => $email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        if (password_verify($password, $user['pass'])) { 
            $_SESSION["nom"] = $user["nom"]; 
            $_SESSION["prenom"] = $user["prenom"]; 
            $_SESSION["id_role"] = $user["id_role"]; 
            $_SESSION["nom_role"] = $user["nom_role"]; 
            $_SESSION['id'] = $user['id'];
            $_SESSION['statut'] = $user['statut'];

            if ($user["id_role"] == 3) {
                header("Location: dashboardVisiteur.php");
                exit;
            } else if ($user["id_role"] == 2) {
                header("Location: dashboardComptable.php");
                exit;
            } else if ($user["id_role"] == 1) {
                header("Location: dashboardAdmin.php");
                exit;
            }
        } else {
            echo "Email ou mot de passe incorrect";
            header("Refresh: 2; URL=index.php");
            exit;
        }
    }
}