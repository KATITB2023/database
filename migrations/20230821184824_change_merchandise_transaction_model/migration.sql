/*
  Warnings:

  - You are about to drop the column `merchId` on the `MerchandiseCheckout` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[studentId,merchId,merchCheckoutId]` on the table `MerchandiseRequest` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `merchCheckoutId` to the `MerchandiseRequest` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "MerchandiseCheckout" DROP CONSTRAINT "MerchandiseCheckout_merchId_fkey";

-- DropIndex
DROP INDEX "MerchandiseCheckout_studentId_merchId_key";

-- DropIndex
DROP INDEX "MerchandiseRequest_studentId_merchId_key";

-- AlterTable
ALTER TABLE "MerchandiseCheckout" DROP COLUMN "merchId";

-- AlterTable
ALTER TABLE "MerchandiseRequest" ADD COLUMN     "merchCheckoutId" UUID NOT NULL,
ADD COLUMN     "quantity" INTEGER NOT NULL DEFAULT 0;

-- CreateIndex
CREATE UNIQUE INDEX "MerchandiseRequest_studentId_merchId_merchCheckoutId_key" ON "MerchandiseRequest"("studentId", "merchId", "merchCheckoutId");

-- AddForeignKey
ALTER TABLE "MerchandiseRequest" ADD CONSTRAINT "MerchandiseRequest_merchCheckoutId_fkey" FOREIGN KEY ("merchCheckoutId") REFERENCES "MerchandiseCheckout"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
