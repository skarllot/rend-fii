CREATE VIEW `historico_yield_anual` AS

SELECT cod_ativo,
    YEAR(data_base) as ano,
    COUNT(*) as qtd,
    CAST(EXP(SUM(LOG(perc_rend+1)))-1 as DECIMAL(16,5)) as yield,
    CAST(STDDEV_SAMP(perc_rend)*SQRT(count(*)) as DECIMAL(16,5)) as volatilidade
FROM historico_yield
GROUP BY cod_ativo, YEAR(data_base)
