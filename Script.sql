-- 1. RADIOGRAFÍA DEL NEGOCIO (Desbalance de Clases)
-- Objetivo: Determinar el porcentaje histórico de fraude y el volumen de dinero en riesgo
-- para justificar la necesidad de un motor de reglas ante la gerencia.

SELECT 
    isFraud AS es_fraude, 
    COUNT(*) AS cantidad_operaciones,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `riesgo_financiero.transacciones`), 3) AS porcentaje_del_total,
    SUM(amount) AS plata_total_involucrada
FROM 
    `riesgo_financiero.transacciones`
GROUP BY 
    isFraud
ORDER BY 
    isFraud;

-- 2. MODUS OPERANDI (Vectores de Ataque)
-- Objetivo: Identificar qué canales (tipo de operación) utilizan los estafadores 
-- para enfocar las reglas de bloqueo automático en esas áreas de alto riesgo.

SELECT 
    type AS tipo_operacion,
    COUNT(*) AS cantidad_fraudes,
    SUM(amount) AS plata_robada
FROM 
    `riesgo_financiero.transacciones`
WHERE 
    isFraud = 1
GROUP BY 
    type
ORDER BY 
    cantidad_fraudes DESC;
