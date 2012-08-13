CREATE VIEW `historico_percrend` AS

SELECT *,
    rendimento/valor as perc_rend
FROM `rend-fii`.historico;
