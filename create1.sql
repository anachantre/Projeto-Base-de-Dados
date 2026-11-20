PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Participacao;
DROP TABLE IF EXISTS Jogada;
DROP TABLE IF EXISTS Partida;
DROP TABLE IF EXISTS Inscricao;
DROP TABLE IF EXISTS Classificacao;
DROP TABLE IF EXISTS Ronda;
DROP TABLE IF EXISTS Torneio;
DROP TABLE IF EXISTS Arbitro;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Motivo_Termino;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Localidade;
DROP TABLE IF EXISTS Pais;

CREATE TABLE Pais (
    pais_id INTEGER PRIMARY KEY,
    nome    TEXT NOT NULL UNIQUE
) STRICT;

CREATE TABLE Localidade (
    localidade_id INTEGER PRIMARY KEY,
    nome          TEXT NOT NULL,
    pais_id       INTEGER NOT NULL REFERENCES Pais (pais_id),
    UNIQUE (nome, pais_id)
) STRICT;

CREATE TABLE Clube (
    clube_id      INTEGER PRIMARY KEY,
    nome          TEXT NOT NULL,
    morada        TEXT NOT NULL,
    telemovel     TEXT NOT NULL,
    email         TEXT NOT NULL,
    localidade_id INTEGER NOT NULL REFERENCES Localidade (localidade_id)
) STRICT;

CREATE TABLE Jogador (
    num_identificacao TEXT PRIMARY KEY NOT NULL,
    nome              TEXT NOT NULL,
    data_nascimento   TEXT NOT NULL CHECK (data_nascimento IS date(data_nascimento, '+0 days')),
    telemovel         TEXT NOT NULL,
    email             TEXT NOT NULL,
    rating_atual      INTEGER NOT NULL CHECK (rating_atual >= 0),
    clube_id          INTEGER REFERENCES Clube (clube_id)
) STRICT;

CREATE TABLE Categoria (
    categoria_id INTEGER PRIMARY KEY,
    nome         TEXT NOT NULL UNIQUE
) STRICT;

CREATE TABLE Arbitro (
    num_identificacao TEXT PRIMARY KEY NOT NULL,
    nome              TEXT NOT NULL,
    data_nascimento   TEXT NOT NULL CHECK (data_nascimento IS date(data_nascimento, '+0 days')),
    telemovel         TEXT NOT NULL,
    email             TEXT NOT NULL,
    categoria_id      INTEGER NOT NULL REFERENCES Categoria (categoria_id)
) STRICT;

CREATE TABLE Torneio (
    torneio_id            INTEGER PRIMARY KEY,
    nome                  TEXT NOT NULL,
    espaco                TEXT NOT NULL,
    data_inicio           TEXT NOT NULL CHECK (data_inicio IS date(data_inicio, '+0 days')),
    data_fim              TEXT NOT NULL CHECK (data_fim IS date(data_fim, '+0 days')),
    data_limite_inscricao TEXT NOT NULL CHECK (data_limite_inscricao IS date(data_limite_inscricao, '+0 days')),
    rating_minimo         INTEGER NOT NULL CHECK (rating_minimo >= 0),
    tempo_inicial_min     REAL NOT NULL CHECK (tempo_inicial_min > 0),
    incremento_seg        REAL NOT NULL CHECK (incremento_seg >= 0),
    localidade_id         INTEGER NOT NULL REFERENCES Localidade (localidade_id),
    CHECK (data_inicio <= data_fim),
    CHECK (data_limite_inscricao < data_inicio)
) STRICT;

CREATE TABLE Ronda (
    torneio_id INTEGER NOT NULL REFERENCES Torneio (torneio_id),
    numero     INTEGER NOT NULL CHECK (numero >= 1),
    PRIMARY KEY (torneio_id, numero)
) STRICT;

CREATE TABLE Motivo_Termino (
    motivo_id INTEGER PRIMARY KEY,
    nome      TEXT NOT NULL UNIQUE
) STRICT;

