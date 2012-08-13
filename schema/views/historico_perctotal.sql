CREATE VIEW `historico_perctotal` AS

SELECT *,
    h1.valor/((SELECT h2.valor
        FROM historico AS h2
        WHERE h2.cod_ativo = h1.cod_ativo AND
        (YEAR(h2.data_base)*100 + MONTH(h2.data_base)) =
        ((YEAR(DATE_SUB(h1.data_base, INTERVAL 1 MONTH))*100 +
        MONTH(DATE_SUB(h1.data_base, INTERVAL 1 MONTH))))
        LIMIT 0,1
    )-h1.rendimento)-1 AS perc
FROM historico AS h1
