Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FA4B3598
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Feb 2022 15:20:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nItGV-00007U-3g; Sat, 12 Feb 2022 14:20:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nItGT-00006M-Gn
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Feb 2022 14:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rJ6drzor/rDVh95WIPQnHyIRxApULrvfl/C5pa0/YTs=; b=LkmJbQM6TqE1Gk4L3FkIhhMgOA
 MG1dfho1qFI3J4aETnK7nLBKaIs/s8Tjn3/542vToUfK70v0OrywkCq9kDTbjNEaKDEA296VIh4HE
 Rmux6M9/SSfHW/sRU8JgQWJwsMX53c+C2KkvKSw+k2TQNRWCd4OZQTINdK+LHfskSpAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rJ6drzor/rDVh95WIPQnHyIRxApULrvfl/C5pa0/YTs=; b=h
 Tbl2QCHByrxUgQSwF45vAfGuwcjKeDpZQHcteAG33nS/+DrB21ubBdGfUkbuBDTNYJa7CcWzTAq48
 4Re9FXwWzktT+sLX+C3cLqGQQ4ndPpILP7HLMTun9C/zo0oOtKciHxfRM5o54vpr+BvThFowAG0Go
 Rm5gLH180XhYZmWA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nItGR-00Gpzo-50
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 12 Feb 2022 14:20:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3516EB8015B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 12 Feb 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6952C340E7;
 Sat, 12 Feb 2022 14:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644675629;
 bh=TwVjv6DO9koJT4L7GHGE18JP/jnf2PVbKTb65YI4Hfc=;
 h=From:To:Cc:Subject:Date:From;
 b=mwVbT5Kao/Qa17cctx28ujIdQCuKm0o/P0yhq/GsWm4gm8Bwnd6POpr/36/W98o/L
 A4qglr3kRgJ48UOLT7UqavPvsS/C/mJQJh/PLTwwA0oM/wzbs59nFQ3yN0nnpLUrN0
 m4NtKAkyeiYIqf4+NZc6Okcqti8O8mqQKB00edjhTrhdxKEhz2Hf4wuTIqQiq+TJx3
 h7vQk2LhEsAGpCcg9SmXpFF1DLT2YrjC8EGm0s8jMLOsuv8xuvX6BDBwmfxdK64kua
 I4g855n4XdAnlKK2F7nEMwZTBHYEh7qAC3JVvlzlFvTZXTz5xMRNkj24mlmwmzgBKX
 EoFfoYDBd5WqA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 12 Feb 2022 06:20:22 -0800
