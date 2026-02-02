#!/usr/bin/env bash
#
# Palas Marketplace - Configuración Mínima de Proyecto
# Crea un .claude/CLAUDE.md básico para proyectos sin uno
#
# Uso:
#   curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/starter/minimal-install.sh | bash
#

set -e

# Colores para salida
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sin color

echo ""
echo "Palas Marketplace - Configuración Mínima de Proyecto"
echo "====================================================="
echo ""

# Verificar si existe el directorio .claude
if [ -d ".claude" ]; then
    echo -e "${YELLOW}Aviso: El directorio .claude/ ya existe${NC}"

    if [ -f ".claude/CLAUDE.md" ]; then
        echo -e "${YELLOW}CLAUDE.md ya existe. Omitiendo para evitar sobrescribirlo.${NC}"
        echo ""
        echo "Para usar los plugins de Palas, ejecuta en Claude Code:"
        echo "  /plugin marketplace add Jacopalas/agentic-ai-palas"
        echo "  /plugin install palas-basic@agentic-ai-palas"
        echo "  /plugin install palas-security@agentic-ai-palas"
        echo "  /plugin install palas-git@agentic-ai-palas"
        exit 0
    fi
else
    mkdir -p .claude
    echo -e "${GREEN}Directorio .claude/ creado${NC}"
fi

# Crear CLAUDE.md mínimo
cat > .claude/CLAUDE.md << 'EOF'
# Instrucciones del Proyecto

## Habilidades Disponibles (via Palas Marketplace)

Instala los plugins de Palas para obtener estas habilidades:

```shell
/plugin marketplace add Jacopalas/agentic-ai-palas
/plugin install palas-basic@agentic-ai-palas
/plugin install palas-security@agentic-ai-palas
/plugin install palas-git@agentic-ai-palas
```

### Habilidades

- `/palas-git:commit` — Crear commits de git bien estructurados con formato convencional
- `/palas-basic:fixing-markdown` — Validar y corregir formato de markdown
- `/palas-security:security-scan` — Escanear secretos expuestos y vulnerabilidades
- `/palas-basic:removing-notebooklm` — Eliminar marcas de agua de PDFs e imágenes

## Notas del Proyecto

<!-- Añade aquí las instrucciones de tu proyecto -->
<!-- Ejemplos: -->
<!-- - El proyecto usa Python 3.11 con uv para gestión de dependencias -->
<!-- - Ejecutar tests con: pytest tests/ -->
<!-- - Compilar con: npm run build -->

EOF

echo -e "${GREEN}Archivo .claude/CLAUDE.md creado${NC}"
echo ""
echo "Siguientes pasos:"
echo "  1. Abre Claude Code en este directorio"
echo "  2. Ejecuta: /plugin marketplace add Jacopalas/agentic-ai-palas"
echo "  3. Instala los plugins que necesites:"
echo "     /plugin install palas-basic@agentic-ai-palas"
echo "     /plugin install palas-security@agentic-ai-palas"
echo "     /plugin install palas-git@agentic-ai-palas"
echo "  4. Edita .claude/CLAUDE.md para añadir las instrucciones de tu proyecto"
echo ""
echo -e "${GREEN}¡Listo!${NC}"
