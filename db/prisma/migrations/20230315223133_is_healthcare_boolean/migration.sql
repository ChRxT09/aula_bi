/*
  Warnings:

  - The `profissional_saude` column on the `covid_testes` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "covid_testes" DROP COLUMN "profissional_saude",
ADD COLUMN     "profissional_saude" BOOLEAN;
