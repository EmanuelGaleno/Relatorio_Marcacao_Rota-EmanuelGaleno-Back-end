BEGIN TRANSACTION ;

-- Usuários do sistema.
CREATE TABLE COLABORADOR (
  CPF  TEXT         NOT NULL
    CONSTRAINT PK_COLABORADOR
    PRIMARY KEY,
  NOME VARCHAR(255) NOT NULL
);

-- Um tipo de marcação: almoço, descanso, jornada.
CREATE TABLE MARCACAO_TIPO (
  CODIGO                    BIGINT NOT NULL
    CONSTRAINT PK_INTERVALO_TIPO
    PRIMARY KEY,
  NOME                      TEXT   NOT NULL,
  TEMPO_RECOMENDADO_MINUTOS BIGINT
);

-- As marcações feitas pelos colaboradores, podendo ser de início ou fim.
CREATE TABLE MARCACAO (
  CODIGO             BIGINT                   NOT NULL
    CONSTRAINT PK_MARCACAO
    PRIMARY KEY,
  COD_TIPO_MARCACAO  BIGINT                   NOT NULL,
  CPF_COLABORADOR    TEXT                     NOT NULL
    CONSTRAINT FK_INTERVALO_COLABORADOR
    REFERENCES COLABORADOR,
  DATA_HORA_MARCACAO TIMESTAMP WITH TIME ZONE NOT NULL,
  TIPO_MARCACAO      VARCHAR(255)
    CONSTRAINT TIPO_MARCACAO
    CHECK ((TIPO_MARCACAO) = ANY (ARRAY ['MARCACAO_INICIO', 'MARCACAO_FIM'])),
  CONSTRAINT FK_MARCACAO_MARCACAO_TIPO
  FOREIGN KEY (COD_TIPO_MARCACAO) REFERENCES MARCACAO_TIPO (CODIGO)
);

-- Vincula uma marcação de início e fim para formar um intervalo.
CREATE TABLE MARCACAO_VINCULO_INICIO_FIM (
  CODIGO              BIGSERIAL NOT NULL
    CONSTRAINT PK_MARCACAO_VINCULO_INICIO_FIM
    PRIMARY KEY,
  COD_MARCACAO_INICIO BIGINT NOT NULL
    CONSTRAINT UNICO_CODIGO_INICIO
    UNIQUE
    CONSTRAINT FK_MARCACAO_VINCULO_MARCACAO_INICIO
    REFERENCES MARCACAO (CODIGO),
  COD_MARCACAO_FIM    BIGINT NOT NULL
    CONSTRAINT UNICO_CODIGO_FIM
    UNIQUE
    CONSTRAINT FK_MARCACAO_VINCULO_MARCACAO_FIM
    REFERENCES MARCACAO (CODIGO)
);

-- Insert colaboradores.
INSERT INTO public.colaborador (cpf, nome) VALUES ('00187832013', 'João da Silva');
INSERT INTO public.colaborador (cpf, nome) VALUES ('12345678987', 'José');

-- Insert tipos de marcações.
INSERT INTO public.marcacao_tipo (codigo, nome, tempo_recomendado_minutos) VALUES (28, 'Refeição', 30);
INSERT INTO public.marcacao_tipo (codigo, nome, tempo_recomendado_minutos) VALUES (30, 'Espera', 60);
INSERT INTO public.marcacao_tipo (codigo, nome, tempo_recomendado_minutos) VALUES (56, 'Descanso', 60);
INSERT INTO public.marcacao_tipo (codigo, nome, tempo_recomendado_minutos) VALUES (29, 'Jornada', 720);


