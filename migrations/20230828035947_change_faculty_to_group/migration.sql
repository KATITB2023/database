/*
  Warnings:

  - You are about to drop the column `fakultas` on the `UnitProfile` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "UnitProfile" DROP COLUMN "fakultas",
ADD COLUMN     "group" TEXT;
