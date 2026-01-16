Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5F9D2AEDA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 04:45:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/I/0obG98zJrUBDu0CVJ8n5tLTc9M4Uxo0B9pel/AIU=; b=fPe2IPbExWNThRe1loul+iTbyq
	WtxnacvCKKGXBPQhElvWpMZTUL8OKg6yuC/FUdZKOq/ZJ/cdMHwWHsWN8l4JzG6AR9Q7JBtQrOLeU
	hvwLuVKM/uiD5bZCteR92qCzkXhIbf4zAhKmxe5YF1NLlumayXfj2o2JIa9SikDYeDgw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgamB-0004Zu-4g;
	Fri, 16 Jan 2026 03:45:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vgam9-0004Zm-LB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 03:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Vip3YRDM758vhRKqWvuTMOv10N1OBgi59rOOddukNk=; b=aAvAu9CwsxMHnr26MuvNQPqu01
 ao2yKaWMr96eV3QDP4hQJTz09r0DwZ4HnGh3A90qbRVfXV/tuXTrrINycQ/Dw8WPie7/NMZtUM252
 5jJIkxmrWsFNhE8AiLPcV5Ow+pFKX3PN0S6KHDqU/dim35RBOp65Vw0pmZEjeA7pSXus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+Vip3YRDM758vhRKqWvuTMOv10N1OBgi59rOOddukNk=; b=a
 WFWSdb+56kCJg9sO8L8gOD9SwB7uF4L7Z/rVVWOo5CvAFNe1wLl+IrkwpZFOkb/h4bbGHOE7Qxnl7
 cyeyPDShMY70Iw7X1G+ulpGvbZnfqAfa8zETQgRNinztYVWGTTIcK5U3JYyiu3EUNmtTkbYslLTUo
 uJKzYie82DV9F1mk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgam9-0001rd-3v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 03:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A74DC40811
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jan 2026 03:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4396DC116C6;
 Fri, 16 Jan 2026 03:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768535123;
 bh=Sv+qcTAySOu9u7pad8UIjc5LXZ7mcEG6UbhlW3iTK1A=;
 h=From:To:Cc:Subject:Date:From;
 b=JLHtT0k1bIYSjGEEIsWoQXQxAuj/dq10FDFMsSekk1aeYCpJkJkuXgMnNX5WUJZBr
 4Kyifd86R79/SFRxGuLQibZbBcEBsRWR7dTcvcdOqKcVhTnve/9IVn6C8XptZPySRo
 su1h8C52VlNl8m2GV5xglyPLxtEr1P0wOve8KbZHi5vNVqRoEcHxtuwOLE2h7aS7Dx
 5gX/n10NJEA6pr2sqnavTJL8fmrAPPwK+qlE1dhH9uJxLGj9tih5RWxJF6DcQjkifK
 dzm2R0Pvw89qAHk0vJj26dvsznAg0UQVaP+amjV860zNNaSEF90LZ1PGif4lr2Y0ll
 mjbdrfPjsRYCQ==
To: jaegeuk@kernel.org
Date: Fri, 16 Jan 2026 11:38:16 +0800
Message-Id: <20260116033816.7399-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This reverts commit 196c81fdd438f7ac429d5639090a9816abb9760a.
 Original patch may cause below deadlock, revert it. write remount - write_begin
 - lock_page --- lock A - prepare_write_begin - f2fs_map_lock -
 f2fs_enable_checkpoint
 - down_write(cp_enable_rwsem) --- lock B - sync_inode_sb - writepages -
 lock_page --- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgam9-0001rd-3v
Subject: [f2fs-dev] [PATCH] Revert "f2fs: block cache/dio write during
 f2fs_enable_checkpoint()"
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
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This reverts commit 196c81fdd438f7ac429d5639090a9816abb9760a.

Original patch may cause below deadlock, revert it.

write				remount
- write_begin
 - lock_page  --- lock A
 - prepare_write_begin
  - f2fs_map_lock
				- f2fs_enable_checkpoint
				 - down_write(cp_enable_rwsem)  --- lock B
				 - sync_inode_sb
				  - writepages
				   - lock_page			--- lock A
   - down_read(cp_enable_rwsem)  --- lock A

