<?php
session_start();
$user = $_SESSION['id_role'];
    if ($user == 1) {
        header("Location: dashboardAdmin.php");
        exit;
    } else if ($user == 2) {
        header("Location: dashboardComptable.php");
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
    $fiche_id = $_POST['fiche_id'];
    $montant_repas = $_POST['montant_repas'];
    $nombre_repas = $_POST['nombre_repas'];
    $montant_hebergement = $_POST['montant_hebergement'];
    $nombre_hebergement = $_POST['nombre_hebergement'];
    $montant_deplacement = $_POST['total_deplacement'];
    $nombre_deplacement = $_POST['nombre_deplacement'];
    $total = $_POST['total'];
    $date_soumission = $_POST['date'];
    $justificatif = $_FILES['justificatif'];
    $kilometres_voiture = $_POST['kilometres_voiture'];

    
    if (empty($fiche_id) || empty($montant_repas) || empty($montant_hebergement) || empty($total) || empty($date_soumission)) {
        die("Tous les champs sont obligatoires.");
    }

    $justificatif = null;
    if (isset($_FILES['justificatif']) && $_FILES['justificatif']['error'] === UPLOAD_ERR_OK) {
        $targetDirectory = 'assets/uploads/'; // Assurez-vous que ce dossier existe et est accessible en écriture
        $fileName = basename($_FILES['justificatif']['name']);
        $targetFilePath = $targetDirectory . $fileName;

        if (move_uploaded_file($_FILES['justificatif']['tmp_name'], $targetFilePath)) {
            $justificatif = $targetFilePath;
        } else {
            die("Erreur lors de l'upload du fichier justificatif.");
        }
    }

    try {
        // Construire la requête SQL
        $sql = "
            UPDATE fiche_frais 
            SET montant_repas = :montant_repas, 
                nombre_repas = :nombre_repas, 
                montant_hebergement = :montant_hebergement, 
                nombre_hebergement = :nombre_hebergement, 
                montant_deplacement = :montant_deplacement, 
                nombre_deplacement = :nombre_deplacement, 
                total = :total, 
                date_soumission = :date_soumission,
                kilometres_voiture = :kilometres_voiture";
        
        // Ajouter le justificatif uniquement si un nouveau fichier a été uploadé
        if ($justificatif !== null) {
            $sql .= ", justificatif = :justificatif";
        }
        
        $sql .= " WHERE `n°fiche_frais` = :fiche_id";

        
        $stmt = $pdo->prepare($sql);


        $params = [
            ':montant_repas' => $montant_repas,
            ':nombre_repas' => $nombre_repas,
            ':montant_hebergement' => $montant_hebergement,
            ':nombre_hebergement' => $nombre_hebergement,
            ':montant_deplacement' => $montant_deplacement,
            ':nombre_deplacement' => $nombre_deplacement,
            ':total' => $total,
            ':date_soumission' => $date_soumission,
            ':kilometres_voiture' => $kilometres_voiture,
            ':fiche_id' => $fiche_id
        ];

        // Ajouter le justificatif dans les paramètres si nécessaire
        if ($justificatif !== null) {
            $params[':justificatif'] = $justificatif;
        }

        $stmt->execute($params);

        header("Location: dashboardVisiteur.php");
        exit;

    } catch (PDOException $e) {
        die("Erreur lors de la mise à jour : " . $e->getMessage());
    }
}