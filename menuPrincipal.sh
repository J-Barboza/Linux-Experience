#!/bin/bash
clear
echo ""
echo ">---------------------------------------------------------------------------<"
echo "> Script criado apenas para o projeto Linux Experience da DIO               <"
echo ">                                                                           <"
echo "> Os comentarios foram propositadamente escritos em portugues e SEM acentos <"
echo ">                                                                           <"
echo ">---------------------------------------------------------------------------<"
echo "> C - Criar usuario                                                         <"
echo "> E - Excluir usuario                                                       <"
echo "> D - Criar diretorio de departamento                                       <"
echo "> A - Apagar diretorio de departamento                                      <"
echo "> L - Listar usuario                                                        <"
echo "> S - Sair do script                                                        <"
echo ">---------------------------------------------------------------------------<"
read -p "Selecione uma opcao e pressione Enter: " actionuser

if [[ $actionuser == "C" || $actionuser == "c" ]]; then
   ./criaApagaLista.sh Criar
elif [[ $actionuser == "E" || $actionuser == "e" ]]; then
   ./criaApagaLista.sh Excluir
elif [[ $actionuser == "L" || $actionuser == "l" ]]; then
   ./criaApagaLista.sh Listar
elif [[ $actionuser == "D" || $actionuser == "d" ]]; then
   ./criaApagaLista.sh CriaDir
elif [[ $actionuser == "A" || $actionuser == "a" ]]; then
   ./criaApagaLista.sh DelDir  
elif [[ $actionuser == "S" || $actionuser == "s" ]]; then
   echo ""
   echo "Obrigado por usar o criarUsuario"
   echo "Fim"
   echo ""
   exit 1
else
      clear
      echo ""
      echo "Entrada invalida, deve informar (C)riar, (A)pagar , (L)istar ou (S)air."
      echo ""
      read -p "Tecle Enter para continuar."
      ./criarUsuario.sh
fi
./menuPrincipal.sh