Message-Id: <20220212142023.2508247-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes xfstests/generic/475 failure. [ 293.680694]
 F2FS-fs (dm-1): May loss orphan inode, run fsck to fix. [ 293.685358] Buffer
 I/O error on dev dm-1, logical block 8388592, async page read [ 293.691527]
 Buffer I/O error on dev dm-1, log [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nItGR-00Gpzo-50
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix missing free nid in
 f2fs_handle_failed_inode
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

This patch fixes xfstests/generic/475 failure.

[  293.680694] F2FS-fs (dm-1): May loss orphan inode, run fsck to fix.
[  293.685358] Buffer I/O error on dev dm-1, logical block 8388592, async page read
[  293.691527] Buffer I/O error on dev dm-1, logical block 8388592, async page read
[  293.691764] sh (7615): drop_caches: 3
[  293.691819] sh (7616): drop_caches: 3
[  293.694017] Buffer I/O error on dev dm-1, logical block 1, async page read
[  293.695659] sh (7618): drop_caches: 3
[  293.696979] sh (7617): drop_caches: 3
[  293.700290] sh (7623): drop_caches: 3
[  293.708621] sh (7626): drop_caches: 3
[  293.711386] sh (7628): drop_caches: 3
[  293.711825] sh (7627): drop_caches: 3
[  293.716738] sh (7630): drop_caches: 3
[  293.719613] sh (7632): drop_caches: 3
[  293.720971] sh (7633): drop_caches: 3
[  293.727741] sh (7634): drop_caches: 3
[  293.730783] sh (7636): drop_caches: 3
[  293.732681] sh (7635): drop_caches: 3
[  293.732988] sh (7637): drop_caches: 3
[  293.738836] sh (7639): drop_caches: 3
[  293.740568] sh (7641): drop_caches: 3
[  293.743053] sh (7640): drop_caches: 3
[  293.821889] ------------[ cut here ]------------
[  293.824654] kernel BUG at fs/f2fs/node.c:3334!
[  293.826226] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[  293.828713] CPU: 0 PID: 7653 Comm: umount Tainted: G           OE     5.17.0-rc1-custom #1
[  293.830946] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/2014
[  293.832526] RIP: 0010:f2fs_destroy_node_manager+0x33f/0x350 [f2fs]
[  293.833905] Code: e8 d6 3d f9 f9 48 8b 45 d0 65 48 2b 04 25 28 00 00 00 75 1a 48 81 c4 28 03 00 00 5b 41 5c 41 5d 41 5e 41 5f 5d c3 0f 0b
[  293.837783] RSP: 0018:ffffb04ec31e7a20 EFLAGS: 00010202
[  293.839062] RAX: 0000000000000001 RBX: ffff9df947db2eb8 RCX: 0000000080aa0072
[  293.840666] RDX: 0000000000000000 RSI: ffffe86c0432a140 RDI: ffffffffc0b72a21
[  293.842261] RBP: ffffb04ec31e7d70 R08: ffff9df94ca85780 R09: 0000000080aa0072
[  293.843909] R10: ffff9df94ca85700 R11: ffff9df94e1ccf58 R12: ffff9df947db2e00
[  293.845594] R13: ffff9df947db2ed0 R14: ffff9df947db2eb8 R15: ffff9df947db2eb8
[  293.847855] FS:  00007f5a97379800(0000) GS:ffff9dfa77c00000(0000) knlGS:0000000000000000
[  293.850647] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  293.852940] CR2: 00007f5a97528730 CR3: 000000010bc76005 CR4: 0000000000370ef0
[  293.854680] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  293.856423] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  293.858380] Call Trace:
[  293.859302]  <TASK>
[  293.860311]  ? ttwu_do_wakeup+0x1c/0x170
[  293.861800]  ? ttwu_do_activate+0x6d/0xb0
[  293.863057]  ? _raw_spin_unlock_irqrestore+0x29/0x40
[  293.864411]  ? try_to_wake_up+0x9d/0x5e0
[  293.865618]  ? debug_smp_processor_id+0x17/0x20
[  293.866934]  ? debug_smp_processor_id+0x17/0x20
[  293.868223]  ? free_unref_page+0xbf/0x120
[  293.869470]  ? __free_slab+0xcb/0x1c0
[  293.870614]  ? preempt_count_add+0x7a/0xc0
[  293.871811]  ? __slab_free+0xa0/0x2d0
[  293.872918]  ? __wake_up_common_lock+0x8a/0xc0
[  293.874186]  ? __slab_free+0xa0/0x2d0
[  293.875305]  ? free_inode_nonrcu+0x20/0x20
[  293.876466]  ? free_inode_nonrcu+0x20/0x20
[  293.877650]  ? debug_smp_processor_id+0x17/0x20
[  293.878949]  ? call_rcu+0x11a/0x240
[  293.880060]  ? f2fs_destroy_stats+0x59/0x60 [f2fs]
[  293.881437]  ? kfree+0x1fe/0x230
[  293.882674]  f2fs_put_super+0x160/0x390 [f2fs]
[  293.883978]  generic_shutdown_super+0x7a/0x120
[  293.885274]  kill_block_super+0x27/0x50
[  293.886496]  kill_f2fs_super+0x7f/0x100 [f2fs]
[  293.887806]  deactivate_locked_super+0x35/0xa0
[  293.889271]  deactivate_super+0x40/0x50
[  293.890513]  cleanup_mnt+0x139/0x190
[  293.891689]  __cleanup_mnt+0x12/0x20
[  293.892850]  task_work_run+0x64/0xa0
[  293.894035]  exit_to_user_mode_prepare+0x1b7/0x1c0
[  293.895409]  syscall_exit_to_user_mode+0x27/0x50
[  293.896872]  do_syscall_64+0x48/0xc0
[  293.898090]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  293.899517] RIP: 0033:0x7f5a975cd25b

Fixes: 7735730d39d7 ("f2fs: fix to propagate error from __get_meta_page()")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0ec8e32a00b4..ab8e0c06c78c 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -885,6 +885,7 @@ void f2fs_handle_failed_inode(struct inode *inode)
 	err = f2fs_get_node_info(sbi, inode->i_ino, &ni, false);
 	if (err) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		set_inode_flag(inode, FI_FREE_NID);
 		f2fs_warn(sbi, "May loss orphan inode, run fsck to fix.");
 		goto out;
 	}
-- 
2.35.1.265.g69c8d7142f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
