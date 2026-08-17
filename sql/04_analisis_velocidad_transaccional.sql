/* FASE 4: Análisis de Velocidad (Hipótesis Descartada)
============================================================================ */

-- HIPÓTESIS: Los estafadores utilizan "Cuentas Mula" que reciben múltiples 
-- transferencias en una misma hora para consolidar el dinero robado.

WITH Perfilado_Recepciones AS (
    SELECT 
        nameDest,
        step,
        isFraud,
        COUNT(*) OVER(PARTITION BY nameDest, step) AS recepciones_en_la_misma_hora
    FROM 
        `riesgo_financiero.transacciones`
    WHERE 
        type = 'TRANSFER'
)
SELECT 
    recepciones_en_la_misma_hora,
    isFraud AS es_fraude_real,
    COUNT(*) AS cantidad_de_casos
FROM 
    Perfilado_Recepciones
GROUP BY 
    recepciones_en_la_misma_hora,
    isFraud
ORDER BY 
    recepciones_en_la_misma_hora DESC, 
    isFraud;

-- CONCLUSIÓN DE NEGOCIO: 
-- Hipótesis refutada. El 99.8% de los fraudes utilizan una cuenta destino única 
-- por cada ataque. La alta velocidad de recepción (2 a 12 transferencias/hora) 
-- es un comportamiento exclusivo de clientes legítimos (posibles comercios). 
-- No se implementarán reglas de bloqueo por velocidad para evitar falsos positivos críticos.
