Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3699E3EB3D9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 12:11:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEUAG-0003h0-31; Fri, 13 Aug 2021 10:11:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1mEUAE-0003gu-MS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 10:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+uV0wnYahWEbtFkul2EgiXYzoii8RwkjEBj8I50mUxQ=; b=IKSteIjdJ2pfPJpwEPSUKSQ++U
 l9wRFVqKylwiK2kK96yYly7mFDCctlGWoMtKmx1ST2BmKngzVIzX9AZ4mQvmNsusyw/8yW1aAOuGr
 exmjbHEM4AeK3HLHDLkYtremazxrjX3NPQD7ZJ5MND4KPT6jQRsbOYAtNzzVB5TsgRag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+uV0wnYahWEbtFkul2EgiXYzoii8RwkjEBj8I50mUxQ=; b=E
 bf2JG4mXECQ9Hmco5ZIXZmHupmxfQVVoQ6MLtpQ9fk7mhPjWiDyVG9Ohnz9pDT6sV5KLzfJghughK
 xXW3I8fVLq0Z/WtBZn54w+pw1uZA0oSRgNuqAIGcv+U4Vdbvve5qJWVqU65ajuzB2TvLhnBOCVlis
 ou5H04mz7hWKbt+8=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEUAB-00044S-Ao
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 10:11:46 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id 19449C40221;
 Fri, 13 Aug 2021 18:11:34 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 13 Aug 2021 18:11:32 +0800
Message-Id: <20210813101132.441389-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkdTk5WSE1LHk9PSEMfTE
 IZVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODY6Ayo4TT8MIRhOLUJJIQkT
 SDwaCQhVSlVKTUlDQ09CT0JPTE1KVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQU1JSE03Bg++
X-HM-Tid: 0a7b3efed916d996kuws19449c40221
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mEUAB-00044S-Ao
Subject: [f2fs-dev] [PATCH v2] f2fs: Don't create discard thread when device
 not support realtime discard
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 Fengnan Chang <changfengnan@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Fengnan Chang <changfengnan@vivo.com>

Don't create discard thread when device not support realtime discard.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/segment.c | 29 +++++++++++++++++++++--------
 fs/f2fs/super.c   | 34 ++++++++++++++++++++++++++++++++--
 3 files changed, 54 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d24fd5045712..60a408af53a3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3483,6 +3483,7 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
 void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
+int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
 bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ca9876a6d396..b83a4a1e5023 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2112,7 +2112,27 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 wakeup:
 	wake_up_discard_thread(sbi, false);
 }
+int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
+{
+	dev_t dev = sbi->sb->s_bdev->bd_dev;
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	int err = 0;
 
+	if (!dcc)
+		return -EINVAL;
+	if (!f2fs_realtime_discard_enable(sbi))
+		return 0;
+
+	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
+				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
+	if (IS_ERR(dcc->f2fs_issue_discard)) {
+		err = PTR_ERR(dcc->f2fs_issue_discard);
+		kfree(dcc);
+		SM_I(sbi)->dcc_info = NULL;
+		return err;
+	}
+	return err;
+}
 static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 {
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
@@ -2153,14 +2173,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	init_waitqueue_head(&dcc->discard_wait_queue);
 	SM_I(sbi)->dcc_info = dcc;
 init_thread:
-	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
-				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(dcc->f2fs_issue_discard)) {
-		err = PTR_ERR(dcc->f2fs_issue_discard);
-		kfree(dcc);
-		SM_I(sbi)->dcc_info = NULL;
-		return err;
-	}
+	err = f2fs_start_discard_thread(sbi);
 
 	return err;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 84cd085020cd..ff19c30cd6a1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2101,12 +2101,15 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool need_restart_gc = false, need_stop_gc = false;
 	bool need_restart_ckpt = false, need_stop_ckpt = false;
 	bool need_restart_flush = false, need_stop_flush = false;
+	bool need_enable_ckpt = false, need_disable_ckpt = false;
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
@@ -2274,7 +2277,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	} else {
 		err = f2fs_create_flush_cmd_control(sbi);
 		if (err)
-			goto restore_ckpt;
+			goto restore_ckpt_thread;
 		need_stop_flush = true;
 	}
 
@@ -2283,8 +2286,28 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 			err = f2fs_disable_checkpoint(sbi);
 			if (err)
 				goto restore_flush;
+			need_enable_ckpt = true;
 		} else {
 			f2fs_enable_checkpoint(sbi);
+			need_disable_ckpt = true;
+		}
+	}
+
+	if (no_discard == !!test_opt(sbi, DISCARD)) {
+		if (test_opt(sbi, DISCARD)) {
+			err = f2fs_start_discard_thread(sbi);
+			if (err)
+				goto restore_ckpt;
+
+		} else {
+			dcc = SM_I(sbi)->dcc_info;
+			if (!dcc) {
+				err = -EINVAL;
+				goto restore_ckpt;
+			}
+			f2fs_stop_discard_thread(sbi);
+			if (unlikely(atomic_read(&dcc->discard_cmd_cnt)))
+				f2fs_issue_discard_timeout(sbi);
 		}
 	}
 
@@ -2302,6 +2325,13 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	adjust_unusable_cap_perc(sbi);
 	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 	return 0;
+restore_ckpt:
+	if (need_enable_ckpt) {
+		f2fs_enable_checkpoint(sbi);
+	} else if (need_disable_ckpt) {
+		if (f2fs_disable_checkpoint(sbi))
+			f2fs_warn(sbi, "checkpoint has been enable");
+	}
 restore_flush:
 	if (need_restart_flush) {
 		if (f2fs_create_flush_cmd_control(sbi))
@@ -2310,7 +2340,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		clear_opt(sbi, FLUSH_MERGE);
 		f2fs_destroy_flush_cmd_control(sbi, false);
 	}
-restore_ckpt:
+restore_ckpt_thread:
 	if (need_restart_ckpt) {
 		if (f2fs_start_ckpt_thread(sbi))
 			f2fs_warn(sbi, "background ckpt thread has stopped");
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
