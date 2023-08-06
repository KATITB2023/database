/*
  Warnings:

  - You are about to drop the column `sizeKaos` on the `ShowcaseBooking` table. All the data in the column will be lost.
  - You are about to drop the column `sleeveKaos` on the `ShowcaseBooking` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "ShowcaseBooking" DROP COLUMN "sizeKaos",
DROP COLUMN "sleeveKaos",
ADD COLUMN     "kaos" JSON[];
