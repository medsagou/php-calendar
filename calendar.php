<?php 
// Connexion à la base de données
session_start();
$currentWeek = isset($_SESSION['currentWeek']) ? $_SESSION['currentWeek'] : 1;
$currentYear = (int) date('Y');

if(isset($_POST['week']) && isset($_POST['year'])) {
    $currentWeek = $_POST['week'];
    $currentYear = $_POST['year'];
    $_SESSION['currentWeek'] = $currentWeek;
}



if(isset($_POST['specific-date-submit']) && isset($_POST['specific-date'])) {

    $specificDate = $_POST['specific-date'];
    $specificWeek = date('W', strtotime($specificDate));
    $specificYear = date('Y', strtotime($specificDate));
    $currentWeek = $specificWeek;
    $currentYear = $specificYear;
    $_SESSION['currentWeek'] = $currentWeek;
    $_SESSION['currentYear'] = $currentYear;
}else{
    $specificDate = date('Y-m-d');
}


if(isset($_POST['prev'])) {
    
    $specificDate =  date('Y-m-d', strtotime('-7 days', strtotime($_POST['specific-date'])));
    $specificWeek = date('W', strtotime($specificDate));
    $specificYear = date('Y', strtotime($specificDate));
    $currentWeek = $specificWeek;
    $currentYear = $specificYear;
    $_SESSION['currentWeek'] = $currentWeek;
    $_SESSION['currentYear'] = $currentYear;
}
 elseif(isset($_POST['next'])) {
    $specificDate =  date('Y-m-d', strtotime('+7 days', strtotime($_POST['specific-date'])));
    $specificWeek = date('W', strtotime($specificDate));
    $specificYear = date('Y', strtotime($specificDate));
    $currentWeek = $specificWeek;
    $currentYear = $specificYear;
    $_SESSION['currentWeek'] = $currentWeek;
    $_SESSION['currentYear'] = $currentYear;
}

  ?>

<style>
    th, tr, td{
        border: 1px solid black;
    }
</style>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
 
<form id="calendar-form" method="POST" action="">
<input type="hidden" name="week" id="currentWeek" value="<?php echo $currentWeek; ?>">
<input type="hidden" name="year" id="currentYear" value="<?php echo $currentYear; ?>">
    <div id="calendar-container">

<div id="buttons">
      <button type="submit" name="prev">&lt</button>
      <button type="submit" name="next">&gt</button>
    </div>
  </form>
<label for="specific-date">Voir la semaine d'une date précise :</label>
<input type="date" name="specific-date" id="specific-date" value="<?php echo $specificDate ?>">
<button type="submit" name="specific-date-submit">Afficher</button>
</form>
<?php

$date = new DateTime();
$date->setISODate($currentYear, intval($currentWeek));
$firstDayOfWeek = clone $date;
$lastDayOfWeek = clone $date;
$lastDayOfWeek->modify('+6 days');// Extraction des créneaux de la base de données
// Define an array of day names starting from Monday
$daysOfWeek = array('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
$hoursOfDay = array('8:00:00','9:00:00','10:00:00','11:00:00','12:00:00','13:00:00','14:00:00','15:00:00','16:00:00','17:00:00','18:00:00');

// Connexion à la base de données
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$mysqli = new mysqli('localhost', 'root', '', 'taotto_bene');
$mysqli->set_charset('utf8mb4');


$sql = "SELECT creneau_cours.No_Creneau, matiere.nom_Matiere, enseignant.Nom, version.Date_Creneau, version.Heure_debut, version.Heure_fin FROM version INNER JOIN ( SELECT refc, MAX(Date_Version) AS maxDate FROM version GROUP BY refc ) groupel ON version.refc = groupel.refc AND version.Date_Version = groupel.maxDate JOIN creneau_cours on version.refc = creneau_cours.No_Creneau JOIN matiere ON creneau_cours.refm = matiere.No_Matiere JOIN enseignant ON version.refens = enseignant.No_enseignant ORDER BY version.Date_Creneau ASC;";
$result = $mysqli->query($sql);


// Création d'un tableau associatif contenant les créneaux par jour et heure
$tableau_creneaux = array();

while ($creneau = $result->fetch_assoc()) {
    // Vérifier si la variable est définie
    if (isset($creneau['Date_Creneau'])) {
        // echo $creneau['Date_Creneau'];
        // Récupération de la date du créneau au format 'Y-m-d'
        // $date_creneau = substr($creneau['version.Date_Creneau'], 0, 10);
        $date_creneau = $creneau['Date_Creneau'];
        
        // Ajout du créneau dans le tableau associatif, en utilisant la date et l'heure de début comme clé
        $heure_debut = $creneau['Heure_debut'];
        $tableau_creneaux[$date_creneau][$heure_debut] = $creneau;
    }
}

// var_dump($tableau_creneaux);
$dateString = $specificDate; // replace this with your desired date
$dateTime = new DateTime($dateString);
$dayOfWeek = $dateTime->format('N');
$startDate = clone $dateTime;
$endDate = clone $dateTime;
$startDate->modify('-'.($dayOfWeek - 1).' days');
$endDate->modify('+'.(7 - $dayOfWeek).' days');
$currentDate = clone $startDate;



echo '<table>';
echo '<thead>';
echo '<tr>';
echo '<th></th>';
$data_index = array();
$k = 0;
while ($currentDate <= $endDate) {
    echo '<th>' . $currentDate->format('Y-m-d l')  . '</th>';
    $currentDate->modify('+1 day');
    if (array_key_exists($currentDate->format('Y-m-d'),$tableau_creneaux)){
        echo $currentDate->format('Y-m-d');
        // var_dump($tableau_creneaux[$currentDate->format('Y-m-d')]);
        
    
        $data_index['index'] = $k;
        $data_index['data'] = $tableau_creneaux[$currentDate->format('Y-m-d')];
    }
    $k++;
}
// var_dump($data_index);
echo '</tr>';
echo '</thead>';
foreach ($hoursOfDay as $hour) {
    echo '<tr>';
    echo '<th>'. $hour . '</th>';
    $i = 0;
    
    while ($i <= 6){
        if(!empty($data_index)){

        
        if ($data_index['index'] + 1 == $i){
            


            if (strtotime($hour)<= strtotime(array_keys($data_index['data'])[0]) &&  intval((strtotime(array_keys($data_index['data'])[0]) - strtotime($hour))/3600) < 1){
                $iaray = array_keys($data_index['data'])[0];
                echo '<td>'.
                array_keys($data_index['data'])[0] .'<br>'
                . 'No_Creneau: ' . $data_index['data'][$iaray]['No_Creneau'] .'<br>'
                . 'Heure_debut: ' . $data_index['data'][$iaray]['Heure_debut'] .'<br>'
                . 'Heure_fin: ' . $data_index['data'][$iaray]['Heure_fin'] .'<br>'
                . 'Nom: ' . $data_index['data'][$iaray]['Nom'] .'<br>'
                . 'nom_Matiere: ' . $data_index['data'][$iaray]['nom_Matiere'] .'<br>'
                .'</td>';
            }else{
                echo '<td></td>';
            }
        }else{
            echo '<td></td>';
        }}else{
            echo '<td></td>';
        }
        
        $i = $i + 1;
    }
    echo '</tr>';
}
echo '<tbody>';


echo '</tbody>';
echo '</table>';
?>
   

</body>
</html>