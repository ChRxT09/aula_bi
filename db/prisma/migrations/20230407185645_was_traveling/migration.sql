/*
  Warnings:

  - You are about to drop the `WasTraveling` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "mortes" DROP CONSTRAINT "mortes_dimensao_viajou_fkey";

-- DropTable
DROP TABLE "WasTraveling";

-- CreateTable
CREATE TABLE "estava_viajando" (
    "id" SERIAL NOT NULL,
    "viagem_internacional" BOOLEAN,
    "viagem_brasil" BOOLEAN,

    CONSTRAINT "estava_viajando_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "estava_viajando_id_key" ON "estava_viajando"("id");

-- AddForeignKey
ALTER TABLE "mortes" ADD CONSTRAINT "mortes_dimensao_viajou_fkey" FOREIGN KEY ("dimensao_viajou") REFERENCES "estava_viajando"("id") ON DELETE SET NULL ON UPDATE CASCADE;
