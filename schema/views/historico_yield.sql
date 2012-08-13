CREATE VIEW `historico_yield` AS

SELECT *,
    rendimento/valor as yield
FROM `rend-fii`.historico;
