/*
  Warnings:

  - The values [PENGMAS,DLL] on the enum `Lembaga` will be removed. If these variants are still used in the database, this will fail.
  - Added the required column `angkatan` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fakultas` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `jurusan` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `method` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `proofPath` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sizeKaos` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sizeLanyard` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sleeveKaos` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sleeveLanyard` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.
  - Added the required column `total` to the `ShowcaseBooking` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Lembaga_new" AS ENUM ('HMJ', 'UKM', 'BSO', 'PUSAT');
ALTER TABLE "ShowcaseBooking" ALTER COLUMN "lembaga" DROP DEFAULT;
ALTER TABLE "ShowcaseBooking" ALTER COLUMN "lembaga" TYPE "Lembaga_new" USING ("lembaga"::text::"Lembaga_new");
ALTER TYPE "Lembaga" RENAME TO "Lembaga_old";
ALTER TYPE "Lembaga_new" RENAME TO "Lembaga";
DROP TYPE "Lembaga_old";
ALTER TABLE "ShowcaseBooking" ALTER COLUMN "lembaga" SET DEFAULT 'PUSAT';
COMMIT;

-- AlterTable
ALTER TABLE "ShowcaseBooking" ADD COLUMN     "angkatan" INTEGER NOT NULL,
ADD COLUMN     "fakultas" VARCHAR(255) NOT NULL,
ADD COLUMN     "jurusan" VARCHAR(255) NOT NULL,
ADD COLUMN     "method" VARCHAR(255) NOT NULL,
ADD COLUMN     "noise" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "proofPath" VARCHAR(255) NOT NULL,
ADD COLUMN     "sizeKaos" VARCHAR(255) NOT NULL,
ADD COLUMN     "sizeLanyard" VARCHAR(255) NOT NULL,
ADD COLUMN     "sleeveKaos" VARCHAR(255) NOT NULL,
ADD COLUMN     "sleeveLanyard" VARCHAR(255) NOT NULL,
ADD COLUMN     "total" INTEGER NOT NULL,
ALTER COLUMN "lembaga" SET DEFAULT 'PUSAT';
