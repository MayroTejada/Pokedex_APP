# Proyecto Pokémon API

![Pokemon](https://img.shields.io/badge/Pok%C3%A9mon-API-red)

Este proyecto es una aplicación desarrollada con una arquitectura limpia, que prioriza la modularidad y la separación de preocupaciones para un mantenimiento y escalabilidad óptimos. Utiliza MobX para el manejo del estado, facilitando la gestión de datos reactivos en toda la aplicación.

## Arquitectura

La estructura de carpetas sigue los principios de la arquitectura limpia, con una clara separación de capas:

- **Presentation**: Contiene los componentes de la interfaz de usuario, manteniendo la lógica de presentación separada de la lógica de negocio.
- **Domain**: Aquí se encuentran los casos de uso y los modelos de dominio, definiendo las reglas de negocio de la aplicación.
- **Data**: Gestiona la obtención de datos, incluyendo la implementación de repositorios y proveedores de datos.

## Consumo de API GraphQL Pokémon

Para obtener datos sobre Pokémon, esta aplicación utiliza GraphQL para realizar consultas eficientes a una API especializada. Esto permite una recuperación rápida y precisa de la información necesaria para mostrar detalles sobre los Pokémon, como sus habilidades, tipos y estadísticas.

## Firebase Distribution para Deploy

La distribución de esta aplicación se realiza a través de Firebase Distribution, una plataforma confiable y escalable que facilita la entrega continua y la distribución de versiones de la aplicación a los usuarios finales. Con Firebase Distribution, garantizamos una experiencia de usuario óptima al desplegar las actualizaciones de forma rápida y segura.

## Instalación

1. Clona este repositorio en tu máquina local.
2. flutter pub get
3. flutter pub run build_runner build --delete-conflicting-outputs
4. Ejecuta la aplicación con `flutter start`.

¡Disfruta explorando el mundo de Pokémon con esta aplicación!

