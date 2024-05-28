<?php

session_start();

if(!isset($_SESSION['user'])){
    $_SESSION['user'] = "";
    $_SESSION['nome'] = "";
    $_SESSION['tipo'] = "";
}

function cripo($senha){
    $c = '';
    for($pos=0; $pos < strlen($senha); $pos++){
        $letra = ord($senha[$pos]) + 1;
        $c .= chr($letra);
    }
    return $c;
}

function gerarHash($senha){
    $hash = password_hash($senha, PASSWORD_DEFAULT);
    return $hash;
}

function testarHash($senha){
    $ok = password_verify($senha, $hash);
    return $ok;
}