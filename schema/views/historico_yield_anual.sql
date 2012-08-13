CREATE VIEW `historico_yield_anual` AS

SELECT cod_ativo,
    YEAR(data_base) as ano,
    COUNT(*) as qtd,
    CAST(EXP(SUM(LOG(yield+1)))-1 as DECIMAL(16,5)) as yield,
    CAST(STDDEV_SAMP(yield)*SQRT(count(*)) as DECIMAL(16,5)) as volatilidade
FROM historico_yield
GROUP BY cod_ativo, YEAR(data_base)
