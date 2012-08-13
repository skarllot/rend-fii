CREATE VIEW `cdi_anual` AS

SELECT ano,
    count(*) as meses,
    EXP(SUM(LOG(rendimento+1)))-1 as rendimento,
    STDDEV_SAMP(rendimento)*SQRT(count(*)) as volatilidade
FROM cdi
GROUP BY ano
