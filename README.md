# Sistema-de-Alertas-de-Fraude-Financiero-PaySim

# 🛡️ Financial Fraud Analytics & Rule Engine

**Rol:** Business Analyst
**Stack Tecnológico:** Google BigQuery (SQL), Tableau  
**Dataset:** PaySim (Mobile Money Simulator - 6.3M Transacciones)

## 🎯 Objetivo del Proyecto
Diseñar la lógica analítica de un sistema de prevención de fraude para transacciones financieras. El proyecto abarca desde la ingesta masiva de datos en Google Cloud (BigQuery) hasta la creación de un motor de reglas (SQL) para identificar comportamientos anómalos y reducir la fuga de capitales, equilibrando la seguridad con la experiencia del usuario (control de falsos positivos).

## 📊 Bitácora Analítica y Hallazgos (Fase 1: Diagnóstico)

Antes de programar alertas de bloqueo, se realizó un diagnóstico operativo para entender la naturaleza del fraude en la base de datos:

*   **El Problema del Desbalance:** Se procesaron más de 6.3 millones de transacciones. Se descubrió que el fraude representa apenas el **0.129%** del total operativo (8.213 casos históricos). Sin embargo, este volumen en apariencia minúsculo involucra un riesgo superior a los **12.000 millones** en el período analizado.
*   **Modus Operandi (Vector de Ataque):** 
    > Fila	tipo_operacion	cantidad_fraudes	plata_robada
        1	CASH_OUT	4116	5989202243.83
        2	TRANSFER	4097	6067213184.0099983	

## 📂 Estructura del Repositorio
*   `/scripts_sql/`: Contiene todo el código SQL utilizado en BigQuery, comentado con enfoque de negocio.
*   `/dashboards/`: Enlaces a los tableros gerenciales en Tableau.

---
*Proyecto desarrollado para simular entornos reales de toma de decisiones basadas en datos.*
