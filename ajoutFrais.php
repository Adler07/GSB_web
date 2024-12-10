<?php 
session_start();
$user = $_SESSION['id_role'];
    if ($user == 1) {
        header("Location: dashboardAdmin.php");
        exit;
    } else if ($user == 2) {
        header("Location: dashboardComptable.php");
        exit;
    } 

$host = 'collaiw225.mysql.db';
$dbname = 'collaiw225';
$username = 'collaiw225';
$password = '1234Azer';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
} catch (PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") { 
    $repas = $_POST["montant_repas"];
    $hebergement = $_POST["montant_hebergement"];
    $deplacement = $_POST["montant_deplacement"];
    $total = $_POST["total"];
    $date = $_POST['date'];

    $stmt = $pdo->prepare("INSERT INTO fiche_frais (montant_repas, montant_hebergement, montant_deplacement, total , date_soumission)
                           VALUES (:montant_repas, :montant_hebergement, :montant_deplacement, :total ,:date_soumission)");
    $stmt->execute(['montant_repas' => $repas, 'montant_hebergement' => $hebergement, 'montant_deplacement' => $deplacement, 'total' => $total, 'date_soumission' => $date]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    $ficheId = $pdo->lastInsertId();
    $stmtStatut = $pdo->prepare("INSERT INTO statut_fiche (fiche_id, statut) VALUES (:fiche_id, 'en attente')");
    $stmtStatut->execute(['fiche_id' => $ficheId]);

    header('Location: dashboardVisiteur.php');

} 
?>