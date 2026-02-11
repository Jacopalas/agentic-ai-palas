# Ámbitos de instalación de los Plugins

Cuando instalas un plugin desde un marketplace en Claude Code, te aparecen tres opciones. Cada una determina **dónde** queda instalado el plugin y **quién** puede usarlo. Aquí va la explicación de cada una.

### Install for you (ámbito usuario)

Esta es la opción por defecto. El plugin se instala a nivel de tu usuario y queda disponible y habilitado en **todos** los repositorios de tu ordenador. La configuración se guarda en `~/.claude/settings.json`.

Es la opción más cómoda si quieres que un plugin esté siempre a mano sin importar en qué proyecto estés trabajando.

### Install for this project (ámbito proyecto)

El plugin se instala y se registra dentro del repositorio actual, en el archivo `.claude/settings.json` del propio proyecto. La idea detrás de esta opción es que **todos los colaboradores** del repositorio puedan compartir el mismo plugin: al hacer commit de ese archivo, cualquiera que clone el repo tendrá el plugin configurado.

Sin embargo, hay un matiz importante: este plugin solo debería funcionar dentro de ese repositorio concreto. Si vas a otro repo en tu máquina, lo verás como "instalado" pero no podrás habilitarlo porque el sistema detecta que pertenece al ámbito de proyecto, no al de usuario.

### Install locally (ámbito local)

El plugin se instala solo para ti y solo en el repositorio actual. No se comparte con colaboradores (no modifica archivos del proyecto que se vayan a commitear) y no está disponible en otros repositorios.

Es útil cuando quieres probar un plugin en un proyecto específico sin que afecte al resto de tu entorno ni al de tu equipo.

### El problema

Para mi lo ideal sería poder instalar en ámbito proyecto o local y luego poder habilitar o deshabilitar el plugin en otros repos. Por desgracia eso no se puede hacer, está diseñado para que cada ámbito sea exclusivo:

- Un plugin instalado en ámbito **proyecto** solo funciona en ese proyecto.
- Un plugin instalado en ámbito **local** solo funciona en ese repo para ti.
- Solo en ámbito **usuario** tenemos el plugin "en el ordenador" pero está activo o desactivo para todo tu ordenador (todos tus proyectos).

A día de hoy (febrero 2026), Claude Code **no soporta** instalar un plugin a nivel de usuario y luego elegir en qué proyectos activarlo y en cuáles no. Es una funcionalidad que la comunidad ha pedido en GitHub (issue #11461 y #14843), pero aún no está implementada.

El workaround manual que existe es editar directamente el archivo `~/.claude/settings.json` o el `.claude/settings.json` del proyecto y manipular las claves `enabledPlugins` y `disabledPlugins`, pero no es una experiencia cómoda.

### Bugs conocidos relacionados

Hay varios bugs abiertos que agravan la situación:

- Si instalas un plugin con ámbito local en un proyecto A, al ir al proyecto B te dice que "ya está instalado" aunque no funcione allí.
- Los plugins con ámbito proyecto aparecen como instalados globalmente en la interfaz, confundiendo al usuario.
- El comando de desinstalación a veces da mensajes contradictorios sobre el ámbito.

Estos están documentados en los issues #20390, #14202, #16260 y #19743 del repositorio de Claude Code en GitHub.

### Resumen rápido

| Opción | Dónde se guarda | Disponible en otros repos | Compartido con equipo |
|---|---|---|---|
| Install for you | `~/.claude/settings.json` | ✅ Sí, en todos | No |
| Install for this project | `.claude/settings.json` del repo | ❌ No | ✅ Sí (vía git) |
| Install locally | Registro local del usuario | ❌ No | No |

````
