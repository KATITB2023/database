/*
  Warnings:

  - You are about to drop the column `token` on the `ShowcaseBooking` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "BookedLocation" DROP CONSTRAINT "BookedLocation_token_fkey";

-- DropIndex
DROP INDEX "ShowcaseBooking_token_key";

-- AlterTable
ALTER TABLE "ShowcaseBooking" DROP COLUMN "token";
