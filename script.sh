#!/bin/sh

#Rotação de Arquivos de Log

#Variaveis
DIR= Insira o diretório dos seus arquivos de log

#Lista os arquivos com extensão .log e salva no arquivo logs.txt
cd $DIR
ls *.log > logs.txt

# Execução de um for para exportar os nomes dos arquivos para a linha de comando do gzip para que seja feito a compressão dos arquivos.
for i in $(awk -F: '{print $1}' logs.txt) 

do

gzip -c $i > $i."$(date +%d%m%Y)".gz

done    

# Executa uma busca e deleta os arquivos com mais de um dia
find $DIR/*.gz -mtime +2 -exec rm -f {} \;
