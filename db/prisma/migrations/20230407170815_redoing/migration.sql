/*
  Warnings:

  - The `viagem_internacional` column on the `WasTraveling` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `viagem_brasil` column on the `WasTraveling` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `comorbidades` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `faixa_etaria` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `lugares` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `sintomas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `socioeconomico` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `testes` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "testes" DROP CONSTRAINT "testes_dimensão_comorbidade_fkey";

-- DropForeignKey
ALTER TABLE "testes" DROP CONSTRAINT "testes_dimensão_faixa_etaria_fkey";

-- DropForeignKey
ALTER TABLE "testes" DROP CONSTRAINT "testes_dimensão_lugar_fkey";

-- DropForeignKey
ALTER TABLE "testes" DROP CONSTRAINT "testes_dimensão_sintomas_fkey";

-- DropForeignKey
ALTER TABLE "testes" DROP CONSTRAINT "testes_dimensão_socioeconomica_fkey";

-- DropForeignKey
ALTER TABLE "testes" DROP CONSTRAINT "testes_dimensão_viajando_fkey";

-- AlterTable
ALTER TABLE "WasTraveling" DROP COLUMN "viagem_internacional",
ADD COLUMN     "viagem_internacional" BOOLEAN,
DROP COLUMN "viagem_brasil",
ADD COLUMN     "viagem_brasil" BOOLEAN;

-- DropTable
DROP TABLE "comorbidades";

-- DropTable
DROP TABLE "faixa_etaria";

-- DropTable
DROP TABLE "lugares";

-- DropTable
DROP TABLE "sintomas";

-- DropTable
DROP TABLE "socioeconomico";

-- DropTable
DROP TABLE "testes";

-- CreateTable
CREATE TABLE "mortes" (
    "id" SERIAL NOT NULL,
    "morreu" BOOLEAN,
    "dimensao_tempo" INTEGER,
    "dimensao_lugar" INTEGER,
    "dimensao_sintoma" INTEGER,
    "dimensao_comorbidade" INTEGER,
    "dimensao_resultado_teste" INTEGER,
    "dimensao_pessoa" INTEGER,
    "dimensao_hospitalizado" INTEGER,
    "dimensao_viajou" INTEGER,

    CONSTRAINT "mortes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tempo" (
    "id" SERIAL NOT NULL,
    "obito_data" TIMESTAMP(3),

    CONSTRAINT "tempo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "lugar" (
    "id" SERIAL NOT NULL,
    "municipio" VARCHAR(100),
    "bairro" VARCHAR(100),

    CONSTRAINT "lugar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sintoma" (
    "id" SERIAL NOT NULL,
    "febre" BOOLEAN,
    "dificuldade_respiratoria" BOOLEAN,
    "tosse" BOOLEAN,
    "coriza" BOOLEAN,
    "dor_garganta" BOOLEAN,
    "diarreia" BOOLEAN,
    "cefaleia" BOOLEAN,

    CONSTRAINT "sintoma_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "comorbidade" (
    "id" SERIAL NOT NULL,
    "pulmao_comorbidade" BOOLEAN,
    "cardio_comorbidade" BOOLEAN,
    "rins_comorbidade" BOOLEAN,
    "diabetes_comorbidade" BOOLEAN,
    "tabagismo_comorbidade" BOOLEAN,
    "obesidade_comorbidade" BOOLEAN,

    CONSTRAINT "comorbidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "resultado_teste" (
    "id" SERIAL NOT NULL,
    "rt_pcr_resultado" VARCHAR(100),
    "teste_rapido_resultado" VARCHAR(100),
    "sorologia_resultado" VARCHAR(100),
    "sorologia_igg_resultado" VARCHAR(100),

    CONSTRAINT "resultado_teste_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pessoa" (
    "id" SERIAL NOT NULL,
    "idade_ano" INTEGER,
    "sexo" VARCHAR(1),
    "raca_cor" VARCHAR(20),
    "escolaridade" VARCHAR(100),
    "gestante" VARCHAR(25),
    "profissional_saude" BOOLEAN,
    "possui_deficiencia" BOOLEAN,
    "morador_de_rua" BOOLEAN,

    CONSTRAINT "pessoa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "hospitalizado" (
    "id" SERIAL NOT NULL,
    "ficou_internado" BOOLEAN,

    CONSTRAINT "hospitalizado_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "mortes_id_key" ON "mortes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "tempo_id_key" ON "tempo"("id");

-- CreateIndex
CREATE UNIQUE INDEX "lugar_id_key" ON "lugar"("id");

-- CreateIndex
CREATE UNIQUE INDEX "sintoma_id_key" ON "sintoma"("id");

-- CreateIndex
CREATE UNIQUE INDEX "comorbidade_id_key" ON "comorbidade"("id");

-- CreateIndex
CREATE UNIQUE INDEX "resultado_teste_id_key" ON "resultado_teste"("id");

-- CreateIndex
CREATE UNIQUE INDEX "pessoa_id_key" ON "pessoa"("id");

-- CreateIndex
CREATE UNIQUE INDEX "hospitalizado_id_key" ON "hospitalizado"("id");

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_tempo_fkey" FOREIGN KEY ("dimensao_tempo") REFERENCES "tempo"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_lugar_fkey" FOREIGN KEY ("dimensao_lugar") REFERENCES "lugar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_sintoma_fkey" FOREIGN KEY ("dimensao_sintoma") REFERENCES "sintoma"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_comorbidade_fkey" FOREIGN KEY ("dimensao_comorbidade") REFERENCES "comorbidade"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_resultado_teste_fkey" FOREIGN KEY ("dimensao_resultado_teste") REFERENCES "resultado_teste"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_pessoa_fkey" FOREIGN KEY ("dimensao_pessoa") REFERENCES "pessoa"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_hospitalizado_fkey" FOREIGN KEY ("dimensao_hospitalizado") REFERENCES "hospitalizado"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_viajou_fkey" FOREIGN KEY ("dimensao_viajou") REFERENCES "WasTraveling"("id") ON DELETE SET NULL ON UPDATE CASCADE;
