# Terraforming Mars PT-BR

Tradução brasileira não oficial para **Terraforming Mars Digital**.

Esta tradução coloca o jogo em **Português do Brasil** usando o idioma **English** do jogo.

Depois de instalar, abra o jogo e selecione o idioma:

    English

Mesmo estando marcado como English, o jogo ficará em português.

---

## O que está traduzido?

- Menus
- Interface
- Cartas
- Corporações
- Projetos-padrão
- Marcos e prêmios
- Tabuleiro
- Logs
- Tutorial
- Regras
- Compêndio
- Conquistas
- Login online / AsmoConnect
- Perfil online
- Community Hub

---

## Download

Baixe a tradução pela aba **Releases** deste repositório.

Arquivo da versão 1.0:

    Terraforming_Mars_PTBR_v1.0_publico.zip

---

# Como instalar

## Windows

1. Baixe o arquivo:

       Terraforming_Mars_PTBR_v1.0_publico.zip

2. Extraia o arquivo ZIP.

3. Abra a pasta extraída.

4. Clique com o botão direito dentro da pasta e escolha:

       Abrir no Terminal

   ou:

       Abrir PowerShell aqui

5. Digite este comando:

       Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

6. Depois digite:

       .\instalar_windows.ps1

7. Aguarde a instalação terminar.

8. Abra o jogo.

9. Vá nas opções de idioma e escolha:

       English

Pronto. O jogo deverá aparecer em Português do Brasil.

### Observação para Windows

Esta tradução não usa arquivo `.exe`.

O instalador do Windows é um arquivo PowerShell:

    instalar_windows.ps1

Isso foi feito para deixar a instalação mais transparente e evitar executáveis desconhecidos.

---

## Linux

1. Baixe o arquivo:

       Terraforming_Mars_PTBR_v1.0_publico.zip

2. Extraia o arquivo ZIP.

3. Instale o xdelta3:

       sudo apt install xdelta3

4. Abra o terminal dentro da pasta extraída.

5. Rode:

       bash instalar_linux.sh

6. Abra o jogo.

7. Selecione o idioma:

       English

Pronto. O jogo deverá aparecer em Português do Brasil.

---

## macOS

1. Baixe o arquivo:

       Terraforming_Mars_PTBR_v1.0_publico.zip

2. Extraia o arquivo ZIP.

3. Instale o xdelta pelo Homebrew:

       brew install xdelta

4. Abra o Terminal dentro da pasta extraída.

5. Rode:

       bash instalar_macos.sh

6. Abra o jogo.

7. Selecione o idioma:

       English

Pronto. O jogo deverá aparecer em Português do Brasil.

---

# Como restaurar o jogo original

O instalador cria um backup automático antes de modificar o jogo.

Se quiser voltar ao original, você também pode usar a própria Steam:

1. Clique com o botão direito no jogo na Steam.
2. Vá em **Propriedades**.
3. Vá em **Arquivos instalados**.
4. Clique em **Verificar integridade dos arquivos**.

A Steam irá restaurar os arquivos originais do jogo.

---

# Problemas conhecidos

Se a Steam atualizar o jogo, a tradução pode parar de instalar.

Isso acontece porque o instalador verifica se o arquivo original é compatível antes de modificar o jogo.

Se o jogo atualizar, pode ser necessário lançar uma nova versão da tradução.

---

# Informações técnicas

Hash SHA256 do arquivo ZIP da v1.0:

    0d2e904fc6d52d02650b988703e35fae313d315a6077cad09c6da1e366f4c388

A tradução usa um patch `.xdelta` aplicado sobre o arquivo original do jogo.

O arquivo original `data.unity3d` não é distribuído neste pacote.

---

# Aviso

Esta é uma tradução feita por fã.

Não é uma tradução oficial.

Os direitos de **Terraforming Mars Digital** pertencem aos seus respectivos proprietários.
