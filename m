Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D209135123
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 03:00:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipN7L-0005Qf-30; Thu, 09 Jan 2020 02:00:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ipN7J-0005QY-F6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 02:00:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EhVITCXGJ2KNLc1HTkU5LbNhvGikoKjcNmpQHmBApM4=; b=Z0ic5CsP7gxPA8V4idALAyOU5W
 HgeqGH3TIqbzPiCbpcTpCFYs7WQWpayFZjnwMuWztFKXUqRryE/Rgbp/Nf5rm+Q+D7I9TzA0hgGj5
 RpGipVpTWMOgDQMKDrYkKUS2Jn+gpu50KPk/THgmqIm/Xtsnjl1bF+NYkUxH/ntHqN/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EhVITCXGJ2KNLc1HTkU5LbNhvGikoKjcNmpQHmBApM4=; b=e
 Aro3XShE7oWwmwymuN9Q4hOeOUe2DKAdXiVWYHiVTKlU7tP0hk0sW+FdbTCKClLpcT5hAZ29dcpGM
 FfiExnVXL85DxT6KJflzyda0L77mCKKc5rJ5pGmOMfYNAjExXSev6TLZzMtBDYUCm6VHep2hxv192
 TAr+UNfXmrWrYPTI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipN7H-00E6sC-F0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 02:00:09 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94C4A206ED;
 Thu,  9 Jan 2020 01:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578535198;
 bh=EwqILaqz/7PnoAABIjsPPvQpMc/sg0Kh++EN6x1YpSU=;
 h=From:To:Cc:Subject:Date:From;
 b=1Q1m3BoNkfc7VHF7l3PG3a9XZb/SG+/9z1fJ31ihbFnztdQjb/nXq2h8yXniEhvS1
 V12cUbmPYEs9T3ybI2iOZzbMHSZOPZ6SeQpDWn3MRwI248NV4sAG74YIn6otjr+PeN
 C5iMOi5wL9luxNnjUeoxALJTg9mJaFwWKQP7SWNI=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  8 Jan 2020 17:59:57 -0800
Message-Id: <20200109015957.61089-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipN7H-00E6sC-F0
Subject: [f2fs-dev] [PATCH] f2fs-tools: avoid ambigous checkpoint mirroring
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/fsck.c  | 26 ++++++++++++++------------
 fsck/fsck.h  |  1 -
 fsck/mount.c | 20 +++++---------------
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 507437d..8383f08 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2171,16 +2171,6 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 	ASSERT(ret >= 0);
 }
 
-static void fix_checkpoints(struct f2fs_sb_info *sbi)
-{
-	/* copy valid checkpoint to its mirror position */
-	duplicate_checkpoint(sbi);
-
-	/* repair checkpoint at CP #0 position */
-	sbi->cur_cp = 1;
-	fix_checkpoint(sbi);
-}
-
 #ifdef HAVE_LINUX_BLKZONED_H
 
 /*
@@ -3103,6 +3093,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 
 		if (force || c.bug_on || c.bug_nat_bits) {
+			/*
+			 * copy valid checkpoint to its mirror position and
+			 * fix everything in cp #0.
+			 */
+			duplicate_checkpoint(sbi);
+
 			/* flush nats to write_nit_bits below */
 			flush_journal_entries(sbi);
 			fix_hard_links(sbi);
@@ -3111,10 +3107,16 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			fix_wp_sit_alignment(sbi);
 			fix_curseg_info(sbi);
 			fix_checksum(sbi);
-			fix_checkpoints(sbi);
+			fix_checkpoint(sbi);
 		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
 			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
-			write_checkpoints(sbi);
+
+			/*
+			 * copy valid checkpoint to its mirror position and
+			 * fix everything in cp #0.
+			 */
+			duplicate_checkpoint(sbi);
+			write_checkpoint(sbi);
 		}
 	}
 	return ret;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index c4432e8..bbc2593 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -203,7 +203,6 @@ extern void write_curseg_info(struct f2fs_sb_info *);
 extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int, bool);
 extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
-extern void write_checkpoints(struct f2fs_sb_info *);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
 extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
diff --git a/fsck/mount.c b/fsck/mount.c
index 882f1ea..ffc10fb 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2404,11 +2404,8 @@ next:
 
 void flush_journal_entries(struct f2fs_sb_info *sbi)
 {
-	int n_nats = flush_nat_journal_entries(sbi);
-	int n_sits = flush_sit_journal_entries(sbi);
-
-	if (n_nats || n_sits)
-		write_checkpoints(sbi);
+	flush_nat_journal_entries(sbi);
+	flush_sit_journal_entries(sbi);
 }
 
 void flush_sit_entries(struct f2fs_sb_info *sbi)
@@ -2777,6 +2774,9 @@ void duplicate_checkpoint(struct f2fs_sb_info *sbi)
 
 	sbi->cp_backuped = 1;
 
+	/* repair checkpoint at CP #0 position */
+	sbi->cur_cp = 1;
+
 	MSG(0, "Info: Duplicate valid checkpoint to mirror position "
 		"%llu -> %llu\n", src, dst);
 }
@@ -2870,16 +2870,6 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	ASSERT(ret >= 0);
 }
 
-void write_checkpoints(struct f2fs_sb_info *sbi)
-{
-	/* copy valid checkpoint to its mirror position */
-	duplicate_checkpoint(sbi);
-
-	/* repair checkpoint at CP #0 position */
-	sbi->cur_cp = 1;
-	write_checkpoint(sbi);
-}
-
 void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
