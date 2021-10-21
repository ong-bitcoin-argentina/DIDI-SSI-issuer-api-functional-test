# DIDI-SSI-issuer-api-functional-test

# Librería de automation Back-End




Esta guía es para integrar casos de prueba automatizados y realizar la ejecución de la librería.

- Creación de Features
- Creación de Pages
- Creación de Steps
- Ejecución

## Features

- Generar dentro de la carpeta scenarios un archivo *.feature
- Realizar la escritura del caso de prueba en lenguaje Humano con la metodologia BDD
- FEATURE => Epica
- Scenario: User Story / Caso de Uso
- Given (Procesos que se ejecutan antes del test), When (Prueba de la funcionalidad), Then (Validaciones de los resultados)

## Steps
Contiene los textos de las features y su conversión a JS. Se llama la función de BDD y se le asigna el texto que contenga la feature y dentro de la misma se llaman a las funciones de testing y llamados a las apis que estan contenidas en el src.

> Given('A account {}', function (request) {
>    this.context['request'] = JSON.parse(request);
>});
> En el given se parsea la request en formato json para almacenarla en el context

> When('Ingreso con el usuario {string}', async (text) => {       # el llamado {string} es para referenciar que dentro del texto de la feature se esta trayendo un texto con comillas dobles "" con formato string. Se puede utilizar para incertarlo en una función que ocupe la logica para realizar el caso de prueba.
>this.context['response'] = await restHelper.postData(`${process.env.SERVICE_URL}${path + id}`, this.context['request']);
 
> }); el context contiente tanto la request como el response y consiste en un json armado con los datos trasladados por el usuario, se llama al restHelper que contiene las funciones para llamar a las peticiones POST,GET,PUT,PATCH y dentro se llama una variable de entorno que es la ruta de la api
> El Then contiene la validación de el resultado por la api
>Then('I get response code {int} and status {}', async function (code, body) {
>   assert.equal(this.context['response'].status, code);
>   assert.equal(this.context['response'].data['status'], body);
>});


As [Gastón Genaud] writes this guide.

