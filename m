Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EE56731D7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:36:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXd-0000z4-Ak;
	Thu, 19 Jan 2023 06:36:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXX-0000yr-E5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i98/N1jTMU5BFfsuB5WaRbW8ztdFj6EVQJfgX6qMD04=; b=GOdis+lxbjhu+qGphaZFn49r8w
 DC2s1uPCovyxvKMahfgp7lmJ33qP1IvvnDBzevm3idK/zvHjfCj3dZ9AzqKTrqc674oq7fSFr0rF0
 mHh1MBksZu7uhVs5aExsbPun8zY9PqgEh9/a9uPXzgHbvizRKYUQYPwXCQzOda8ngBkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i98/N1jTMU5BFfsuB5WaRbW8ztdFj6EVQJfgX6qMD04=; b=RQxpuitvN6/62+VmWmgG34Q54+
 UaJ5zmq18tAbEOvmwcIt0/f0Mcn7cUyIYL8at0Htb7yIFLPn+Z2hsV8eHynL28XBlxqUmYrA6obTU
 Nv5DPhPlfv5Mziuav+g+aFI9NivvpNlF1YdEyTiBj1Y75cpOkHOM6DEOBl6mRHu+kSfY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXW-008fSJ-0O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=i98/N1jTMU5BFfsuB5WaRbW8ztdFj6EVQJfgX6qMD04=; b=vSRe5crZIFOdBLzlPen2t7HXXL
 M5HIjZkDID1izOD5c3F52h3rhFDR3HOn08Lhtl2Lb1n60gs25Wm3ai/gMOj8Ubo4og5wEMwsYJfia
 oKdwV70gIBIgoTKG/XgFJu4t4hUp55EjaVtSzRkXNEQ6binpXi0vSzDtMh330V8+T9CBfO2W+S3Id
 wOZxNfOkutwUypANhwmzQmk6hCsBitD7ub+pdYViu8YbyC8Ezp5LeLEBjwfRumcUv/eCqriQJX3ug
 OaRMNHGllfJXCYcHbXqP5XLnsNr8g4VwvN0tj7uDoM3L9xybsb2RuQX+rOMIWZ1im/YEU7bhLX6Gc
 HCzDfx6w==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXO-003kbY-F3; Thu, 19 Jan 2023 06:36:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:20 +0100
Message-Id: <20230119063625.466485-4-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119063625.466485-1-hch@lst.de>
References: <20230119063625.466485-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add a helper to return the valid blocks on log and SSR
 segments, 
 and replace the last two uses of curseg_blkoff with it. Signed-off-by:
 Christoph
 Hellwig <hch@lst.de> --- fs/f2fs/segment.c | 32 +++++++++++++++
 fs/f2fs/segment.h
 | 6 ------ 2 files changed, 15 insertions(+), 23 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIOXW-008fSJ-0O
Subject: [f2fs-dev] [PATCH 3/8] f2fs: add a f2fs_curseg_valid_blocks helper
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a helper to return the valid blocks on log and SSR segments, and
replace the last two uses of curseg_blkoff with it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 32 +++++++++++++++-----------------
 fs/f2fs/segment.h |  6 ------
 2 files changed, 15 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ec6880213e8fa9..ad323b6e8609cd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2323,6 +2323,15 @@ bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return is_cp;
 }
 
+static unsigned short f2fs_curseg_valid_blocks(struct f2fs_sb_info *sbi, int type)
+{
+	struct curseg_info *curseg = CURSEG_I(sbi, type);
+
+	if (sbi->ckpt->alloc_type[type] == SSR)
+		return sbi->blocks_per_seg;
+	return curseg->next_blkoff;
+}
+
 /*
  * Calculate the number of current summary pages for writing
  */
@@ -2332,15 +2341,11 @@ int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra)
 	int i, sum_in_page;
 
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
-		if (sbi->ckpt->alloc_type[i] == SSR)
-			valid_sum_count += sbi->blocks_per_seg;
-		else {
-			if (for_ra)
-				valid_sum_count += le16_to_cpu(
-					F2FS_CKPT(sbi)->cur_data_blkoff[i]);
-			else
-				valid_sum_count += curseg_blkoff(sbi, i);
-		}
+		if (sbi->ckpt->alloc_type[i] != SSR && for_ra)
+			valid_sum_count +=
+				le16_to_cpu(F2FS_CKPT(sbi)->cur_data_blkoff[i]);
+		else
+			valid_sum_count += f2fs_curseg_valid_blocks(sbi, i);
 	}
 
 	sum_in_page = (PAGE_SIZE - 2 * SUM_JOURNAL_SIZE -
@@ -3861,15 +3866,8 @@ static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
 
 	/* Step 3: write summary entries */
 	for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
-		unsigned short blkoff;
-
 		seg_i = CURSEG_I(sbi, i);
-		if (sbi->ckpt->alloc_type[i] == SSR)
-			blkoff = sbi->blocks_per_seg;
-		else
-			blkoff = curseg_blkoff(sbi, i);
-
-		for (j = 0; j < blkoff; j++) {
+		for (j = 0; j < f2fs_curseg_valid_blocks(sbi, i); j++) {
 			if (!page) {
 				page = f2fs_grab_meta_page(sbi, blkaddr++);
 				kaddr = (unsigned char *)page_address(page);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index ad6a9c19f46a48..0f3f05cb8c29f5 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -710,12 +710,6 @@ static inline unsigned char curseg_alloc_type(struct f2fs_sb_info *sbi,
 	return curseg->alloc_type;
 }
 
-static inline unsigned short curseg_blkoff(struct f2fs_sb_info *sbi, int type)
-{
-	struct curseg_info *curseg = CURSEG_I(sbi, type);
-	return curseg->next_blkoff;
-}
-
 static inline void check_seg_range(struct f2fs_sb_info *sbi, unsigned int segno)
 {
 	f2fs_bug_on(sbi, segno > TOTAL_SEGS(sbi) - 1);
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
