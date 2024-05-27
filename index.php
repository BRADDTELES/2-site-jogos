<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Listagem de Jogos</title>
    <link rel="stylesheet" href="estilos/estilo.css">
</head>

<body>
    <?php
    require_once "includes/banco.php";
    require_once "includes/funcoes.php";
    ?>
    <div id="corpo">
        <?php
        include_once "cabecalho.php";
        ?>
        <h1>Escolha seu jogo</h1>
        <form method="get" id="busca" action="index.php">
            Ordenar: Nome | Produtora | Nota Alta | Nota Baixa |
            <!---  PAREI POR AQUI COMEÇAR A ASSISTIR O VIDEO 08 -->
            Buscar: <input type="text" name="c" size="10" maxlength="40" />
            <input type="submit" value="Ok">
        </form>
        <table class="listagem">
            <?php
            $q = "SELECT j.cod, j.nome, g.genero, p.produtora, j.capa FROM jogos j JOIN generos g ON j.genero = g.cod JOIN produtoras p ON j.produtora = p.cod;";
            $busca = $banco->query($q);
            if (!$busca) {
                echo "<tr><td>Infelizmente a busca deu errado</td></tr>";
            } else {
                if ($busca->num_rows == 0) {
                    echo "<tr><td>Nenhum registro emcontrado</td></tr>";
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