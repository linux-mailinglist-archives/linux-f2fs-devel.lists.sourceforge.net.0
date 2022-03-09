Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D454D3C59
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 22:48:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nS4Au-0002L5-Hn; Wed, 09 Mar 2022 21:48:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nS4Ar-0002Kl-P4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 21:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6VnkYJhu4PTDjVgJezNkxVLqCTEOhOX26q3O/k9r/Lg=; b=fby+H+1ZzVSfH/fc5hpDnWL/7W
 hKC4ZJuBogwXW4ONQhM/U5aDCeFFsBRbXik3Sjak69zzq7KFVLnPW8n2hHyGmZSqLufOmpx6RBCGQ
 L1BN40yyQUG3F4lnMk0FjSDMXwDRvtL9AZao2OXJUhVwCdNac+Tpi35khTfoUXcB4+cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6VnkYJhu4PTDjVgJezNkxVLqCTEOhOX26q3O/k9r/Lg=; b=ilmL0QapsSg+o63Q14JhfaaDHe
 V4nwMYECA77H77ESXPG2bels9LRT1L808iadcK5yQrDPmpd5vbdLgoL+oxZ5KDBXQZw0c1ER6ceTB
 7aE31Tjo6SfG0Jh9DxX9ygQF0lInEWxEzly8SBE2/Lud8+3DTBuXFjlbdWPtuVEooesQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nS4Ak-0001of-WA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 21:48:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BBFA61B22
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  9 Mar 2022 21:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3681C340F5;
 Wed,  9 Mar 2022 21:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646862517;
 bh=39ENY5sRJs9hngyluGrE4/EDGdC8Q6QsuX+odGM1stk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TbyBXa3WQbGVp+rexODr/c5q9PW9r75PRNudR17GBb/DxNr9ShT4UGtxysOSHSaEG
 PsPYLasgDliigi+GKTjcPlr+6hS9l8On4Af+k1SHp6rtW4EX7y/+iV4smh1nZvUVpj
 SNSw70NxH9YMF4z9Vp86lFP4he3v7v8o/vl9WdAF7xq6W7VX930CV9IBCGdr+MCLGJ
 HEypl0w8G+r+VE563O8No4/arnch65+F/DLSh9UjeoS5GvV3sAB8EP7v/mqd+PySQ6
 6bh9vWAtHnizTUfIifUVYBZGA4M5yA6nScvEtDqw2zEa/HXK6Fxkhm/w0xiBeB/BJJ
 Rcx9O/o2Q1Fcw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  9 Mar 2022 13:48:34 -0800
Message-Id: <20220309214834.3408741-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220309214834.3408741-1-jaegeuk@kernel.org>
References: <20220309214834.3408741-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: [14696.634553] task:cat state:D stack: 0 pid:1613738
 ppid:1613735
 flags:0x00000004 [14696.638285] Call Trace: [14696.639038] <TASK>
 [14696.640032]
 __schedule+0x302/0x930 [14696.640969] schedule+0x58/0 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nS4Ak-0001of-WA
Subject: [f2fs-dev] [PATCH 2/2] f2fs: use spin_lock to avoid hang
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/debug.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index cba5eab24595..6d26872c7364 100644
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
 
@@ -577,7 +578,7 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - paged : %llu KB\n",
 				si->page_mem >> 10);
 	}
-	mutex_unlock(&f2fs_stat_mutex);
+	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
 	return 0;
 }
 
@@ -588,6 +589,7 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	struct f2fs_stat_info *si;
+	unsigned long flags;
 	int i;
 
 	si = f2fs_kzalloc(sbi, sizeof(struct f2fs_stat_info), GFP_KERNEL);
@@ -623,9 +625,9 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->max_aw_cnt, 0);
 	atomic_set(&sbi->max_vw_cnt, 0);
 
-	mutex_lock(&f2fs_stat_mutex);
+	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_add_tail(&si->stat_list, &f2fs_stat_list);
-	mutex_unlock(&f2fs_stat_mutex);
+	raw_spin_unlock_irqrestore(&f2fs_stat_lock, flags);
 
 	return 0;
 }
@@ -633,10 +635,11 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
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
2.35.1.616.g0bdcbb4464-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
