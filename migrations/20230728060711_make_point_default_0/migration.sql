/*
  Warnings:

  - Made the column `point` on table `Profile` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
UPDATE "Profile" SET "point" = 0 WHERE "point" IS NULL;

ALTER TABLE "Profile" ALTER COLUMN "point" SET NOT NULL,
ALTER COLUMN "point" SET DEFAULT 0;
