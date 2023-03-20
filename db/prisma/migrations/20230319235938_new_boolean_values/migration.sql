/*
  Warnings:

  - The `viagem_internacional` column on the `covid_testes` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `viagem_brasil` column on the `covid_testes` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `possui_deficiencia` column on the `covid_testes` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `morador_de_rua` column on the `covid_testes` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "covid_testes" DROP COLUMN "viagem_internacional",
ADD COLUMN     "viagem_internacional" BOOLEAN,
DROP COLUMN "viagem_brasil",
ADD COLUMN     "viagem_brasil" BOOLEAN,
DROP COLUMN "possui_deficiencia",
ADD COLUMN     "possui_deficiencia" BOOLEAN,
DROP COLUMN "morador_de_rua",
ADD COLUMN     "morador_de_rua" BOOLEAN;
