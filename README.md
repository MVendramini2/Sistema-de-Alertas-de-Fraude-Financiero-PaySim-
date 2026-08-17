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


## ⚙️ Desarrollo del Motor de Reglas (Iteración Analítica)

**Regla 1: Detección de "Vaciado de Cuenta" (Account Draining)**
Se diseñó un algoritmo para detectar transacciones (`TRANSFER` y `CASH_OUT`) que dejan el saldo final de la cuenta emisora en cero. 

*   **Versión 1.0 (Sin umbrales):** Detectó el 97.8% del fraude, pero generó 2.4 millones de falsos positivos. Inviable a nivel operativo.
*   **Versión 2.0 (Sistema de Triage):** Se implementó un semáforo de riesgo segmentando por volumen de capital (Mayor a 1M, Mayor a 200k, Menor a 200k). 
*   **Insight Operativo:** El análisis demostró que evaluar operaciones aisladas satura la capacidad operativa del equipo de revisión manual (más de 1 millón de alertas amarillas). Se determinó que el motor debe incorporar lógica de comportamiento temporal (velocidad transaccional) para reducir la tasa de falsas alarmas.

---
*Proyecto desarrollado para simular entornos reales de toma de decisiones basadas en datos.*



