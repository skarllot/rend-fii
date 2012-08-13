CREATE VIEW `historico_distanual` AS

SELECT cod_ativo,
    YEAR(data_base) as ano,
    COUNT(*) as qtd,
    SUM(dist_mensal) as dist_anual
FROM historico
WHERE NOT dist_mensal IS NULL
GROUP BY cod_ativo, YEAR(data_base)
