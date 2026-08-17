-- REGLA 1: "Vaciado de Cuenta" 
-- Lógica: El usuario transfiere o retira dinero y su saldo queda en cero.
-- Iteración: Se agregó un umbral de $100.000 tras descubrir que la regla base
-- generaba 2.4 millones de falsos positivos (fricción comercial inaceptable).

SELECT 
    isFraud AS es_fraude_real,
    COUNT(*) AS cantidad_de_alertas
FROM 
    `Riesgo_Financiero.transacciones`
WHERE 
    type IN ('TRANSFER', 'CASH_OUT') 
    AND newbalanceOrig = 0 
    AND amount > 100000
GROUP BY 
    isFraud;
