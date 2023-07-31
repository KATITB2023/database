/*
  Warnings:

  - A unique constraint covering the columns `[campus]` on the table `Map` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[title]` on the table `MapLocation` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Map_campus_key" ON "Map"("campus");

-- CreateIndex
CREATE UNIQUE INDEX "MapLocation_title_key" ON "MapLocation"("title");
