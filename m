Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F107DC503C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 02:48:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrPw8W97XoJ3xIWcSRlUa0advbA+ptpMkKqcuIP03fg=; b=Vxf4B5B/v9uMwWYfTvdA3U3d5x
	U6q017X1NtBEsk7RSSS1JLg5VCaJ73LPZYWtNCEjiJHToMSKRP17Og18KfGOG8eZEaELfxvYiHuxU
	iKIU9lKhhA3IZr4wfEvqeJMTZwnoqtM8AvPG4Z7V8A+pLy5gJ8gMYXSkj5eEqwIkBsm8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIzxw-0003ah-EQ;
	Wed, 12 Nov 2025 01:48:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIzxu-0003aa-QE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 01:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gTDBJsPSHdWM1Ct6VQAhjYiTygkjyqfjmJ15sTEVY7k=; b=F2miS0O5F4vJpZmIPUpaUDgt7X
 Tf2ixnH4oo7K4rehiipRJII+1583DrhcLxfDY/HrERfMht+Y97+hoP2i32iRS+r8O61C1ztzg798T
 G6/cqycB1F00IrIF+MJJFMFiO6YZkpd4rAOan3alH2LQQ2G0ULxAtsdPFSTUi1wWH//o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gTDBJsPSHdWM1Ct6VQAhjYiTygkjyqfjmJ15sTEVY7k=; b=cXXcpcNX9QbC1VNg/5q+nT0Hw4
 iEDp98jk720RvTbnPZ/BNwHCMY7dgpjn9hPEBDO4igoMWfQAJ+6Y6u5K3f5tuwFgXTQnxzXFnZ5Vm
 V4YU5K2wVfnYUSY8I7yFO0/Lu1oMlDw9uXNPr8Jko4R9OrYy+Y3D+vWjq4fKNiymCsxM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIzxu-0004uB-5K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 01:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 66B9C6020B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Nov 2025 01:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEA3C116B1;
 Wed, 12 Nov 2025 01:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762912080;
 bh=caTNvumpR+KdHLkJSpfpObyy4nYXY+CobTC0ucALsd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EMMFj4Fuavf+prqYjQuL/Fcq6Xe8sqIkFZ0/uxFszO5/RZ74/Man62RlZk2UHdu0o
 J21e/F9ZUPB9tN0/K4yu+AqlYQqEKHtFlcy7/8zuqqs45ZWDnQoY07kUuHgvWKFZQo
 ZOCRUDMrUpuBDVrcoS/j34epKGvXzmd2OkymnxB/8QggASDfk779iaQzDJhyeQpJZ7
 58y7TV5W1c/ffl51/ZePRm3mv1xcOkMrDvTzkJoKzqmEVueYLjEpxeQE2CT/Fq3dbj
 Fc5zFfzYHUAEMN3IbLDAgCG3OSLG0meyQ+FfgwbBWjrRooPc1VNfeN8VJdueEGoEPJ
 Hvq3VA8eUjEmg==
To: jaegeuk@kernel.org
Date: Wed, 12 Nov 2025 09:47:48 +0800
Message-ID: <20251112014749.2006439-2-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
In-Reply-To: <20251112014749.2006439-1-chao@kernel.org>
References: <20251112014749.2006439-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs retry logic, we will call f2fs_io_schedule_timeout()
 to sleep as uninterruptible state (waiting for IO) for a while, however,
 in several paths below, we are not blocked by IO: - f2fs_write_sin [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIzxu-0004uB-5K
Subject: [f2fs-dev] [PATCH v2 2/3] f2fs: introduce f2fs_schedule_timeout()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs retry logic, we will call f2fs_io_schedule_timeout() to sleep as
uninterruptible state (waiting for IO) for a while, however, in several
paths below, we are not blocked by IO:
- f2fs_write_single_data_page() return -EAGAIN due to racing on cp_rwsem.
- f2fs_flush_device_cache() failed to submit preflush command.
- __issue_discard_cmd_range() sleeps periodically in between two in batch
discard submissions.

So, in order to reveal state of task more accurate, let's introduce
f2fs_schedule_timeout() and call it in above paths in where we are waiting
for non-IO reasons.

Then we can get real reason of uninterruptible sleep for a thread in
tracepoint, perfetto, etc.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- get rid of f2fs_schedule_timeout() replacement in retry logic for no
memory error.
 fs/f2fs/checkpoint.c |  4 ++--
 fs/f2fs/compress.c   |  4 ++--
 fs/f2fs/data.c       |  4 ++--
 fs/f2fs/f2fs.h       | 22 +++++++++++++++-------
 fs/f2fs/segment.c    |  4 ++--
 fs/f2fs/super.c      |  2 +-
 6 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index bbe07e3a6c75..4c401b5b2933 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1318,7 +1318,7 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
 			f2fs_submit_merged_write(sbi, DATA);
 
 		prepare_to_wait(&sbi->cp_wait, &wait, TASK_UNINTERRUPTIBLE);
-		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+		io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 	}
 	finish_wait(&sbi->cp_wait, &wait);
 }
