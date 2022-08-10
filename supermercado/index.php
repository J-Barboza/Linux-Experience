<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Exemplo PHP</title>
</head>
<body>
   <?php
      ini_set("display_errors", 1);
      header('Content-Type: text/html; charset=iso-8859-1');
      echo 'Versao Atual do PHP: ' . phpversion() . '<br>';

      $hostname = "127.0.0.1";
      $username = "root";
      $password = "Password@123";
      $database = "myDbMercado";

      $conn = new mysqli($hostname, $username, $password, $database);

      if ($conn->connect_error){
         printf("Erro na conexao: %s\n", $conn->connect_error);
         exit();
      }

      $produto=array();
      if ($file=fopen("produtos.csv","r"))
      {
         while (!feof($file)){
            $linha=fgets($file,255);
            $produto=explode(",",$linha);
            $nome=$produto[0];
            $unmedida=$produto[1];
            $preco=$produto[2];
            $estoque=$produto[3];
            $ativo=$produto[4];
            
            $sql= "INSERT INTO produtos (nome, unmedida, preco, estoque, ativo) 
               VALUES ('$nome', '$unmedida','$preco', '$estoque', '$ativo')"; 

            printf("<h4>Produto: %s incluido com sucesso.</h4>", $produto[0]);

            if ($conn->query($sql) === TRUE) {
            } else {

               echo "Error: " . $sql . "<br>" . $conn->error;
            }
         }   
         echo"<h3><br> Inclusao concluida!</h3>";
         fclose($file);
      }
   ?>

</body>
</html>