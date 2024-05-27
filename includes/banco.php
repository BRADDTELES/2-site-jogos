<?php
$banco = new mysqli("localhost", "root", "", "bd_games");
if ($banco->connect_error) {
    echo "<p>Encontrei um erro $banco -> error --> $banco -> connect_error</p>";
    die();
}

$banco->query("SET NAMES 'utf8'");
$banco->query("SET character_set_connection=utf8");
$banco->query("SET character_set_client=utf8");
$banco->query("SET character_set_results=utf8");

