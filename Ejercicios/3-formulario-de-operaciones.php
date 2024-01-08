<!DOCTYPE html>
<html lang="en">

<?php
/*

Hacer una interfaz de usuario (Formulario) con 2 inputs y 4 botones, sumar, restar, dividir, multiplicar. Y mostrar el resultado

*/

$resultado=null;

if(isset($_POST["sumar"]) || isset($_POST["restar"]) || isset($_POST["multiplicar"]) || isset($_POST["dividir"])){
    if(isset($_POST["sumar"])){
        operacion("sumar");
    }elseif(isset($_POST["restar"])){
        operacion("restar");
    }elseif(isset($_POST["multiplicar"])){
        operacion("multiplicar");
    }elseif(isset($_POST["dividir"])){
        operacion("dividir");
    }
}


function operacion($operador){
    global $resultado;
    if($_POST["n1"]!="" && $_POST["n2"]!=""){
    //if(!empty($_POST["n1"]) && !empty($_POST["n2"])){
        if(filter_var($_POST["n1"],FILTER_VALIDATE_INT) && filter_var($_POST["n2"],FILTER_VALIDATE_INT)){
            $resultado= "<h3>Resultado: ";
            switch($operador){
                case 'sumar': $resultado.= (int)$_POST["n1"] + (int)$_POST["n2"] . "</h3>";
                break;
                case 'restar': $resultado.= (int)$_POST["n1"] - (int)$_POST["n2"] . "</h3>";
                break;
                case 'multiplicar': $resultado.= (int)$_POST["n1"] * (int)$_POST["n2"] . "</h3>";
                break;
                case 'dividir': 
                    if((int)$_POST["n2"]==0){
                        $resultado="<h3>No se puede dividir entre 0</h3>";
                    }else{
                        $resultado.= (int)$_POST["n1"] / (int)$_POST["n2"] . "</h3>";
                    }
                break;
            }
        }else{
            $resultado="<h3>Ingrese números enteros.</h3>";
        }
    }else{
        $resultado="<h3>Por favor llene los campos.</h3>";
    }
}

?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 3</title>
</head>
<body>
<form action="3-formulario-de-operaciones.php" method="POST">
    <input type="text" name="n1" placeholder="Ingrese un número"/>
    <input type="text" name="n2" placeholder="Ingrese otro número"/>
    <input type="submit" name="sumar" value="Sumar"/>
    <input type="submit" name="restar" value="Restar"/>
    <input type="submit" name="multiplicar" value="Multiplicar"/>
    <input type="submit" name="dividir" value="Dividir"/>
</form>    
<?php if($resultado!=null){
    echo $resultado;
} ?>
</body>
</html>