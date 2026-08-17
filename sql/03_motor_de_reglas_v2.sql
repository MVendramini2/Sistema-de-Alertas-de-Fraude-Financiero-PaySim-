-- REGLA 1 (V2): Categorización de Riesgo por Umbrales
-- Lógica: Se abandona el modelo binario (Bloqueo/Aprobación) en favor de un 
-- sistema de ruteo para gestionar la carga operativa del equipo de revisión.

SELECT 
    CASE 
        WHEN amount >= 1000000 THEN '1_ALERTA_ROJA_Bloqueo'
        WHEN amount >= 200000 THEN '2_ALERTA_AMARILLA_Revision'
        ELSE '3_VERDE_Aprobado'
    END AS nivel_de_riesgo,
    isFraud AS es_fraude_real,
    COUNT(*) AS cantidad_de_transacciones
FROM 
    `riesgo_financiero.transacciones`
WHERE 
    type IN ('TRANSFER', 'CASH_OUT') 
    AND newbalanceOrig = 0 
GROUP BY 
    nivel_de_riesgo, 
    isFraud
ORDER BY 
    nivel_de_riesgo, 
    isFraud;
