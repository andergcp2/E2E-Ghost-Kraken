﻿# E2E-Ghost-Kraken

Integrantes:

- ANDERSON GIOVANNY CASTIBLANCO PRIETO (ag.castiblanco1207@uniandes.edu.co)
- MARLON MAURICIO AGON FLOREZ (m.agonf@uniandes.edu.co)
- CESAR ALFONSO SOLANO RUIZ (c.solanor@uniandes.edu.co)
- ANA LUCIA FORERO NEME (a.foreron@uniandes.edu.co)

## Ghost

**Intrucciones para instalar las versiones de Ghost 3.41.1 y 4.41.3 usando contenedores de Docker**

- Instalar docker usando el link de acuerdo a su sistema operativo:

  - https://docs.docker.com/desktop/mac/install/
  - https://docs.docker.com/desktop/linux/install/
  - https://docs.docker.com/desktop/windows/install/

- Instalar contenedor ghost 3.41.1 puerto 3001
  `docker run -d -e url=http://localhost:3001 -p 3001:2368 --name ghost_3.41.1 ghost:3.41.1`

- Instalar contenedor ghost 4.41.3 puerto 3002
  `docker run -d -e url=http://localhost:3002 -p 3002:2368 --name ghost_4.41.3 ghost:4.41.3`

**Nota**: en caso de necesitar reinstalar los contenedores, ejecutar los comandos:

```
  docker rm -f ghost_3.41.1
  docker rm -f ghost_4.41.3

  docker run -d -e url=http://localhost:3001 -p 3001:2368 --name ghost_3.41.1 ghost:3.41.1
  docker run -d -e url=http://localhost:3002 -p 3002:2368 --name ghost_4.41.3 ghost:4.41.3

```

## Kraken

Funcionalidades y escenarios:

- Crear usuario Administrador (para ejecutar de forma exitosa las pruebas relacionadas a esta funcionalidad se debe tener una instalación "limpia" de Ghost, es decir sin ningún usuario administrador creado previamente)
  - Crear un nuevo usuario administrador de forma exitosa
  - Crear un usuario administrador de forma no exitosa con una clave corta
  - Crear un usuario administrador de forma no exitosa con una clave insegura
  - Crear un usuario administrador de forma no exitosa con un correo inválido
  - Crear un usuario administrador de forma no exitosa sin título del sitio
- Ingresar a la aplicacion:
  - Login fallido por mail erroneo
  - Login fallido por mail vacio
  - Login fallido por password vacio
  - Login fallido por password erroneo
  - Login fallido por mail y password vacío
- Administración Post
  - Listar Post
  - Crear con título máximo caracteres sin publicar
  - Crear con body máximo caracteres sin publicar
  - Crear con body máximo caracteres publicando
  - Crear con título máximo caracteres 255
  - Crear con título máximo caracteres 254
  - Update post con título máximo caracteres 256
  - Update post con título máximo caracteres 255
  - Update post con título máximo caracteres 254
  - Update post con body generado
  - Crear post y delete post confirmar
  - Crear post y delete post cancelar
  - Crear post, publicar y quitar publicación.

Intrucciones para ejecutar las pruebas creadas con Kraken:

- Instale kraken en su computador siguiendo las instrucciones que se encuentra en: https://thesoftwaredesignlab.github.io/Kraken/#installation
- Despliegue la aplicación Ghost de forma local siguiendo este tutorial: https://misovirtual.virtual.uniandes.edu.co/codelabs/ghost-local-deployment/index.html#0
- Descargue este repositorio ejecutando en su consola el comando `git clone https://github.com/csolanor22/E2E-Ghost-Kraken.git`
- Desde la console entre a la carpeta creada al clonar el repositorio
- Dentro de la carpeta kraken del proyecto ejecute el comando npm install
- Puede usar el comando `npx kraken-node run` ó `kraken-node run` para correr las pruebas
- En el archivo properties.json que se encuentra dentro de la carpeta kraken debe cambiar la variable `BASE_URL` a `http://localhost:3001` si se requiere probar la versión 3.41.1 o cambiarla a `http://localhost:3002` si se requiere probar la versión 4.41.3.

**Sobre la implementación de las pruebas con Kraken**

- Se implementó el patrón given-when-then para indicar el contexto del escenario, la acción sobre la aplicación bajo pruebas y el resultado esperado:

