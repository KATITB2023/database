-- CreateTable
CREATE TABLE "StudentMentor" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "studentId" UUID NOT NULL,
    "mentorId" UUID NOT NULL,

    CONSTRAINT "StudentMentor_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "StudentMentor" ADD CONSTRAINT "StudentMentor_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StudentMentor" ADD CONSTRAINT "StudentMentor_mentorId_fkey" FOREIGN KEY ("mentorId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
