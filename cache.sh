clear
echo "Sincronizando os arquivos da memória RAM para o disco rígido."
sync
sleep 3
echo "Limpando o Cache da memória RAM."
echo 3 > /proc/sys/vm/drop_caches
sleep 2.5
echo "Tarefa concluida com Sucesso!"
sleep 4
exit 1
