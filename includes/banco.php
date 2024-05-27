<pre><?php 
    $banco = new mysqli("localhost", "root", "", "bd_games");
    if ($banco -> connect_error) {
        echo "<p>Encontrei um erro $banco -> error --> $banco -> connect_error</p>";
        die();
    }

    $banco->query("SET NAMES 'utf8'");
    $banco->query("SET character_set_connection=utf8");
    $banco->query("SET character_set_client=utf8");
    $banco->query("SET character_set_server=utf8");
    $banco->query("SET character_set_results=utf8");

    $busca = $banco->query("SELECT * FROM generos");
    if (!$busca) {
        echo "<p>Falha no buscar! $banco -> error</p>";
    }else {
        while ($registro = $busca->fetch_object()) {
            print_r($registro);
        }
    }
    
?>