CREATE TABLE Partida (
    ronda_torneio    INTEGER NOT NULL,
    ronda_numero     INTEGER NOT NULL,
    mesa             INTEGER NOT NULL CHECK (mesa >= 1),
    data_hora_inicio TEXT NOT NULL CHECK (data_hora_inicio IS datetime(data_hora_inicio, '+0 seconds')),
    duracao_min      REAL NOT NULL CHECK (duracao_min > 0),
    arbitro_id       TEXT NOT NULL REFERENCES Arbitro (num_identificacao),
    motivo_termino   INTEGER NOT NULL REFERENCES Motivo_Termino (motivo_id),
    PRIMARY KEY (ronda_torneio, ronda_numero, mesa),
    FOREIGN KEY (ronda_torneio, ronda_numero)
        REFERENCES Ronda (torneio_id, numero)
) STRICT;

CREATE TABLE Jogada (
    partida_torneio INTEGER NOT NULL,
    partida_numero  INTEGER NOT NULL,
    partida_mesa    INTEGER NOT NULL,
    ordem           INTEGER NOT NULL CHECK (ordem >= 1),
    notacao         TEXT NOT NULL,
    duracao_seg     REAL NOT NULL CHECK (duracao_seg >= 0),
    PRIMARY KEY (partida_torneio, partida_numero, partida_mesa, ordem),
    FOREIGN KEY (partida_torneio, partida_numero, partida_mesa)
        REFERENCES Partida (ronda_torneio, ronda_numero, mesa)
) STRICT;

CREATE TABLE Classificacao (
    torneio_id     INTEGER NOT NULL REFERENCES Torneio (torneio_id),
    pontos         REAL NOT NULL CHECK (pontos >= 0),
    vitorias       INTEGER NOT NULL CHECK (vitorias >= 0),
    rating_inicial INTEGER NOT NULL CHECK (rating_inicial >= 0),
    posicao        INTEGER CHECK (posicao >= 1),
    PRIMARY KEY (torneio_id, pontos, vitorias, rating_inicial),
    UNIQUE (torneio_id, posicao),
    CHECK (vitorias <= pontos),
    CHECK (2 * pontos = CAST(2 * pontos AS INTEGER))
) STRICT;

CREATE TABLE Inscricao (
    jogador_id     TEXT NOT NULL REFERENCES Jogador (num_identificacao),
    torneio_id     INTEGER NOT NULL,
    data_inscricao TEXT NOT NULL CHECK (data_inscricao IS date(data_inscricao, '+0 days')),
    rating_inicial INTEGER NOT NULL CHECK (rating_inicial >= 0),
    pontos         REAL NOT NULL DEFAULT 0 CHECK (pontos >= 0),
    vitorias       INTEGER NOT NULL DEFAULT 0 CHECK (vitorias >= 0),
    PRIMARY KEY (jogador_id, torneio_id),
    FOREIGN KEY (torneio_id, pontos, vitorias, rating_inicial)
        REFERENCES Classificacao (torneio_id, pontos, vitorias, rating_inicial),
    CHECK (vitorias <= pontos)
) STRICT;

CREATE TABLE Participacao (
    partida_torneio   INTEGER NOT NULL,
    partida_numero    INTEGER NOT NULL,
    partida_mesa      INTEGER NOT NULL,
    inscricao_jogador TEXT NOT NULL,
    cor               TEXT NOT NULL CHECK (cor IN ('Brancas', 'Pretas')),
    pontos            REAL NOT NULL CHECK (pontos IN (0, 0.5, 1)),
    PRIMARY KEY (partida_torneio, partida_numero, inscricao_jogador),
    UNIQUE (partida_torneio, partida_numero, partida_mesa, cor),
    FOREIGN KEY (partida_torneio, partida_numero, partida_mesa)
        REFERENCES Partida (ronda_torneio, ronda_numero, mesa),
    FOREIGN KEY (inscricao_jogador, partida_torneio)
        REFERENCES Inscricao (jogador_id, torneio_id)
) STRICT;

COMMIT;