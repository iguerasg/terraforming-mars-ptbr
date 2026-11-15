#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEFAULT_STEAM="$HOME/.steam/debian-installation/steamapps/common/Terraforming Mars"
ALT_STEAM="$HOME/.local/share/Steam/steamapps/common/Terraforming Mars"

echo "==============================================="
echo " Terraforming Mars PT-BR Runtime - Linux/Proton"
echo "==============================================="
echo ""

GAME_DIR=""

if [ "${1:-}" != "" ]; then
  GAME_DIR="$1"
elif [ -d "$DEFAULT_STEAM" ]; then
  GAME_DIR="$DEFAULT_STEAM"
elif [ -d "$ALT_STEAM" ]; then
  GAME_DIR="$ALT_STEAM"
else
  echo "Não encontrei automaticamente a pasta do jogo."
  echo ""
  echo "Use assim:"
  echo "bash instalar_linux_proton.sh \"/caminho/para/Terraforming Mars\""
  exit 1
fi

if [ ! -f "$GAME_DIR/TerraformingMars.exe" ]; then
  echo "Erro: TerraformingMars.exe não encontrado em:"
  echo "$GAME_DIR"
  echo ""
  echo "Informe a pasta correta do jogo."
  exit 1
fi

echo "Jogo encontrado:"
echo "$GAME_DIR"
echo ""

echo "Instalando arquivos da tradução..."

mkdir -p "$GAME_DIR/BepInEx/plugins"
mkdir -p "$GAME_DIR/BepInEx/config/TMPTBR"

cp -a "$SCRIPT_DIR/BepInEx/core" "$GAME_DIR/BepInEx/"
cp -a "$SCRIPT_DIR/BepInEx/patchers" "$GAME_DIR/BepInEx/"

cp -a "$SCRIPT_DIR/BepInEx/plugins/TMPTBR.Plugin.dll" "$GAME_DIR/BepInEx/plugins/"

cp -a "$SCRIPT_DIR/BepInEx/config/TMPTBR/ptbr_i2_master.tsv" "$GAME_DIR/BepInEx/config/TMPTBR/"
cp -a "$SCRIPT_DIR/BepInEx/config/TMPTBR/ptbr_asmodee_master.tsv" "$GAME_DIR/BepInEx/config/TMPTBR/"

cp -a "$SCRIPT_DIR/winhttp.dll" "$GAME_DIR/"
cp -a "$SCRIPT_DIR/doorstop_config.ini" "$GAME_DIR/"
cp -a "$SCRIPT_DIR/.doorstop_version" "$GAME_DIR/"

cat > "$SCRIPT_DIR/OPCAO_INICIALIZACAO_STEAM.txt" <<'STEAMOPT'
WINEDLLOVERRIDES="winhttp=n,b" %command%
STEAMOPT

echo ""
echo "==============================================="
echo " Arquivos instalados com sucesso!"
echo "==============================================="
echo ""
echo "IMPORTANTE PARA LINUX/PROTON:"
echo ""
echo "Na Steam, abra:"
echo "Terraforming Mars > Propriedades > Geral > Opções de inicialização"
echo ""
echo "Cole esta linha:"
echo ""
echo 'WINEDLLOVERRIDES="winhttp=n,b" %command%'
echo ""
echo "Também salvei essa linha em:"
echo "$SCRIPT_DIR/OPCAO_INICIALIZACAO_STEAM.txt"
echo ""
echo "Depois disso, abra o jogo normalmente pela Steam."