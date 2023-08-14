-- CreateTable
CREATE TABLE "Article" (
    "id" TEXT NOT NULL,
    "likes" INTEGER NOT NULL,
    "views" INTEGER NOT NULL,

    CONSTRAINT "Article_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Article_id_key" ON "Article"("id");
