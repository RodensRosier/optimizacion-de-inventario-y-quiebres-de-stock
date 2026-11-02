# Optimización de Inventario y Quiebres de Stock (Ferretería)

## Objetivo del Proyecto
Este proyecto está enfocado en analizar el flujo de inventario operativo en el sector ferretero para minimizar quiebres de stock, determinar puntos de reorden precisos y optimizar el capital inmovilizado en bodega mediante técnicas de segmentación y parámetros estadísticos de control.

---

## Problema de Negocio
En la industria ferretera, el equilibrio de inventario es crítico: la falta de stock (quiebre) provoca ventas perdidas y pérdida de clientes frente a la competencia, mientras que el exceso de inventario inmoviliza capital de trabajo y genera costos de almacenamiento imprevistos. Maximizar la rentabilidad requiere categorizar el catálogo según el impacto financiero de cada producto y automatizar los niveles de reposición basándose en la variabilidad real de la demanda y los tiempos de entrega del proveedor.

---

## Fuente de Datos
- **Dataset obtenido de Kaggle:** Dataset sintético de inventario y transacciones ferreteras (`https://www.kaggle.com/datasets/datatalesbyagos/inventario-ferreteria-hardware-inventorysynth`).

- **Estructura de Datos:** Registros de ventas históricas, maestro de productos (SKUs, stock actual, costo y precio unitario) y catálogo de proveedores (*Lead Time* en días).

- **Métricas Operativas Principales:** Rotación de inventario, Días de Inventario a Mano, Nivel de Servicio y Tasa de Quiebre de Stock.

---

## Stack Tecnológico
- **Lenguaje:** Python 3.13
- **Base de Datos & Consultas:** SQL (SQLite / PostgreSQL / CTEs & Window Functions)
- **Procesamiento de Datos:** Pandas, NumPy
- **Visualización & Dashboarding:** Matplotlib, Seaborn, Tableau
- **Modelado Operativo:** Segmentación ABC (Curva de Pareto 80/20), Stock de Seguridad Estadístico y Punto de Reorden (ROP)

---

## Metodología y Enfoque

### Consultas SQL & Procesamiento Integrado (`sql/` & `01_eda_limpieza_inventario.ipynb`)
- **Agregaciones de Ventas:** Consolidación mensual y diaria de transacciones por SKU mediante `GROUP BY` y agregaciones para evaluar la estabilidad de la demanda.

- **Clasificación ABC Dinámica:** Uso de Window Functions (`SUM() OVER`) para calcular los ingresos acumulados y clasificar automáticamente los productos en Categorías A (80% de ingresos), B (15%) y C (5%).

- **Limpieza de Datos:** Verificación de consistencia entre SKUs, tratamiento de discrepancias en series de tiempo y gestión de valores nulos o atípicos en los precios de reposición.

## Resultados e Impacto de Negocio
- **Priorización del Catálogo:** La segmentación ABC aisló los productos de Categoría A (20% del catálogo) que representan el 80% del valor del negocio, permitiendo enfocar la gestión operativa en los ítems de mayor impacto financiero.

- **Prevención de Quiebres:** El modelo de Punto de Reorden identified los SKUs en riesgo inminente de quiebre, generando alertas tempranas antes de impactar el nivel de servicio al cliente.

- **Optimización de Capital:** Se definieron estrategias diferenciadas: automatización de reabastecimiento para la Categoría A y planes de liquidación promocional para la Categoría C, liberando capital inmovilizado en bodega.

---

## Estructura del Repositorio
```text
optimizacion-de-inventario-y-quiebres-de-stock/
│
├── dashboard/
│   └── screenshot/           # Captura de pantalla de dashboard de Tableau
│
├── data/
│   ├── raw/                  # Dataset original de ventas, inventario y proveedores
│   └── processed/            # Dataset procesado con clasificación ABC, ROP y alertas
│
├── docs/
│   └── presentacion.pdf      # Presentación para comunicar los hallazgos de los análisis 
│
├── notebooks/ 
│   └── 01_eda_limpieza_inventario.ipynb  # Auditoría, limpieza y exploración de datos, Modelamiento ABC, ROP y análisis estadístico
│ 
├── sql/
│   ├── 01_agregaciones_mensuales.sql  # Consolidación de demanda histórica
│   ├── 02_clasificacion_abc.sql       # Curva de Pareto con Window Functions
│   └── 03_calculo_rop_alertas.sql     # Lógica de Stock de Seguridad y ROP
│
├── .gitignore
├── LICENSE                    # Licencia del proyecto
├── README.md                  # Documentación principal
└── requirements.txt           # Dependencias de Python necesarias
```

---

## Cómo Ejecutar el Proyecto
1. Clonar el repositorio:
   ```bash
   git clone https://github.com/rodensrosier/optimizacion-de-inventario-y-quiebres-de-stock.git
   cd optimizacion-de-inventario-y-quiebres-de-stock
   ```
2. Instalar las dependencias:
   ```bash
   pip install -r requirements.txt
   ```
3. Ejecutar los scripts SQL en tu motor de base de datos o revisar el flujo en los notebooks de la carpeta `notebooks/`.