PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

INSERT INTO Pais (pais_id, nome) VALUES
    (1, 'Portugal'),
    (2, 'Espanha');

INSERT INTO Localidade (localidade_id, nome, pais_id) VALUES
    (1, 'Porto', 1),
    (3, 'Matosinhos', 1),
    (4, 'Maia', 1),
    (5, 'Póvoa de Varzim', 1),
    (7, 'Santarém', 1);

INSERT INTO Clube (clube_id, nome, morada, telemovel, email, localidade_id) VALUES
    (1, 'Clube de Xadrez da Invicta', 'Rua de Santa Catarina, 412', '+351 925 582 115', 'geral@xadrezinvicta.pt', 1),
    (4, 'Clube de Xadrez Leça da Palmeira', 'Rua Hintze Ribeiro, 210', '+351 934 976 197', 'xadrez.lecadapalmeira@gmail.com', 3),
    (5, 'Clube de Xadrez Castêlo da Maia', 'Rua do Castêlo, 33', '+351 931 152 431', 'geral@cxcastelodamaia.pt', 4),
    (6, 'Clube de Xadrez Póvoa Mar', 'Avenida dos Banhos, 300', '+351 912 142 908', 'povoamar.xadrez@sapo.pt', 5),
    (8, 'Clube de Xadrez Scalabitano', 'Largo do Seminário, 12', '+351 962 384 676', 'geral@xadrezscalabitano.pt', 7);

INSERT INTO Jogador (num_identificacao, nome, data_nascimento, telemovel, email, rating_atual, clube_id) VALUES
    ('05845689 9 ZW2', 'Joaquim Fernando Azevedo', '1956-01-30', '+351 928 267 413', 'joaquim.azevedo@sapo.pt', 1823, 1),
    ('13909532 2 ZW0', 'Duarte Miguel Fonseca', '1991-12-14', '+351 967 003 757', 'duarte.fonseca91@gmail.com', 1755, 6),
    ('08526656 6 ZW0', 'Afonso Manuel Barbosa', '1968-03-03', '+351 922 310 253', 'afonso.barbosa@outlook.pt', 1948, 5),
    ('04110060 3 ZY0', 'Fernando José Mourão', '1949-11-11', '+351 918 035 065', 'fernando.mourao49@sapo.pt', 1620, 8),
    ('14231550 8 ZX0', 'Raquel Machado Torres', '1993-06-21', '+351 964 796 169', 'raquel.torres@hotmail.com', 1726, 1),
    ('12623963 0 ZZ4', 'Vasco Duarte Lima', '1986-02-09', '+351 918 537 529', 'vasco.lima86@gmail.com', 1573, 4),
    ('15718792 6 ZZ3', 'Bruno Miguel Esteves', '1999-08-08', '+351 935 494 118', 'bruno.esteves@hotmail.com', 1450, NULL),
    ('17651378 7 ZZ4', 'Carolina Freitas Araújo', '2008-01-15', '+351 938 862 542', 'carolina.araujo@outlook.pt', 1400, 6),
    ('17199186 9 ZY4', 'Simão Pedro Vaz', '2006-05-05', '+351 910 811 213', 'simao.vaz@gmail.com', 1400, 8);

INSERT INTO Categoria (categoria_id, nome) VALUES
    (1, 'Árbitro Internacional'),
    (2, 'Árbitro FIDE'),
    (3, 'Árbitro Nacional A'),
    (4, 'Árbitro Nacional B'),
    (5, 'Árbitro Distrital');

INSERT INTO Arbitro (num_identificacao, nome, data_nascimento, telemovel, email, categoria_id) VALUES
    ('10908557 4 ZZ5', 'Helena Maria Quintas', '1978-08-03', '+351 961 883 479', 'helena.quintas78@outlook.pt', 2),
    ('14959410 0 ZX3', 'Alberto Silva Cunha', '1996-11-05', '+351 961 798 634', 'alberto.cunha96@sapo.pt', 5);

INSERT INTO Motivo_Termino (motivo_id, nome) VALUES
    (1, 'Xeque-Mate'),
    (2, 'Tempo'),
    (3, 'Abandono'),
    (4, 'Acordo');

INSERT INTO Torneio (torneio_id, nome, espaco, data_inicio, data_fim, data_limite_inscricao, rating_minimo, tempo_inicial_min, incremento_seg, localidade_id) VALUES
    (1, 'Torneio Clássico da Primavera', 'Biblioteca Municipal', '2025-04-05', '2025-04-19', '2025-03-29', 1400, 90, 30, 3),
    (6, 'Open Internacional de Verão da Póvoa de Varzim', 'Biblioteca Municipal', '2027-07-24', '2027-07-31', '2027-07-15', 1200, 60, 30, 5);

INSERT INTO Classificacao (torneio_id, pontos, vitorias, rating_inicial, posicao) VALUES
    (1, 2.5, 2, 1945, 1),
    (1, 2.0, 1, 1710, 2),
    (1, 1.0, 0, 1840, 3),
    (1, 0.5, 0, 1575, 4),
    (6, 0.0, 0, 1400, NULL),  
    (6, 0.0, 0, 1620, NULL),  
    (6, 0.0, 0, 1755, NULL);

