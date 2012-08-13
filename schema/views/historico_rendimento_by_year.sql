CREATE VIEW `historico_rendimento_by_year` AS

SELECT cod_ativo,
    YEAR(data_base) as ano,
    COUNT(*) as qtd,
    SUM(rendimento) as rendimento
FROM historico
WHERE NOT rendimento IS NULL
GROUP BY cod_ativo, YEAR(data_base)