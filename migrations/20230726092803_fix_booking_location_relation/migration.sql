/*
  Warnings:

  - You are about to drop the column `showcaseId` on the `BookedLocation` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[token]` on the table `BookedLocation` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[token]` on the table `LocationBooking` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[token]` on the table `ShowcaseBooking` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `token` to the `BookedLocation` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "BookedLocation" DROP CONSTRAINT "BookedLocation_showcaseId_fkey";

-- DropIndex
DROP INDEX "BookedLocation_showcaseId_key";

-- AlterTable
ALTER TABLE "BookedLocation" DROP COLUMN "showcaseId",
ADD COLUMN     "token" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ShowcaseBooking" ADD COLUMN     "token" VARCHAR(50);

-- CreateIndex
CREATE UNIQUE INDEX "BookedLocation_token_key" ON "BookedLocation"("token");

-- CreateIndex
CREATE UNIQUE INDEX "LocationBooking_token_key" ON "LocationBooking"("token");

-- CreateIndex
CREATE UNIQUE INDEX "ShowcaseBooking_token_key" ON "ShowcaseBooking"("token");

-- AddForeignKey
ALTER TABLE "LocationBooking" ADD CONSTRAINT "LocationBooking_token_fkey" FOREIGN KEY ("token") REFERENCES "ShowcaseBooking"("token") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookedLocation" ADD CONSTRAINT "BookedLocation_token_fkey" FOREIGN KEY ("token") REFERENCES "ShowcaseBooking"("token") ON DELETE RESTRICT ON UPDATE CASCADE;
