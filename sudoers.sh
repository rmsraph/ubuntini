desejo="N"
grupo="padrao"
cat /etc/sudoers
echo "Você deseja adicionar alguma configuração à este arquivo?s/[N]"
read desejo
if [ $desejo = s -o $desejo = S ]; then
	echo "Você deseja logar como root através de \"sudo su\" sem senha?"
	read desejo
	if [ $desejo = s -o $desejo = S ]; then
		if [ ! -e /etc/sudoers.original ]; then
			cp /etc/sudoers /etc/sudoers.original
		fi
		echo "Qual grupo voce deseja adicionar?"
		read grupo
		echo "#Adicionado pelo arquivo de configuração automática do Ubuntu. Por Raphael Santos\n" >> /etc/sudoers
		echo "%$grupo ALL=NOPASSWD: ALL\n" >> /etc/sudoers
	else
		echo "Qual grupo voce deseja adicionar?"
		read grupo
		echo "%$grupo ALL=(ALL) ALL\n" >> /etc/sudoers
	fi
elif [ $desejo = N -o $desejo = n ]; then
	echo "Você quer voltar ao estado anterior do arquivo?s/[N]"
	read escolha
	if [ $? = s -o $? = S ]; then
		cp /etc/sudoers.original /etc/sudoers
	else
		echo "Nenhuma alteração foi feita."
	fi
fi
exit 0
	
