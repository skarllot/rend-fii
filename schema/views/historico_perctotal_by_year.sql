CREATE VIEW `historico_perctotal_by_year` AS

SELECT h.cod_ativo,
    YEAR(h.data_base) AS ano,
    EXP(SUM(LOG(h.perc+1)))-1 AS perc,
    STDDEV_SAMP(h.perc)*SQRT(count(*)) AS volatilidade
FROM historico_perctotal AS h
WHERE NOT h.perc IS NULL AND
    NOT (SELECT valor
        FROM historico AS h2
        WHERE h2.cod_ativo = h.cod_ativo AND
        YEAR(h2.data_base) = (YEAR(h.data_base)-1) AND
        MONTH(h2.data_base) = 12
        LIMIT 0,1) IS NULL
GROUP BY cod_ativo, YEAR(h.data_base)