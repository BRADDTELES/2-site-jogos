<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Listagem de Jogos</title>
    <link rel="stylesheet" href="estilos/estilo.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
    <?php
    require_once "includes/banco.php";
    require_once "includes/login.php";
    require_once "includes/funcoes.php";
    $ordem = $_GET['ord'] ?? "nome";
    $chave = $_GET['c'] ?? "";
    ?>
    <div id="corpo">
        <?php
        include_once "top.php";
        ?>
        <h1>Escolha seu jogo</h1>
        <form method="get" id="busca" action="index.php">
            Ordenar: 
            <a href="index.php?ord=nome&c=<?php echo $chave;?>">Nome</a> |  
            <a href="index.php?ord=produtora&c=<?php echo $chave;?>">Produtora</a> |
            <a href="index.php?ord=notaAlta&c=<?php echo $chave;?>">Nota Alta</a> | 
            <a href="index.php?ord=notaBaixa&c=<?php echo $chave;?>">Nota Baixa</a> |
            <a href="index.php">Mostrar Todos</a> |
            Buscar: <input type="text" name="c" size="10" maxlength="40"/>
            <input type="submit" value="Ok">
        </form>
        <table class="listagem">
            <?php
            $query = "SELECT j.cod, j.nome, g.genero, p.produtora, j.capa FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod ";

            if ($chave!= "") {
                $query.= "WHERE j.nome LIKE '%$chave%' OR p.produtora LIKE '%$chave%' OR g.genero LIKE '%$chave%'";
            }

            switch ($ordem) {
                case 'nome':
                    $query.= "ORDER BY j.nome";
                    break;
                case 'produtora':
                    $query .= "ORDER BY p.produtora";
                    break;
                case 'notaAlta':
                    $query .= "ORDER BY j.nota DESC";
                    break;
                case 'notaBaixa':
                    $query .= "ORDER BY j.nota ASC";
                    break;
                default:
                    $query .= "";
                    break;
            }
            $busca = $banco->query($query);
            if (!$busca) {
                echo "<tr><td>Infelizmente a busca deu errado</td></tr>";
            } else {
                if ($busca->num_rows == 0) {
                    echo "<tr><td>Nenhum registro encontrado</td></tr>";
                } else {
                    while ($registro = $busca->fetch_object()) {
                        $t = thumb($registro->capa);
                        echo "<tr><td><img src='$t' class='mini'/>";
                        echo "<td><a href='detalhes.php?cod=$registro->cod'>$registro->nome</a>";
                        echo " [$registro->genero]";
                        echo "<br/>$registro->produtora";
                        echo "<td>Adm";
                        
                    }
                }
            }
            ?>
        </table>
    </div>
    <?php include_once "rodape.php"; ?>
</body>

</html>