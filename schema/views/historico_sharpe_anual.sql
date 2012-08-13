CREATE VIEW `historico_sharpe_anual` AS

SELECT h.cod_ativo,
    h.ano,
    h.perc,
    h.volatilidade,
    (h.perc-c.rendimento)/h.volatilidade as sharpe
FROM historico_perctotal_anual AS h
INNER JOIN cdi_anual AS c ON (h.ano = c.ano);
