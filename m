Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E522A4E9FDE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Mar 2022 21:42:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nYv88-0004QI-O6; Mon, 28 Mar 2022 19:42:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sashal@kernel.org>) id 1nYv86-0004QC-MV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 19:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4jnQkpFleSNnszE7RZOyb3yJO9mFQyfdUd8ASdFgl2o=; b=gL/fqg1UGj+PJCOl4F2tab9t+H
 3hwl3bLV/xzgmt4fn9601idac0bWIlOrksPp/b7WK2K9DsK6/LLGbt/g0nq0AiR/sHQjrsd8Hf6vT
 TBJBs0RlJV/0uXOVZwZyndO49Sx2qNkx6ouzuotNlIyFBedqdVo0TOVI+IsWBW5XANWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4jnQkpFleSNnszE7RZOyb3yJO9mFQyfdUd8ASdFgl2o=; b=Yn3MlC/c7szdO1wgoBVdxdB35E
 OObmpXQ+C4hgKmLZFmY8tt+KjF6Rk9Zt/gzi2/c8A2VKBLKJKgnmPtHwEfCJne8T9buPscNi2ddcP
 obJe2Mr2bxyPo22j+ekkfby2f1m3LOf7Md2FhTx8turI+2x/pZV6X90fJnd7DHWA/2ps=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nYvG0-00EwnU-2m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Mar 2022 19:42:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BC34612CA;
 Mon, 28 Mar 2022 19:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D1BC34111;
 Mon, 28 Mar 2022 19:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648496541;
 bh=Ho/BjnVNGfweAgBtMiS7dBtzUEAbt0AM1Wjb60i/UUs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TDLZa+VaNAtwlieI6dmRL6auO3GEFPwnMIifx5a5nAoXuK6ePpaz8IOEjNCaCkJzo
 ut9gwcvtnJhcyktbpJXLqsS3ZxiDjN/VemASPUPhqqAgKp+w1srQCLaTwkXf6JgsdF
 Zpfr0Fw8/AYw0Sf8ZSTpkTqk4zQcNpnO+w4dpo22YFtB5Cok+OmQA9bDZ1IN/SRPIm
 VVNWWTbu9Gt741ypNOYjWDGbHqbtzxi7tiu1SYNO0blxMlFJtZBnHOPyKDGQ9McsSc
 IfiY66m0ULuqNS135/j7BrNQw71hfztxf7FEPtsouYGHKs94+ve1V8khxSS041IBHt
 iifd51w1AeHxg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 28 Mar 2022 15:41:53 -0400
Message-Id: <20220328194157.1585642-18-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220328194157.1585642-1-sashal@kernel.org>
References: <20220328194157.1585642-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Jaegeuk Kim <jaegeuk@kernel.org> [ Upstream commit
 98237fcda4a24e67b0a4498c17d5aa4ad4537bc7
 ] [14696.634553] task:cat state:D stack: 0 pid:1613738 ppid:1613735
 flags:0x00000004
 [14696.638285] Call Trace: [14696.639038] <TASK> [14696.640032]
 __schedule+0x302/0x930 [14696.640969] schedule+0x58/0 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nYvG0-00EwnU-2m
Subject: [f2fs-dev] [PATCH AUTOSEL 5.17 18/21] f2fs: use spin_lock to avoid
 hang
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 yuchao0@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 98237fcda4a24e67b0a4498c17d5aa4ad4537bc7 ]

