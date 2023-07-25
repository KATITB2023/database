-- CreateTable
CREATE TABLE "LocationBooking" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "token" VARCHAR(50) NOT NULL,
    "locations" VARCHAR(50)[],

    CONSTRAINT "LocationBooking_pkey" PRIMARY KEY ("id")
);
