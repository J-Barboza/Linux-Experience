#!/bin/bash

clear
echo ""
echo ">------------------------------------------------------------------------<"
echo "Script criado apenas para o projeto Linux Experience da DIO"
echo ""
echo "Os comentarios foram propositadamente escritos em portugues e SEM acentos "
echo ""
echo "Criara usuario, o grupo,  o diretorio e dando permissoes"
echo ""
echo ">------------------------------------------------------------------------<"

if [ $# -eq 0 ]
   then 
     echo ""
     echo "-----------------------------------------------------------------------"
     echo "Deve passar o parametro Criar para criar usuario"
     echo "Deve passar o parametro Excluir para apagar usuario"
     echo "Deve passar o parametro Listar para Listar os usuarios"
     echo "Sintaxe: criaApagaLista.sh Criar"
     echo "-----------------------------------------------------------------------"
     echo ""
     exit 1
fi

listadeusuarios="usuarios.txt"
listadediretorios="diretorios.txt"

if [[ $1 == "Listar" ]]; then
   acao="Listar usuario"
   echo ""
   echo "----------------------------"
   echo "Lista de usuarios do sistema"
   echo "----------------------------"
   for  linha in `cat ${listadeusuarios}`
   do
      array=(${linha//,/ })
      usuario=${array[0]}
      if [ $(getent passwd $usuario) ]; then
            echo "Usuario: " $(getent passwd $usuario)
      else
            echo "Usuario:" $usuario "nao existe."
      fi
   done
   ./criaLog.sh listar "Solicitados" "Lista de usuarios concluida"
elif [[ $1 == "Criar" ]]; then
   acao="criar"
   echo ""
   echo "-------------------------"
   echo "Criar usuario no sistema"
   echo "-------------------------"
   echo "Se o grupo e diretorio nao existirem, serao criados"
   echo ""
   read -p "Deseja continuar? (S/n) " continue
   
   if [[ ${continue,,} == "s" ]]; then
      for linha in `cat ${listadeusuarios}`
      do
         array=(${linha//,/ })
         usuario=${array[0]}
         grupo=${array[1]}
         diretorio=${array[2]}
         permissao=${array[3]}

         if [ $(getent passwd $usuario) ]; then
            echo "Usuario" $usuario "ja existe"
            ./criaLog.sh $acao $usuario $grupo $diretorio $permissao "Usuario ja existe"
         else
            if [ ! $(getent group $grupo) ]; then
               groupadd $grupo
               echo "Grupo criado."
            else
               echo "Grupo ja existe."
            fi
            if [ ! -d $diretorio ]; then
               mkdir ./$diretorio
               echo "Diretorio" $directorio "criado."
            else
               echo "Diretorio ja existe."
            fi
            useradd $usuario -m -s /bin/bash -p $(openssl passwd -crypt Passw123) -G $grupo
            touch /var/mail/$usuario
            echo "Usuario:" $usuario "criado." 
            chown root:$grupo /$diretorio
            chmod $permissao /$diretorio
            ./criaLog.sh $acao $usuario $grupo $diretorio $permissao "Usuario criado"
         fi
      done
   else
      exit 1
      ./criarUsuario.sh
   fi
elif [[ $1 == "Excluir" ]]; then
   acao="excluir"
   echo ""
   echo "----------------------------"
   echo "Excluir usuario do sistema  "
   echo "----------------------------"
   for linha in `cat ${listadeusuarios}`
   do
      array=(${linha//,/ })
      usuario=${array[0]}
      if [ $(getent passwd $usuario) ]; then
         userdel $usuario -rf > /dev/null
         echo "Usuario:" $usuario "deletado." 
         ./criaLog.sh $acao $usuario "Usuario excluido"
      else
         echo "Usuario:" $usuario "nao encontrado." 
         ./criaLog.sh $acao $usuario "Usuario nao encontrado"
      fi
   done
elif [[ $1 == "CriaDir" ]]; then
   acao="criadir"
   echo ""
   echo "----------------------------------"
   echo "Criar diretorio de departamento "
   echo "----------------------------------"
   for linha in `cat ${listadediretorios}`
   do
      diretorio=$linha
      if [ ! -d $diretorio ]; then
         mkdir ./$diretorio
         echo "Diretorio:" $diretorio "criado." 
         ./criaLog.sh $acao $diretorio "Diretorio criado"
      else
         echo "Diretorio:" $diretorio "ja existe." 
         ./criaLog.sh $acao $diretorio "Diretorio ja existe"
      fi
   done
elif [[ $1 == "DelDir" ]]; then
   acao="deldir"
   echo ""
   echo "----------------------------------"
   echo "Excluir Diretorio de departamento "
   echo "----------------------------------"
   for linha in `cat ${listadediretorios}`
   do
      diretorio=$linha
      if [ -d ./$diretorio ]; then
         rm -frd $diretorio
         echo "Diretorio:" $diretorio "excluido." 
         ./criaLog.sh $acao $diretorio "Diretorio excluido"
      else
         echo "Diretorio:" $diretorio "nao encontrado." 
         ./criaLog.sh $acao $diretorio "Diretorio nao encontrado"
      fi
   done
else
  echo ""
  echo "---------------------------------------------"
  echo "Parametro incorreto, deve informar C, D ou L"
  echo "---------------------------------------------"
  echo ""
fi
echo " "
read -p "Pressione Enter para continuar" continue
exit 1
