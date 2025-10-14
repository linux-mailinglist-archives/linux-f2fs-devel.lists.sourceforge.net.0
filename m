Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1688BD918F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 13:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34kQu6lvX63fffjmviP+ZwI2OW5CWKqOVWSUqi1vvFE=; b=TmMQD1q3kCaNMc+KA41DmSqClI
	Q1YwZiFqjUQ5wAV/FKIzGUor8ebd6iVPNax835A3M+A9dutAm5a32RWldnupyIQBZL2iBYUcm6/+G
	gy9KoitoboJZnDkCo/SAH6iYGcCA1hi20rC4pYWuZXj2Cw3sjusORaDa48Q/CCZN3uTQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dVO-0000E2-Mb;
	Tue, 14 Oct 2025 11:47:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v8dVM-0000Dt-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 11:47:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vCuK7PHT/Q/QhXxwoavE5MHL212Mgig4lFthx3D7SFE=; b=fSrXdkKIRnfMTrIEGYL4ts161j
 XYEspyYH3aVc9chOd9tK1b2grLCIxpeEeZw7cDfB/ymbMbGvi5NG+suNWTGCCRAxYJn8h2vTmU3uf
 Ghw5QckO/TV+RORRW7NM6tpvkhOgPyaHeGsx2X0fcyn7V2r+iMBwaU4WPTizuGqahGVQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vCuK7PHT/Q/QhXxwoavE5MHL212Mgig4lFthx3D7SFE=; b=j
 Z34LvkV8i7O0Yg0Y8z2yoMr/SquCf2U1NL03f2Zmm71XpxVsx7ydoW3Pg1D2muQFw7e7j/ZbU3pU7
 Z85B+FujRyYbfGWUmvyodl+MC+WPaSkgPjRbq/jd3PXzrGUZPZmy5XClBWEJZOV0tK6wYJGS6c18t
 eOzoZFVpvbvDUzmk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dVM-0000IU-5E for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 11:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 764C36228E;
 Tue, 14 Oct 2025 11:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974A5C4CEE7;
 Tue, 14 Oct 2025 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760442462;
 bh=j+g5Eqjx0MTwUbgaKhhj1vRq4cBecflGOLWMsOYorwQ=;
 h=From:To:Cc:Subject:Date:From;
 b=pfQRHsVlEdAfotQL8PbTVDwkCzk5lXak3c4QP7+q1t1M+sP0RX3jm/Vr7Nfz2Jeff
 czAjLAL4cqo4+RFkjZuxRFzZx16wxrPd8WcBTvO53wDdSw+UmpNN2D01s9l2tF8AwS
 V3g15OWr3APajnKEimIBWLQ1WoV8oLcQrWWDgPzzDjA7+sBdggQcGwNI6q63/X3NKc
 9tGO3AC5NpBSk2PtOOGA8lDfzXROqsBUxPxfb/LAj/drqmA3y7IoiHZ2FCKDktrEd1
 g4XdCPjdrrMg+pLY1IAn4P4DYMEJjuiNOcmk6lA54VsIZbSGFV4dnjPS1Fro6jjqPF
 peFjqwedbnwdw==
To: jaegeuk@kernel.org
Date: Tue, 14 Oct 2025 19:47:35 +0800
Message-ID: <20251014114735.1840965-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.760.g7b8bcc2412-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As Jiaming Zhang and syzbot reported,
 there is potential deadlock
 in f2fs as below: Chain exists of: &sbi->cp_rwsem --> fs_reclaim -->
 sb_internal#2 Possible unsafe locking scenario: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8dVM-0000IU-5E
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: syzbot+14b90e1156b9f6fc1266@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jiaming Zhang <r772577952@gmail.com>, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Jiaming Zhang and syzbot reported, there is potential deadlock in
f2fs as below:

