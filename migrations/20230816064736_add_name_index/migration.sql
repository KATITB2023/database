-- DropIndex
DROP INDEX "Profile_point_idx";

-- CreateIndex
CREATE INDEX "Profile_point_name_idx" ON "Profile"("point" DESC, "name" DESC);
