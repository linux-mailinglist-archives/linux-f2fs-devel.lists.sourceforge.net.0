Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E75AC1A63
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 05:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IxlbPN9hqssC/Bh1lrx/NfC2KJVUfPuLxD3Q2ta660M=; b=VLk6xoeEOgCe5EAxzwlHTBUrng
	GqRsQpjZj1h01B6x3cDpOAw4S20msQ6obRw60yyVXS8Q1hmi7YS+5k/etTyEWLG94rpPT3pGLfDNP
	u5ptO3jf881mYLOlFI7DsbTRmkh57hYK+gqlrkxtDpaRi5QlJkwEdqmj+55eCr9u4y2Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIJ2u-0006C7-9V;
	Fri, 23 May 2025 03:26:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uIJ2n-0006Bw-RI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 03:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BeNQgTh4TtTdN4cXzV8e9IGEnJJrnIU/rLc318NHNqc=; b=HPKbhbt9lncl7saf3gymM3pSsV
 0meopMRbqI3qd1xmerks4+CoPcjFj4Tue5Z5frSh2iZJ7/yN4FghsvqydS8uxyVu4Q68uFfjE1iTj
 Zc6VM98ceYVKRbgLJy9eipnbOMRr6h4WxDTxtF3uYai2mQlYQh0hfw6WDq9JhpOL2rPs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BeNQgTh4TtTdN4cXzV8e9IGEnJJrnIU/rLc318NHNqc=; b=O
 Hjc7xBNzk09N0JPtUPEeifdUS3ex2pybfZcGhYDRRN9XH7L77XkBbh/z+7rQkH7emQbKm0X6+2/pC
 iWaOx0TnoXCjoL2Q0fO9sFBBDNWNAEQS+Tn6KxsI6sTyofSFdjv8nufLHliVQfMaElwV4cCXeBZVo
 AFsQx9vZfWESbysQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uIJ2m-0000Zy-Vi for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 03:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2CFF3A4D99C;
 Fri, 23 May 2025 03:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0021C4CEE9;
 Fri, 23 May 2025 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747970749;
 bh=zs8r39vbFN2or9MqJTpefToKt3xi9idBEwDckvz2KwE=;
 h=From:To:Cc:Subject:Date:From;
 b=RDLkN5U8S0h0uFcNamFboMXudFbJhQc8QAf3cr+uRhghhFNDHhun8aEUAm1nP4Qz2
 rFZSWF2yCW026/4xDW44AG2ngCgkP/dEPvr7Ro4zwH2M3PYk1FgSA/rvBu0AJBSXfS
 FxFI+l0dnWuS6VkcIRREzrs7uhqndFZrunEtPFhoQgMMYIMs+Vjmw0hRLl7jJOTvuo
 3S1TkRVeVBI3uAK4ppsodeKDJl67+lQMUl3jCY4uGtjA2b2ofyfkE9Gwvai8Fzox4k
 duY0BuLGywslGToY01i6pmyX4xt2Tq/Kvll+2l+zLfGBr2p7xjRosazBI8jdcIuk9a
 a92XCKLuQUV/Q==
To: jaegeuk@kernel.org
Date: Fri, 23 May 2025 11:25:45 +0800
Message-ID: <20250523032545.1392641-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
MIME-Version: 1.0
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Syzbot reports a f2fs bug as below: INFO: task
 syz-executor328:5856
 blocked for more than 144 seconds. Not tainted
 6.15.0-rc6-syzkaller-00208-g3c21441eeffc
 #0 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 tas [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uIJ2m-0000Zy-Vi
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to skip f2fs_balance_fs() if
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

Syzbot reports a f2fs bug as below:

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

And the testcase mounts f2fs image w/ gc_merge,checkpoint=disable, so deadloop
will happen through below race condition:

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
avoid such deadloop issue.

Meanwhile let's remove f2fs_is_checkpoint_ready() check condition in
f2fs_balance_fs(), since it's redundant, due to the main logic in the
function is to check:
a) whether checkpoint is disabled
b) there is enough free segments

f2fs_balance_fs() still has all logics after f2fs_is_checkpoint_ready()'s
removal.

Reported-by: syzbot+aa5bb5f6860e08a60450@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/682d743a.a00a0220.29bc26.0289.GAE@google.com
Fixes: 84b5bb8bf0f6 ("f2fs: modify f2fs_is_checkpoint_ready logic to allow more data to be written with the CP disable")
Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- clean up the codes
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5ff0111ed974..24b4bb2a4b9b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -433,7 +433,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (need && excess_cached_nats(sbi))
 		f2fs_balance_fs_bg(sbi, false);
 
-	if (!f2fs_is_checkpoint_ready(sbi))
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		return;
 
 	/*
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