Chain exists of:
  &sbi->cp_rwsem --> fs_reclaim --> sb_internal#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(sb_internal#2);
                               lock(fs_reclaim);
                               lock(sb_internal#2);
  rlock(&sbi->cp_rwsem);

 *** DEADLOCK ***

3 locks held by kswapd0/73:
 #0: ffffffff8e247a40 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:7015 [inline]
 #0: ffffffff8e247a40 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0x951/0x2800 mm/vmscan.c:7389
 #1: ffff8880118400e0 (&type->s_umount_key#50){.+.+}-{4:4}, at: super_trylock_shared fs/super.c:562 [inline]
 #1: ffff8880118400e0 (&type->s_umount_key#50){.+.+}-{4:4}, at: super_cache_scan+0x91/0x4b0 fs/super.c:197
 #2: ffff888011840610 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x8d9/0x1b60 fs/f2fs/inode.c:890

stack backtrace:
CPU: 0 UID: 0 PID: 73 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full)
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2043
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 down_read+0x46/0x2e0 kernel/locking/rwsem.c:1537
 f2fs_down_read fs/f2fs/f2fs.h:2278 [inline]
 f2fs_lock_op fs/f2fs/f2fs.h:2357 [inline]
 f2fs_do_truncate_blocks+0x21c/0x10c0 fs/f2fs/file.c:791
 f2fs_truncate_blocks+0x10a/0x300 fs/f2fs/file.c:867
 f2fs_truncate+0x489/0x7c0 fs/f2fs/file.c:925
 f2fs_evict_inode+0x9f2/0x1b60 fs/f2fs/inode.c:897
 evict+0x504/0x9c0 fs/inode.c:810
 f2fs_evict_inode+0x1dc/0x1b60 fs/f2fs/inode.c:853
 evict+0x504/0x9c0 fs/inode.c:810
 dispose_list fs/inode.c:852 [inline]
 prune_icache_sb+0x21b/0x2c0 fs/inode.c:1000
 super_cache_scan+0x39b/0x4b0 fs/super.c:224
 do_shrink_slab+0x6ef/0x1110 mm/shrinker.c:437
 shrink_slab_memcg mm/shrinker.c:550 [inline]
 shrink_slab+0x7ef/0x10d0 mm/shrinker.c:628
 shrink_one+0x28a/0x7c0 mm/vmscan.c:4955
 shrink_many mm/vmscan.c:5016 [inline]
 lru_gen_shrink_node mm/vmscan.c:5094 [inline]
 shrink_node+0x315d/0x3780 mm/vmscan.c:6081
 kswapd_shrink_node mm/vmscan.c:6941 [inline]
 balance_pgdat mm/vmscan.c:7124 [inline]
 kswapd+0x147c/0x2800 mm/vmscan.c:7389
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

The root cause is deadlock among four locks as below:

kswapd
- fs_reclaim				--- Lock A
 - shrink_one
  - evict
   - f2fs_evict_inode
    - sb_start_intwrite			--- Lock B

- iput
 - evict
  - f2fs_evict_inode
   - sb_start_intwrite			--- Lock B
   - f2fs_truncate
    - f2fs_truncate_blocks
     - f2fs_do_truncate_blocks
      - f2fs_lock_op			--- Lock C

ioctl
- f2fs_ioc_commit_atomic_write
 - f2fs_lock_op				--- Lock C
  - __f2fs_commit_atomic_write
   - __replace_atomic_write_block
    - f2fs_get_dnode_of_data
     - __get_node_folio
      - f2fs_check_nid_range
       - f2fs_handle_error
        - f2fs_record_errors
         - f2fs_down_write		--- Lock D

open
- do_open
 - do_truncate
  - security_inode_need_killpriv
   - f2fs_getxattr
    - lookup_all_xattrs
     - f2fs_handle_error
      - f2fs_record_errors
       - f2fs_down_write		--- Lock D
        - f2fs_commit_super
         - read_mapping_folio
          - filemap_alloc_folio_noprof
           - prepare_alloc_pages
            - fs_reclaim_acquire	--- Lock A

