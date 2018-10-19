#!/bin/bash

# ////////////////////////////////////////////////////////////////////////////////MÉTODOS DOS GRUPOS///////////////////////////////////////////////////////////////
grupos()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo "a) Criar grupo"
	echo "b) Alterar o nome de um grupo existente"
	echo "c) Voltar"
	echo "d) Sair"
	echo
	echo -n "Qual a opção desejada? "

	read opcaoGrupo
	case $opcaoGrupo in
		a) criarGrupo ;;
		b) alterarGrupo ;;
		c) escolherFuncao ;;
		d) exit ;;
		*) "Opção desconhecida." ; echo ; grupos ;;
	esac
}

criarGrupo()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo "Se não quiser criar um grupo, digite [sair]."
	echo 
	echo -n "Qual o nome do grupo a ser criado? "

	read nomeGrupo
	#echo $(groupadd $nomeGrupo)

	if [ $nomeGrupo = "sair" ]
	then
		grupos
	else
	sudo groupadd $nomeGrupo
	fi
	echo
	echo "Grupo chamado $nomeGrupo criado com sucesso!" 
	echo
	echo "Pressione qualquer botão para continuar!"
	read
	grupos
}

alterarGrupo()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo "Se não quiser alterar o nome de um grupo, digite [sair]."	
	echo
	echo -n "Qual o nome do grupo a ser mudado? "
	read nomeGrupoAntigo

	if [ $nomeGrupoAntigo = "sair" ]
	then
		grupos
	fi
	echo
	echo -n "Qual o novo nome? "
	read nomeGrupoNovo
	sudo groupmod -n $nomeGrupoNovo $nomeGrupoAntigo
	echo
	echo "Grupo chamado $nomeGrupoAntigo renomeado com sucesso! Seu novo nome é $nomeGrupoNovo" 
	echo
	echo "Pressione qualquer botão para continuar!"
	read
	grupos
}


# ////////////////////////////////////////////////////////////////////////////////MÉTODOS DOS USUARIOS///////////////////////////////////////////////////////////////
usuarios()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo "a) Criar usuário"
	echo "b) Voltar"
	echo "c) Sair"
	echo
	echo -n "Qual a opção desejada? "

	read opcaoGrupo
	case $opcaoGrupo in
		a) criarUsuario ;;
		b) escolherFuncao ;;
		c) exit ;;
		*) "Opção desconhecida." ; echo ; usuarios ;;
	esac
}

criarUsuario()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo "Se não quiser criar um usuário, digite [sair]."
	echo 
	echo -n "Qual o nome do usuário a ser criado? "

	read nomeUser
	#echo $(groupadd $nomeGrupo)

	if [ $nomeUser = "sair" ]
	then
		usuarios
	else
	sudo useradd $nomeUser
	fi
	#considerar utilizar adduser
	echo
	echo "Usuário chamado $nomeUser criado com sucesso!" 
	echo
	echo "Pressione qualquer botão para continuar!"
	read
	usuarios
}


# ////////////////////////////////////////////////////////////////////////////////MÉTODOS DAS PERMISSOES///////////////////////////////////////////////////////////////
permissoes()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo "a) Modificar o dono de um arquivo ou diretório"
	echo "b) Modificar o grupo dono de um arquivo ou diretório"
	echo "c) Modificar as permissões de um arquivo ou diretório separadamente para o dono, para o grupo e para outros"
	echo "d) Voltar"
	echo "e) Sair"
	echo
	echo -n "Qual a opção desejada? "

	read opcaoPermissoes
	case $opcaoPermissoes in
		a) modificarDono ;;
		b) modificarGrupoDono ;;
		c) modificarPermissoes ;;
		d) escolherFuncao ;;
		e) exit ;;
		*) "Opção desconhecida." ; echo ; permissoes ;;
	esac
}

modificarDono()
{}

modificarGrupoDono()
{}

modificarPermissoes()
{}


# ////////////////////////////////////////////////////////////////////////////////MÉTODOS INICIAL///////////////////////////////////////////////////////////////
escolherFuncao()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo "O que vamos mudar agora?"
	echo
	echo "1) Grupos"
	echo "2) Usuários"
	echo "3) Permissões de acesso"
	echo "4) Sair"
	echo
	echo -n "Qual a opção desejada? "

	read opcao
	case $opcao in
		1) grupos ;;
		2) usuarios ;;
		3) permissoes ;;
		4) exit ;;
		*) "Opção desconhecida." ; echo ; escolherFuncao ;;
	esac
}

escolherFuncao