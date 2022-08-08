<img src="https://hermes.digitalinnovation.one/tracks/606823c2-8a73-4655-947d-d41b991baf12.png" alt="Linux Experience" style="height: 100px; width: 100px">

# Linux-Experience

## Script para a criação de usuários

### Propósito
> #### Script criado com fins educativos, explorando diversas possibilidades do uso do 
> #### shell bash para a criação e manutenção de usuários no sistema Linux.
> #### Faz uso dos arquivos usuarios.txt e diretorios.txt, usando-os como parâmetro de 
> #### entrada de dados.
> #### Cria um log de saída com as operações realizadas.

### Componentes:
<table>
    <td><h2>Arquivos</h2>
    <h2>menuPrincipal.sh</h2>
    <li> Script principal para servir de Menu para uso das funcionalidades</li>
    <h2>criaApagaLista.sh</h2>
    Responsavel por realizar todas as tarefas do scripr<br>
    Parâmetros:
    <ul>
        <li>Criar - Cria usuários no sistema, baseado nas configurações descritas no arquivo usuarios.txt, também crias os Grupos e Diretorios de tabalho, caso não existam. </li>
        <li>Exluir - Exclui usuários do sistema, também baseado no arquivo usuarios.txt</li>
        <li>Lista - Lista em tela os usuários do sistema, baseado no arquivo usuarios.txt</li>
        <li>CriaDir - Cria diretorios baseados no arquivo diretorios.txt</li>
        <li>DelDir - Deleta diretorios baseados no arquivo diretorios.txt</li>
        <li>Sair - Sai do script</li>
    </ul>
    Pode ser chamado diretamente, bastando para isso a passagem dos parâmetros em sua chamada.
    <h2>criaLog.sh</h2>
    Responsável por criar os Logs das ações solicitadas<br>
    LAyout:
    <li>Ação - Descrição ação, "Criar usuario", "Excluir usuario", "Listar usuarios", "Criar diretorio", "Excluir diretorio"</li>
    <li>Data - data da criação da linha de log</li>
    <li>Diretorio ou Usuario - realcionado a ação, refere-se é uma ação para usuário ou direório</li>
    Apenas para criação de usuários, baseados no arquivo usuarios.txt
    <ul><li>Grupo - Crupo a que pertence o usuário</li>
    <li>Diretorio - Diretorio de tablalho do usuario</li>
    <li>Permissao - Permisssão dos diretórios de trabalho</li>
    </ul>
    <li>Status - status da ação realizada</li>
    <h2>usuarios.txt</h2>
    Arquivos com a lista de usuários a serem criados e seus parâmetros.<br>
    As informações devem ser separadas por vingulas e sem espaço<br>
    Parâmetros:
    <li>id_do_usuario</li>
    <li>grupo</li>
    <li>diretorio-de-trabalho</li>
    <li>permissao (deve ser usado modo absoluto (numérico))</li><br>
    Exemplo: jose_silva, GRP_VEN,vendas,770
    <h2>diretorios.txt</h2>
    <li>Lista de diretório que se deseja criar ou excluir</li>
    <h2>criarUsuarios.log</h2>
    <li> Arquivo de Log propriamente dito com o layout descrito no script criaLog</li>
</table>

## Organizador: [Digital Innovation One](https://web.dio.me/home)