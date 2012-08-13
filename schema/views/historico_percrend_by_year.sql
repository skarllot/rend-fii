CREATE VIEW `historico_percrend_by_year` AS

SELECT cod_ativo,
    YEAR(data_base) as ano,
    COUNT(*) as meses,
    CAST(EXP(SUM(LOG(perc_rend+1)))-1 as DECIMAL(16,5)) as perc_rend,
    CAST(STDDEV_SAMP(perc_rend)*SQRT(count(*)) as DECIMAL(16,5)) as volatilidade
FROM historico_percrend
GROUP BY cod_ativo, YEAR(data_base)