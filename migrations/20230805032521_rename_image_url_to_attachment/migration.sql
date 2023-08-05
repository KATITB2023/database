/*
  Warnings:

  - You are about to drop the column `imageUrl` on the `Feed` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Feed" RENAME COLUMN "imageUrl" to "attachmentUrl";