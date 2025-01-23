Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA0A19EBC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jan 2025 08:14:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tarQA-0002n3-MZ;
	Thu, 23 Jan 2025 07:14:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1tarQA-0002mw-1p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 07:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=znQ83vYfgDLoD00O0W+/20NyZyhbsP6lOfbQMEmUQBU=; b=JfbQ66mkccMh/bEbaeInGKwDcK
 hGEg8Vays0ae7M3jG2YsS5cPD1T9n0iAF5VsxRPkDvUy/RXRi6Iu9EY58LzKPsk4n3rzwGQLvPnLV
 YDFm3B0nhbpyboDKTDqyOcGf5mxYNOFI7N/j3Yr9Enr33zoyA9fCq0rNR0gi4KpjhySQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=znQ83vYfgDLoD00O0W+/20NyZyhbsP6lOfbQMEmUQBU=; b=L
 EXCKz6JCUROxVW4awA0bCZfw7OvRxZ3dEvnQVD8gA9la/CUThrKjwPLllSQ2eCUIbGALew/nTBV+Z
 wthaM0Ekkf2xo4UZjnjcIxZwcSTubN/aqyUvim9sKppOLdrI/cQC6OYcsrZuyqqehdv6moH2RVsY2
 KWOCnePbNMv0urJc=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.122])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tarQ8-0000aS-6m for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Jan 2025 07:14:33 +0000
X-CSE-ConnectionGUID: 33F8P/r9SuOQculHWvQUTg==
X-CSE-MsgGUID: fsJpJdfeQyi1PQl6b1AImg==
X-IronPort-AV: E=Sophos;i="6.13,227,1732550400"; d="scan'208";a="131114153"
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Thu, 23 Jan 2025 15:14:17 +0800
Message-ID: <20250123071417.253019-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.237.8.164]
X-ClientProxiedBy: BJ-MBX17.mioffice.cn (10.237.8.137) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When testing the atomic write fix patches, the f2fs_bug_on
 was triggered as below: [ cut here ] kernel BUG at fs/f2fs/inode.c:935! Oops:
 invalid opcode: 0000 [#1] PREEMPT SMP PTI CPU: 3 UID: 0 PID: 257 Comm: bash
 Not tainted 6.13.0-rc1-00033-gc283a70d3497 #5 [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.226.244.122 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.226.244.122 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.226.244.122 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tarQ8-0000aS-6m
Subject: [f2fs-dev] [PATCH] f2fs: fix inconsistent dirty state of atomic file
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
From: Jianan Huang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jianan Huang <huangjianan@xiaomi.com>
Cc: daehojeong@google.com, jnhuang95@gmail.com, linux-kernel@vger.kernel.org,
 wanghui33@xiaomi.com, yudongbin@xiaomi.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When testing the atomic write fix patches, the f2fs_bug_on was
triggered as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/inode.c:935!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
CPU: 3 UID: 0 PID: 257 Comm: bash Not tainted 6.13.0-rc1-00033-gc283a70d3497 #5
RIP: 0010:f2fs_evict_inode+0x50f/0x520
Call Trace:
 <TASK>
 ? __die_body+0x65/0xb0
 ? die+0x9f/0xc0
 ? do_trap+0xa1/0x170
 ? f2fs_evict_inode+0x50f/0x520
 ? f2fs_evict_inode+0x50f/0x520
 ? handle_invalid_op+0x65/0x80
 ? f2fs_evict_inode+0x50f/0x520
 ? exc_invalid_op+0x39/0x50
 ? asm_exc_invalid_op+0x1a/0x20
 ? __pfx_f2fs_get_dquots+0x10/0x10
 ? f2fs_evict_inode+0x50f/0x520
 ? f2fs_evict_inode+0x2e5/0x520
 evict+0x186/0x2f0
 prune_icache_sb+0x75/0xb0
 super_cache_scan+0x1a8/0x200
 do_shrink_slab+0x163/0x320
 shrink_slab+0x2fc/0x470
 drop_slab+0x82/0xf0
 drop_caches_sysctl_handler+0x4e/0xb0
 proc_sys_call_handler+0x183/0x280
 vfs_write+0x36d/0x450
 ksys_write+0x68/0xd0
 do_syscall_64+0xc8/0x1a0
 ? arch_exit_to_user_mode_prepare+0x11/0x60
 ? irqentry_exit_to_user_mode+0x7e/0xa0

The root cause is: f2fs uses FI_ATOMIC_DIRTIED to indicate dirty
atomic files during commit. If the inode is dirtied during commit,
such as by f2fs_i_pino_write, the vfs inode keeps clean and the
f2fs inode is set to FI_DIRTY_INODE. The FI_DIRTY_INODE flag cann't
be cleared by write_inode later due to the clean vfs inode. Finally,
f2fs_bug_on is triggered due to this inconsistent state when evict.

To reproduce this situation:
- fd = open("/mnt/test.db", O_WRONLY)
- ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE)
- mv /mnt/test.db /mnt/test1.db
- ioctl(fd, F2FS_IOC_COMMIT_ATOMIC_WRITE)
- echo 3 > /proc/sys/vm/drop_caches

To fix this problem, clear FI_DIRTY_INODE after commit, then
f2fs_mark_inode_dirty_sync will ensure a consistent dirty state.

Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
---
 fs/f2fs/segment.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dc1b47f9269a..71b509a31eae 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -201,6 +201,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
 	if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
 		clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
+		clear_inode_flag(inode, FI_DIRTY_INODE);
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
 	stat_dec_atomic_inode(inode);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