```
  @user1 @web
Scenario: Creacion de usuario con email inválido
    Given I navigate to register page "<BASE_URL>"
    And I wait for 2 seconds
    And I take a screenshot "1"
    When I enter new site title "<NEW_SITE_TITLE>"
    And I take a screenshot "2"
    And I enter new user fullname "<NEW_USER_FULLNAME>"
    And I take a screenshot "3"
    And I enter sign up email "<NEW_INVALID_MAIL>"
    And I take a screenshot "4"
    And I enter new password "<PASSWORD1>"
    And I take a screenshot "5"
    Then I click signup
    And I wait for 1 seconds
    And I take a screenshot "6"
    And I expect error message "<INVALID_MAIL_MSG>"
    And I take a screenshot "7"
```

- En el archivo properties.json se incluyeron variables para adaptar las pruebas a la versión requerida, ya sea la 3.41.1 o la 4.41.3
  - Este archivo también incluye variables que almacenan mensajes de error, mensajes de éxito y datos del usuario que se crea como administrador.

## Cypress

**Funcionalidades y escenarios**

- Ingresar a la aplicacion:

  - Login exitoso y Logout
  - Login erroneo por password incorrecto
  - Login erroneo por username inexistente en DB
  - Login sin usuario
  - Login sin contraseña
  - Login con formato de usuario no valido

- Administración Post

  - Crear post borrador
  - Crear post y programarlo
  - Crear post y publicarlo
  - Listar post
  - Listar post borradores
  - Listar post programados
  - Listar post por antiguedad de publicación
  - Listar post por antiguedad de actualización
  - Actualizar post - titulo y contenido
  - Actualizar post - agregar tag
  - Eliminar post

- Tags

  - Listar Tags
  - Crear un Tag
  - Editar Tag
  - Eliminar Tag

- Administración Pages
  - Crear page borrador
  - Crear page y programarla
  - Crear page y publicarla
  - Listar pages
  - Listar pages borrador
  - Listar pages programadas
  - Listar pages por antiguedad de publicación
  - Listar pages por antiguedad de actualización
  - Listar pages programadas
  - Listar pages publicadas
  - Actualizar page - titulo
  - Actualizar page - agregar tag
  - Eliminar page borrador
  - Eliminar page programada
  - Eliminar page publicada

**Intrucciones para instalar y ejecutar pruebas E2E con Cypress**

- clonar este repositorio ejecutando en su consola el comando `git clone https://github.com/csolanor22/E2E-Ghost-Kraken.git`
- entrar desde la consola a la carpeta creada al clonar el repositorio E2E-Ghost-Kraken
- instalar cypress y faker ejecutando los comandos 
```
npm install cypress --save-dev
npm install @faker-js/faker --save-dev
```

- antes de ejecutar pruebas de estrategia de datos sobre ghost 4.41.3, configurar el archivo `cypress.json`

```
...
    "baseUrl": "http://localhost:3002",
    "env": {
      "ghost-version" : "4.41.3",
      ...
      "urlPagesAPI"   : "https://my.api.mockaroo.com/ghost_data.json?key=7e009e30", 
...
```
  - ejecutar todas las pruebas de estrategia de datos con el comando 
```
  node_modules\.bin\cypress run --headless --spec "cypress/integration/data-*.spec.js"
```

  - El resultado de las pruebas debe verse así:  

