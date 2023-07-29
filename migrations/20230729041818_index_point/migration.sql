-- AlterTable
ALTER TABLE "UserMatch" ALTER COLUMN "isRevealed" SET DEFAULT false;

-- CreateIndex
CREATE INDEX "Profile_point_idx" ON "Profile"("point" DESC);