@@ -1974,7 +1974,7 @@ void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi)
 
 	/* Let's wait for the previous dispatched checkpoint. */
 	while (atomic_read(&cprc->queued_ckpt))
-		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+		io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 }
 
 void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 716004ba44dc..148bb925b03b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1057,7 +1057,7 @@ static void cancel_cluster_writeback(struct compress_ctx *cc,
 		f2fs_submit_merged_write(F2FS_I_SB(cc->inode), DATA);
 		while (atomic_read(&cic->pending_pages) !=
 					(cc->valid_nr_cpages - submitted + 1))
-			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+			f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 	}
 
 	/* Cancel writeback and stay locked. */
@@ -1574,7 +1574,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 				 */
 				if (IS_NOQUOTA(cc->inode))
 					goto out;
-				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+				f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 				goto retry_write;
 			}
 			goto out;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d8e163cc7308..48c20386f031 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3150,8 +3150,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				} else if (ret == -EAGAIN) {
 					ret = 0;
 					if (wbc->sync_mode == WB_SYNC_ALL) {
-						f2fs_io_schedule_timeout(
-							DEFAULT_IO_TIMEOUT);
+						f2fs_schedule_timeout(
+							DEFAULT_SCHEDULE_TIMEOUT);
 						goto retry_write;
 					}
 					goto next;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a4439175eabf..0d0e0a01a659 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -656,8 +656,8 @@ enum {
 
 #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
 
-/* congestion wait timeout value, default: 20ms */
-#define	DEFAULT_IO_TIMEOUT	(msecs_to_jiffies(20))
+/* IO/non-IO congestion wait timeout value, default: 20ms */
+#define	DEFAULT_SCHEDULE_TIMEOUT	(msecs_to_jiffies(20))
 
 /* timeout value injected, default: 1000ms */
 #define DEFAULT_FAULT_TIMEOUT	(msecs_to_jiffies(1000))
@@ -4919,22 +4919,30 @@ static inline bool f2fs_block_unit_discard(struct f2fs_sb_info *sbi)
 	return F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_BLOCK;
 }
 
-static inline void f2fs_io_schedule_timeout(long timeout)
+static inline void __f2fs_schedule_timeout(long timeout, bool io)
 {
 	set_current_state(TASK_UNINTERRUPTIBLE);
-	io_schedule_timeout(timeout);
+	if (io)
+		io_schedule_timeout(timeout);
+	else
+		schedule_timeout(timeout);
 }
 
+#define f2fs_io_schedule_timeout(timeout)		\
+			__f2fs_schedule_timeout(timeout, true)
+#define f2fs_schedule_timeout(timeout)			\
+			__f2fs_schedule_timeout(timeout, false)
+
 static inline void f2fs_io_schedule_timeout_killable(long timeout)
 {
 	while (timeout) {
 		if (fatal_signal_pending(current))
 			return;
 		set_current_state(TASK_UNINTERRUPTIBLE);
-		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
-		if (timeout <= DEFAULT_IO_TIMEOUT)
+		io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+		if (timeout <= DEFAULT_SCHEDULE_TIMEOUT)
 			return;
-		timeout -= DEFAULT_IO_TIMEOUT;
+		timeout -= DEFAULT_SCHEDULE_TIMEOUT;
 	}
 }
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d968a4250b1a..993ec8afe2db 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -750,7 +750,7 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
 		do {
 			ret = __submit_flush_wait(sbi, FDEV(i).bdev);
 			if (ret)
-				f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+				f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 		} while (ret && --count);
 
 		if (ret) {
@@ -3471,7 +3471,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 			blk_finish_plug(&plug);
 			mutex_unlock(&dcc->cmd_lock);
 			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+			f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 			goto next;
 		}
 skip:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2bd7c2320d4f..d47ec718f3be 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2652,7 +2652,7 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	/* we should flush all the data to keep data consistency */
 	while (get_pages(sbi, F2FS_DIRTY_DATA)) {
 		writeback_inodes_sb_nr(sbi->sb, nr_pages, WB_REASON_SYNC);
-		f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
 
 		if (f2fs_time_over(sbi, ENABLE_TIME))
 			break;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
