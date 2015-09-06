#!/bin/sh
escolha="S"
if [ $USER != root ]; then
	sudo ./config_ubuntu.sh
	clear
	echo "			Programa finalizado com Sucesso!"
	sleep 3
	reset
	exit 1
else
	chmod +x *.sh
	while [ 1 ]; do
		reset
		echo "			Script de Configuração Inicial Ubuntu\n"
		echo "	1 - Adicionar uma partição NTFS ao fstab."
		echo "	2 - Adicionar um usuário ao \"/etc/sudoers\"."
		echo "	3 - Atualizar os repositórios de software.(apt-get update)"
		echo "	4 - Atualizar os programas instalados.(apt-get upgrade)"
		echo "	5 - Instalar PlayOnLinux e Wine atualizados."
		echo "	6 - Ativar os Ícones de Menus."
		echo "	7 - Instalar Samba para redes Windows."
		echo "	8 - Limpeza de pacotes não utilizados."
		echo "	9 - Criar aliases."
		echo "	q - Limpar memória Cache."
		echo "	w - Configurar atualização atutomática de Segurança."
		echo "	p - Adicionar PPA's."
		echo "	l - Quantas Linhas possui todo este script."
		echo "	777 - Executar Todas As Opções. Menos a Limpeza dos pacotes."
		echo "	x - Sair.\n"
		echo -n "	Escolha: "
		read escolha
		if [ $escolha = 1 ]; then
			./fstab.sh
		elif [ $escolha = 2 ]; then
			./sudoers.sh
		elif [ $escolha = 3 ]; then
			./update.sh
		elif [ $escolha = 4 ]; then
			apt-get upgrade
		elif [ $escolha = 5 ]; then
			./playonlinux.sh
		elif [ $escolha = 6 ]; then
			./icones_menu.sh
		elif [ $escolha = 7 ]; then
			./samba.sh
		elif [ $escolha = 8 ]; then
			./limpeza.sh
		elif [ $escolha = 9 ]; then
			./aliases.sh
		elif [ $escolha = q ]; then
			./cache.sh
		elif [ $escolha = w ]; then
			./autoupdate.sh
		elif [ $escolha = p ]; then
			./ppas.sh
		elif [ $escolha = l ]; then
			./linhas.sh
		elif [ $escolha = 777 ]; then
			./tudo.sh
		elif [ $escolha = x ]; then
			exit 1
		else
			clear
			echo "Opção indisponivel."
			sleep 4
		fi
	done
fi
#		elif [ $escolha = x ]; then
#			
exit 0
