clear
echo "Ativando Ícones de Menus."
gconftool-2 --type Boolean --set /desktop/gnome/interface/menus_have_icons True
sleep 3
echo "Ícones Ativados."
sleep 4
exit 1
