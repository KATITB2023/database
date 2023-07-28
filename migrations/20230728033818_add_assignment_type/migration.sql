-- CreateEnum
CREATE TYPE "AssignmentType" AS ENUM ('MANDATORY', 'DAILY_QUEST', 'SIDE_QUEST');

-- AlterTable
ALTER TABLE "Assignment" ADD COLUMN     "type" "AssignmentType" NOT NULL DEFAULT 'MANDATORY';
