# Predicción de precios inmobiliarios

## Objetivo del proyecto
Este proyecto se centra en comprender los factores influyentes que determinan los precios inmobiliarios y utilizar algoritmos de Machine Learning para la predicción de precios. Como parte del proyecto de medio término del bootcamp de Ironhack, nuestro trabajo explora un conjunto de datos de 22,000 propiedades vendidas entre mayo de 2014 y mayo de 2015 en el condado de King, WA.

## Conjunto de datos
El conjunto de datos contiene información sobre 22,000 propiedades.
El conjunto de datos incluye datos históricos de casas vendidas entre mayo de 2014 y mayo de 2015 en el condado de King, WA.
Estas son las definiciones de los puntos de datos proporcionados:

| Nombre de columna | Descripción |
|-------------------|-------------|
| id                | ID de la casa |
| date              | Fecha en que se vendió la casa |
| bedrooms          | Número de dormitorios |
| bathrooms         | Número de baños |
| sqft_living       | Metros cuadrados de la vivienda |
| sqft_lot          | Metros cuadrados del terreno |
| floors            | Total de pisos en la casa |
| waterfront        | Casa con vista al mar/lago |
| view              | Vistas |
| condition         | Condición general de la casa |
| grade             | Grado general asignado a la unidad de vivienda |
| sqft_above        | Metros cuadrados de la casa excluyendo el sótano |
| sqft_basement     | Metros cuadrados del sótano |
| yr_built          | Año de construcción |
| yr_renovated      | Año en que se renovó la casa |
| zipcode           | Código postal |
| lat               | Coordenada de latitud |
| long              | Coordenada de longitud |
| sqft_living15     | Área de la sala de estar en 2015 (implica renovaciones) |
| sqft_lot15        | Área del terreno en 2015 (implica renovaciones) |
| price             | Precio de la casa |

## Herramientas utilizadas
- **Visualización**: Power BI
- **Análisis exploratorio de datos (EDA)**: MySQL, Python (AVS)
- **Machine Learning**: Python (AVS) utilizando regresión lineal, KNN Regressor y XGBoost Regressor

## Estructura del proyecto:
1. **Importar bibliotecas y configuración inicial**: Inicialización del proceso de exploración y análisis de datos.
2. **Carga y exploración inicial de los datos**: Una mirada rápida a los atributos de los datos, verificación de tipos de datos y detección de valores nulos y duplicados.
3. **Análisis exploratorio de datos (EDA)**: Exploración de la relación entre variables categóricas y el precio, y análisis de la matriz de correlación.
4. **Transformación de datos**: Identificación y transformación de outliers mediante una transformación logarítmica.
5. **División de datos y preparación del modelo**: Separación de características y target, identificación de características categóricas y numéricas, preprocesamiento y división de los datos.
6. **Entrenamiento y evaluación de modelos**: Construcción de modelos mediante regresión lineal, KNN Regressor y XGBoost Regressor, y evaluación de su rendimiento.
7. **Optimización del modelo**: Optimización del modelo XGBoost utilizando GridSearchCV y evaluación del mejor modelo.
8. **Análisis de importancia de características**: Determinación de los principales factores que influyen en el precio.
9. **Interpretación de resultados**: Breve exposición y análisis de los resultados del punto 8.
9. **Análisis de viviendas con precio superior a $650,000**: Exploración específica de las características de las viviendas de alto valor.
10. **Conclusiones**: Resumen de hallazgos y recomendaciones futuras.

## Conclusión general
El modelo XGBoost Regressor afinado surgió como el modelo de mejor rendimiento tras aplicar diversas técnicas de preprocesamiento de datos como la estandarización y la transformación logarítmica.

Características como `grade`, `lat`, y `sqft_living` se encontraron significativamente influyentes en el precio, donde `grade` refleja la calidad de la casa, `lat` representa la ubicación y `sqft_living` indica el tamaño de la vivienda. También destacan un código postal determinado y tener vistas al mar/lago.

Se recomienda considerar factores sociales adicionales como transporte, educación y tasas de criminalidad para una predicción de precios más completa.

## Conclusión sobre las propiedades de más alto valor
Las características identificadas como las más importantes por el modelo XGBoost son razonables y reflejan factores que típicamente influyen en el precio de propiedades de alto valor:

- **Ubicación (zipcode_98039)**: Refleja la alta demanda y los servicios exclusivos de ciertas áreas.
- **Vista al agua (waterfront)**: Aumenta significativamente el valor debido a su atractivo estético.
- **Superficie habitable (sqft_living)**: Mayor superficie suele indicar mayor comodidad y lujo.
- **Calidad de construcción (grade)**: La calidad de los materiales y los acabados es crucial en propiedades de lujo.
- **Posición geográfica (long)**: Puede indicar la proximidad a puntos de interés específicos que afectan el valor de la propiedad.

---

Para una información más exhaustiva sobre insights y la metodología empleada, consultar el archivo ipynb.

## Recursos útiles
- **Presentación** 
- **Dashboard en Power BI** 
- **Sitio web del condado de King**: Nuestra fuente principal de datos. Visita para obtener más insights específicos sobre el mercado inmobiliario.
