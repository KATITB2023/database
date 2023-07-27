/*
  Warnings:

  - Added the required column `reportedUserId` to the `ChatReport` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ChatReport" ADD COLUMN     "reportedUserId" UUID NOT NULL;

-- AddForeignKey
ALTER TABLE "ChatReport" ADD CONSTRAINT "ChatReport_reportedUserId_fkey" FOREIGN KEY ("reportedUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
