# Conversor de Distancias (Millas a Kilómetros)

Este proyecto implementa un conversor de distancias de millas a kilómetros utilizando el patrón de diseño Adapter. La aplicación permite adaptar las distancias proporcionadas por una aplicación de navegación de Los Ángeles (en millas) para que sean compatibles con un sistema de información geográfica en España (en kilómetros).

## Solución al Ejercicio 5 Individual

Este proyecto es la solución al **Ejercicio 5 Individual** que consiste en implementar una solución que permita a un servicio de información geográfica español interpretar y utilizar las distancias provistas por una aplicación de navegación de Los Ángeles, sin modificar las clases existentes.

### Patrón de Diseño Utilizado

Se ha implementado el **patrón Adapter (Adaptador)** que permite la compatibilidad entre interfaces incompatibles. En este caso:

- **ServicioLA**: Representa el servicio de Los Ángeles (Adaptee) que proporciona distancias en millas.
- **Adaptador**: Convierte las distancias en millas a kilómetros (Adapter).
- **App**: Cliente que utiliza el adaptador para obtener las distancias en el formato deseado.

## Instalación

Para acceder al código fuente del proyecto:

1. Clonar el repositorio:
```bash
 git clone git@github.com:blancagiron/DS-Individual.git  
```
2. Navegar a la carpeta del proyecto:
```
cd DS-individual/conversor-distancias
```
3. Instalar las dependencias:
```
npm install
```
4. Iniciar la app:
```
npm run dev
```
5. Abrir el navegador en la dirección indicada (generalmente http://localhost:5173)
## Uso de la aplicación:

1. En el campo "Ingrese millas", introduzca la distancia en millas que desea convertir.
2. Haga clic en el botón "Convertir".
3. La distancia convertida a kilómetros se mostrará en el campo "Distancia Convertida para España".


## Autor
Blanca Girón Ricoy
