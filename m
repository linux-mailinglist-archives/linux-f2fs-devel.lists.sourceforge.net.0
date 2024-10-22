Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8989A9CDF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 10:36:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3ANe-0007SQ-0z;
	Tue, 22 Oct 2024 08:36:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3ANb-0007SJ-DG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 08:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IAQExpQ2VVXJqqOp1PjNKGgM0RL/TTaqEcQ4ZTKxblw=; b=L5iRTUhiJRlbVsvY4DPlrknkFn
 nAZnnWp7lY8adGxxgFhSrYB76sVoNqRbmSYO774XUssl9Dk1bP4WKcgPU94FE7Bw+4X6o9RnPHWdG
 ZK7+7olXwQmP2ciEPghFJ3qb1LcS0B3l9SjMhUPm4V0anJWvaX4c4JtitpIeK8bMnnc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IAQExpQ2VVXJqqOp1PjNKGgM0RL/TTaqEcQ4ZTKxblw=; b=B
 fP15bARLrhxbawv9dVV4guAaSe3oZ6/hoak4ODpbOzOGUhGPFZkNV09ItKr7UqS6D7um3hrlqii4T
 fr2AaOaSCbh2vEWet5n8CwccA/poBjb8iGGRWSTWqenSBzgp/EmX7LHy9+/H2FYSyR6P4Ye3Y/GlY
 lrD7TmydjA604m14=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3ANa-000110-Ft for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 08:36:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 98A2F5C42B7;
 Tue, 22 Oct 2024 08:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E30CC4CEC3;
 Tue, 22 Oct 2024 08:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729586192;
 bh=cs3qnvWB45CLzEZtHHIHemYwXCravNhrfo6+sjOzGEI=;
 h=From:To:Cc:Subject:Date:From;
 b=PTTcR5kFjecbk2kTj1+N+U5csP5E00xLf3PwOvMxrVpdcMb3W1bRt8HsISsB2Tyt4
 8J/shNDHPCZwo338KpTdXdxSGLrzveL0Hd40hkjQG5zEpriU541cy9GKb1evLsyAvu
 SlxXxpW7UyPj0pnZEvvHZZ/szVXt29mIuXyJfG/VppYXZX8SyABgCDKfzO8tMi45Ad
 cB3iFLYBMhPem/jA5JgGDHA09SKu335YbrAVFExDPMqcGsvx1j5666Kr/KyLQnCb9p
 zgdE/TcO3FPp8bOz6sQjKFY6JuMGlr0HoGN30K2WP2SJWvj4N+IgeEi8HpyAPeMeGl
 8Onaa64CuE0vA==
To: jaegeuk@kernel.org
Date: Tue, 22 Oct 2024 16:36:23 +0800
Message-Id: <20241022083623.2641434-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports deadlock issue of f2fs as below:
 ======================================================
 WARNING: possible circular locking dependency detected
 6.12.0-rc3-syzkaller-00087-gc964ced77262 #0 Not tainted [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3ANa-000110-Ft
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to avoid potential deadlock in
 f2fs_record_stop_reason()
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
Cc: syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports deadlock issue of f2fs as below:

======================================================
WARNING: possible circular locking dependency detected
6.12.0-rc3-syzkaller-00087-gc964ced77262 #0 Not tainted
------------------------------------------------------
kswapd0/79 is trying to acquire lock:
ffff888011824088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2199 [inline]
ffff888011824088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_record_stop_reason+0x52/0x1d0 fs/f2fs/super.c:4068