INSERT INTO Inscricao (jogador_id, torneio_id, data_inscricao, rating_inicial, pontos, vitorias) VALUES
    ('14231550 8 ZX0', 1, '2025-03-27', 1710, 2.0, 1),
    ('12623963 0 ZZ4', 1, '2025-03-27', 1575, 0.5, 0),
    ('05845689 9 ZW2', 1, '2025-03-28', 1840, 1.0, 0),
    ('08526656 6 ZW0', 1, '2025-03-29', 1945, 2.5, 2),
    ('17651378 7 ZZ4', 6, '2026-10-14', 1400, 0.0, 0),
    ('13909532 2 ZW0', 6, '2026-10-23', 1755, 0.0, 0),
    ('04110060 3 ZY0', 6, '2026-10-29', 1620, 0.0, 0),
    ('17199186 9 ZY4', 6, '2026-11-06', 1400, 0.0, 0);

INSERT INTO Ronda (torneio_id, numero) VALUES
    (1, 1),
    (1, 2),
    (1, 3);

INSERT INTO Partida (ronda_torneio, ronda_numero, mesa, data_hora_inicio, duracao_min, arbitro_id, motivo_termino) VALUES
    (1, 1, 1, '2025-04-05 15:00:00', 9.9, '10908557 4 ZZ5', 4),
    (1, 1, 2, '2025-04-05 15:00:00', 15.2, '10908557 4 ZZ5', 4),
    (1, 2, 1, '2025-04-12 15:00:00', 4.5, '10908557 4 ZZ5', 4),
    (1, 2, 2, '2025-04-12 15:00:00', 65.2, '10908557 4 ZZ5', 1),
    (1, 3, 1, '2025-04-19 15:00:00', 27.5, '10908557 4 ZZ5', 3), 
    (1, 3, 2, '2025-04-19 15:00:00', 31.1, '10908557 4 ZZ5', 3);  

INSERT INTO Participacao (partida_torneio, partida_numero, partida_mesa, inscricao_jogador, cor, pontos) VALUES
    (1, 1, 1, '12623963 0 ZZ4', 'Brancas', 0.5),
    (1, 1, 1, '05845689 9 ZW2', 'Pretas', 0.5),
    (1, 1, 2, '08526656 6 ZW0', 'Brancas', 0.5),
    (1, 1, 2, '14231550 8 ZX0', 'Pretas', 0.5),
    (1, 2, 1, '05845689 9 ZW2', 'Brancas', 0.5),
    (1, 2, 1, '14231550 8 ZX0', 'Pretas', 0.5),
    (1, 2, 2, '12623963 0 ZZ4', 'Brancas', 0),
    (1, 2, 2, '08526656 6 ZW0', 'Pretas', 1),
    (1, 3, 1, '08526656 6 ZW0', 'Brancas', 1),
    (1, 3, 1, '05845689 9 ZW2', 'Pretas', 0),
    (1, 3, 2, '14231550 8 ZX0', 'Brancas', 1),
    (1, 3, 2, '12623963 0 ZZ4', 'Pretas', 0);

INSERT INTO Jogada (partida_torneio, partida_numero, partida_mesa, ordem, notacao, duracao_seg) VALUES
    (1, 1, 1, 1, 'd4', 34), (1, 1, 1, 2, 'd5', 24),
    (1, 1, 1, 3, 'c4', 39), (1, 1, 1, 4, 'dxc4', 24),
    (1, 1, 1, 5, 'Cf3', 10), (1, 1, 1, 6, 'Cf6', 36),
    (1, 1, 1, 7, 'e3', 29), (1, 1, 1, 8, 'e6', 15),
    (1, 1, 1, 9, 'Bxc4', 14), (1, 1, 1, 10, 'c5', 10),
    (1, 1, 1, 11, 'Cc3', 106), (1, 1, 1, 12, 'Be7', 55),
    (1, 1, 1, 13, 'Dd3', 112), (1, 1, 1, 14, 'a6', 74);

INSERT INTO Jogada (partida_torneio, partida_numero, partida_mesa, ordem, notacao, duracao_seg) VALUES
    (1, 1, 2, 1, 'e4', 22), (1, 1, 2, 2, 'e5', 20),
    (1, 1, 2, 3, 'f4', 32), (1, 1, 2, 4, 'exf4', 26),
    (1, 1, 2, 5, 'Cf3', 13), (1, 1, 2, 6, 'g5', 40),
    (1, 1, 2, 7, 'h4', 21), (1, 1, 2, 8, 'g4', 19),
    (1, 1, 2, 9, 'Ce5', 69), (1, 1, 2, 10, 'Cf6', 65),
    (1, 1, 2, 11, 'Bc4', 125), (1, 1, 2, 12, 'd5', 201),
    (1, 1, 2, 13, 'exd5', 164), (1, 1, 2, 14, 'Ch5', 61);

