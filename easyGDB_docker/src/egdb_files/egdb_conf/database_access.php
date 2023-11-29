<?php
function getConnectionString(){
  $db_pwd = getenv('POSTGRES_USERPW', true) ?: getenv('POSTGRES_USERPW');
  $cs = "host=DB dbname=annot1 user=web_usr password={$db_pwd}";
  return $cs ;
};
?>
