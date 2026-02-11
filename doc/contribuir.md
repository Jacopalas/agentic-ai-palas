# Contribuir a Palas

¡Gracias por querer contribuir! Palas se centra en **herramientas genéricas** y **habilidades de dominio** para particulares y empresas.

## Nuestro Enfoque

La mayoría de plugins de Claude Code están orientados a desarrolladores. Nosotros somos diferentes:

- **Herramientas genéricas** — Útiles en cualquier proyecto (commits, formato, seguridad)
- **Habilidades de dominio** — Funciones de negocio como finanzas, RRHH, marketing, ventas, legal
- **Para PYMEs** — Herramientas prácticas para equipos pequeños sin departamento de IT

## Lo Que Buscamos

### Herramientas Genéricas

Habilidades que funcionen en cualquier proyecto:

- **Productividad**: Gestión de tareas, toma de notas, documentación
- **Calidad**: Formato, validación, consistencia
- **Seguridad**: Escaneo, auditoría, cumplimiento
- **Utilidades**: Procesamiento de archivos, transformación de datos

### Habilidades de Dominio (Alta Prioridad)

Especialmente buscamos habilidades para dominios de negocio:

| Dominio       | Ideas de Habilidades                                        |
| ------------- | ----------------------------------------------------------- |
| **Finanzas**  | `/palas:invoice` — Generar/revisar facturas                 |
|               | `/palas:budget` — Analizar presupuestos y previsiones       |
|               | `/palas:expense-report` — Crear informes de gastos          |
| **Marketing** | `/palas:seo-review` — Revisar contenido para SEO            |
|               | `/palas:social-post` — Crear posts para redes sociales      |
|               | `/palas:newsletter` — Estructurar newsletters               |
| **RRHH**      | `/palas:job-description` — Redactar descripciones de puesto |
|               | `/palas:onboarding` — Crear checklists de incorporación     |
|               | `/palas:policy` — Revisar/redactar políticas internas       |
| **Ventas**    | `/palas:proposal` — Estructurar propuestas comerciales      |
|               | `/palas:followup` — Redactar emails de seguimiento          |
|               | `/palas:meeting-notes` — Resumir reuniones con clientes     |
| **Legal**     | `/palas:contract-review` — Revisar contratos básicos        |
|               | `/palas:compliance` — Checklists de cumplimiento            |
|               | `/palas:nda` — Generar NDAs sencillos                       |

**¿No ves tu dominio?** También buscamos habilidades para contabilidad, operaciones, atención al cliente, gestión de proyectos y más.

---

## Cómo Contribuir

### 1. Fork y clonar

```bash
git clone https://github.com/TU_USUARIO/agentic-ai-palas.git
cd agentic-ai-palas
```

### 2. Crear una rama

```bash
git checkout -b add-nombre-de-tu-skill
```

### 3. Añadir tu habilidad

Ver [`/plugins/palas-ejemplo`](plugins/palas-ejemplo) como implementación de referencia.

Si tu habilidad necesita scripts, añádelos en un subdirectorio `scripts/`.

### 4. Idioma

El contenido interno del SKILL.md (instrucciones que ejecuta Claude) debe estar en inglés para máxima fiabilidad. Las trigger phrases deben ser bilingües.

### 5. Probar tu habilidad

Consulta la sección [Desarrollo y Pruebas Locales](#desarrollo-y-pruebas-locales) más abajo para instrucciones detalladas.

### 6. Enviar un PR

```bash
git add .
git commit -m "feat: add nombre-de-tu-skill skill"
git push origin add-nombre-de-tu-skill
```

Abre un PR explicando:

- Qué hace la habilidad
- Por qué es útil (especialmente para PYMEs)
- Cómo la has probado

---

## Desarrollo y Pruebas Locales

Antes de enviar un PR, prueba tu plugin localmente. Claude Code permite cargar plugins desde una carpeta local sin necesidad de instalarlos.

### Cargar un plugin local

Usa el flag `--plugin-dir` para cargar tu plugin directamente:

```bash
# Desde el directorio raíz del repositorio
claude --plugin-dir ./plugins/palas-basic
```

Esto carga el plugin sin usar la caché. Los cambios que hagas se reflejan al reiniciar Claude Code.

### Cargar múltiples plugins

Puedes cargar varios plugins a la vez:

```bash
claude --plugin-dir ./plugins/palas-basic --plugin-dir ./plugins/palas-git
```

### Flujo de desarrollo

1. Haz cambios en tu plugin (SKILL.md, scripts, etc.)
2. Reinicia Claude Code con `--plugin-dir`
3. Prueba el skill completo: `/palas:nombre-de-tu-skill`
4. Repite hasta que funcione correctamente

### Ejecutar scripts directamente

Si tu skill usa scripts Python o JavaScript, puedes probarlos sin cargar el plugin completo.

**Python con `uv run`** (gestión sin huella):

```bash
# Desde el directorio raíz del repositorio
uv run ./plugins/palas-basic/skills/fixing-markdown/scripts/fix_md_extra.py ./README.md
```

**JavaScript con `pnpm dlx`** (gestión sin huella):

```bash
# Ejemplo con markdownlint-cli2
pnpm dlx markdownlint-cli2 --fix "./README.md"
```

### Verificar estructura del plugin

Asegúrate de que tu plugin tenga esta estructura:

```text
plugins/tu-plugin/
├── .claude-plugin/
│   └── plugin.json          # Requerido
├── skills/
│   └── tu-skill/
│       ├── SKILL.md         # Definición del skill
│       └── scripts/         # Scripts auxiliares (opcional)
└── README.md
```

**Importante**: Los directorios `skills/`, `commands/`, `agents/` van en la raíz del plugin, NO dentro de `.claude-plugin/`.

---

## Directrices

### Sí

- Mantén las habilidades enfocadas en una tarea
- Escribe pensando en usuarios no técnicos
- Incluye instrucciones de uso claras
- Prueba antes de enviar
- Piensa en casos de uso para PYMEs

### No

- Incluir datos sensibles (API keys, tokens, rutas personales)
- Requerir servicios de pago caros
- Asumir conocimientos técnicos
- Duplicar funcionalidad existente
- Crear flujos excesivamente complejos

---

## Añadir Dependencias

Si tu habilidad necesita paquetes de Python o Node.js:

1. **Python**: Añadir a `_tooling/requirements.txt`
2. **Node.js**: Añadir a `_tooling/package.json`

Incluye instrucciones de configuración en tu SKILL.md.

---

## Nombrado de Archivos

- Usa minúsculas con guiones: `revision-facturas/SKILL.md`
- Sé descriptivo: `analisis-presupuesto` en lugar de `presupuesto`
- El nombre del directorio debe coincidir con el name en el frontmatter

---

## ¿Preguntas?

Abre un [issue](https://github.com/Jacopalas/agentic-ai-palas/issues).

---

¡Gracias por contribuir a Palas!
