<?php
session_start();

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
    
    $fiche_id = $_POST['fiche_id'];
    $date_hors_farfait = $_POST['date_hors_forfait'];
    $libelle = $_POST['libelle'];
    $montant = $_POST['montant'];
    $justificatif = $_FILES['justificatif'];
 
    
    $justificatif = null;
    if (isset($_FILES['justificatif']) && $_FILES['justificatif']['error'] === UPLOAD_ERR_OK) {
        $targetDirectory = 'assets/uploads/'; 
        $fileName = basename($_FILES['justificatif']['name']); 
        $targetFilePath = $targetDirectory . $fileName;

        if (move_uploaded_file($_FILES['justificatif']['tmp_name'], $targetFilePath)) {
            $justificatif = $targetFilePath;
        } else {
            die("Erreur lors de l'upload du fichier justificatif.");
        }
    }

    try {
        $sql = "
            UPDATE hors_forfait 
            SET date_hors_forfait = :date_hors_forfait,
                libelle = :libelle, 
                montant = :montant
        ";
        $params = [
            'fiche_id' => $fiche_id,
            'date_hors_forfait' => $date_hors_farfait,
            'libelle' => $libelle,
            'montant' => $montant,
        ];

        // Ajouter la colonne justificatif si un fichier a été uploadé
        if ($justificatif !== null) {
            $sql .= ", justificatif = :justificatif";
            $params['justificatif'] = $justificatif;
        }

        $sql .= " WHERE `id_hors_forfait` = :fiche_id";

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);

        header("Location: dashboardVisiteur.php");
        exit;
    } catch (PDOException $e) {
        die("Erreur lors de la mise à jour : " . $e->getMessage());
    }
} else {
    die("Requête invalide.");
}
?>