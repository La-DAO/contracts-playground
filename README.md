# La DAO - Área de juego para Contratos Inteligentes

**Conecta, Contribuye, Construye**

Bienvenido a La DAO, una comunidad de apasionados de las finanzas descentralizadas y la tecnología.

Este repositorio está dedicado para la innovación y experimentación con contratos inteligentes. El objetivo es permitir a los miembros de la comunidad interactuar con tecnologías desarrolladas por La DAO, así como otras del ecosistema.

Si gustas colaborar o integrar tu proyecto, contáctanos en gm@ladao.club

### **Flujo de colaboración**

Utilizamos los principios de Gitflow para el control de versiones durante el flujo de trabajo como desarrolladores.

En nuestras contribuciones, debemos considerar el modelo de creación de ramas propuesto en Gitflow, donde siempre mantendremos nuestra rama principal, `main`, así como una rama para aportar nuestras contribuciones: `dev`.

Para conocer más sobre este flujo de trabajo, puedes visitar este excelente [Tutorial de Gitflow](https://www.atlassian.com/es/git/tutorials/comparing-workflows/gitflow-workflow) creado por Atlassian.

### Contribuciones: cambia a la rama `dev` y crea tu rama

Ejecuta el siguiente comando en la consola

```bash
  git switch dev
```

La rama dev es donde mantenemos una copia de las últimas contribuciones. Por ello, es nuestro punto de inicio para contribuir.

Si deseas crear un nuevo feature o realizarás alguna otra contribución, siguiendo el modelo de trabajo Gitflow, deberás crear tu propia rama a partir de `dev`

```bash
  git checkout -b feat/<inserta-tu-feature>
```

Seamos descriptivos pero concisos con los nombres de las ramas, algunos ejemplos:

- feat/contacto-pagina
- feat/setup-auth
- feat/api-profile-routes

Para contribuciones, crea _commits_ constantemente para que los demás podamos mantener el contexto de tus contribuciones. Recomendamos seguir estas [mejores prácticas en tus commits](https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages).

Una vez que tu aportación esté lista, puedes abrir un Pull Request hacia la rama `dev` y solicita revisión de otro contribuidor.

## Requisitos

Antes de iniciar, debes instalar las siguientes herramientas:

- [Node (v18 LTS)](https://nodejs.org/en/download/)
- Yarn ([v1](https://classic.yarnpkg.com/en/docs/install/) or [v2+](https://yarnpkg.com/getting-started/install))
- [Git](https://git-scm.com/downloads)

Este proyecto utiliza [Scaffold-ETH 2](https://scaffoldeth.io).

### Variables de ambiente

En construcción...

## Inicio rápido

Para empezar a construir en este proyecto, seguimos las instrucciones para desarrollar con Scaffold-ETH 2.

1. Clona el repositorio e instala las dependencias:

```
git clone https://github.com/La-DAO/contracts-playground.git
cd contracts-playground
yarn install
```

2. Corre una red local en la primera terminal:

```
yarn chain
```

Este comando inicia una red local de Ethereum utilizando Hardhat. La red corre en localmente en tu máquina. Puedes modificar la configuración de la red en el archivo `hardhat.config.ts`.

3. En una segunda terminal, despliega el contrato de prueba:

```
yarn deploy
```

Este comando despliega un contrato inteligente a la red local. El contrato está ubicado en `packages/hardhat/contracts` y puede ser modificado de acuerdo a tus necesidades. El comando `yarn deploy` utiliza el script "deploy" ubicado en `packages/hardhat/deploy` para depsplegar el contrato en la red. También puedes modificar el script.

4. En una tercera terminal, inicia la aplicación de NextJS:

```
yarn start
```

Visita tu aplicación en: `http://localhost:3000`. Puedes interactuar con tu contrato inteligente utilizando el componente "contract" o el componente "example ui" en el frontend. Puedes modificar la configuración de la aplicación en el archivo `packages/nextjs/scaffold.config.ts`.

Realiza los tests de tu contrato con `yarn hardhat:test`

- Edita tu contrato inteligente `YourContract.sol` en `packages/hardhat/contracts`
- Edita tu frontend en `packages/nextjs/pages`
- Edita tus scripts de despliegue en `packages/hardhat/deploy`

## Construido con Scaffold-ETH-2

<h4 align="center">
  <a href="https://docs.scaffoldeth.io">Documentación</a> |
  <a href="https://scaffoldeth.io">Sitio Web</a>
</h4>

🧪 Un toolkit de código abierto, actualizado, para construir aplicación descentralizadas (dapps) en la blockchain de Ethereum. Diseñado para facilitar a los desarrolladores la creación y despliegue de contratos inteligentes, así como la construcción de interfaces de usuario para interactuar con dichos contratos.

⚙️ Construido con NextJS, RainbowKit, Hardhat, Wagmi, y Typescript.

## Documentación Scaffold-ETH 2

Visita los [docs](https://docs.scaffoldeth.io) para aprender más sobre Scaffold-ETH 2.

Para conocer más sobre sus características, puedes revisar el [sitio web de Scaffold-ETH 2](https://scaffoldeth.io).
