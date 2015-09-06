device="sda1"
pasta="nome"
fstabdesejo="s"
cp /etc/fstab /etc/fstab.backup
fdisk -l
echo "\nQual partição vc deseja adicionar a fstab?(sda1) "
echo -n "Dispositivo: "
read device
if [ $device = "orig" ]; then
	cp /etc/fstab.original /etc/fstab
	echo "Retornado ao original com sucesso!"
fi
echo "\nQual o nome do diretório vc deseja montar a partição? "
while [ 1 ]; do
	echo -n "Diretório: "
	read pasta
	if [ $pasta = "none" ]; then
		exit 0
	fi
	if [ -e /media/$pasta ]; then
		echo "\nA Pasta já existe, dê outro nome."
	else
		break
	fi
done
if [ $pasta = "none" ]; then
	exit 0
fi
if [ ! -e /etc/fstab.original ]; then
	cp /etc/fstab /etc/fstab.original
fi
echo "Partição NTFS adicionada pelo script config_ubuntu.sh"
echo "\n\n#Partição NTFS adicionada pelo script config_ubuntu.sh" >> /etc/fstab
echo "/dev/$device	/media/$pasta	ntfs-3g	async,atime,auto,rw,suid,dev,exec,user	0	0" >> /etc/fstab
cat /etc/fstab
echo "\nVocê deseja desfazer a alteração?"
echo -n "Escolha(S/n): "
read fstabdesejo
if [ $fstabdesejo = s -o $fstabdesejo = S ]; then
	cp /etc/fstab.backup /etc/fstab
	clear
	echo "			Alteração desfeita."
	sleep 4
	cat /etc/fstab
	sleep 4
elif [ ! -e /media/$pasta ]; then
	mkdir /media/$pasta
	chown raphael /media/$pasta
	chgrp raphael /media/$pasta
fi
mount -a
exit 0
