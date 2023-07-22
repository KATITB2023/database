-- CreateEnum
CREATE TYPE "Lembaga" AS ENUM ('HMJ', 'UKM', 'PENGMAS', 'DLL');

-- CreateTable
CREATE TABLE "ITBGotTalent" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "day" VARCHAR(255) NOT NULL,
    "time" VARCHAR(255) NOT NULL,

    CONSTRAINT "ITBGotTalent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ITBGotTalentRegistrant" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "scheduleId" UUID NOT NULL,
    "teamName" VARCHAR(255) NOT NULL,
    "ktmPath" VARCHAR(255) NOT NULL,
    "musicPath" VARCHAR(255),
    "property" VARCHAR(255),

    CONSTRAINT "ITBGotTalentRegistrant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShowcaseBooking" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" VARCHAR(255) NOT NULL,
    "nim" TEXT NOT NULL,
    "lembaga" "Lembaga" NOT NULL DEFAULT 'DLL',
    "lembagaName" VARCHAR(255) NOT NULL,
    "position" VARCHAR(255) NOT NULL,
    "lineId" VARCHAR(255) NOT NULL,
    "waNumber" VARCHAR(255) NOT NULL,
    "mouPath" VARCHAR(255) NOT NULL,

    CONSTRAINT "ShowcaseBooking_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ITBGotTalentRegistrant_scheduleId_key" ON "ITBGotTalentRegistrant"("scheduleId");

-- CreateIndex
CREATE UNIQUE INDEX "ShowcaseBooking_nim_key" ON "ShowcaseBooking"("nim");

-- AddForeignKey
ALTER TABLE "ITBGotTalentRegistrant" ADD CONSTRAINT "ITBGotTalentRegistrant_scheduleId_fkey" FOREIGN KEY ("scheduleId") REFERENCES "ITBGotTalent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
