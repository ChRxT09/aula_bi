/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `covid_testes` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "covid_testes_id_key" ON "covid_testes"("id");
