SELECT 
    h.nombre AS hotel,
    CONCAT(p.apellido_p, ' ', p.apellido_m) AS apellidos_árbitro,
    a.experiencia
FROM alojamiento al
JOIN hotel h 
    ON al.id_hotel = h.id_hotel
JOIN participante p 
    ON al.no_asociado = p.no_asociado
JOIN arbitro a 
    ON p.no_asociado = a.no_asociado;


SELECT
    CONCAT(p.nombre, ' ', p.apellido_p, ' ', p.apellido_m) AS jugador,
    j.nivel,
    pa.nombre_pais AS país
FROM participante p
JOIN jugador j 
    ON p.no_asociado = j.no_asociado
JOIN pais pa 
    ON p.num_correlativo = pa.num_correlativo;


SELECT
    pt.cod_partida,
    j.fecha       AS jornada,
    s.id_sala
FROM partida pt
JOIN jornada j 
    ON pt.id_jornada = j.id_jornada
JOIN sala s 
    ON pt.id_sala = s.id_sala;


SELECT
    pt.cod_partida,
    j.fecha                             AS jornada,
    s.id_sala,
    CONCAT(pb.nombre, ' ', pb.apellido_p, ' ', pb.apellido_m) AS jugador_blancas,
    CONCAT(pn.nombre, ' ', pn.apellido_p, ' ', pn.apellido_m) AS jugador_negras,
    CONCAT(pa.nombre, ' ', pa.apellido_p, ' ', pa.apellido_m) AS árbitro
FROM partida pt
JOIN jornada j 
    ON pt.id_jornada = j.id_jornada
JOIN sala s 
    ON pt.id_sala = s.id_sala
JOIN partida_participante pp 
    ON pt.cod_partida = pp.cod_partida

JOIN jugador jb 
    ON pp.id_jugador_blancas = jb.id_jugador
JOIN participante pb 
    ON jb.no_asociado = pb.no_asociado

JOIN jugador jn 
    ON pp.id_jugador_negras = jn.id_jugador
JOIN participante pn 
    ON jn.no_asociado = pn.no_asociado

JOIN arbitro ar 
    ON pp.id_arbitro = ar.id_arbitro
JOIN participante pa 
    ON ar.no_asociado = pa.no_asociado;


SELECT 
    cod_partida,
    id_jugador_blancas AS id_jugador,
    color1             AS color
FROM partida_participante
UNION ALL
SELECT
    cod_partida,
    id_jugador_negras AS id_jugador,
    color2            AS color
FROM partida_participante;


SELECT
    pt.cod_partida,
    j.fecha                             AS jornada,
    CONCAT(pa.nombre, ' ', pa.apellido_p, ' ', pa.apellido_m) AS árbitro
FROM partida pt
JOIN jornada j 
    ON pt.id_jornada = j.id_jornada
JOIN partida_participante pp 
    ON pt.cod_partida = pp.cod_partida
JOIN arbitro ar 
    ON pp.id_arbitro = ar.id_arbitro
JOIN participante pa 
    ON ar.no_asociado = pa.no_asociado;


SELECT 
    p.no_asociado,
    CONCAT(p.nombre, ' ', p.apellido_p, ' ', p.apellido_m) AS nombre,
    'JUGADOR'                                             AS rol,
    j.nivel                                               AS atributo
FROM participante p
JOIN jugador j 
    ON p.no_asociado = j.no_asociado
UNION ALL
SELECT
    p.no_asociado,
    CONCAT(p.nombre, ' ', p.apellido_p, ' ', p.apellido_m) AS nombre,
    'ÁRBITRO'                                             AS rol,
    ar.experiencia                                        AS atributo
FROM participante p
JOIN arbitro ar 
    ON p.no_asociado = ar.no_asociado;


SELECT
    pa.nombre_pais     AS país,
    pr.nombre_pais     AS representa_a
FROM pais pa
LEFT JOIN pais pr 
    ON pa.num_representante = pr.num_correlativo;


SELECT
    pa.nombre_pais     AS país,
    pr.nombre_pais     AS representa_a,
    CONCAT(p.nombre, ' ', p.apellido_p, ' ', p.apellido_m) AS jugador
FROM pais pa
JOIN pais pr 
    ON pa.num_representante = pr.num_correlativo
JOIN participante p 
    ON p.num_correlativo = pa.num_correlativo
JOIN jugador j 
    ON p.no_asociado = j.no_asociado;


SELECT
    pp.id_jugador_blancas AS id_jugador,
    COUNT(*)              AS veces_blancas
FROM partida_participante pp
WHERE pp.id_jugador_blancas = :id_jugador
GROUP BY pp.id_jugador_blancas;
