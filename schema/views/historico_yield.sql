CREATE VIEW `historico_yield` AS

SELECT *,
    dist_mensal/valor as yield
FROM historico;
