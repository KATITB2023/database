-- CreateTable
CREATE TABLE "BookedLocation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "showcaseId" UUID NOT NULL,
    "location" VARCHAR(50) NOT NULL,

    CONSTRAINT "BookedLocation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "BookedLocation_showcaseId_key" ON "BookedLocation"("showcaseId");

-- AddForeignKey
ALTER TABLE "BookedLocation" ADD CONSTRAINT "BookedLocation_showcaseId_fkey" FOREIGN KEY ("showcaseId") REFERENCES "ShowcaseBooking"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
