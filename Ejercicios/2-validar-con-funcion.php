<?php
/*

1. Crear una función.
2. Validar un email con filter_var.
3. Recoger variable por get y validarla.
4. Mostrar el resultado.

*/

function validarEmail($email){
    if(!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL)){
        $status="Email Válido.";
    }else{
        $status="Email no Válido.";
    }
    return $status;
}

if(isset($_GET['email'])){
    echo "Resultado: ". validarEmail($_GET['email']);
}else{
    echo "No se ha recibido ningún mail. (Enviar por GET)";
}

?>