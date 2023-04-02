-- CreateTable
CREATE TABLE "testes" (
    "id" SERIAL NOT NULL,
    "dimensão_faixa_etaria" INTEGER NOT NULL,
    "dimensão_socioeconomica" INTEGER NOT NULL,
    "dimensão_lugar" INTEGER NOT NULL,
    "dimensão_sintomas" INTEGER NOT NULL,
    "dimensão_comorbidade" INTEGER NOT NULL,
    "rt_pcr_resultado" VARCHAR(100),
    "teste_rapido_resultado" VARCHAR(100),
    "sorologia_resultado" VARCHAR(100),
    "sorologia_igg_resultado" VARCHAR(100),
    "tipo_teste_rapido" VARCHAR(100),
    "notificacao_data" VARCHAR(100),
    "cadastro_data" VARCHAR(100),
    "diagnostico_data" VARCHAR(100),
    "coleta_rt_pcr_data" VARCHAR(100),
    "coleta_teste_rapido_data" VARCHAR(100),
    "coleta_sorologia_data" VARCHAR(100),
    "coleta_sorologia_igg_data" VARCHAR(100),
    "encerramento_data" VARCHAR(100),
    "obito_data" VARCHAR(100),
    "classificacao" VARCHAR(100),
    "evolucao" VARCHAR(100),
    "confirmacao_criterio" VARCHAR(100),
    "status_notificacao" VARCHAR(100),

    CONSTRAINT "testes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "faixa_etaria" (
    "id" SERIAL NOT NULL,
    "faixa_etaria" VARCHAR(100),
    "idade_data_notificacao" VARCHAR(100),

    CONSTRAINT "faixa_etaria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "socioeconomico" (
    "id" SERIAL NOT NULL,
    "morador_de_rua" BOOLEAN NOT NULL,
    "profissional_saude" BOOLEAN NOT NULL,
    "sexo" BOOLEAN NOT NULL,
    "raca_cor" BOOLEAN NOT NULL,
    "escolaridade" BOOLEAN NOT NULL,

    CONSTRAINT "socioeconomico_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lugares" (
    "id" SERIAL NOT NULL,
    "municipio" VARCHAR(100) NOT NULL,
    "bairro" VARCHAR(100) NOT NULL,

    CONSTRAINT "lugares_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sintomas" (
    "id" SERIAL NOT NULL,
    "febre" BOOLEAN NOT NULL,
    "dificuldade_respiratoria" BOOLEAN NOT NULL,
    "tosse" BOOLEAN NOT NULL,
    "coriza" BOOLEAN NOT NULL,
    "dor_garganta" BOOLEAN NOT NULL,
    "diarreia" BOOLEAN NOT NULL,
    "cefaleia" BOOLEAN NOT NULL,

    CONSTRAINT "sintomas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "comorbidades" (
    "id" SERIAL NOT NULL,
    "pulmao_comorbidade" BOOLEAN NOT NULL,
    "cardio_comorbidade" BOOLEAN NOT NULL,
    "rins_comorbidade" BOOLEAN NOT NULL,
    "diabetes_comorbidade" BOOLEAN NOT NULL,
    "tabagismo_comorbidade" BOOLEAN NOT NULL,
    "obesidade_comorbidade" BOOLEAN NOT NULL,

    CONSTRAINT "comorbidades_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "testes_id_key" ON "testes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "faixa_etaria_id_key" ON "faixa_etaria"("id");

-- CreateIndex
CREATE UNIQUE INDEX "socioeconomico_id_key" ON "socioeconomico"("id");

-- CreateIndex
CREATE UNIQUE INDEX "lugares_id_key" ON "lugares"("id");

-- CreateIndex
CREATE UNIQUE INDEX "sintomas_id_key" ON "sintomas"("id");

-- CreateIndex
CREATE UNIQUE INDEX "comorbidades_id_key" ON "comorbidades"("id");

-- AddForeignKey
ALTER TABLE "testes" ADD CONSTRAINT "testes_dimensão_faixa_etaria_fkey" FOREIGN KEY ("dimensão_faixa_etaria") REFERENCES "faixa_etaria"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "testes" ADD CONSTRAINT "testes_dimensão_socioeconomica_fkey" FOREIGN KEY ("dimensão_socioeconomica") REFERENCES "socioeconomico"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "testes" ADD CONSTRAINT "testes_dimensão_lugar_fkey" FOREIGN KEY ("dimensão_lugar") REFERENCES "lugares"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "testes" ADD CONSTRAINT "testes_dimensão_sintomas_fkey" FOREIGN KEY ("dimensão_sintomas") REFERENCES "sintomas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "testes" ADD CONSTRAINT "testes_dimensão_comorbidade_fkey" FOREIGN KEY ("dimensão_comorbidade") REFERENCES "comorbidades"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
