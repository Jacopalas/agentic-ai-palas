# Palas — Marketplace de Plugins para Claude Code

![Palas Overview](./infographic.svg)

## ¿Por qué Palas?

**Habilidades de IA para tu negocio, no solo para tu código.**

Varios plugins de Claude Code que une **productividad general y conocimiento especializado** para ayudar a particulares y PYMES a dar sus primeros pasos en la IA.

Mientras la mayoría de plugins se centran en el desarrollo de software, Palas nace para ayudar a todos: desde el crecimiento personal y la gestión de datos, hasta operaciones, finanzas y marketing.

## Conceptos Clave

Si es tu primera vez usando una herramienta de este tipo, aquí tienes lo básico para entender el potencial:

* 🤖 **IA Agéntica:** A diferencia de un chat normal (que solo "habla"), una IA agéntica puede **actuar**. Tiene "manos": puede leer tus archivos, ejecutar comandos, realizar cálculos y tomar decisiones para completar tareas complejas de forma autónoma.
* 🧩 **Plugins:** Es una forma de empaquetar extras que añades a Claude, para darle nuevos "superpoderes" a la IA. Imagínalos como las apps que instalas en tu móvil para hacer cosas que no venían de fábrica.
* 🛠️ **Habilidades (Skills):** Son las tareas específicas que añades a tu entorno. Si el plugin es la caja de herramientas, las habilidades son el martillo, la calculadora o el gestor de archivos.

> Siempre puedes crear o copiar Skills en un proyecto sin necesidad de Plugins (que traen Skills), la ventaja de los Plugins es la forma de empaquetar dichos Skills, es mucho más cómodo.

## Para usuarios nuevos

¿Empezando de cero? Si tienes el efecto "papel en blanco" y no has jugado con todo esto, tu carpeta está vacía, empieza probando con este ejemplo para romper el hielo:

```bash
# Abre una terminal y navega a tu proyecto
cd ~/Documentos/mi-proyecto

# Crea la configuración mínima
# Usuarios de Windows: Ejecutar desde Git Bash, no PowerShell o CMD.
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/starter/minimal-install.sh | bash
```

**¿Qué hace?** Crea una carpeta `.claude/` con un archivo `CLAUDE.md` que contiene:

* Instrucciones básicas para Claude sobre tu proyecto
* Las habilidades de Palas listas para usar
* Un espacio donde añadir notas específicas de tu proyecto

Piensa en `CLAUDE.md` como el "briefing" que le das a Claude cada vez que abre tu proyecto. Cuanto más contexto le des, mejor te ayudará.

## Instalación del Plugin "Palas"

Primero sitúate en el proyecto en el que vas a trabajar:

**Opción A — Línea de comando:**

```bash
# Abre una terminal y navega a tu proyecto
cd ~/Documentos/mi-proyecto

# Inicia Claude Code
claude
```

**Opción B — Desde un IDE (VS Code, Cursor, etc.):**

1. Abre tu proyecto en el IDE
2. Abre el panel de Claude Code (normalmente en la barra lateral)
3. Claude ya estará en el contexto de tu proyecto

### Instala el Marketplace

Escribe `/plugin > Manage Plugins`. Navega a `Marketplaces` añade `Jacopalas/agentic-ai-palas`. Navega a `Plugins` instala el plugin que desees

Alternativa, en modo comando:

```shell
# Añadir el marketplace (una sola vez)
/plugin marketplace add Jacopalas/agentic-ai-palas

# Instalar el plugin Palas
/plugin install {nombre-plugin}@agentic-ai-palas
```

## Plugins Disponibles

| Plugin | Habilidades | Descripción |
|--------|-------------|-------------|
| **palas-basic** | `fixing-markdown`, `removing-notebooklm` | Herramientas comunes: formato markdown y eliminación de watermarks |
| **palas-git** | `commit` | Commits bien estructurados con Conventional Commits |
| **palas-security** | `security-scan` | Escaneo de secretos y vulnerabilidades |

## Estructura de Plugins

Cada plugin sigue una estructura estándar:

```
palas-<nombre>/
├── .claude-plugin/
│   └── plugin.json      # Metadatos del plugin (requerido)
├── .mcp.json            # Configuración MCP (opcional)
├── commands/            # Comandos slash (opcional)
├── skills/              # Habilidades (opcional)
└── README.md            # Documentación
```

## Requisitos

Algunos plugins tienen scripts que dependen de herramientas JavaScript CLI o librerías Python. Usamos **gestión de dependencias sin huella** (zero-footprint):

- **Python scripts**: Se ejecutan via `uv run` con metadatos PEP 723 inline
- **JavaScript CLI tools**: Se ejecutan via `pnpm dlx`

No se crean `node_modules`, `.venv`, `package.json` ni `requirements.txt` en el repositorio. Las dependencias se cachean globalmente en tu máquina.

**Prerrequisitos** (deben estar instalados en el sistema):

- **pnpm** — [https://pnpm.io/](https://pnpm.io/)
- **uv** — [https://docs.astral.sh/uv/](https://docs.astral.sh/uv/)

Para más detalles, consulta [scripts-dependencies.md](scripts-dependencies.md).

## Nota sobre Idiomas

> **¿Por qué las instrucciones internas están en inglés?**
>
> Los modelos de IA funcionan mejor con instrucciones en inglés. Por eso:
>
> * El **motor del plugin** (instrucciones que Claude ejecuta) está en inglés
> * La **documentación y ejemplos** (lo que tú lees) está en español
> * Las **trigger phrases** son bilingües para que puedas hablar con Claude en español
>
> Esto garantiza la mejor experiencia: máxima fiabilidad técnica + documentación en tu idioma.

## Documentación

Para más información sobre desarrollo de plugins, ver la [documentación oficial](https://docs.anthropic.com/en/docs/claude-code/plugins).

## Licencia

Usamos la licencia [MIT](./LICENSE).

## Contribuir al proyecto

Lee por favor el documento [CONTRIBUIR.md](CONTRIBUIR.md).

<!-- readme: contributors -start -->
<table>
 <tbody>
  <tr>
            <td align="center">
                <a href="https://github.com/Jacopalas">
                    <img src="https://github.com/Jacopalas.png" width="80;" alt="Jacopalas"/>
                    <br />
                    <sub><b>Jacobo Palacios</b></sub>
                </a>
            </td>
            <td align="center">
                <a href="https://github.com/LuisPalacios">
                    <img src="https://github.com/LuisPalacios.png" width="80;" alt="LuisPalacios"/>
                    <br />
                    <sub><b>Luis Palacios</b></sub>
                </a>
            </td>
  </tr>
 <tbody>
</table>
<!-- readme: contributors -end -->
