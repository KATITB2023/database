-- AlterEnum
ALTER TYPE "UserRole" ADD VALUE 'UNIT';

-- AlterTable
ALTER TABLE "Profile" ADD COLUMN     "coin" INTEGER NOT NULL DEFAULT 0;

-- CreateTable
CREATE TABLE "UnitProfile" (
    "userId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "lembaga" "Lembaga" NOT NULL DEFAULT 'PUSAT',
    "pin" CHAR(6) NOT NULL,
    "image" TEXT,
    "bio" TEXT NOT NULL DEFAULT '',
    "visitedCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UnitProfile_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "UnitVisit" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "studentId" UUID NOT NULL,
    "unitId" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UnitVisit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UnitReward" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "studentId" UUID NOT NULL,
    "unitId" UUID NOT NULL,
    "reward" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UnitReward_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Merchandise" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "price" INTEGER NOT NULL DEFAULT 0,
    "stock" INTEGER NOT NULL DEFAULT 0,
    "image" TEXT,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Merchandise_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchandiseRequest" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "studentId" UUID NOT NULL,
    "merchId" UUID NOT NULL,
    "isApproved" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MerchandiseRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MerchandiseCheckout" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "studentId" UUID NOT NULL,
    "merchId" UUID NOT NULL,
    "amount" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MerchandiseCheckout_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UnitProfile_pin_key" ON "UnitProfile"("pin");

-- CreateIndex
CREATE INDEX "UnitProfile_pin_idx" ON "UnitProfile"("pin");

-- CreateIndex
CREATE UNIQUE INDEX "UnitVisit_studentId_unitId_key" ON "UnitVisit"("studentId", "unitId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchandiseRequest_studentId_merchId_key" ON "MerchandiseRequest"("studentId", "merchId");

-- CreateIndex
CREATE UNIQUE INDEX "MerchandiseCheckout_studentId_merchId_key" ON "MerchandiseCheckout"("studentId", "merchId");

-- AddForeignKey
ALTER TABLE "UnitProfile" ADD CONSTRAINT "UnitProfile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitVisit" ADD CONSTRAINT "UnitVisit_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitVisit" ADD CONSTRAINT "UnitVisit_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitReward" ADD CONSTRAINT "UnitReward_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UnitReward" ADD CONSTRAINT "UnitReward_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchandiseRequest" ADD CONSTRAINT "MerchandiseRequest_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchandiseRequest" ADD CONSTRAINT "MerchandiseRequest_merchId_fkey" FOREIGN KEY ("merchId") REFERENCES "Merchandise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchandiseCheckout" ADD CONSTRAINT "MerchandiseCheckout_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MerchandiseCheckout" ADD CONSTRAINT "MerchandiseCheckout_merchId_fkey" FOREIGN KEY ("merchId") REFERENCES "Merchandise"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
