/*
  Warnings:

  - You are about to drop the column `rt_pcr_resultado` on the `resultado_teste` table. All the data in the column will be lost.
  - You are about to drop the column `sorologia_igg_resultado` on the `resultado_teste` table. All the data in the column will be lost.
  - You are about to drop the column `sorologia_resultado` on the `resultado_teste` table. All the data in the column will be lost.
  - You are about to drop the column `teste_rapido_resultado` on the `resultado_teste` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "resultado_teste" DROP COLUMN "rt_pcr_resultado",
DROP COLUMN "sorologia_igg_resultado",
DROP COLUMN "sorologia_resultado",
DROP COLUMN "teste_rapido_resultado",
ADD COLUMN     "resultado" VARCHAR(20);
