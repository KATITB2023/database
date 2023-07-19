-- CreateTable
CREATE TABLE "ShortenedLink" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "source" VARCHAR(255) NOT NULL,
    "destination" VARCHAR(255) NOT NULL,
    "clickCount" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ShortenedLink_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ShortenedLink_source_key" ON "ShortenedLink"("source");

-- CreateIndex
CREATE UNIQUE INDEX "ShortenedLink_destination_key" ON "ShortenedLink"("destination");
