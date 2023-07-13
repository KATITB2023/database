/*
  Warnings:

  - The values [USER] on the enum `UserRole` will be removed. If these variants are still used in the database, this will fail.
  - You are about to drop the column `isDeleted` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `version` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[createdAt,id]` on the table `Message` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[createdAt,id]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE');

-- CreateEnum
CREATE TYPE "Campus" AS ENUM ('GANESHA', 'JATINANGOR');

-- AlterEnum
BEGIN;
CREATE TYPE "UserRole_new" AS ENUM ('ADMIN', 'MENTOR', 'STUDENT');
ALTER TABLE "User" ALTER COLUMN "role" DROP DEFAULT;
ALTER TABLE "User" ALTER COLUMN "role" TYPE "UserRole_new" USING ("role"::text::"UserRole_new");
ALTER TYPE "UserRole" RENAME TO "UserRole_old";
ALTER TYPE "UserRole_new" RENAME TO "UserRole";
DROP TYPE "UserRole_old";
ALTER TABLE "User" ALTER COLUMN "role" SET DEFAULT 'STUDENT';
COMMIT;

-- DropIndex
DROP INDEX "Message_createdAt_key";

-- DropIndex
DROP INDEX "User_createdAt_key";

-- DropIndex
DROP INDEX "User_updatedAt_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "isDeleted",
DROP COLUMN "version",
ALTER COLUMN "role" SET DEFAULT 'STUDENT';

-- CreateTable
CREATE TABLE "Profile" (
    "userId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "pin" CHAR(6) NOT NULL,
    "faculty" VARCHAR(50),
    "gender" "Gender",
    "campus" "Campus",
    "email" TEXT,
    "image" TEXT,
    "bio" TEXT NOT NULL DEFAULT '',
    "instagram" TEXT,
    "visitedCount" INTEGER NOT NULL DEFAULT 0,
    "friendCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Friendship" (
    "userInitiatorId" UUID NOT NULL,
    "userReceiverId" UUID NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "accepted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Friendship_pkey" PRIMARY KEY ("userInitiatorId","userReceiverId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Profile_pin_key" ON "Profile"("pin");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_email_key" ON "Profile"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Message_createdAt_id_key" ON "Message"("createdAt", "id");

-- CreateIndex
CREATE UNIQUE INDEX "User_createdAt_id_key" ON "User"("createdAt", "id");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Friendship" ADD CONSTRAINT "Friendship_userInitiatorId_fkey" FOREIGN KEY ("userInitiatorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Friendship" ADD CONSTRAINT "Friendship_userReceiverId_fkey" FOREIGN KEY ("userReceiverId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
