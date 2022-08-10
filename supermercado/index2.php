<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {background-color: powderblue;}
    </style>
    <title>Exemplo PHP</title>
</head>
<body>
    <?php
        if(($_POST["fileToUpload"])&&(["fileToUpload "]!=" ")){
            $variabile=$_POST["fileToUpload"];
            $servername = "127.0.0.1";
            $username = "root";
            $password = "Beleza#2019";
            $database = "myDbMercado";

            $conexao = mysqli_connect($server, $nomeUtente, $password, $database);
            if ($conexao->connect_error) {
                die("Falha na conexao: " . $conexao->connect_error);
            }

            $produtos=array();
            if ($file=fopen("produtos.csv","r"))
            {
                while (!feof($file)){
                    $linha=fgets($file,255);
                    $linha=explode(",",$linha);
                    $nome=$linha[0];
                    $unmedida=$linha[1];
                    $preco=$linha[2];
                    $estoque=$linha[3];
                    $ativo=$linha[5];

                    $sql= "INSERT INTO produtos (nome, descricao, preco, estoque, promocao, ativo) 
                        VALUES ('$nome', '$unmedida','$preco', '$estoque', '$ativo',)"; 

                    if ($conexao->query($sql) === TRUE) {
                    } else {

                        echo "Error: " . $sql . "<br>" . $conexao->error;
                    }
                }   
                echo"<h3><br> Inclusao concluida!</h3>";
                fclose($file);
            }
        }
    ?>
</body>
</html>
