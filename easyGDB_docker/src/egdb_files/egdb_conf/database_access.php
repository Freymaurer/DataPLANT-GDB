<?php
function getConnectionString(){
  $db_pwd = getenv('POSTGRES_USERPW', true) ?: getenv('POSTGRES_USERPW');
  $db = getenv('POSTGRES_DB', true) ?: getenv('POSTGRES_DB');
  $cs = "host={$db} dbname=annot1 user=web_usr password={$db_pwd}";
  return $cs ;
};
?>
