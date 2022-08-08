#!/bin/bash
case $1 in
    criar) 
        acao="Criar usuario";;
    listar) 
        acao="Listar usuarios";;
    excluir)
        acao="Excluir usuario";;
    criadir)
        acao="Criar diretorio";;
    deldir)
        acao="Excluir diretorio";;
esac

echo ">--------------------------------------------------------------------------<" >> criarUsuarios.log
echo "> Acao:" $acao >> criarUsuarios.log
echo "> Data:" $(date +'%d-%m-%Y %H:%M:%S') >> criarUsuarios.log

if [[ $1 == "deldir" || $1 == "criadir" ]]; then
    echo "> Diretorio:" $2 >> criarUsuarios.log
else
    echo "> Usuario:" $2 >> criarUsuarios.log
fi
if [ $1 == "criar" ]; then
    echo "> Grupo:" $3 >> criarUsuarios.log
    echo "> Diretorio:" $4 >> criarUsuarios.log
    echo "> Permissao:" $5 >> criarUsuarios.log
    echo "> Status:" $6 >> criarUsuarios.log
else
    echo "> Status:" $3 >> criarUsuarios.log
fi
