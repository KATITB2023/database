-- CreateTable
CREATE TABLE "ResetToken" (
    "userId" UUID NOT NULL,
    "token" TEXT NOT NULL,
    "createdAt" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expireTime" INTEGER NOT NULL DEFAULT 3600,

    CONSTRAINT "ResetToken_pkey" PRIMARY KEY ("userId")
);

-- AddForeignKey
ALTER TABLE "ResetToken" ADD CONSTRAINT "ResetToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
