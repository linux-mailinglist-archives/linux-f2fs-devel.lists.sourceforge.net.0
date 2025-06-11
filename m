Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7ADAD4EA6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Jun 2025 10:42:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7XGh0QWjU6wzzqgwiKpLz2EVO1v8Xio0hLdgRhjexPc=; b=RXgm1OKvS10xxTdu9usAjqY4Nv
	ARhNkPSnRaI/Zh7McpPonyVeRkCADY7mTz2bcdJDbA1eW5kYzMX9IXwusbNUAWllX0eCmv//8JbVo
	4hR5hzfeuWkOmNw53RZ9R1eA4WSIH6xSU2DG52c5DymnGaAhz74X5ebrQLHUsYmcul6o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPH2W-00030l-Gv;
	Wed, 11 Jun 2025 08:42:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPH2V-00030f-J2
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 08:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C5mphAndzYQDJ2ft07TzSyzAYv4YbI561hkefUXWDbs=; b=kSVQ/IFd6nHKQvs5RcLJlQ7P4T
 EOf8ghUlqJtgs7f/yni4/9Dh13a06A9gbP9heUCwnlzjNnZZaCp7RfvKHy7jZW2G1OkJGTfSxLNPW
 OJXaK5j2NsZ4p/7sGaMjVji98LBF/24SEeQ7QU4OUz7Iegg/ZDjBOfXJ3jVpVNQyUNQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C5mphAndzYQDJ2ft07TzSyzAYv4YbI561hkefUXWDbs=; b=Y
 oXFArGga9/kO535sn5xmuur+WAFrruqQKx6nsp3XeKjcoZn5kci+yK/noqe/MgOX8ZrzPGOOhG3t3
 zadUiaUMHC6iaN+yzR0o9apMnObuvQA0XXXa5f7eUzMu1crr56h80dO62zZxwKml3jj6DZ7DBaxnt
 Vs/sT6UbKqj+haWA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPH2V-0006t6-0j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Jun 2025 08:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B5B0C49F4F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Jun 2025 08:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36050C4CEEE;
 Wed, 11 Jun 2025 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749631345;
 bh=yTO9uxOi42yW7SZL06qosFQkiiQUmDffdoWv9dfSvko=;
 h=From:To:Cc:Subject:Date:From;
 b=dDfK1dP5J3dnQtjICKgaDbI2fwEBPgcsuwg+psGrlkWMY5bNbmrVO0NdnskXHBziD
 8TPwX/On+T2jC8dD21Ib3i22I6zXgwXpgnJgjytkVQvKLo1X7bq94Kex9iWKz0uP96
 ofDl4sz/snFyOsAEl1jVAermVvakna7gI3JwO0ngNeJlUEm3wckXkZYccrxJ03S0n9
 OMetaua773/MAAhStAiPwFyTisAOXPyl9hky8ETPMYtb+d8joMcRi2CyQj68fYI3xn
 X4/SwUP3wc2ZDKN+yI+LDBNL11Qo886Ijw0zVi/NwTflSCDcDbWnQTsz5O0+N8aw1O
 LF7ntkSudxqnw==
