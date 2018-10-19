#!/bin/bash

grupos()
{
	echo "voce escolheu grupos!"
}

escolherFuncao()
{
	echo "O que vamos mudar agora?"
	echo
	echo "1) Grupos"
	echo "2) Usuários"
	echo "3) Permissões de acesso"
	echo "4) Sair"
	echo
	echo -n "Sua opção: "
	read $opcao

	case $opcao in
		1) grupos ;;
		2) Usuários ;;
		3) Permissoes ;;
		4) exit ;;
		*) "Opção desconhecida." ; echo ; escolherFuncao ;;
	esac
}

escolherFuncao