[14696.634553] task:cat             state:D stack:    0 pid:1613738 ppid:1613735 flags:0x00000004
[14696.638285] Call Trace:
[14696.639038]  <TASK>
[14696.640032]  __schedule+0x302/0x930
[14696.640969]  schedule+0x58/0xd0
[14696.641799]  schedule_preempt_disabled+0x18/0x30
[14696.642890]  __mutex_lock.constprop.0+0x2fb/0x4f0
[14696.644035]  ? mod_objcg_state+0x10c/0x310
[14696.645040]  ? obj_cgroup_charge+0xe1/0x170
[14696.646067]  __mutex_lock_slowpath+0x13/0x20
[14696.647126]  mutex_lock+0x34/0x40
[14696.648070]  stat_show+0x25/0x17c0 [f2fs]
[14696.649218]  seq_read_iter+0x120/0x4b0
[14696.650289]  ? aa_file_perm+0x12a/0x500
[14696.651357]  ? lru_cache_add+0x1c/0x20
[14696.652470]  seq_read+0xfd/0x140
[14696.653445]  full_proxy_read+0x5c/0x80
[14696.654535]  vfs_read+0xa0/0x1a0
[14696.655497]  ksys_read+0x67/0xe0
[14696.656502]  __x64_sys_read+0x1a/0x20
[14696.657580]  do_syscall_64+0x3b/0xc0
[14696.658671]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[14696.660068] RIP: 0033:0x7efe39df1cb2
[14696.661133] RSP: 002b:00007ffc8badd948 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[14696.662958] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007efe39df1cb2
[14696.664757] RDX: 0000000000020000 RSI: 00007efe399df000 RDI: 0000000000000003
[14696.666542] RBP: 00007efe399df000 R08: 00007efe399de010 R09: 00007efe399de010
[14696.668363] R10: 0000000000000022 R11: 0000000000000246 R12: 0000000000000000
[14696.670155] R13: 0000000000000003 R14: 0000000000020000 R15: 0000000000020000
[14696.671965]  </TASK>
[14696.672826] task:umount          state:D stack:    0 pid:1614985 ppid:1614984 flags:0x00004000
[14696.674930] Call Trace:
[14696.675903]  <TASK>
[14696.676780]  __schedule+0x302/0x930
[14696.677927]  schedule+0x58/0xd0
[14696.679019]  schedule_preempt_disabled+0x18/0x30
[14696.680412]  __mutex_lock.constprop.0+0x2fb/0x4f0
[14696.681783]  ? destroy_inode+0x65/0x80
[14696.683006]  __mutex_lock_slowpath+0x13/0x20
[14696.684305]  mutex_lock+0x34/0x40
[14696.685442]  f2fs_destroy_stats+0x1e/0x60 [f2fs]
[14696.686803]  f2fs_put_super+0x158/0x390 [f2fs]
[14696.688238]  generic_shutdown_super+0x7a/0x120
[14696.689621]  kill_block_super+0x27/0x50
[14696.690894]  kill_f2fs_super+0x7f/0x100 [f2fs]
[14696.692311]  deactivate_locked_super+0x35/0xa0
[14696.693698]  deactivate_super+0x40/0x50
[14696.694985]  cleanup_mnt+0x139/0x190
[14696.696209]  __cleanup_mnt+0x12/0x20
[14696.697390]  task_work_run+0x64/0xa0
[14696.698587]  exit_to_user_mode_prepare+0x1b7/0x1c0
[14696.700053]  syscall_exit_to_user_mode+0x27/0x50
[14696.701418]  do_syscall_64+0x48/0xc0
[14696.702630]  entry_SYSCALL_64_after_hwframe+0x44/0xae

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/debug.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 07ad0d81f0c5..b449c7a372a4 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -21,7 +21,7 @@
 #include "gc.h"
 
 static LIST_HEAD(f2fs_stat_list);
-static DEFINE_MUTEX(f2fs_stat_mutex);
+static DEFINE_RAW_SPINLOCK(f2fs_stat_lock);
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *f2fs_debugfs_root;
 #endif
@@ -345,8 +345,9 @@ static int stat_show(struct seq_file *s, void *v)
 {
 	struct f2fs_stat_info *si;
 	int i = 0, j = 0;
+	unsigned long flags;
 
-	mutex_lock(&f2fs_stat_mutex);
+	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
 		update_general_status(si->sbi);
 
@@ -574,7 +575,7 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - paged : %llu KB\n",
 				si->page_mem >> 10);
 	}
-	mutex_unlock(&f2fs_stat_mutex);
+	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
 	return 0;
 }
 
@@ -585,6 +586,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	struct f2fs_stat_info *si;
+	unsigned long flags;
 	int i;
 
 	si = f2fs_kzalloc(sbi, sizeof(struct f2fs_stat_info), GFP_KERNEL);
@@ -620,9 +622,9 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->max_aw_cnt, 0);
 	atomic_set(&sbi->max_vw_cnt, 0);
 
-	mutex_lock(&f2fs_stat_mutex);
+	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_add_tail(&si->stat_list, &f2fs_stat_list);
-	mutex_unlock(&f2fs_stat_mutex);
+	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
 
 	return 0;
 }
@@ -630,10 +632,11 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
+	unsigned long flags;
 
-	mutex_lock(&f2fs_stat_mutex);
+	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_del(&si->stat_list);
-	mutex_unlock(&f2fs_stat_mutex);
+	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
 
 	kfree(si);
 }
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