![cypress-data-tests-finished](https://user-images.githubusercontent.com/98719877/169726938-be4c89ee-561e-49b1-a5de-cea34c5c439a.png)

  - nota: para las pruebas VRT, ejecutar el siguiente con el comando 
```
  node_modules\.bin\cypress run --headless --spec "cypress/integration/vrt.spec.js"
```

  - con el proposito de preparar las pruebas VRT, al final de las pruebas de cada versión, copie en la ruta `vrt`, las capturas de pantalla ubicadas en la ruta `cypress\screenshots\vrt.spec.js` y renonmbre las carpetas de la siguiente manera, dependiendo de la versión: 
```
  vrt\cypress\screenshots-3.41.1\vrt.spec.js
  vrt\cypress\screenshots-4.41.3\vrt.spec.js
```

- en la ruta cypress\screenshots puede revisar las capturas de pantalla generadas durante la prueba


**Sobre la implementación de las pruebas Cypress**

- se implementó el patrón given-when-then para indicar el contexto del escenario, la acción sobre la aplicación bajo pruebas y el resultado esperado:

```
  ghost admin visual regression tests
    Given admin accesses post list option
      When admin creates new published post
        √ Then admin sees new published post in list (24287ms)
    Given admin accesses pages list option
      When admin creates new published page
        √ Then admin sees new published page in list (15976ms)
    Given admin access posts list option for editing
      When admin edits title of a published post
        √ Then admin sees new title checking published post (16684ms)
    Given admin access pages list option for editing
      When admin edits title of a published page
        √ Then admin sees new title checking published page (14630ms)
    Given admin accesses post list option for delete
      When admin delete a published post
        √ Then admin sees an empty published posts list (13444ms)
    Given admin accesses pages list option for delete
      When admin delete a published page
        √ Then admin sees an empty published pages list (13370ms)
```

- también se implementaron commands para agrupar funcionalidades, delegar la responsabilidad del llamado a los selectores (incluyendo los cambios de versión) y simplificar el código de pruebas:

cypress/integration/pages.spec.js:

```
...
	context('Given admin accesses pages list option', () => {
		beforeEach(()=>{
			cy.listPages()
			cy.newPage()
		})

		context('When admin creates new page', () => {
			beforeEach(() => {
				cy.createPage(version, draft, desc)
			})
			it('Then admin sees new draft page in list', () => {
				cy.listPagesAndCheck(draft);
			})
		})
...
```

cypress/support/commands.js

```
...
Cypress.Commands.add('listPages', () => {
    cy.get('a[href="#/pages/"]').click()
    cy.url().should('include', 'pages')
    cy.wait(1000)
    cy.screenshot()
})

Cypress.Commands.add('listPagesAndCheck', (page) => {
    cy.wait(1000)
    cy.get('a[href="#/pages/"]').click()
    cy.url().should('include', 'pages')
    cy.contains(page)
    cy.screenshot()
})
...
```

para manejar los cambios en los selectores segun la versión, se configuró la variable de ambiente ghost-version y se ajustaron los comandos impactados:

- createPage/editPage: placeholder del titulo
- deletePage: titulo/clase del botón settings
- schedulePage/publishPage: clase del boton de confirmación

```
...
Cypress.Commands.add('createPage', (version, title, description) => {
  if (version == '4.41.3')
      cy.get('textarea[placeholder="Page title"]').type(title)
  else
      cy.get('textarea[placeholder="Page Title"]').type(title)
  cy.get('.koenig-editor__editor-wrapper').type(description +'{enter}')
  cy.wait(1000)
  cy.screenshot()
})
...
Cypress.Commands.add('publishPage', (version) => {
  cy.contains('Publish').click()
  cy.screenshot()
  if (version == '4.41.3')
      cy.get('button.gh-btn.gh-btn-black.gh-publishmenu-button.gh-btn-icon.ember-view').click()
  else
      cy.get('button.gh-btn.gh-btn-blue.gh-publishmenu-button.gh-btn-icon.ember-view').click()
  cy.wait(1000)
})
...
```

Visual Regression Tests
-----------------------

**Intrucciones para para configurar y ejecutar las VRT con Resemble.js** 

- Para generar este reporte ya se deben haber ejecutado las pruebas de Kraken y Cypress para tener las capturas de pantalla necesarias
- Instalar las dependencias desde el directorio raíz del repositorio
```
npm install playwright
npm install resemblejs
```
- Ejecutar la prueba VRT desde la carpeta raíz del repositorio con el comando:
```
node resemble.js
```
- Revisar el reporte generado: Las imágenes resultado de la comparación que realiza resemble se encuentran en la carpeta ./results. 
- Dentro de esta carpeta results, se genera una carpeta con las imágenes de cada set de comparaciones hecha y el reporte llamado report.html
- Por ejemplo ver el reporte: E2E-Ghost-Kraken/results/2022-05-16T03.49.53.570Z/report.html


Estrategias y herramientas para generación de datos
---------------------------------------------------

La implementación de las estrategias a nivel de cypress se puede revisar en el archivo `cypress/support/Data.js`, el cual expone funciones que se utilizan al inicio de los escenarios de pruebas, dependiendo de la estrategia a utilizar. 

**Pool de datos apriori**

**Implementación en Cypress**

La estrategia pool de datos apriori se implementó utilizando esquemas Mockaroo, por ejemplo `ghost-data` con la siguiente definición: 

![mockaroo-apriori-data-pool](https://user-images.githubusercontent.com/98719877/169727100-655658ff-b7bd-4794-8eb6-16b2f0bc8c3e.png)

Luego se exportó a un archivo json, el cual se ubicó en la ruta `cypress/fixtures/` para ser cargado desde los spec files:

```
	const aprioriDataPool = require('../fixtures/ghost-data.json');
```

Para extrer un registro aleatorio del data pool (tanto para el apriori como para el pseudo aleatorio), se utiliza la función `getRandomDataPool`, la cual se apoya en la libreria faker: 

```
  getRandomDataPool(dataPool) {
    **let idx = faker.datatype.number({'min': 0, 'max': dataPool.length-1}, 1)**
    cy.log(dataPool.length, idx, dataPool[idx].email, dataPool[idx].title)
    cy.wait(2000)
    return dataPool[idx];
  }
```

Un ejemplo de implementación en un escenario de prueba: 
```
		context('When admin tries to create new member with apriori data pool strategy', () => {
			beforeEach(() => {
				**member = data.getRandomDataPool(aprioriDataPool)**
				cy.newMember()
			}) 

			it('and input spaces, then admin sees error message and member was not created', () => {
          cy.createMember(' ', ' ', ' ')
          cy.checkMemberEmailError()
          cy.listMembers()
          // cy.clickLeaveButton()
        })
```
**Implementación en Kraken**

Con Kraken se crearon 30+ escenarios con pool de datos apriori, haciendo uso de la opción de Scenario Outline. Puede ver ejemplos de la implementación en la carpeta kraken/features/1_crear_admin_negativo.feature

Principalmente se usaron estos datos para pruebas de escenarios negativos. Ejemplo de esto es:

```
@user5 @web
Scenario Outline: Creacion de usuario - escenarios negativos con datos inválidos usando Scenario Outline
    Given I navigate to register page
    And I wait for 2 seconds 
    When I enter new site title "<site_title>"
    And I enter new user fullname "<new_user_fullname>"
    And I enter sign up email "<mail>"
    And I enter new password "<password>"
    Then I click signup
    And I wait for 1 seconds
    And I expect error message "<invalid_msg>"

Examples:
    | site_title | new_user_fullname | mail | password | invalid_msg | scenario_description |
    | Mi nuevo sitio | Pepito Perez  | invalidEmail  | User-12345  | Invalid Email. | |
    | Mi nuevo sitio | Pepito Perez  | invalidEmail@  | User-12345  | Invalid Email. | |
    | Mi nuevo sitio | Pepito Perez  | invalidEmail@a  | User-12345  | Invalid Email. | |
    | Mi nuevo sitio | Pepito Perez  | invalidEmail@a.  | User-12345  | Invalid Email. | |
    | Mi nuevo sitio | Pepito Perez  | @mail.com  | User-12345  | Invalid Email. | |
    | Mi nuevo sitio | Pepito Perez  | user123@mail.com  | 1234  | Password must be at least 10 characters long | |
    | Mi nuevo sitio | Pepito Perez  | user123@mail.com  | asdf12345 | Password must be at least 10 characters long | |
    | Mi nuevo sitio | Pepito Perez  | user123@mail.com  | password123  | Sorry, you cannot use an insecure password | |
    | Mi nuevo sitio | Pepito Perez  | user123@mail.com  | 1234567890  | Sorry, you cannot use an insecure password | |
    | Mi nuevo sitio | Pepito Perez  | user123@mail.com  | qwertyuiop  | Sorry, you cannot use an insecure password | |
    | Mi nuevo sitio | Pepito Perez  | user123@mail.com  | 0987654321  | Sorry, you cannot use an insecure password | |
    | Mi nuevo sitio | Pepito Perez  | user123@mail.com  | abcdefghij  | Sorry, you cannot use an insecure password | |
    | Este es un titulo demasiado largo: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut mollis dui, convallis pulvinar tortor. Nam ante libero, semper semper justo nec, ultricies consectetur ante. Aliquam sit amet mattis mi, at sollicitudin diam. Praesent urna dolor, pretium et felis id, commodo egestas augue. Nunc sed erat vel justo commodo finibus pulvinar sit amet mi. Integer sodales sem non nisl efficitur volutpat. Cras sed varius nisl, eget tempor leo. Pellentesque vestibulum, lacus sit amet volutpat luctus, elit mi venenatis purus, vitae tempus diam velit eget orci. Morbi elementum porta urna. Maecenas vehicula leo leo, at tincidunt sapien feugiat quis. Nam libero erat, bibendum vel efficitur sit amet, lobortis et ante. Suspendisse potenti. Sed id imperdiet nulla. Morbi sodales augue ac metus suscipit vehicula. | Pepito Perez  | user123@mail.com  | User-12345  | Title is too long | |
    | Este es un titulo que tiene 151 caracteres, lo que está por encima de limite permitido. El limite maximo es de 150 caracteres. Este es un escenario neg | Pepito Perez  | user123@mail.com  | User-12345 | Title is too long  | |
    | Mi nuevo sitio | Este es un nombre de usuario que tiene 191 caracteres, lo cual está 1 por encima de límite máximo. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quis sollicitudin ipsum, iddander | user123@mail.com  | User-12345  | exceeds maximum length of 191 characters. users.name | |
    | Mi nuevo sitio | Este es un nombre demasiado largo: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ut mollis dui, convallis pulvinar tortor. Nam ante libero, semper semper justo nec, ultricies consectetur ante. Aliquam sit amet mattis mi, at sollicitudin diam. Praesent urna dolor, pretium et felis id, commodo egestas augue. Nunc sed erat vel justo commodo finibus pulvinar sit amet mi. Integer sodales sem non nisl efficitur volutpat. Cras sed varius nisl, eget tempor leo. Pellentesque vestibulum, lacus sit amet volutpat luctus, elit mi venenatis purus, vitae tempus diam velit eget orci. Morbi elementum porta urna. Maecenas vehicula leo leo, at tincidunt sapien feugiat quis. Nam libero erat, bibendum vel efficitur sit amet, lobortis et ante. Suspendisse potenti. Sed id imperdiet nulla. Morbi sodales augue ac metus suscipit vehicula. | user123@mail.com  | User-12345  | exceeds maximum length of 191 characters. users.name | |
    | Mi nuevo sitio | Pepito Perez  | esteEsUnCorreoDemasiadoLargoEsteEsUnCorreoDemasiadoLargoEsteEsUnCorreoDemasiadoLargoEsteEsUnCorreoDemasiadoLargo@hotmail.com  | User-12345  | Invalid Email. | |
    | Mi nuevo sitio | Pepito Perez  | EsteEsUnCorreoDemasiadoLargoQueExcede77CaracteresLoMaximoPermitido@hotmail.com  | User-12345  | Invalid Email. | |
```


**Pool de datos pseudo aleatorio dinámico**

La estrategia pool de datos pseudo aleatorio se implementó utilizando una mock API Mockaroo generada a partir del esquema `ghost-data`: 

![mockaroo-pseudo-random-data-pool](https://user-images.githubusercontent.com/98719877/169727145-4bce4b2e-aa80-436e-8f1d-02a0462b7299.png)

La url se configuró en la propiedad urlPagesAPI del archivo `cypress.json`
```
      "urlPagesAPI"   : "https://my.api.mockaroo.com/ghost_data.json?key=7e009e30", 
```

Y se invoca al inicio de las pruebas a través de la función getPseudoRandomDataPool de `cypress/support/Data.js`
```
  getPseudoRandomDataPool(urlAPI) {
    let dataPool = {};
    Cypress.$.ajax({
      async: false,
      url: urlAPI,
      responseType:'application/json',
      success: function(data) {dataPool = data;},
      error: function(xhr, status, error) { console.log(`getPseudoRandomDataPool error: ${urlAPI} \n${error}`); }
    });
    return dataPool;
  }
```

desde cada uno de los spec files
```
	const pseudoRandomDataPool = data.getPseudoRandomDataPool(Cypress.env('urlPagesAPI'));
```

Para extrer un registro aleatorio del data pool (tanto para el apriori como para el pseudo aleatorio), se utiliza la función `getRandomDataPool` descrita en la estrategia anterior. 

Un ejemplo de implementación en un escenario de prueba: 
```
		context('When admin tries to create new member with pseudo random data pool strategy', () => {
			beforeEach(() => {
				**member = data.getRandomDataPool(pseudoRandomDataPool)**
				cy.newMember()
			}) 
	
			it('and input not valid email border-1, then admin sees error message and member was not created', () => {
				cy.createMember(' ', member.text190, ' ')
				cy.checkMemberEmailError()
				cy.listMembers()
				cy.clickLeaveButton()
			})
```

**Escenario aleatorio**

Por último, la estrategia de escenario aleatorio se implementó con el apoyo de la librería faker y se utiliza en las siguientes funciones: 

```
  getRandomData() {
    return {title: faker.lorem.words(), description:faker.lorem.paragraphs()}; 
  }
...
  getRandomWords(num){
    return faker.lorem.words(num); 
  }
```

Un ejemplo de implementación en un escenario de prueba con Cypress: 
```
		context('When admin creates new page with random data strategy', () => {
			beforeEach(() => {
				**page = data.getRandomData();**
				title = page.title;
				desc = page.description;
				cy.newPage()
				cy.createPage(version, title, desc)
			}) 

			it('Then admin sees new draft page in list and can delete it', () => {
				cy.listPagesAndCheck(title);
				cy.filterDraftPages()
			})
```

Un ejemplo de implementación en un escenario de prueba con Kraken: 
```
		When("I enter ramdom text into post body max", async function () {
      let element = await this.driver.$(".__has-no-content > p:nth-child(1)");
      return await element.setValue(faker.datatype.string(2001));
    });
```
