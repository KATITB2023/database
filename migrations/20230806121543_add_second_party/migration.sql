/*
  Warnings:

  - Added the required column `secondPartyContact` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `secondPartyName` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `secondPartyPosition` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ShowcaseBooking" ADD COLUMN     "secondPartyContact" VARCHAR(255) NOT NULL,
ADD COLUMN     "secondPartyName" VARCHAR(255) NOT NULL,
ADD COLUMN     "secondPartyPosition" VARCHAR(255) NOT NULL;
