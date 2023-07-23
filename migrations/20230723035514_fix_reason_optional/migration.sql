-- AlterTable
ALTER TABLE "AttendanceRecord" ALTER COLUMN "reason" DROP NOT NULL;

-- AlterTable
ALTER TABLE "ShowcaseBooking" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;
