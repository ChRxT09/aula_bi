/*
  Warnings:

  - Added the required column `dimensão_viajando` to the `testes` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "testes" ADD COLUMN     "dimensão_viajando" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "WasTraveling" (
    "id" SERIAL NOT NULL,
    "viagem_internacional" VARCHAR(100),
    "viagem_brasil" VARCHAR(100),

    CONSTRAINT "WasTraveling_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "WasTraveling_id_key" ON "WasTraveling"("id");

-- AddForeignKey
ALTER TABLE "testes" ADD CONSTRAINT "testes_dimensão_viajando_fkey" FOREIGN KEY ("dimensão_viajando") REFERENCES "WasTraveling"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
