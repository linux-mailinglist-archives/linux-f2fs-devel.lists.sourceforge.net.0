Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2283F14C1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Aug 2021 10:03:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGd0q-0003ar-Pv; Thu, 19 Aug 2021 08:02:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mGd0l-0003ak-PP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 08:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MWXYt0dxrTXDCA+Nky1zKojyLZgRojm/yorz7Q1qISE=; b=WSBBSeE1q27MWJhOho0iipM2cU
 8pJQPaQlCytSwoMBtrtnx7DaP0QZtjbhJF0XVJuYUFIBPBPdLof4Gm1LgXCLla+4s/Ua0WD9j8ZhJ
 dF27dXpxoAWY3i0ectMB0v+3vBLASPFOlafr78StuiWbAel2ya0WcqKi4EyoyzGrBMtc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MWXYt0dxrTXDCA+Nky1zKojyLZgRojm/yorz7Q1qISE=; b=R
 cfwHdfKYb10S0xYX/BzxFouuESaoV94Zl+9CT/Z/bdhKtMZwx4JpyZyaeTqatqqgKxGXqk6FNiY1p
 0jAxg9wB4IhvhuVytMjBjYdFzzlbJnH1a6hOFaolrI3xsTZCE2pjNcugndCSD3vfkB02fbcEvIrV2
 txCxsifX8UrKFFfs=;
Received: from mail-m17635.qiye.163.com ([59.111.176.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGd0h-00007b-Kw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Aug 2021 08:02:51 +0000
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m17635.qiye.163.com (Hmail) with ESMTPA id 5DCCF40011F;
 Thu, 19 Aug 2021 16:02:39 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 19 Aug 2021 16:02:37 +0800
Message-Id: <20210819080237.12462-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlPSUJWQ01IGE1DSENMT0
 hMVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSI6USo*OT9OExcSTT8vIxA6
 FjEwCkNVSlVKTUlCSE1LSk1LTkxKVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFOTElJNwY+
X-HM-Tid: 0a7b5d6efb38d991kuws5dccf40011f
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.35 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mGd0h-00007b-Kw
Subject: [f2fs-dev] [PATCH v5] f2fs: Don't create discard thread when device
 doesn't support realtime discard
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
Cc: Yangtao Li <frank.li@vivo.com>, Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Don't create discard thread when device doesn't support realtime discard
or user specifies nodiscard mount option.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/segment.c | 25 +++++++++++++++++++------
 fs/f2fs/super.c   | 27 ++++++++++++++++++++++++++-
 3 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fe5f280f6ac0..d64a2b80add5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3511,6 +3511,7 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
 void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
+int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
 bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b4dd22134a73..8b1119fc246d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2114,9 +2114,25 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 	wake_up_discard_thread(sbi, false);
 }
 
-static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
+int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 {
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	int err = 0;
+
+	if (!f2fs_realtime_discard_enable(sbi))
+		return 0;
+
+	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
+				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
+	if (IS_ERR(dcc->f2fs_issue_discard))
+		err = PTR_ERR(dcc->f2fs_issue_discard);
+
+	return err;
+}
+
+static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
+{
 	struct discard_cmd_control *dcc;
 	int err = 0, i;
 
@@ -2154,13 +2170,10 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	init_waitqueue_head(&dcc->discard_wait_queue);
 	SM_I(sbi)->dcc_info = dcc;
 init_thread:
-	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
-				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(dcc->f2fs_issue_discard)) {
-		err = PTR_ERR(dcc->f2fs_issue_discard);
+	err = f2fs_start_discard_thread(sbi);
+	if (err) {
 		kfree(dcc);
 		SM_I(sbi)->dcc_info = NULL;
-		return err;
 	}
 
 	return err;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b556ca38f0fb..f7972b704d56 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2103,12 +2103,15 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool need_restart_gc = false, need_stop_gc = false;
 	bool need_restart_ckpt = false, need_stop_ckpt = false;
 	bool need_restart_flush = false, need_stop_flush = false;
+	bool need_restart_discard = false, need_stop_discard = false;
 	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
 	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
 	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool no_atgc = !test_opt(sbi, ATGC);
+	bool no_discard = !test_opt(sbi, DISCARD);
 	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
 	bool block_unit_discard = f2fs_block_unit_discard(sbi);
+	struct discard_cmd_control *dcc;
 #ifdef CONFIG_QUOTA
 	int i, j;
 #endif
@@ -2280,11 +2283,26 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		need_stop_flush = true;
 	}
 
+	if (no_discard == !!test_opt(sbi, DISCARD)) {
+		if (test_opt(sbi, DISCARD)) {
+			err = f2fs_start_discard_thread(sbi);
+			if (err)
+				goto restore_flush;
+			need_stop_discard = true;
+		} else {
+			dcc = SM_I(sbi)->dcc_info;
+			f2fs_stop_discard_thread(sbi);
+			if (atomic_read(&dcc->discard_cmd_cnt))
+				f2fs_issue_discard_timeout(sbi);
+			need_restart_discard = true;
+		}
+	}
+
 	if (enable_checkpoint == !!test_opt(sbi, DISABLE_CHECKPOINT)) {
 		if (test_opt(sbi, DISABLE_CHECKPOINT)) {
 			err = f2fs_disable_checkpoint(sbi);
 			if (err)
-				goto restore_flush;
+				goto restore_discard;
 		} else {
 			f2fs_enable_checkpoint(sbi);
 		}
@@ -2304,6 +2322,13 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	adjust_unusable_cap_perc(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 	return 0;
+restore_discard:
+	if (need_restart_discard) {
+		if (f2fs_start_discard_thread(sbi))
+			f2fs_warn(sbi, "discard has been stopped");
+	} else if (need_stop_discard) {
+		f2fs_stop_discard_thread(sbi);
+	}
 restore_flush:
 	if (need_restart_flush) {
 		if (f2fs_create_flush_cmd_control(sbi))
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
