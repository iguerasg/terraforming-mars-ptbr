# Terraforming Mars PT-BR Runtime v1.0 TESTE

Tradução não oficial em português do Brasil para **Terraforming Mars Digital**.

Esta versão usa um sistema runtime com BepInEx.
Ela **não modifica o arquivo `data.unity3d`** do jogo.

## O que muda nesta versão?

A tradução é carregada quando o jogo abre.

Em vez de substituir arquivos grandes do jogo, o mod copia arquivos pequenos para a pasta do Terraforming Mars e aplica os textos em memória.

Vantagens:

* não altera o `data.unity3d`;
* instalação mais leve;
* mais resistente a atualizações do jogo;
* mais fácil de manter em futuras versões;
* se o jogo for atualizado, a tradução pode continuar funcionando se as chaves dos textos forem mantidas.

## Compatibilidade

Testado em:

* Steam no Linux usando Proton.

Ainda precisa de teste em:

* Windows (Steam e Epic Games Launcher);
* outras instalações do jogo.

## Instalação no Windows

1. Extraia o ZIP.
2. Abra a pasta extraída.
3. Execute o arquivo `instalar_windows.bat`.

O instalador procura o jogo nas bibliotecas Steam e nos manifests de instalação da Epic Games Launcher. Se não encontrar automaticamente, informe a pasta onde está `TerraformingMars.exe`:

```powershell
powershell -ExecutionPolicy Bypass -File .\instalar_windows.ps1 -Caminho "C:\caminho\para\Terraforming Mars"
```

4. Abra o Terraforming Mars normalmente pelo launcher em que ele está instalado.

## Instalação no Linux / Proton

1. Extraia o ZIP.
2. Abra um terminal dentro da pasta extraída.
3. Rode:

```bash
bash instalar_linux_proton.sh
```

4. O instalador vai copiar os arquivos da tradução para a pasta do jogo.

5. Na Steam, abra:

```text
Terraforming Mars > Propriedades > Geral > Opções de inicialização
```

6. Cole esta linha:

```bash
WINEDLLOVERRIDES="winhttp=n,b" %command%
```

7. Abra o jogo normalmente pela Steam.

## Como saber se funcionou?

O jogo deve abrir em português mantendo o idioma do jogo como **English**.

No Linux/Proton, se a tradução não carregar, confira se a opção de inicialização da Steam foi colocada corretamente:

```bash
WINEDLLOVERRIDES="winhttp=n,b" %command%
```

## Arquivos instalados

O instalador copia:

```text
BepInEx/
winhttp.dll
doorstop_config.ini
.doorstop_version
TMPTBR.Plugin.dll
ptbr_i2_master.tsv
ptbr_asmodee_master.tsv
```

## Observações

Esta é uma versão de teste do novo instalador runtime.

A versão antiga com patch `.xdelta` ainda pode ser mantida como alternativa estável até esta versão ser testada em mais computadores.

## Remover a tradução

Para remover manualmente, apague da pasta do jogo:

```text
BepInEx/
winhttp.dll
doorstop_config.ini
.doorstop_version
```

No Linux/Proton, remova também a opção de inicialização da Steam:

```bash
WINEDLLOVERRIDES="winhttp=n,b" %command%
```

## Créditos

Tradução PT-BR não oficial para Terraforming Mars Digital.

Este projeto não é afiliado oficialmente à Steam, Asmodee, Twin Sails Interactive, Luckyhammers ou aos detentores dos direitos de Terraforming Mars.
