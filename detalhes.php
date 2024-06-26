<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes</title>
    <link rel="stylesheet" href="estilos/estilo.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
    <?php
    require_once "includes/banco.php";
    require_once "includes/login.php";
    require_once "includes/funcoes.php";
    ?>
    <div id="corpo">
        <?php
            include_once "top.php";
            $codigo = $_GET['cod'] ?? 0;
            $busca = $banco->query("SELECT * FROM jogos WHERE cod='$codigo'");
        ?>
        <h1>Detalhes do jogo</h1>
        <table class="detalhes">
            <?php
                if (!$busca) {
                    echo "tr><td>Busca falhou! $banco->error";
                } else {
                    if($busca->num_rows == 1){
                        $registro = $busca->fetch_object();
                        $t = thumb($registro->capa);
                        echo "<tr><td rowspan='3'><img src='$t' class='full'/>";
                        echo "<td><h2>$registro->nome</h2>";
                        echo "Nota: " . number_format($registro->nota, 1) . "/10.0";
                        echo "<tr><td>$registro->descricao";
                        echo "<tr><td>Adm";
                    }else{
                        echo "<tr><td>Nenhum registro encontrado";
                    }
                }
            ?>
        </table>
        <?php echo voltar(); ?>
    </div>
    <?php include_once "rodape.php"; ?>
</body>
</html>