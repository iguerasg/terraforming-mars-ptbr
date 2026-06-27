# Terraforming Mars PT-BR

Tradução brasileira não oficial para **Terraforming Mars Digital**.

Esta versão usa um sistema runtime com **BepInEx**.  
Ela **não modifica o arquivo `data.unity3d`** do jogo.

Depois de instalar, mantenha o idioma do jogo como **English**.  
Mesmo marcado como English, o jogo ficará em Português do Brasil.

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

Observação: alguns botões pequenos do login, como `Cancel` e `Continue`, ainda podem aparecer em inglês.

---

## Download

Baixe a versão mais recente pela aba **Releases** deste repositório.

Arquivo recomendado:

`Terraforming_Mars_PTBR_Runtime_v1.0_BETA3.zip`

---

## Como instalar

### Windows

1. Baixe o ZIP.
2. Extraia o arquivo.
3. Abra a pasta extraída.
4. Execute:

`instalar_windows.bat`

5. Abra o Terraforming Mars pela Steam.
6. Deixe o idioma do jogo como **English**.

Pronto. O jogo deverá aparecer em Português do Brasil.

---

### Linux / Steam Proton

1. Baixe o ZIP.
2. Extraia o arquivo.
3. Abra um terminal dentro da pasta extraída.
4. Rode:

`bash instalar_linux_proton.sh`

5. Na Steam, abra:

`Terraforming Mars > Propriedades > Geral > Opções de inicialização`

6. Cole esta linha:

`WINEDLLOVERRIDES="winhttp=n,b" %command%`

7. Abra o jogo pela Steam.
8. Deixe o idioma como **English**.

---

## Como remover

### Windows e Linux

Apague estes arquivos/pastas da pasta do jogo:

- `BepInEx/`
- `winhttp.dll`
- `doorstop_config.ini`
- `.doorstop_version`

No Linux/Proton, remova também a opção de inicialização da Steam:

`WINEDLLOVERRIDES="winhttp=n,b" %command%`

---

## Sobre antivírus / Windows Defender

Esta tradução usa **BepInEx**, uma ferramenta comum para mods de jogos Unity.

Por isso, alguns antivírus podem alertar sobre arquivos como:

- `winhttp.dll`
- `TMPTBR.Plugin.dll`

Isso acontece porque o BepInEx carrega o mod dentro do jogo.

Se receber um alerta, baixe a tradução somente por este repositório oficial e confira o arquivo na aba **Releases**.

Não recomendamos desativar o antivírus do sistema.

---

## Informações técnicas

A versão runtime:

- não altera `data.unity3d`;
- não usa patch `.xdelta`;
- carrega a tradução por arquivos `.tsv`;
- aplica os textos em memória quando o jogo abre;
- mantém o jogo original da Steam intacto.

Arquivos principais:

- `TMPTBR.Plugin.dll`
- `ptbr_i2_master.tsv`
- `ptbr_asmodee_master.tsv`

---

## Status

Versão atual:

**v1.0 BETA3**

Testado em:

- Steam Windows
- Steam Linux usando Proton

Pendente:

- teste na versão Amazon Games;
- revisão de alguns botões pequenos do login online.

---

## Aviso

Esta é uma tradução feita por fã.

Não é uma tradução oficial.

Os direitos de Terraforming Mars Digital pertencem aos seus respectivos proprietários.
