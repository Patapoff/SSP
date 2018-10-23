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
	
		if sudo groupadd $nomeGrupo
		then
			echo "Grupo chamado $nomeGrupo criado com sucesso!" 
		else
			echo "O programa deu erro!" 
		fi
	fi
	echo
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
	echo
	if sudo groupmod -n $nomeGrupoNovo $nomeGrupoAntigo
	then	
		echo "Grupo chamado $nomeGrupoAntigo renomeado com sucesso! Seu novo nome é $nomeGrupoNovo" 
	else
		echo "O programa deu erro!"
	fi
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
	if sudo adduser $nomeUser
	then
		echo "Usuário chamado $nomeUser criado com sucesso!" 
	else
		echo "O programa deu erro!" 			
	fi
	fi
	#considerar utilizar adduser
	echo
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

se

modificarDono()
{
clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo -n "Você está no seguinte diretório:"
	pwd
	echo
	echo "Ele contem os seguintes arquivos e diretórios: "
	echo
	ls
	echo	
	echo
	echo -n "Qual o nome da pasta ou diretório que você deseja mudar? "

	read nomePastaDir

	if [ -d $nomePastaDir ] && [ ! -z $nomePastaDir ]
	then
		echo -n "Quem será o novo dono? "
		read novoDono
		if sudo chown $novoDono $nomePastaDir
		then
			echo "Dono deste diretório foi alterado com sucesso!"
			echo
			echo
			echo "Pressione qualquer botão para continuar!"
			read
			permissoes
		else
			echo "Dono inexistente!"; echo; echo; echo "Pressione qualquer botão para continuar!"; read; permissoes
		fi
	else
		echo 
	fi

	if [ -f $nomePastaDir ] && [ ! -z $nomePastaDir ]
	then
		echo -n "Quem será o novo dono? "
		read novoDono
		if sudo chown $novoDono $nomePastaDir
		then
			echo "Dono deste arquivo foi alterado com sucesso!"
			echo
			echo
			echo "Pressione qualquer botão para continuar!"
			read
			permissoes
		else
			echo "Dono inexistente!"; echo; echo; echo "Pressione qualquer botão para continuar!"; read; permissoes	
		fi
	else
		echo
	fi

	echo "Diretório/Arquivo não encontrado!"
	echo
	echo
	echo "Pressione qualquer botão para continuar!"
	read
	permissoes

	
}

modificarGrupoDono()
{
clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo -n "Você está no seguinte diretório:"
	pwd
	echo
	echo "Ele contém os seguintes arquivos e diretórios: "
	echo
	ls
	echo	
	echo
	echo -n "Qual o nome da pasta ou diretório que você deseja mudar? "

	read nomePastaDir

	if [ -d $nomePastaDir ] && [ ! -z $nomePastaDir ]
	then
		echo -n "Quem será o novo grupo dono? "
		read grupoDonoNovo
		if sudo chgrp $grupoDonoNovo $nomePastaDir
		then
			echo "Grono deste diretório foi alterado com sucesso!"
			echo
			echo
			echo "Pressione qualquer botão para continuar!"
			read
			permissoes
		else
			echo "Grupo dono inexistente!"; echo; echo; echo "Pressione qualquer botão para continuar!"; read; permissoes
		fi
	else
		echo 
	fi

	if [ -f $nomePastaDir ] && [ ! -z $nomePastaDir ]
	then
		echo -n "Quem será o novo dono? "
		read grupoDonoNovo
		if sudo chown $grupoDonoNovo $nomePastaDir
		then
			echo "Grupo dono deste arquivo foi alterado com sucesso!"
			echo
			echo
			echo "Pressione qualquer botão para continuar!"
			read
			permissoes
		else
			echo "Grupo dono inexistente!"; echo; echo; echo "Pressione qualquer botão para continuar!"; read; permissoes	
		fi
	else
		echo
	fi

	echo "Diretório/Arquivo não encontrado!"
	echo
	echo
	echo "Pressione qualquer botão para continuar!"
	read
	permissoes
}

