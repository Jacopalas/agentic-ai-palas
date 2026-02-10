#!/usr/bin/env python3
# /// script
# requires-python = ">=3.11"
# dependencies = []
# ///
"""
fix_md_extra.py — Correcciones de markdown que markdownlint no puede auto-fixear.

Arregla:
- MD040: Code blocks sin lenguaje especificado → añade 'text'
- MD025: Múltiples encabezados H1 → degrada los duplicados a H2

Uso:
    python fix_md_extra.py <archivo.md>
    python fix_md_extra.py <carpeta>  # procesa todos los .md recursivamente
"""

import re
import sys
from pathlib import Path


def fix_code_blocks(content: str) -> str:
    """
    MD040: Añade 'text' como lenguaje por defecto a code blocks sin especificar.
    
    Antes:  ```
    Después: ```text
    """
    return re.sub(r'^```\s*$', '```text', content, flags=re.MULTILINE)


def fix_multiple_h1(content: str) -> str:
    """
    MD025: Degrada encabezados H1 duplicados a H2.
    
    El primer H1 se mantiene, los siguientes se convierten en H2.
    Solo afecta a líneas que empiezan con '# ' (ATX style).
    """
    lines = content.split('\n')
    found_h1 = False
    
    for i, line in enumerate(lines):
        # Detecta H1: empieza con '# ' pero no con '## '
        if line.startswith('# ') and not line.startswith('## '):
            if found_h1:
                # Ya encontramos un H1 antes, degradar este a H2
                lines[i] = '#' + line
            else:
                # Primer H1, lo mantenemos
                found_h1 = True
    
    return '\n'.join(lines)


def process_file(filepath: Path) -> bool:
    """
    Procesa un archivo markdown aplicando todas las correcciones.
    
    Retorna True si el archivo fue modificado.
    """
    original = filepath.read_text(encoding='utf-8')
    
    # Aplicar correcciones en orden
    content = original
    content = fix_code_blocks(content)
    content = fix_multiple_h1(content)
    
    # Solo escribir si hubo cambios
    if content != original:
        filepath.write_text(content, encoding='utf-8')
        return True
    
    return False


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    
    target = Path(sys.argv[1])
    
    # Excluir .agent/ siempre (convención del skill)
    def should_skip(path: Path) -> bool:
        return '.agent' in path.parts
    
    if target.is_file():
        # Archivo único
        if should_skip(target):
            print(f"Saltando {target} (directorio .agent/)")
            sys.exit(0)
        
        if process_file(target):
            print(f"Corregido: {target}")
        else:
            print(f"Sin cambios: {target}")
    
    elif target.is_dir():
        # Carpeta: procesar todos los .md recursivamente
        modified = 0
        skipped = 0
        
        for md_file in target.rglob('*.md'):
            if should_skip(md_file):
                skipped += 1
                continue
            
            if process_file(md_file):
                print(f"Corregido: {md_file}")
                modified += 1
        
        print(f"\nResumen: {modified} archivo(s) modificado(s), {skipped} saltado(s)")
    
    else:
        print(f"Error: {target} no existe")
        sys.exit(1)


if __name__ == '__main__':
    main()