INSERT INTO Jogada (partida_torneio, partida_numero, partida_mesa, ordem, notacao, duracao_seg) VALUES
    (1, 2, 1, 1, 'e4', 5), (1, 2, 1, 2, 'e5', 15),
    (1, 2, 1, 3, 'Cf3', 6), (1, 2, 1, 4, 'Cc6', 7),
    (1, 2, 1, 5, 'Bc4', 16), (1, 2, 1, 6, 'Bc5', 8),
    (1, 2, 1, 7, 'c3', 29), (1, 2, 1, 8, 'Cf6', 32),
    (1, 2, 1, 9, 'd3', 6), (1, 2, 1, 10, 'd6', 3),
    (1, 2, 1, 11, 'O-O', 13), (1, 2, 1, 12, 'O-O', 42);

INSERT INTO Jogada (partida_torneio, partida_numero, partida_mesa, ordem, notacao, duracao_seg) VALUES
    (1, 2, 2, 1, 'Cf3', 22), (1, 2, 2, 2, 'd5', 10),
    (1, 2, 2, 3, 'g3', 8), (1, 2, 2, 4, 'Cf6', 22),
    (1, 2, 2, 5, 'Bg2', 28), (1, 2, 2, 6, 'c6', 9),
    (1, 2, 2, 7, 'O-O', 3), (1, 2, 2, 8, 'Bg4', 14),
    (1, 2, 2, 9, 'd3', 5), (1, 2, 2, 10, 'Cbd7', 8),
    (1, 2, 2, 11, 'De1', 71), (1, 2, 2, 12, 'e5', 68),
    (1, 2, 2, 13, 'Bf4', 96), (1, 2, 2, 14, 'exf4', 187),
    (1, 2, 2, 15, 'gxf4', 17), (1, 2, 2, 16, 'Bd6', 84),
    (1, 2, 2, 17, 'e4', 43), (1, 2, 2, 18, 'dxe4', 105),
    (1, 2, 2, 19, 'dxe4', 192), (1, 2, 2, 20, 'Bxf4', 141),
    (1, 2, 2, 21, 'e5', 222), (1, 2, 2, 22, 'Cd5', 384),
    (1, 2, 2, 23, 'Cc3', 143), (1, 2, 2, 24, 'Bxf3', 256),
    (1, 2, 2, 25, 'Cxd5', 139), (1, 2, 2, 26, 'cxd5', 188),
    (1, 2, 2, 27, 'a4', 369), (1, 2, 2, 28, 'Dg5', 344),
    (1, 2, 2, 29, 'e6', 120), (1, 2, 2, 30, 'Dxg2#', 614);

INSERT INTO Jogada (partida_torneio, partida_numero, partida_mesa, ordem, notacao, duracao_seg) VALUES
    (1, 3, 1, 1, 'd4', 15), (1, 3, 1, 2, 'd5', 7),
    (1, 3, 1, 3, 'c4', 12), (1, 3, 1, 4, 'e6', 23),
    (1, 3, 1, 5, 'Cc3', 19), (1, 3, 1, 6, 'Cf6', 15),
    (1, 3, 1, 7, 'Bg5', 36), (1, 3, 1, 8, 'Be7', 29),
    (1, 3, 1, 9, 'cxd5', 78), (1, 3, 1, 10, 'c6', 27),
    (1, 3, 1, 11, 'dxe6', 91), (1, 3, 1, 12, 'Cd5', 83),
    (1, 3, 1, 13, 'exf7+', 75), (1, 3, 1, 14, 'Rd7', 137),
    (1, 3, 1, 15, 'Bd2', 276), (1, 3, 1, 16, 'Cxc3', 165),
    (1, 3, 1, 17, 'bxc3', 66), (1, 3, 1, 18, 'Bg5', 111),
    (1, 3, 1, 19, 'f4', 162), (1, 3, 1, 20, 'Bh4+', 62),
    (1, 3, 1, 21, 'g3', 134);

INSERT INTO Jogada (partida_torneio, partida_numero, partida_mesa, ordem, notacao, duracao_seg) VALUES
    (1, 3, 2, 1, 'e4', 36), (1, 3, 2, 2, 'c5', 26),
    (1, 3, 2, 3, 'c3', 14), (1, 3, 2, 4, 'Cf6', 4),
    (1, 3, 2, 5, 'e5', 21), (1, 3, 2, 6, 'Cd5', 13),
    (1, 3, 2, 7, 'd4', 10), (1, 3, 2, 8, 'cxd4', 12),
    (1, 3, 2, 9, 'Cf3', 7), (1, 3, 2, 10, 'Cc6', 48),
    (1, 3, 2, 11, 'Bc4', 35), (1, 3, 2, 12, 'dxc3', 169),
    (1, 3, 2, 13, 'Dxd5', 36), (1, 3, 2, 14, 'e6', 45),
    (1, 3, 2, 15, 'Dd1', 73), (1, 3, 2, 16, 'd5', 119),
    (1, 3, 2, 17, 'exd6', 73), (1, 3, 2, 18, 'a6', 24),
    (1, 3, 2, 19, 'Cxc3', 97), (1, 3, 2, 20, 'h5', 257),
    (1, 3, 2, 21, 'O-O', 639);

COMMIT;