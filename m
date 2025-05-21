Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 427B8ABF384
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 13:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pYxOzq6FV9BrkvdJcm2ExsWzv7Tx8q5QGUijsGh4vLI=; b=M4Wb/TTUfExLiHtIdXczQa7jBL
	dDgD6Pl2BPt5rxlK7GaEKdw2Vow/cSEeFgYCBHo/zUD4y6AbDMjzKaMz69V3UungwCwdzY5aBamdp
	NffFi3roE+2foMHdcDyA0+4BDaDZk7Jub7TXxKBujobtQ67calbiywJynoByzjiX53oo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHi48-0003aM-RN;
	Wed, 21 May 2025 11:56:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uHi47-0003aC-JU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 11:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a+0Gd/KqfuvS+L+ASNmzhFKNy9NFDSniCcHyvz/K6+4=; b=X8rKQVMaXbbdj1RCXm6Lr7JJWy
 WRZNSna/RQHtebq1c5bxaT6IxczMWerRh8N8HAqUPOVrU2lpKXM9Flz6nqD+/OnB529/FVMgWi1i7
 bKqpcgXzpFNc/zrpLyaGeEZfqK7I68jn+jpvqXZjy5+9SFUR3Hj1x3z+hW4nRlGvtHEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a+0Gd/KqfuvS+L+ASNmzhFKNy9NFDSniCcHyvz/K6+4=; b=E
 zivLikv/G/IAHtVJzOXBsKYsrmbBtj48B06x6JgylJCeUQvCLQ4lMhUuopeHWwxgRt5oQzDqyIkV9
 XARVIeAoAlpz3k0d53TI3W0nCcJM2M1fNoS1JGdLQqvpf03Pa0kk0b0/RrtOJK/JT7EKPcW0Yx+PF
 m3g5Kkfcf/Kc4WWI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uHi46-0007CH-Nc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 11:56:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 382EA5C58CC;
 Wed, 21 May 2025 11:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926CAC4CEE4;
 Wed, 21 May 2025 11:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747828609;
 bh=32nBK1uDQNJmr5ueHl6ztx09emDA9JhlP9K7dSuMnWE=;
 h=From:To:Cc:Subject:Date:From;
 b=Oug/UbzsruDwihb3MtFAq6Bb7AJ9ArCPNvd0/swPUDl3nimBGnWm5LK0H8DypWeTv
 HsypXXpqcpD5CT+XZuMR5IDNs8uHoagLKA8jLIAomYMvoc0EEPDEZh9PtXGLYCw0Nv
 mn5m1SCubYoUf9RpR6SqCr/6NKNCmw9npIINo9v5LKLWldtMElcJEaI6Vvh+fv9LpR
 39EIW/qjqimE0jwfy3NPJNw98gpFN3z9YUq07iVYLA25iP2csXbamur2z/VYXJPfO7
 M9SnQpSflBzFGHslcBruawj6YXqLUL86iztaR99iP1G4GiL5IxfcaHWm7XqVE6sf0o
 5trY5aAOP+Gsg==
To: jaegeuk@kernel.org
Date: Wed, 21 May 2025 19:56:35 +0800
Message-ID: <20250521115635.829744-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  INFO: task syz-executor328:5856 blocked for more than 144
 seconds. Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0 "echo 0 >
 /proc/sys/kernel/hung_task_timeout_secs" disables this message. tas [...]
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uHi46-0007CH-Nc
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to skip f2fs_balance_fs() if
 checkpoint is disabled
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
Cc: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com,
 Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

INFO: task syz-executor328:5856 blocked for more than 144 seconds.
      Not tainted 6.15.0-rc6-syzkaller-00208-g3c21441eeffc #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor328 state:D stack:24392 pid:5856  tgid:5832  ppid:5826   task_flags:0x400040 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5382 [inline]
 __schedule+0x168f/0x4c70 kernel/sched/core.c:6767
 __schedule_loop kernel/sched/core.c:6845 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6860
 io_schedule+0x81/0xe0 kernel/sched/core.c:7742
 f2fs_balance_fs+0x4b4/0x780 fs/f2fs/segment.c:444
 f2fs_map_blocks+0x3af1/0x43b0 fs/f2fs/data.c:1791
 f2fs_expand_inode_data+0x653/0xaf0 fs/f2fs/file.c:1872
 f2fs_fallocate+0x4f5/0x990 fs/f2fs/file.c:1975
 vfs_fallocate+0x6a0/0x830 fs/open.c:338
 ioctl_preallocate fs/ioctl.c:290 [inline]
 file_ioctl fs/ioctl.c:-1 [inline]
 do_vfs_ioctl+0x1b8f/0x1eb0 fs/ioctl.c:885
 __do_sys_ioctl fs/ioctl.c:904 [inline]
 __se_sys_ioctl+0x82/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The root cause is after commit 84b5bb8bf0f6 ("f2fs: modify
f2fs_is_checkpoint_ready logic to allow more data to be written with the
CP disable"), we will get chance to allow f2fs_is_checkpoint_ready() to
return true once below conditions are all true:
1. checkpoint is disabled
2. there are not enough free segments
3. there are enough free blocks

Then it will cause f2fs_balance_fs() to trigger foreground GC.

void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
...
	if (!f2fs_is_checkpoint_ready(sbi))
		return;

And it mounts f2fs image w/ gc_merge,checkpoint=disable, so below deadloop
will happen:

- f2fs_do_shutdown		- vfs_fallocate				- gc_thread_func
				 - file_start_write
				  - __sb_start_write(SB_FREEZE_WRITE)
				 - f2fs_fallocate
				  - f2fs_expand_inode_data
				   - f2fs_map_blocks
				    - f2fs_balance_fs
				     - prepare_to_wait
				     - wake_up(gc_wait_queue_head)
				     - io_schedule
 - bdev_freeze
  - freeze_super
   - sb->s_writers.frozen = SB_FREEZE_WRITE;
   - sb_wait_write(sb, SB_FREEZE_WRITE);
									 - if (sbi->sb->s_writers.frozen >= SB_FREEZE_WRITE) continue;
									 : cause deadloop

This patch fix to add check condition in f2fs_balance_fs(), so that if
checkpoint is disabled, we will just skip trigger foreground GC to
avoid above deadloop issue.

Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/682d743a.a00a0220.29bc26.0289.GAE@google.com
Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable")
Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add missing Closes line
- fix to use git commit description style

 fs/f2fs/segment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5ff0111ed974..19b716fda72a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -433,6 +433,8 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (need && excess_cached_nats(sbi))
 		f2fs_balance_fs_bg(sbi, false);
 
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+		return;
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return;
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
