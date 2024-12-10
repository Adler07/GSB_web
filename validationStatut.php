<?php
session_start();
$user = $_SESSION['id_role'];
    if ($user == 3) {
        header("Location: dashboardVisiteur.php");
        exit;
    } else if ($user == 1) {
        header("Location: dashboardAdmin.php");
        exit;}

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

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fiche_id = $_POST['fiche_id'] ?? null;
    $validation = $_POST['validation'] ?? null;
    $montant_rembourse = $_POST['montant_rembourse'] ?? null;

    if (!$fiche_id) {
        die("ID de fiche non spécifié.");
    }

    $nouveau_statut = '';
    

    switch ($validation) {
        case 'Complet':
            $nouveau_statut = 'Remboursement complet';
            break;
        case 'Partiel':
            $nouveau_statut = 'Remboursement partiel';
            break;
        case 'Refuse':
            $nouveau_statut = 'Refusé';
            break;
        default:
            die("Option de validation non reconnue.");
    }

    $sqlStatut = "
        UPDATE fiche_frais 
        SET statut = :statut, montant_rembourse = :montant_rembourse
        WHERE n°fiche_frais = :fiche_id
    ";
    $stmtStatut = $pdo->prepare($sqlStatut);
    $stmtStatut->execute([
        'statut' => $nouveau_statut,
        'montant_rembourse' => $montant_rembourse,
        'fiche_id' => $fiche_id,
    ]);

    header('Location: dashboardComptable.php');
    exit;
} else {
    die("Requête invalide.");
}
?>