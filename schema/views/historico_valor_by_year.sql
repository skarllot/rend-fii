CREATE VIEW `historico_valor_by_year` AS

SELECT
    h1.cod_ativo,
    YEAR(h1.data_base) AS ano,
    (SELECT h2.valor
        FROM historico AS h2
        WHERE h2.cod_ativo = h1.cod_ativo AND
        YEAR(h2.data_base) = (YEAR(h1.data_base)-1) AND
        MONTH(h2.data_base) = 12 LIMIT 0,1) AS valor_inicial,
    (SELECT h2.valor
        FROM historico AS h2
        WHERE h2.cod_ativo = h1.cod_ativo AND
        YEAR(h2.data_base) = YEAR(h1.data_base) AND
        MONTH(h2.data_base) = 12 LIMIT 0,1) AS valor_final
FROM historico AS h1
GROUP BY h1.cod_ativo, YEAR(h1.data_base)