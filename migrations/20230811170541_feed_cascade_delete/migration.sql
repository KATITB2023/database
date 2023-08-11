-- DropForeignKey
ALTER TABLE "FeedReaction" DROP CONSTRAINT "FeedReaction_feedId_fkey";

-- DropForeignKey
ALTER TABLE "FeedRead" DROP CONSTRAINT "FeedRead_feedId_fkey";

-- AddForeignKey
ALTER TABLE "FeedReaction" ADD CONSTRAINT "FeedReaction_feedId_fkey" FOREIGN KEY ("feedId") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FeedRead" ADD CONSTRAINT "FeedRead_feedId_fkey" FOREIGN KEY ("feedId") REFERENCES "Feed"("id") ON DELETE CASCADE ON UPDATE CASCADE;
