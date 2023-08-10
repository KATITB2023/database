/*
  Warnings:

  - A unique constraint covering the columns `[studentId,assignmentId]` on the table `AssignmentSubmission` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[studentId,eventId]` on the table `AttendanceRecord` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE INDEX "AssignmentSubmission_studentId_idx" ON "AssignmentSubmission"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "AssignmentSubmission_studentId_assignmentId_key" ON "AssignmentSubmission"("studentId", "assignmentId");

-- CreateIndex
CREATE INDEX "AttendanceRecord_studentId_idx" ON "AttendanceRecord"("studentId");

-- CreateIndex
CREATE UNIQUE INDEX "AttendanceRecord_studentId_eventId_key" ON "AttendanceRecord"("studentId", "eventId");

-- CreateIndex
CREATE INDEX "FeedReaction_feedId_idx" ON "FeedReaction"("feedId");

-- CreateIndex
CREATE INDEX "FeedRead_feedId_idx" ON "FeedRead"("feedId");

-- CreateIndex
CREATE INDEX "Message_userMatchId_idx" ON "Message"("userMatchId");

-- CreateIndex
CREATE INDEX "Message_createdAt_idx" ON "Message"("createdAt" DESC);

-- CreateIndex
CREATE INDEX "Message_receiverId_senderId_idx" ON "Message"("receiverId", "senderId");

-- CreateIndex
CREATE INDEX "Message_roomChatId_idx" ON "Message"("roomChatId");

-- CreateIndex
CREATE INDEX "Profile_pin_idx" ON "Profile"("pin");

-- CreateIndex
CREATE INDEX "UserMatch_firstUserId_secondUserId_idx" ON "UserMatch"("firstUserId", "secondUserId");

-- CreateIndex
CREATE INDEX "UserMatch_firstUserId_idx" ON "UserMatch"("firstUserId");

-- CreateIndex
CREATE INDEX "UserMatch_secondUserId_idx" ON "UserMatch"("secondUserId");

-- CreateIndex
CREATE INDEX "UserMatch_endedAt_idx" ON "UserMatch"("endedAt");