but task is already holding lock:
ffff88804bd92610 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #2 (sb_internal#2){.+.+}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1716 [inline]
       sb_start_intwrite+0x4d/0x1c0 include/linux/fs.h:1899
       f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842
       evict+0x4e8/0x9b0 fs/inode.c:725
       f2fs_evict_inode+0x1a4/0x15c0 fs/f2fs/inode.c:807
       evict+0x4e8/0x9b0 fs/inode.c:725
       dispose_list fs/inode.c:774 [inline]
       prune_icache_sb+0x239/0x2f0 fs/inode.c:963
       super_cache_scan+0x38c/0x4b0 fs/super.c:223
       do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
       shrink_slab+0x1093/0x14d0 mm/shrinker.c:662
       shrink_one+0x43b/0x850 mm/vmscan.c:4818
       shrink_many mm/vmscan.c:4879 [inline]
       lru_gen_shrink_node mm/vmscan.c:4957 [inline]
       shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
       kswapd_shrink_node mm/vmscan.c:6765 [inline]
       balance_pgdat mm/vmscan.c:6957 [inline]
       kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
       kthread+0x2f0/0x390 kernel/kthread.c:389
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       __fs_reclaim_acquire mm/page_alloc.c:3834 [inline]
       fs_reclaim_acquire+0x88/0x130 mm/page_alloc.c:3848
       might_alloc include/linux/sched/mm.h:318 [inline]
       prepare_alloc_pages+0x147/0x5b0 mm/page_alloc.c:4493
       __alloc_pages_noprof+0x16f/0x710 mm/page_alloc.c:4722
       alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2265
       alloc_pages_noprof mm/mempolicy.c:2345 [inline]
       folio_alloc_noprof+0x128/0x180 mm/mempolicy.c:2352
       filemap_alloc_folio_noprof+0xdf/0x500 mm/filemap.c:1010
       do_read_cache_folio+0x2eb/0x850 mm/filemap.c:3787
       read_mapping_folio include/linux/pagemap.h:1011 [inline]
       f2fs_commit_super+0x3c0/0x7d0 fs/f2fs/super.c:4032
       f2fs_record_stop_reason+0x13b/0x1d0 fs/f2fs/super.c:4079
       f2fs_handle_critical_error+0x2ac/0x5c0 fs/f2fs/super.c:4174
       f2fs_write_inode+0x35f/0x4d0 fs/f2fs/inode.c:785
       write_inode fs/fs-writeback.c:1503 [inline]
       __writeback_single_inode+0x711/0x10d0 fs/fs-writeback.c:1723
       writeback_single_inode+0x1f3/0x660 fs/fs-writeback.c:1779
       sync_inode_metadata+0xc4/0x120 fs/fs-writeback.c:2849
       f2fs_release_file+0xa8/0x100 fs/f2fs/file.c:1941
       __fput+0x23f/0x880 fs/file_table.c:431
       task_work_run+0x24f/0x310 kernel/task_work.c:228
       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
       exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
       exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
       __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
       syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
       do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&sbi->sb_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
       __lock_acquire+0x1384/0x2050 kernel/locking/lockdep.c:5202
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       down_write+0x99/0x220 kernel/locking/rwsem.c:1577
       f2fs_down_write fs/f2fs/f2fs.h:2199 [inline]
       f2fs_record_stop_reason+0x52/0x1d0 fs/f2fs/super.c:4068
       f2fs_handle_critical_error+0x2ac/0x5c0 fs/f2fs/super.c:4174
       f2fs_evict_inode+0xa61/0x15c0 fs/f2fs/inode.c:883
       evict+0x4e8/0x9b0 fs/inode.c:725
       f2fs_evict_inode+0x1a4/0x15c0 fs/f2fs/inode.c:807
       evict+0x4e8/0x9b0 fs/inode.c:725
       dispose_list fs/inode.c:774 [inline]
       prune_icache_sb+0x239/0x2f0 fs/inode.c:963
       super_cache_scan+0x38c/0x4b0 fs/super.c:223
       do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
       shrink_slab+0x1093/0x14d0 mm/shrinker.c:662
       shrink_one+0x43b/0x850 mm/vmscan.c:4818
       shrink_many mm/vmscan.c:4879 [inline]
       lru_gen_shrink_node mm/vmscan.c:4957 [inline]
       shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
       kswapd_shrink_node mm/vmscan.c:6765 [inline]
       balance_pgdat mm/vmscan.c:6957 [inline]
       kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
       kthread+0x2f0/0x390 kernel/kthread.c:389
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

other info that might help us debug this:

Chain exists of:
  &sbi->sb_lock --> fs_reclaim --> sb_internal#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(sb_internal#2);
                               lock(fs_reclaim);
                               lock(sb_internal#2);
  lock(&sbi->sb_lock);

Root cause is there will be potential deadlock in between
below tasks:

Thread A				Kswapd
- f2fs_ioc_commit_atomic_write
 - mnt_want_write_file -- down_read lock A
					- balance_pgdat
					 - __fs_reclaim_acquire  -- lock B
					  - shrink_node
					   - prune_icache_sb
					    - dispose_list
					     - f2fs_evict_inode
					      - sb_start_intwrite  -- down_read lock A
 - f2fs_do_sync_file
  - f2fs_write_inode
   - f2fs_handle_critical_error
    - f2fs_record_stop_reason
     - f2fs_commit_super
      - read_mapping_folio
       - filemap_alloc_folio_noprof
        - fs_reclaim_acquire  -- lock B

Both threads try to acquire read lock of lock A, then its upcoming write
lock grabber will trigger deadlock.

Let's always create an asynchronous task in f2fs_handle_critical_error()
rather than calling f2fs_record_stop_reason() synchronously to avoid
this potential deadlock issue.

Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic mountoption")
Reported-by: syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6704d667.050a0220.1e4d62.0081.GAE@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- remove unneeded irq_context parameter from
f2fs_handle_critical_error() pointed by Daejun Park.
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/f2fs.h       |  3 +--
 fs/f2fs/super.c      | 13 +++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 7f76460b721f..efda9a022981 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -32,7 +32,7 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 	f2fs_build_fault_attr(sbi, 0, 0);
 	if (!end_io)
 		f2fs_flush_merged_writes(sbi);
-	f2fs_handle_critical_error(sbi, reason, end_io);
+	f2fs_handle_critical_error(sbi, reason);
 }
 
 /*
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9b7fa960cd8b..18a3343d8831 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3644,8 +3644,7 @@ int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
 void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
-void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
-							bool irq_context);
+void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
 void f2fs_handle_error_async(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9325d8dc7f7d..d9e64ed14092 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4161,8 +4161,7 @@ static bool system_going_down(void)
 		|| system_state == SYSTEM_RESTART;
 }
 
-void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
-							bool irq_context)
+void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason)
 {
 	struct super_block *sb = sbi->sb;
 	bool shutdown = reason == STOP_CP_REASON_SHUTDOWN;
@@ -4174,10 +4173,12 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
 	if (!f2fs_hw_is_readonly(sbi)) {
 		save_stop_reason(sbi, reason);
 
-		if (irq_context && !shutdown)
-			schedule_work(&sbi->s_error_work);
-		else
-			f2fs_record_stop_reason(sbi);
+		/*
+		 * always create an asynchronous task to record stop_reason
+		 * in order to avoid potential deadlock when running into
+		 * f2fs_record_stop_reason() synchronously.
+		 */
+		schedule_work(&sbi->s_error_work);
 	}
 
 	/*
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
