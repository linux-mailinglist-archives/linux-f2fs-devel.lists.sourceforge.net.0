Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB56217E66
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 06:35:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jt1o7-0000vl-JW; Wed, 08 Jul 2020 04:35:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jt1o6-0000vf-Jk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 04:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0oDQmjwNLQa7uDIdvZRebl3/WrRyakl1jgsk+1GfAeg=; b=mihi03NYni169M95bW1vT1c9iK
 gHVcEkcMbrOj6rtf9+N4QJGk/uz2WjLRogIx4fPho1vTukMNoX80eOoM4qipaZApAJCgsbN3livh+
 V4FFbxJ1sG7MqFaQ/MRCHqe6eVlxrqBl5YA4D6yDNYnSZoyshJ+S6TGl0doneCgUmry0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0oDQmjwNLQa7uDIdvZRebl3/WrRyakl1jgsk+1GfAeg=; b=c
 JHrwngdsLbNYdenqm+pZlW99CbcRnzlcBLifFBrERMCj3sMiSGiJG/wuVmeqluJQOYG4OOastCEye
 ctGZZJV86efwhSPq+60mGUmmi3p+fpXO1Y2ik7sMglxN1l+HlRHM/wWT0TIlqxbVQ/4C/JVsYPd3j
 ykmXa3kfILCrw3gM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jt1o5-00Aqg4-A3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 04:35:42 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D415920774;
 Wed,  8 Jul 2020 04:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594182934;
 bh=iC/eGkn5R6Dr5BlSa2NuZAw+jNeYUWR7IubafwM+FSg=;
 h=From:To:Cc:Subject:Date:From;
 b=Op7JGPe0gjOv7+JxE+R0fnRmyrzfbBQZR5OixErTenMAoEnx++EZEoZxoiKIQz8N6
 letd3m2BRQzCtAEtqwpF1rzGO1mA3wOge9f30kXNFkvS/er53wjTwFTX0z21xZDpyq
 3lfSYDAwpNurfoKu1YenZrf+7yeVpxttooF6IgVA=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  7 Jul 2020 21:35:33 -0700
Message-Id: <20200708043533.2168771-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
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
X-Headers-End: 1jt1o5-00Aqg4-A3
Subject: [f2fs-dev] [PATCH] fsck.f2fs: Split build_segment_manager() to
 speed up auto-fix
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

From: Robin Hsu <robinhsu@google.com>

Speed up fsck in auto-fix mode by splitting
build_segment_manager() into two disjoint parts:
	early_build_segment_manager(), and
	late_build_segment_manager(),
where in some cases (when !need_fsync_data_record(), or cannot
find_fsync_inode()), late_build_segment_manager() won't be needed in
auto-fix mode.  This speeds up a little bit in those cases.

Signed-off-by: Robin Hsu <robinhsu@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/f2fs.h  |  3 +++
 fsck/mount.c | 34 ++++++++++++++++++++++++++++++----
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 2a00d35..76e8272 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -273,6 +273,9 @@ struct f2fs_sb_info {
 	u32 free_segments;
 
 	int cp_backuped;			/* backup valid checkpoint */
+
+	/* true if late_build_segment_manger() is called */
+	bool seg_manager_done;
 };
 
 static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
diff --git a/fsck/mount.c b/fsck/mount.c
index d0f2eab..e5fe734 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2284,7 +2284,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
-static int build_segment_manager(struct f2fs_sb_info *sbi)
+static int early_build_segment_manager(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
@@ -2306,7 +2306,7 @@ static int build_segment_manager(struct f2fs_sb_info *sbi)
 	sm_info->main_segments = get_sb(segment_count_main);
 	sm_info->ssa_blkaddr = get_sb(ssa_blkaddr);
 
-	if (build_sit_info(sbi) || build_curseg(sbi) || build_sit_entries(sbi)) {
+	if (build_sit_info(sbi) || build_curseg(sbi)) {
 		free(sm_info);
 		return -ENOMEM;
 	}
@@ -2314,6 +2314,20 @@ static int build_segment_manager(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
+static int late_build_segment_manager(struct f2fs_sb_info *sbi)
+{
+	if (sbi->seg_manager_done)
+		return 1; /* this function was already called */
+
+	sbi->seg_manager_done = true;
+	if (build_sit_entries(sbi)) {
+		free (sbi->sm_info);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
@@ -3387,6 +3401,12 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 	if (ret)
 		goto out;
 
+	ret = late_build_segment_manager(sbi);
+	if (ret < 0) {
+		ERR_MSG("late_build_segment_manager failed\n");
+		goto out;
+	}
+
 	ret = traverse_dnodes(sbi, &inode_list);
 out:
 	destroy_fsync_dnodes(&inode_list);
@@ -3457,8 +3477,8 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	sbi->last_valid_block_count = sbi->total_valid_block_count;
 	sbi->alloc_valid_block_count = 0;
 
-	if (build_segment_manager(sbi)) {
-		ERR_MSG("build_segment_manager failed\n");
+	if (early_build_segment_manager(sbi)) {
+		ERR_MSG("early_build_segment_manager failed\n");
 		return -1;
 	}
 
@@ -3475,6 +3495,12 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 	if (!f2fs_should_proceed(sb, get_cp(ckpt_flags)))
 		return 1;
 
+
+	if (late_build_segment_manager(sbi) < 0) {
+		ERR_MSG("late_build_segment_manager failed\n");
+		return -1;
+	}
+
 	if (f2fs_late_init_nid_bitmap(sbi)) {
 		ERR_MSG("f2fs_late_init_nid_bitmap failed\n");
 		return -1;
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