In order to avoid such deadlock, we need to avoid grabbing sb_lock in
f2fs_handle_error(), so, let's use asynchronous method instead:
- remove f2fs_handle_error() implementation
- rename f2fs_handle_error_async() to f2fs_handle_error()
- spread f2fs_handle_error()

Fixes: 95fa90c9e5a7 ("f2fs: support recording errors into superblock")
Cc: stable@kernel.org
Reported-by: syzbot+14b90e1156b9f6fc1266@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/68eae49b.050a0220.ac43.0001.GAE@google.com
Reported-by: Jiaming Zhang <r772577952@gmail.com>
Closes: https://lore.kernel.org/lkml/CANypQFa-Gy9sD-N35o3PC+FystOWkNuN8pv6S75HLT0ga-Tzgw@mail.gmail.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
Please notice that this patch is base on below patch:
f2fs: fix to do sanity check on node footer in {read,write}_end_io

 fs/f2fs/compress.c |  5 +----
 fs/f2fs/f2fs.h     |  1 -
 fs/f2fs/node.c     |  6 ++----
 fs/f2fs/super.c    | 41 -----------------------------------------
 4 files changed, 3 insertions(+), 50 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6ad8d3bc6df7..811bfe38e5c0 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -759,10 +759,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 		ret = -EFSCORRUPTED;
 
 		/* Avoid f2fs_commit_super in irq context */
-		if (!in_task)
-			f2fs_handle_error_async(sbi, ERROR_FAIL_DECOMPRESSION);
-		else
-			f2fs_handle_error(sbi, ERROR_FAIL_DECOMPRESSION);
+		f2fs_handle_error(sbi, ERROR_FAIL_DECOMPRESSION);
 		goto out_release;
 	}
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c589aed069d9..c3e968787d7e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3815,7 +3815,6 @@ void f2fs_quota_off_umount(struct super_block *sb);
 void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
 void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason);
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
-void f2fs_handle_error_async(struct f2fs_sb_info *sbi, unsigned char error);
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
 int f2fs_sync_fs(struct super_block *sb, int sync);
 int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e70c970a3047..ce471e033774 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1550,10 +1550,8 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
 		ntype, nid, nid_of_node(folio), ino_of_node(folio),
 		ofs_of_node(folio), cpver_of_node(folio),
 		next_blkaddr_of_node(folio));
-	if (in_irq)
-		f2fs_handle_error_async(sbi, ERROR_INCONSISTENT_FOOTER);
-	else
-		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
+
+	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
 	return -EFSCORRUPTED;
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2ae341768a39..1dd4a93ba4bb 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4544,48 +4544,7 @@ void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
 	spin_unlock_irqrestore(&sbi->error_lock, flags);
 }
 
-static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
-{
-	unsigned long flags;
-	bool need_update = false;
-
-	spin_lock_irqsave(&sbi->error_lock, flags);
-	if (sbi->error_dirty) {
-		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors,
-							MAX_F2FS_ERRORS);
-		sbi->error_dirty = false;
-		need_update = true;
-	}
-	spin_unlock_irqrestore(&sbi->error_lock, flags);
-
-	return need_update;
-}
-
-static void f2fs_record_errors(struct f2fs_sb_info *sbi, unsigned char error)
-{
-	int err;
-
-	f2fs_down_write(&sbi->sb_lock);
-
-	if (!f2fs_update_errors(sbi))
-		goto out_unlock;
-
-	err = f2fs_commit_super(sbi, false);
-	if (err)
-		f2fs_err_ratelimited(sbi,
-			"f2fs_commit_super fails to record errors:%u, err:%d",
-			error, err);
-out_unlock:
-	f2fs_up_write(&sbi->sb_lock);
-}
-
 void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
-{
-	f2fs_save_errors(sbi, error);
-	f2fs_record_errors(sbi, error);
-}
-
-void f2fs_handle_error_async(struct f2fs_sb_info *sbi, unsigned char error)
 {
 	f2fs_save_errors(sbi, error);
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
