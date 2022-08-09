#!/bin/bash

function f1 {
    echo ">*********<    Atualiza lista pacote    >*********<" | tee -a ./atualizacao.log
    echo "> Data:" $(date +'%d-%m-%Y %H:%M:%S') | tee -a ./atualizacao.log
    apt-get update | tee -a ./atualizacao.log
    echo ""
    echo "Verifique op arquivo de LOG (atualizacao.log)"
    read -p "Pressione Enter para continuar " p
}

function f2 {
    echo ">*********<      Atualiza Sistema       >*********<" | tee -a ./atualizacao.log
    echo "> Data:" $(date +'%d-%m-%Y %H:%M:%S') | tee -a ./atualizacao.log
    apt-get upgrade -y | tee -a ./atualizacao.log
    echo ""
    echo "Verifique op arquivo de LOG (atualizacao.log)"
    read -p "Pressione Enter para continuar " p
}

function f3 {
    echo ">*********<       Instalar Apache       >*********<" | tee -a ./atualizacao.log
    echo "> Data:" $(date +'%d-%m-%Y %H:%M:%S') | tee -a ./atualizacao.log
    apt-get install apache2 -y | tee -a ./atualizacao.log
    echo ""
    echo "Verifique op arquivo de LOG (atualizacao.log)"
    read -p "Pressione Enter para continuar " p
}

function f4 {
    echo ">*********<        Instalar Unzip       >*********<" | tee -a ./atualizacao.log
    echo "> Data:" $(date +'%d-%m-%Y %H:%M:%S') | tee -a ./atualizacao.log
    apt-get install unzip -y | tee -a ./atualizacao.log
    echo ""
    echo "Verifique op arquivo de LOG (atualizacao.log)"
    read -p "Pressione Enter para continuar " p
}

function f5 {
    echo ">*********<     Instalar Projeto Web    >*********<" | tee -a ./atualizacao.log
    echo "> Data:" $(date +'%d-%m-%Y %H:%M:%S') | tee -a ./atualizacao.log
    wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip | tee -a ./atualizacao.log
    unzip main.zip | tee -a ./atualizacao.log
    cp -R ./linux-site-dio-main/* /var/www/html | tee -a ./atualizacao.log
    echo ""
    echo "Verifique op arquivo de LOG (atualizacao.log)"
    read -p "Pressione Enter para continuar " p
}

function f6 {
    echo ">*********< Arquivo de LOG inicializado >*********<" | tee ./atualizacao.log
    echo "> Data:" $(date +'%d-%m-%Y %H:%M:%S') | tee -a ./atualizacao.log
    echo ""
    echo "Verifique op arquivo de LOG (atualizacao.log)"
    read -p "Pressione Enter para continuar " p
}

clear
echo "|------------------------------------------------|"
echo "|               Menu Principal                   |"
echo "|                                                |"
echo "|   1) Atualiza lista pacote                     |"
echo "|   2) Atualiza Sistema                          |"
echo "|   3) Instalar Apache                           |"
echo "|   4) Instalar Unzip                            |"
echo "|   5) Instala projeto Web                       |"
echo "|   6) Limpar o arquivo de LOG                   |"
echo "|   0) Sair                                      |"
echo "|                                                |"
echo "|------------------------------------------------|"
while [[ ! $opcao =~ ^[0-6]{1} ]]; do
    read -p "Escolha uma opcao: " opcao
    if [[ ! $opcao =~ ^[0-6]{1} ]]; then
        ./atualizacao.sh
    fi
done

case $opcao in
    1)
        f1;;
    2)
        f2;;
    3)
        f3;;
    4)
        f4;;
    5)
        f5;;
    6)
        f6;;
    0)
        exit 1
esac
./atualizacao.sh
