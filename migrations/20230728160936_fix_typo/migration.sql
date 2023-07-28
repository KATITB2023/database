/*
  Warnings:

  - You are about to drop the column `isRevelaed` on the `UserMatch` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "UserMatch" RENAME COLUMN "isRevelaed" TO "isRevealed";
