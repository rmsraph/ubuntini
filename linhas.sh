clear
echo -n "O script todo possui "
wc *.sh -l | grep total > linhas.txt | cat linhas.txt ; echo -n " de linhas. Obrigado!\n"
sleep 5
