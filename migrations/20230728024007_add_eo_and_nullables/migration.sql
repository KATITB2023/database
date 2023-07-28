-- AlterEnum
ALTER TYPE "UserRole" ADD VALUE 'EO';

-- AlterTable
ALTER TABLE "Assignment" ALTER COLUMN "filePath" DROP NOT NULL,
ALTER COLUMN "description" DROP NOT NULL;

-- AlterTable
ALTER TABLE "AssignmentSubmission" ALTER COLUMN "filePath" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Profile" ADD COLUMN     "point" INTEGER;
