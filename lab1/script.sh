#!/usr/bin/env bash

mkdir lab0
cd lab0
# Folders
mkdir -p ariados/exploud
mkdir -p ariados/makuhita
mkdir -p ariados/lucario
mkdir -p carracosta/buizel
mkdir -p carracosta/baltoy
mkdir -p carracosta/furret
mkdir -p magmortar/cyndaquil
mkdir -p magmortar/quagsire

# Files in lab0
touch feebas
echo "Живет = Freshwater"  >> feebas
touch kabutops
echo "Живет = Cave Ocean" >> kabutops
touch servine
echo "Способности = Leer Vine Whip Wrap Growth Leaf Tornado Leech Seed Mega Drain Slam Leaf Blade Coil Giga Drain Wring Out Gastro Acid Leaf Storm" >> servine
# Files in ariados 
cd ariados
touch vanillish
echo "Живет = Cave Taiga Tundra" >> vanillish
touch caterpie
echo "Живет = Forest" >> caterpie
cd ..
# Files in carracosta 
cd carracosta
touch geodude 
echo "Способности = Mountain Peak Landslide Sturdy Rock Head" >> geodude
touch swanna
echo "Тип покемона = WATER FLYING" >> swanna 
touch pidgeotto
echo "Возможности = Overland=6 Surface=1 Sky=10 Jump=3 Power2=0 Intelligence=3" >>pidgeotto
cd ..
# Files in magmortar 
cd magmortar
touch silcoon
echo "satk=silcoon sdef=3 spd=2" >> silcoon
touch hydreigon
echo "Тип покемона = DARK DRAGON" >> hydreigon
touch geodude
echo "weigth=44.1 height=16.0 atk=8 def=10" >> geodude
cd ..
# Permissions 
chmod 307 ariados
cd ariados
chmod u=rx g=rx o=x exploud
chmod 444 vanillish  
chmod 357 makuhita
chmod 400 caterpie
chmod 500 lucario
cd ..

chmod 511 carracosta 
chmod 666 carracosta/geodude
chmod u=wx,g=wx,o=rwx carracosta/buizel
chmod 664 carracosta/swanna
chmod 551 carracosta/baltoy
chmod 404 carracosta/pidgeotto
chmod 571 carracosta/furret
chmod u=,g=rw,o=r feebas
chmod 444 kabutops
chmod 770 magmortar
chmod 600 magmortar/silcoon
chmod 500 magmortar/cyndaquil
chmod 660 magmortar/hydreigon
chmod 770 magmortar/quagsire
chmod u=rw,g=rw,o=r magmortar/geodude
chmod 666 servine







cd ..
# скопировать содержимое файла kabutops в новый файл lab0/carracosta/geodudekabutops
cp lab0/kabutops lab0/carracosta/geodudekabutops
# cоздать жесткую ссылку для файла servine с именем lab0/carracosta/pidgeottoservine
ln lab0/servine lab0/carracosta/pidgeottoservine
# cоздать символическую ссылку для файла feebas с именем lab0/magmortar/geodudefeebas
ln -s ../feebas lab0/magmortar/geodudefeebas
# скопировать файл feebas в директорию lab0/magmortar/cyndaquil
cp lab0/feebas lab0/magmortar/cyndaquil
# объединить содержимое файлов lab0/carracosta/swanna, lab0/carracosta/geodude, в новый файл lab0/feebas_27
cat lab0/carracosta/swanna lab0/carracosta/geodude > lab0/feebas_27
# скопировать рекурсивно директорию carracosta в директорию lab0/carracosta/buizel
cp -r lab0/carracosta lab0/carracosta/buizel
# создать символическую ссылку c именем Copy_23 на директорию magmortar в каталоге lab0
ln -s magmortar lab0/Copy_23 



# Рекурсивно подсчитать количество строк содержимого файлов из директории lab0, имя которых начинается на 'g', отсортировать вывод по уменьшению количества, ошибки доступа не подавлять и не перенаправлять
find lab0 -type f -name "g*" -exec wc -l {} \; | sort -nr
# Вывести рекурсивно список имен и атрибутов файлов в директории magmortar, список отсортировать по возрастанию даты доступа к файлу, ошибки доступа не подавлять и не перенаправлять
ls -luRrt lab0/magmortar
# Вывести содержимое файлов в директории magmortar, оставить только строки, заканчивающиеся на 'm', добавить вывод ошибок доступа в стандартный поток вывода
find lab0/magmortar -type f -exec cat {} \; 2>&1 | grep "m$" 
# Вывести список имен и атрибутов файлов в директории ariados, список отсортировать по возрастанию даты модификации файла, ошибки доступа не подавлять и не перенаправлять
ls -ltr lab0/ariados
# Вывести рекурсивно список имен и атрибутов файлов в директории lab0, заканчивающихся на символ 'n', список отсортировать по имени a->z, подавить вывод ошибок доступа
find lab0 -type f -name "*n" -exec ls -l {} \; 2>/dev/null |sort -k9
# Рекурсивно вывести содержимое файлов из директории lab0, имя которых заканчивается на 'o', строки отсортировать по имени z->a, ошибки доступа перенаправить в файл в директории /tmp
find lab0 -type f -name "*o" -exec cat {} \; 2>/tmp/errors | sort -r 

# Удалить файл kabutops
rm lab0/kabutops
# Удалить файл lab0/carracosta/pidgeotto
rm lab0/carracosta/pidgeotto
# удалить символические ссылки lab0/magmortar/geodudefeeb*
rm lab0/magmortar/geodudefeeb*
# удалить жесткие ссылки lab0/carracosta/pidgeottoservi*
rm lab0/carracosta/pidgeottoservi*
# Удалить директорию magmortar
rm -r lab0/magmortar
# Удалить директорию lab0/ariados/makuhita
rm -r lab0/ariados/makuhita