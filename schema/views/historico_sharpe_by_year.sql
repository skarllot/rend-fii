CREATE VIEW `historico_sharpe_by_year` AS

SELECT h.cod_ativo,
    h.ano,
    h.perc,
    h.volatilidade,
    (h.perc-c.rendimento)/h.volatilidade as sharpe
FROM historico_perctotal_by_year AS h
INNER JOIN cdi_by_year AS c ON (h.ano = c.ano);