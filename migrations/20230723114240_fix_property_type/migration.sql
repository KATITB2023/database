/*
  Warnings:

  - The `property` column on the `ITBGotTalentRegistrant` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "ITBGotTalentRegistrant" DROP COLUMN "property",
ADD COLUMN     "property" TEXT[];
