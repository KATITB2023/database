/*
  Warnings:

  - You are about to drop the column `sizeLanyard` on the `ShowcaseBooking` table. All the data in the column will be lost.
  - You are about to drop the column `sleeveLanyard` on the `ShowcaseBooking` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "ShowcaseBooking" DROP COLUMN "sizeLanyard",
DROP COLUMN "sleeveLanyard";
