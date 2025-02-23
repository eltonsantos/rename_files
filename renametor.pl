#!/usr/bin/perl

# Script para renomear arquivos em massa
# Autor: Elton Santos
# Data: 2025-23-02

use strict;
use warnings;
use File::Copy;

# Pasta onde estão os arquivos
my $dir = "/home/elton/dev/perl_projects/rename_files";

# Abrir a pasta
opendir(my $dh, $dir) or die "Não foi possível abrir a pasta $dir: $!";

# Ler os arquivos da pasta
while (my $file = readdir($dh)) {
    # Pular "." e ".."
    next if ($file =~ /^\.+$/);

    # Renomear arquivos para letras minúsculas e substituir espaços por "_"
    my $novo_nome = lc($file);         # Converter para minúsculas
    $novo_nome =~ s/\s+/_/g;           # Substituir espaços por "_"

    if ($file ne $novo_nome) {
        rename("$dir/$file", "$dir/$novo_nome") or warn "Erro ao renomear $file: $!";
        print "Renomeado: $file -> $novo_nome\n";
    }
}

closedir($dh);