<?php
header('Content-Type: application/json');

$action = isset($_GET['action']) ? $_GET['action'] : '';
$status = isset($_GET['status']) ? $_GET['status'] : '';
$startDate = isset($_GET['startDate']) ? $_GET['startDate'] : '';
$endDate = isset($_GET['endDate']) ? $_GET['endDate'] : '';
$firstName = isset($_GET['firstName']) ? $_GET['firstName'] : '';
$lastName = isset($_GET['lastName']) ? $_GET['lastName'] : '';
//$authorid = isset($_GET['authorid']) ? $_GET['authorid'] : '';


$db_servername = "localhost:3306";
$db_username = "root";
$db_password = "mysql";
$db_name = "store";

$db_conn = new mysqli($db_servername, $db_username, $db_password, $db_name);
if ($db_conn->connect_error) {
    die("Connection failed: " . $db_conn->connect_error);
} 

$sql = "";
if ($action === "getStatusReport") {
    $sql = "SELECT * FROM orders WHERE status_id = ".$status." AND order_date BETWEEN '".$startDate."' AND '".$endDate."' ;";
    echo $sql;
} elseif ($action === "getCustomerReport") {
    if ($firstName != '')
    {
        $sql = "SELECT * FROM customer WHERE first_name = '" . $firstName . "';";
    }
    else if ($lastName != '')
    {
        echo $sql;
        $sql = "SELECT * FROM customer WHERE last_name = '" . $lastName . "';";
    }
} 

//echo $sql;
//die();

$db_result = $db_conn->query($sql);

$arr = array();
while($row = $db_result->fetch_assoc()){	$arr[] = $row; }
$db_result->free();

echo json_encode($arr);

$db_conn->close();
?>