<?php
/*
Crear una sesión que aumente su valor en 1 o disminuya en 1 en función al parametro get counter está a 1 o a 0.
*/

session_start();

if (!isset($_SESSION["numero"])) {
    $_SESSION["numero"]=0;
}elseif(isset($_GET["counter"])){
    if((int)$_GET["counter"]>0){
        $_SESSION["numero"]+=1;
    }else{
        $_SESSION["numero"]-=1;
    }
}

//if (!isset($_GET["counter"])) {
    echo "<h2>La variable de sesión tiene valor: ". $_SESSION["numero"].".</h2>";
//}

?>

<a href="1-Sesion-numeros.php?counter=1">Aumentar el Valor</a>
<a href="1-Sesion-numeros.php?counter=0">Disminuir el Valor</a>