Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C31972780
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Sep 2024 05:07:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1snrEF-0006rO-HN;
	Tue, 10 Sep 2024 03:07:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1snrED-0006rH-Mk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 03:07:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nohM8NyGGY7nVI0HlHv4/ApKO4A4dKee8IiNQ5e6cJw=; b=XgLO+zG0gMXCM1WWoTs1/wmA2O
 YXLSsNS/YFzrkJ/LB1+qnzbPpmMQEeIRqAZXFzVmfZUfGsUPFXMLBvckjlzpom1Yn7YqmvnX5GdyJ
 5qZJFlU+tlm/nq/H+wlGYDweVwJC1asgaHPaSVbxssjW0rFEI2Z0a4lIXwBAnkJ1t6H8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nohM8NyGGY7nVI0HlHv4/ApKO4A4dKee8IiNQ5e6cJw=; b=A
 jHrqA0anwjiC6smKcM65vD10GXThf6wwsT49Mdb0vjmpXR5n7eoR+O4iJ2eqWVkhbd28crN3KfLAB
 Wb0GLYixdj832nuce2Q6iN7x/uUxy2YdFLy4QtLTfJQa0giLhQ6/5NVIZSdgc06MeaP7CUQmo1VCm
 6yG4VN7eI0tw1cU4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1snrEC-0008E7-JU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Sep 2024 03:07:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5D267A425D9;
 Tue, 10 Sep 2024 03:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D07C4CEC6;
 Tue, 10 Sep 2024 03:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725937647;
 bh=BGcgohLjLuZmmBluZnoPhK7PAf91cjVeYnh47tUQo30=;
 h=From:To:Cc:Subject:Date:From;
 b=OPHp4gQDpEU4HHh2lgL8dNF2qkRGXRAat+q9dZFDJAfnXL2yrmw3NhUSjNg6xPkVn
 rDbK8RkHcCVdNE457CuXfYcy7TtWknJKd0gTiPeBKNsYDgt81yQ5v+DVYeChXXgL5k
 FTibT04T25uK8S6+EF8XpTOTJ9QYY9sMgti/wHbeAnGBBflvpEr9nScDaKHEFotEjX
 FHnlVidC1MSQhOpaZqJZgu8MKHZN+qCswhy4wtmsm82VW/rzaanTo/KHdGIKRdF0Pe
 cBWLJmOZrsy6hqW70wRXbl9wMzz+yNnT2mqW2iaUrZwxNa1y2SxRmlXHSgBuBDNwSI
 1CVIlWvy1agiw==
To: jaegeuk@kernel.org
Date: Tue, 10 Sep 2024 11:07:13 +0800
Message-Id: <20240910030713.3716318-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot reports a f2fs bug as below: [ cut here ] WARNING:
 CPU: 1 PID: 58 at kernel/rcu/sync.c:177 rcu_sync_dtor+0xcd/0x180
 kernel/rcu/sync.c:177
 CPU: 1 UID: 0 PID: 58 Comm: kworker/1:2 Not tainted 6.10.0-syzkalle [...]
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1snrEC-0008E7-JU
Subject: [f2fs-dev] [PATCH] f2fs: fix to don't set SB_RDONLY in
 f2fs_handle_critical_error()
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org,
 syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a f2fs bug as below:

------------[ cut here ]------------
WARNING: CPU: 1 PID: 58 at kernel/rcu/sync.c:177 rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
CPU: 1 UID: 0 PID: 58 Comm: kworker/1:2 Not tainted 6.10.0-syzkaller-12562-g1722389b0d86 #0
Workqueue: events destroy_super_work
RIP: 0010:rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
Call Trace:
 percpu_free_rwsem+0x41/0x80 kernel/locking/percpu-rwsem.c:42
 destroy_super_work+0xec/0x130 fs/super.c:282
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

As Christian Brauner pointed out [1]: the root cause is f2fs sets
SB_RDONLY flag in internal function, rather than setting the flag
covered w/ sb->s_umount semaphore via remount procedure, then below
race condition causes this bug:

- freeze_super()
 - sb_wait_write(sb, SB_FREEZE_WRITE)
 - sb_wait_write(sb, SB_FREEZE_PAGEFAULT)
 - sb_wait_write(sb, SB_FREEZE_FS)
					- f2fs_handle_critical_error
					 - sb->s_flags |= SB_RDONLY
- thaw_super
 - thaw_super_locked
  - sb_rdonly() is true, so it skips
    sb_freeze_unlock(sb, SB_FREEZE_FS)
  - deactivate_locked_super

Since f2fs has almost the same logic as ext4 [2] when handling critical
error in filesystem if it mounts w/ errors=remount-ro option:
- set CP_ERROR_FLAG flag which indicates filesystem is stopped
- record errors to superblock
- set SB_RDONLY falg
Once we set CP_ERROR_FLAG flag, all writable interfaces can detect the
flag and stop any further updates on filesystem. So, it is safe to not
set SB_RDONLY flag, let's remove the logic and keep in line w/ ext4 [3].

[1] https://lore.kernel.org/all/20240729-himbeeren-funknetz-96e62f9c7aee@brauner
[2] https://lore.kernel.org/all/20240729132721.hxih6ehigadqf7wx@quack3
[3] https://lore.kernel.org/linux-ext4/20240805201241.27286-1-jack@suse.cz

Fixes: b62e71be2110 ("f2fs: support errors=remount-ro|continue|panic mountoption")
Reported-by: syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/000000000000b90a8e061e21d12f@google.com/
Cc: Jan Kara <jack@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e774bdf875b2..acfd000c6bb0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4207,12 +4207,14 @@ void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
 	}
 
 	f2fs_warn(sbi, "Remounting filesystem read-only");
+
 	/*
-	 * Make sure updated value of ->s_mount_flags will be visible before
-	 * ->s_flags update
+	 * We have already set CP_ERROR_FLAG flag to stop all updates
+	 * to filesystem, so it doesn't need to set SB_RDONLY flag here
+	 * because the flag should be set covered w/ sb->s_umount semaphore
+	 * via remount procedure, otherwise, it will confuse code like
+	 * freeze_super() which will lead to deadlocks and other problems.
 	 */
-	smp_wmb();
-	sb->s_flags |= SB_RDONLY;
 }
 
 static void f2fs_record_error_work(struct work_struct *work)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
