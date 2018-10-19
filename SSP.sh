#!/bin/bash

# ////////////////////////////////////////////////////////////////////////////////MÉTODOS DOS GRUPOS///////////////////////////////////////////////////////////////
grupos()
{
	clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo "a) Criar grupo"
	echo "b) Alterar o nome de um grupo já criado"
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
	echo "criar grupo? aa"
}


# ////////////////////////////////////////////////////////////////////////////////MÉTODOS DOS USUARIOS///////////////////////////////////////////////////////////////
usuarios()
{
	echo "voce escolheu usuarios!"
}


# ////////////////////////////////////////////////////////////////////////////////MÉTODOS DAS PERMISSOES///////////////////////////////////////////////////////////////
permissoes()
{
	echo "voce escolheu permissoes!"
}


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