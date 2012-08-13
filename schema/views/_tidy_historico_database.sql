CREATE VIEW `_tidy_historico_database` AS

SELECT cod_ativo,
    MIN(data_base) AS data_base_min,
    MAX(data_base) AS data_base_max,
    COUNT(*) AS qtd
FROM historico
GROUP BY cod_ativo