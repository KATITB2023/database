/*
  Warnings:

  - You are about to drop the `MentorGroup` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "MentorGroup" DROP CONSTRAINT "MentorGroup_groupId_fkey";

-- DropForeignKey
ALTER TABLE "MentorGroup" DROP CONSTRAINT "MentorGroup_mentorId_fkey";

-- DropTable
DROP TABLE "MentorGroup";

-- CreateTable
CREATE TABLE "GroupRelation" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "userId" UUID NOT NULL,
    "groupId" UUID NOT NULL,

    CONSTRAINT "GroupRelation_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "GroupRelation" ADD CONSTRAINT "GroupRelation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GroupRelation" ADD CONSTRAINT "GroupRelation_groupId_fkey" FOREIGN KEY ("groupId") REFERENCES "Group"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