-- Marcações dos colaboradores.
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (324456, 30, '12345678987', '2019-01-02 22:27:08.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (345132, 29, '00187832013', '2019-02-28 21:57:39.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (345266, 28, '00187832013', '2019-03-01 05:38:44.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (345275, 28, '00187832013', '2019-03-01 06:15:51.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (345343, 56, '00187832013', '2019-03-01 11:07:02.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (346884, 56, '00187832013', '2019-03-01 19:10:10.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (346885, 29, '00187832013', '2019-03-01 19:10:24.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348497, 29, '00187832013', '2019-03-02 21:22:32.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348498, 30, '00187832013', '2019-03-02 21:22:43.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348536, 30, '00187832013', '2019-03-02 22:40:00.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348537, 30, '00187832013', '2019-03-03 00:09:54.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348538, 30, '00187832013', '2019-03-03 00:27:46.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348550, 29, '00187832013', '2019-03-03 01:39:25.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348741, 29, '00187832013', '2019-03-04 00:19:06.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348742, 30, '00187832013', '2019-03-04 00:19:23.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348758, 30, '00187832013', '2019-03-04 01:29:56.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348788, 30, '00187832013', '2019-03-04 05:00:44.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348808, 30, '00187832013', '2019-03-04 05:41:35.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348823, 28, '00187832013', '2019-03-04 06:43:42.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348830, 28, '00187832013', '2019-03-04 07:42:45.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (348849, 29, '00187832013', '2019-03-04 09:50:03.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351075, 29, '00187832013', '2019-03-06 18:40:35.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351077, 30, '00187832013', '2019-03-06 18:45:42.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351149, 30, '00187832013', '2019-03-06 21:13:03.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351221, 28, '00187832013', '2019-03-06 23:35:53.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351237, 28, '00187832013', '2019-03-07 00:06:20.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351264, 30, '00187832013', '2019-03-07 01:29:28.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351280, 30, '00187832013', '2019-03-07 02:25:02.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351281, 56, '00187832013', '2019-03-07 02:25:22.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351317, 56, '00187832013', '2019-03-07 05:47:38.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (351318, 29, '00187832013', '2019-03-07 05:47:55.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354653, 29, '00187832013', '2019-03-08 18:14:59.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354659, 30, '00187832013', '2019-03-08 18:15:36.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354760, 30, '00187832013', '2019-03-08 19:48:08.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354870, 28, '00187832013', '2019-03-08 23:05:36.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354898, 28, '00187832013', '2019-03-08 23:37:04.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354925, 30, '00187832013', '2019-03-09 00:30:22.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354938, 30, '00187832013', '2019-03-09 01:07:06.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (354997, 29, '00187832013', '2019-03-09 04:26:14.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356598, 29, '00187832013', '2019-03-10 18:16:48.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356599, 30, '00187832013', '2019-03-10 18:17:00.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356606, 30, '00187832013', '2019-03-10 19:26:03.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356612, 30, '00187832013', '2019-03-10 20:42:28.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356618, 30, '00187832013', '2019-03-10 21:14:19.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356634, 30, '00187832013', '2019-03-10 22:28:35.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356642, 30, '00187832013', '2019-03-10 23:10:29.000000', 'MARCACAO_FIM');

INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356656, 28, '00187832013', '2019-03-11 00:15:12.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356659, 28, '00187832013', '2019-03-11 00:55:09.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356660, 30, '00187832013', '2019-03-11 01:21:44.000000', 'MARCACAO_INICIO');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356661, 30, '00187832013', '2019-03-11 01:52:56.000000', 'MARCACAO_FIM');
INSERT INTO public.MARCACAO (codigo, cod_tipo_marcacao, cpf_colaborador, data_hora_marcacao, tipo_marcacao) VALUES (356666, 29, '00187832013', '2019-03-11 03:23:29.000000', 'MARCACAO_FIM');

-- Vínculos das marcações do colaborador João.
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (345266, 345275);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (345343, 346884);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (345132, 346885);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (348498, 348536);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (348497, 348550);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (348741, 348849);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (348537, 348538);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (348742, 348758);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (348788, 348808);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (348823, 348830);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (351077, 351149);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (351221, 351237);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (351264, 351280);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (351281, 351317);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (351075, 351318);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (354659, 354760);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (354925, 354938);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (354870, 354898);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (354653, 354997);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (356599, 356606);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (356612, 356618);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (356634, 356642);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (356656, 356659);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (356660, 356661);
INSERT INTO public.marcacao_vinculo_inicio_fim (cod_marcacao_inicio, cod_marcacao_fim) VALUES (356598, 356666);

END TRANSACTION ;
