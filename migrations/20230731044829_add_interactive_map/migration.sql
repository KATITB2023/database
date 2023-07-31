-- CreateTable
CREATE TABLE "Map" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "campus" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "baseLatitude" DECIMAL(8,6) NOT NULL,
    "baseLongitude" DECIMAL(9,6) NOT NULL,

    CONSTRAINT "Map_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MapLocation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "title" VARCHAR(255) NOT NULL,
    "subtitle" VARCHAR(255),
    "description" TEXT,
    "baseLatitude" DECIMAL(8,6) NOT NULL,
    "baseLongitude" DECIMAL(9,6) NOT NULL,
    "mapId" UUID NOT NULL,

    CONSTRAINT "MapLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MapPhoto" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "imageUrl" VARCHAR(255) NOT NULL,
    "caption" VARCHAR(255),
    "mapLocationId" UUID NOT NULL,

    CONSTRAINT "MapPhoto_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MapLocation" ADD CONSTRAINT "MapLocation_mapId_fkey" FOREIGN KEY ("mapId") REFERENCES "Map"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MapPhoto" ADD CONSTRAINT "MapPhoto_mapLocationId_fkey" FOREIGN KEY ("mapLocationId") REFERENCES "MapLocation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
