/*
  Warnings:

  - Added the required column `contact` to the `ITBGotTalentRegistrant` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ITBGotTalentRegistrant" ADD COLUMN     "contact" TEXT NOT NULL;
