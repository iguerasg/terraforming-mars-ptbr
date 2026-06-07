# Terraforming Mars PT-BR

Tradução brasileira não oficial para **Terraforming Mars Digital**.

Esta tradução coloca o jogo em **Português do Brasil** usando o idioma **English** do jogo.

Depois de instalar, selecione **English** nas opções de idioma. Mesmo marcado como English, o jogo ficará em português.

## O que está traduzido

- Menus e interface
- Cartas, corporações e projetos
- Marcos, prêmios, tabuleiro e logs
- Tutorial, regras, compêndio e conquistas
- Login online, perfil online e Community Hub

## Download

Baixe pela aba **Releases** deste repositório.

Arquivo recomendado:

    Terraforming_Mars_PTBR_v1.0.1_publico.zip

## Instalação no Windows

1. Baixe o ZIP da tradução.
2. Extraia o ZIP.
3. Abra a pasta extraída.
4. Clique com o botão direito dentro da pasta e escolha **Abrir no Terminal** ou **Abrir PowerShell aqui**.
5. Rode:

       Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

6. Depois rode:

       .\instalar_windows.ps1

7. Abra o jogo e selecione o idioma **English**.

A versão 1.0.1 já inclui `xdelta3.exe`, então no Windows não é necessário instalar o xdelta3 separadamente.

## Instalação no Linux

1. Baixe e extraia o ZIP.
2. Instale o xdelta3.

Ubuntu, Linux Mint, Zorin OS, Debian e derivados:

       sudo apt install xdelta3

Fedora:

       sudo dnf install xdelta

Arch Linux e Manjaro:

       sudo pacman -S xdelta3

3. Abra o terminal dentro da pasta extraída.
4. Rode:

       bash instalar_linux.sh

5. Abra o jogo e selecione o idioma **English**.

## Instalação no macOS

1. Baixe e extraia o ZIP.
2. Instale o xdelta pelo Homebrew:

       brew install xdelta

3. Abra o Terminal dentro da pasta extraída.
4. Rode:

       bash instalar_macos.sh

5. Abra o jogo e selecione o idioma **English**.

## Como restaurar o jogo original

Pela Steam:

1. Clique com o botão direito no jogo.
2. Vá em **Propriedades**.
3. Vá em **Arquivos instalados**.
4. Clique em **Verificar integridade dos arquivos**.

A Steam irá restaurar os arquivos originais.

## Observações

- Esta é uma tradução feita por fã.
- Não é uma tradução oficial.
- O arquivo original `data.unity3d` não é distribuído.
- A tradução usa patch `.xdelta`.
- Se a Steam atualizar o jogo, pode ser necessário atualizar a tradução.
- Os direitos de **Terraforming Mars Digital** pertencem aos seus respectivos proprietários.

Fonte do xdelta3 incluído na versão Windows:

    https://github.com/jmacd/xdelta-gpl/releases
