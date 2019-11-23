<?php
 
$method = $_SERVER['REQUEST_METHOD'];
$request = explode('/', trim($_SERVER['PATH_INFO'],'/'));
$input = json_decode(file_get_contents('php://input'),true);
 
$link = mysqli_connect('localhost', 'root', 'mysql', 'store');
mysqli_set_charset($link,'utf8');
 
$table = preg_replace('/[^a-z0-9_]+/i','',array_shift($request));
$key = array_shift($request)+0;

if ($input) {
$columns = preg_replace('/[^a-z0-9_]+/i','',array_keys($input));
$values = array_map(function ($value) use ($link) {
  if ($value===null) return null;
  return mysqli_real_escape_string($link,(string)$value);
  },array_values($input));
}


$set = '';
for ($i=0;$i<count($columns);$i++) {
  $set.=($i>0?',':'').'`'.$columns[$i].'`=';
  $set.=($values[$i]===null?'NULL':'"'.$values[$i].'"');
}
 

switch ($method) {
  case 'GET':
    $sql = "select * from `$table`".($key?" WHERE order_id=$key":''); break;
  case 'PUT':
    $sql = "update `$table` set $set where order_id=$key"; break;
  case 'POST':
    $sql = "insert into `orders` set $set"; break;
  case 'DELETE':
    $sql = "delete from `$table` where order_id=$key"; break;
}
 

$result = mysqli_query($link,$sql);
 

if (!$result) {
  http_response_code(404);
  die(mysqli_error($link));
}
 

if ($method == 'GET') {
  if (!$key) echo '[';
  for ($i=0;$i<mysqli_num_rows($result);$i++) {
    echo ($i>0?',':'').json_encode(mysqli_fetch_object($result));
  }
  if (!$key) echo ']';
} elseif ($method == 'POST') {
  echo mysqli_insert_id($link);
} else {
  echo mysqli_affected_rows($link);
}
 

mysqli_close($link);
?>