modificarPermissoes()
{
clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo -n "Você está no seguinte diretório:"
	pwd
	echo
	echo "Ele contém os seguintes arquivos e diretórios: "
	echo
	ls
	echo	
	echo
	echo -n "Qual o nome da pasta ou diretório que você deseja alterar as permissões? "

	read nomePastaDir

	if [ -d $nomePastaDir ] && [ ! -z $nomePastaDir ]
	then		
		clear
		echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
		echo "====================================================================="
		echo
		echo "a) Modificar permissões do dono."
		echo "b) Modificar permissões de grupo."
		echo "c) Modificar permissões de outros."
		echo "d) Voltar"
		echo "e) Sair"
		echo
		echo -n "Qual a opção desejada? "
	
		read opcaoPermissoes
		case $opcaoPermissoes in
			a) permissoesDono ;;
			b) permissoesGrupo ;;
			c) permissoesOutros ;;
			d) permissoes ;;
			e) exit ;;
			*) "Opção desconhecida." ; echo ; modificarPermissoes ;;
		esac 
	fi

	if [ -f $nomePastaDir ] && [ ! -z $nomePastaDir ]
	then
		clear
		echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
		echo "====================================================================="
		echo
		echo "a) Modificar permissões do dono."
		echo "b) Modificar permissões de grupo."
		echo "c) Modificar permissões de outros."
		echo "d) Voltar"
		echo "e) Sair"
		echo
		echo -n "Qual a opção desejada? "
	
		read opcaoPermissoes
		case $opcaoPermissoes in
			a) permissoesDono ;;
			b) permissoesGrupo ;;
			c) permissoesOutros ;;
			d) permissoes ;;
			e) exit ;;
			*) "Opção desconhecida." ; echo ; modificarPermissoes ;;
		esac 
	fi	
	fi

	echo "Diretório/Arquivo não encontrado!"
	echo
	echo
	echo "Pressione qualquer botão para continuar!"
	read
	modificarPermissoes
}

permissoesDono()
{
clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo
	echo "Quais permissões o dono possuirá?"
	echo
	echo "a) Nenhuma permissão."
	echo "b) Execução."
	echo "c) Escrita."
	echo "d) Leitura."
	echo "e) Escrita e execução."
	echo "f) Leitura e execução."
	echo "g) Leitura e escrita."
	echo "h) Leitura e escrita e execução."
	echo "i) Voltar."
	echo "j) Sair."
	echo
	echo -n "Qual a opção desejada? "

	read opcaoPermissoes
	
	case $opcaoPermissoes in
		a) chmod u-rwx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		b) chmod u+x $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		c) chmod u+w $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		d) chmod u+r $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		e) chmod u+wx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		f) chmod u+rx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		g) chmod u+rw $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		h) chmod u+rwx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		i) modificarPermissoes ;;
		j) exit ;;
		*) "Opção desconhecida." ; echo ; permissoesDono ;;
	esac
}

permissoesGrupo()
{
clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo
	echo "Quais permissões os grupos possuirão?"
	echo
	echo "a) Nenhuma permissão."
	echo "b) Execução."
	echo "c) Escrita."
	echo "d) Leitura."
	echo "e) Escrita e execução."
	echo "f) Leitura e execução."
	echo "g) Leitura e escrita."
	echo "h) Leitura e escrita e execução."
	echo "i) Voltar."
	echo "j) Sair."
	echo
	echo -n "Qual a opção desejada? "

	read opcaoPermissoes
	
	case $opcaoPermissoes in
		a) chmod g-rwx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		b) chmod g+x $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		c) chmod g+w $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		d) chmod g+r $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		e) chmod g+wx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		f) chmod g+rx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		g) chmod g+rw $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		h) chmod g+rwx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		i) modificarPermissoes ;;
		j) exit ;;
		*) "Opção desconhecida." ; echo ; permissoesGrupo ;;
	esac
}

permissoesOutros()
{
clear
	echo "Projeto de Sistemas Operacionais por João Henri e Nicholas Patapoff"
	echo "====================================================================="
	echo
	echo
	echo "Quais permissões os outros possuirão?"
	echo
	echo "a) Nenhuma permissão."
	echo "b) Execução."
	echo "c) Escrita."
	echo "d) Leitura."
	echo "e) Escrita e execução."
	echo "f) Leitura e execução."
	echo "g) Leitura e escrita."
	echo "h) Leitura e escrita e execução."
	echo "i) Voltar."
	echo "j) Sair."
	echo
	echo -n "Qual a opção desejada? "

	read opcaoPermissoes
	
	case $opcaoPermissoes in
		a) chmod o-rwx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		b) chmod o+x $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		c) chmod o+w $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		d) chmod o+r $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		e) chmod o+wx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		f) chmod o+rx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		g) chmod o+rw $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		h) chmod o+rwx $nomePastaDir ; echo "Permissões alteradas com sucesso!" ; echo ; echo ; echo "Pressione qualquer botão para continuar!" ; echo ; read ; permissoes ;;
		i) modificarPermissoes ;;
		j) exit ;;
		*) "Opção desconhecida." ; echo ; permissoesOutros ;;
	esac
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