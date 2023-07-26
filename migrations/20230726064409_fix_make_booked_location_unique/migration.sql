/*
  Warnings:

  - A unique constraint covering the columns `[location]` on the table `BookedLocation` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "BookedLocation_location_key" ON "BookedLocation"("location");