Cc: stable@kernel.org
Fixes: 196c81fdd438 ("f2fs: block cache/dio write during f2fs_enable_checkpoint()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c  |  2 --
 fs/f2fs/f2fs.h  |  3 +--
 fs/f2fs/super.c | 38 ++++++++------------------------------
 3 files changed, 9 insertions(+), 34 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f32eb51ccee4..2e133a723b99 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1474,7 +1474,6 @@ static void f2fs_map_lock(struct f2fs_sb_info *sbi,
 				struct f2fs_lock_context *lc,
 				int flag)
 {
-	f2fs_down_read(&sbi->cp_enable_rwsem);
 	if (flag == F2FS_GET_BLOCK_PRE_AIO)
 		f2fs_down_read_trace(&sbi->node_change, lc);
 	else
@@ -1489,7 +1488,6 @@ static void f2fs_map_unlock(struct f2fs_sb_info *sbi,
 		f2fs_up_read_trace(&sbi->node_change, lc);
 	else
 		f2fs_unlock_op(sbi, lc);
-	f2fs_up_read(&sbi->cp_enable_rwsem);
 }
 
 int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ded41b416ed7..90aa1d53722a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -311,7 +311,7 @@ enum {
 #define DEF_CP_INTERVAL			60	/* 60 secs */
 #define DEF_IDLE_INTERVAL		5	/* 5 secs */
 #define DEF_DISABLE_INTERVAL		5	/* 5 secs */
-#define DEF_ENABLE_INTERVAL		5	/* 5 secs */
+#define DEF_ENABLE_INTERVAL		16	/* 16 secs */
 #define DEF_DISABLE_QUICK_INTERVAL	1	/* 1 secs */
 #define DEF_UMOUNT_DISCARD_TIMEOUT	5	/* 5 secs */
 
@@ -1762,7 +1762,6 @@ struct f2fs_sb_info {
 	long interval_time[MAX_TIME];		/* to store thresholds */
 	struct ckpt_req_control cprc_info;	/* for checkpoint request control */
 	struct cp_stats cp_stats;		/* for time stat of checkpoint */
-	struct f2fs_rwsem cp_enable_rwsem;	/* block cache/dio write */
 
 	struct inode_management im[MAX_INO_ENTRY];	/* manage inode cache */
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4573bac94793..25f796232ad9 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2687,12 +2687,11 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
 	unsigned int nr_pages = get_pages(sbi, F2FS_DIRTY_DATA) / 16;
-	long long start, writeback, lock, sync_inode, end;
+	long long start, writeback, end;
 	int ret;
 	struct f2fs_lock_context lc;
 
-	f2fs_info(sbi, "%s start, meta: %lld, node: %lld, data: %lld",
-					__func__,
+	f2fs_info(sbi, "f2fs_enable_checkpoint() starts, meta: %lld, node: %lld, data: %lld",
 					get_pages(sbi, F2FS_DIRTY_META),
 					get_pages(sbi, F2FS_DIRTY_NODES),
 					get_pages(sbi, F2FS_DIRTY_DATA));
@@ -2711,18 +2710,11 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	}
 	writeback = ktime_get();
 
-	f2fs_down_write(&sbi->cp_enable_rwsem);
-
-	lock = ktime_get();
-
-	if (get_pages(sbi, F2FS_DIRTY_DATA))
-		sync_inodes_sb(sbi->sb);
+	sync_inodes_sb(sbi->sb);
 
 	if (unlikely(get_pages(sbi, F2FS_DIRTY_DATA)))
-		f2fs_warn(sbi, "%s: has some unwritten data: %lld",
-			__func__, get_pages(sbi, F2FS_DIRTY_DATA));
-
-	sync_inode = ktime_get();
+		f2fs_warn(sbi, "checkpoint=enable has some unwritten data: %lld",
+					get_pages(sbi, F2FS_DIRTY_DATA));
 
 	f2fs_down_write_trace(&sbi->gc_lock, &lc);
 	f2fs_dirty_to_prefree(sbi);
@@ -2731,13 +2723,6 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	set_sbi_flag(sbi, SBI_IS_DIRTY);
 	f2fs_up_write_trace(&sbi->gc_lock, &lc);
 
-	f2fs_info(sbi, "%s sync_fs, meta: %lld, imeta: %lld, node: %lld, dents: %lld, qdata: %lld",
-					__func__,
-					get_pages(sbi, F2FS_DIRTY_META),
-					get_pages(sbi, F2FS_DIRTY_IMETA),
-					get_pages(sbi, F2FS_DIRTY_NODES),
-					get_pages(sbi, F2FS_DIRTY_DENTS),
-					get_pages(sbi, F2FS_DIRTY_QDATA));
 	ret = f2fs_sync_fs(sbi->sb, 1);
 	if (ret)
 		f2fs_err(sbi, "%s sync_fs failed, ret: %d", __func__, ret);
@@ -2745,17 +2730,11 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	/* Let's ensure there's no pending checkpoint anymore */
 	f2fs_flush_ckpt_thread(sbi);
 
-	f2fs_up_write(&sbi->cp_enable_rwsem);
-
 	end = ktime_get();
 
-	f2fs_info(sbi, "%s end, writeback:%llu, "
-				"lock:%llu, sync_inode:%llu, sync_fs:%llu",
-				__func__,
-				ktime_ms_delta(writeback, start),
-				ktime_ms_delta(lock, writeback),
-				ktime_ms_delta(sync_inode, lock),
-				ktime_ms_delta(end, sync_inode));
+	f2fs_info(sbi, "f2fs_enable_checkpoint() finishes, writeback:%llu, sync:%llu",
+					ktime_ms_delta(writeback, start),
+					ktime_ms_delta(end, writeback));
 	return ret;
 }
 
@@ -4952,7 +4931,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
 	spin_lock_init(&sbi->stat_lock);
 	init_f2fs_rwsem_trace(&sbi->cp_rwsem, sbi, LOCK_NAME_CP_RWSEM);
-	init_f2fs_rwsem(&sbi->cp_enable_rwsem);
 	init_f2fs_rwsem(&sbi->quota_sem);
 	init_waitqueue_head(&sbi->cp_wait);
 	spin_lock_init(&sbi->error_lock);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