To: jaegeuk@kernel.org
Date: Wed, 11 Jun 2025 16:42:18 +0800
Message-ID: <20250611084218.62774-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ============================= [ BUG: Invalid wait context
 ] 6.13.0-rc1 #84 Tainted: G O cat/56160 is trying to lock: ffff888105c86648
 (&cprc->stat_lock){+.+.}-{3:3}, at: [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPH2V-0006t6-0j
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid invalid wait context issue
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

=============================
[ BUG: Invalid wait context ]
6.13.0-rc1 #84 Tainted: G           O
-----------------------------
cat/56160 is trying to lock:
ffff888105c86648 (&cprc->stat_lock){+.+.}-{3:3}, at: update_general_status+0x32a/0x8c0 [f2fs]
other info that might help us debug this:
context-{5:5}
2 locks held by cat/56160:
 #0: ffff88810a002a98 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0x56/0x4c0
 #1: ffffffffa0462638 (f2fs_stat_lock){....}-{2:2}, at: stat_show+0x29/0x1020 [f2fs]
stack backtrace:
CPU: 0 UID: 0 PID: 56160 Comm: cat Tainted: G           O       6.13.0-rc1 #84
Tainted: [O]=OOT_MODULE
Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
Call Trace:
 <TASK>
 dump_stack_lvl+0x88/0xd0
 dump_stack+0x14/0x20
 __lock_acquire+0x8d4/0xbb0
 lock_acquire+0xd6/0x300
 _raw_spin_lock+0x38/0x50
 update_general_status+0x32a/0x8c0 [f2fs]
 stat_show+0x50/0x1020 [f2fs]
 seq_read_iter+0x116/0x4c0
 seq_read+0xfa/0x130
 full_proxy_read+0x66/0x90
 vfs_read+0xc4/0x350
 ksys_read+0x74/0xf0
 __x64_sys_read+0x1d/0x20
 x64_sys_call+0x17d9/0x1b80
 do_syscall_64+0x68/0x130
 entry_SYSCALL_64_after_hwframe+0x67/0x6f
RIP: 0033:0x7f2ca53147e2

- seq_read
 - stat_show
  - raw_spin_lock_irqsave(&f2fs_stat_lock, flags)
  : f2fs_stat_lock is raw_spinlock_t type variable
  - update_general_status
   - spin_lock(&sbi->cprc_info.stat_lock);
   : stat_lock is spinlock_t type variable

The root cause is the lock order is incorrect [1], we should not acquire
spinlock_t lock after raw_spinlock_t lock, as if CONFIG_PREEMPT_LOCK is
on, spinlock_t is implemented based on rtmutex, which can sleep after
holding the lock.

To fix this issue, let's use change f2fs_stat_lock lock type from
raw_spinlock_t to spinlock_t, it's safe due to:
- we don't need to use raw version of spinlock as the path is not
performance sensitive.
- we don't need to use irqsave version of spinlock as it won't be
used in irq context.

Quoted from [1]:

"Extend lockdep to validate lock wait-type context.

The current wait-types are:

	LD_WAIT_FREE,		/* wait free, rcu etc.. */
	LD_WAIT_SPIN,		/* spin loops, raw_spinlock_t etc.. */
	LD_WAIT_CONFIG,		/* CONFIG_PREEMPT_LOCK, spinlock_t etc.. */
	LD_WAIT_SLEEP,		/* sleeping locks, mutex_t etc.. */

Where lockdep validates that the current lock (the one being acquired)
fits in the current wait-context (as generated by the held stack).

This ensures that there is no attempt to acquire mutexes while holding
spinlocks, to acquire spinlocks while holding raw_spinlocks and so on. In
other words, its a more fancy might_sleep()."

[1] https://lore.kernel.org/all/20200321113242.427089655@linutronix.de

Fixes: 98237fcda4a2 ("f2fs: use spin_lock to avoid hang")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/debug.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 16c2dfb4f595..3417e7e550b2 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -21,7 +21,7 @@
 #include "gc.h"
 
 static LIST_HEAD(f2fs_stat_list);
-static DEFINE_RAW_SPINLOCK(f2fs_stat_lock);
+static DEFINE_SPINLOCK(f2fs_stat_lock);
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *f2fs_debugfs_root;
 #endif
@@ -439,9 +439,8 @@ static int stat_show(struct seq_file *s, void *v)
 {
 	struct f2fs_stat_info *si;
 	int i = 0, j = 0;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
+	spin_lock(&f2fs_stat_lock);
 	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
 		struct f2fs_sb_info *sbi = si->sbi;
 
@@ -753,7 +752,7 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - paged : %llu KB\n",
 				si->page_mem >> 10);
 	}
-	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
+	spin_unlock(&f2fs_stat_lock);
 	return 0;
 }
 
@@ -765,7 +764,6 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	struct f2fs_stat_info *si;
 	struct f2fs_dev_stats *dev_stats;
-	unsigned long flags;
 	int i;
 
 	si = f2fs_kzalloc(sbi, sizeof(struct f2fs_stat_info), GFP_KERNEL);
@@ -817,9 +815,9 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 
 	atomic_set(&sbi->max_aw_cnt, 0);
 
-	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
+	spin_lock(&f2fs_stat_lock);
 	list_add_tail(&si->stat_list, &f2fs_stat_list);
-	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
+	spin_unlock(&f2fs_stat_lock);
 
 	return 0;
 }
@@ -827,11 +825,10 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 void f2fs_destroy_stats(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
+	spin_lock(&f2fs_stat_lock);
 	list_del(&si->stat_list);
-	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
+	spin_unlock(&f2fs_stat_lock);
 
 	kfree(si->dev_stats);
 	kfree(si);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
