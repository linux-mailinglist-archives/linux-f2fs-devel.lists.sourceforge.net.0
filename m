Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D0A1B029
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2025 06:58:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tbChf-0000Mb-Us;
	Fri, 24 Jan 2025 05:58:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1tbChe-0000MV-Jh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 05:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Bcj4l0ZfOptYu5Bp2YWoVVwCbWbBfZh/kIOlk7fxOA=; b=mkcRfVC1svEGFhOmUaNWW7rcbs
 FCMiQCElipbdOrQUXQPQAuvQxF19Q2RV+2cWseW/4xF8wLWfANMPHCO0oK5EXSGLl+4J6t8QWDIXE
 IzSokOX5Ft2R24tpDVFhKCZK7VgTi+gxOJA3PuzxxZ6WZn74qMyem0yxmyfTrDv3N9O0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6Bcj4l0ZfOptYu5Bp2YWoVVwCbWbBfZh/kIOlk7fxOA=; b=ZGGfQkv7lkbfG8+xhCGuNuM8zs
 b8XyNKaJqF8UpnRHCiXgpoyAmwAWiDIzP+0xO9JozO8DhcdTv3JCc3mEdGxLy7hhM20cBlp69Y+Ji
 K6gjDn2M1waPU6xRB98zsargqERgsF/N5G58tVm/9Ye0b4iwvXRmcaesyYmHuBDnySd4=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tbChd-0005KR-KZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 05:58:02 +0000
X-CSE-ConnectionGUID: 1U3t6oKbTA6OY/O7CeOZWw==
X-CSE-MsgGUID: mNntPo1JRDqBtNDJzxDcaQ==
X-IronPort-AV: E=Sophos;i="6.13,230,1732550400"; d="scan'208";a="105606996"
To: <linux-f2fs-devel@lists.sourceforge.net>, <chao@kernel.org>,
 <jaegeuk@kernel.org>
Date: Fri, 24 Jan 2025 13:57:51 +0800
Message-ID: <20250124055751.283198-1-huangjianan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250124015042.273336-1-huangjianan@xiaomi.com>
References: <20250124015042.273336-1-huangjianan@xiaomi.com>
MIME-Version: 1.0
X-Originating-IP: [10.237.8.166]
X-ClientProxiedBy: BJ-MBX06.mioffice.cn (10.237.8.126) To YZ-MBX05.mioffice.cn
 (10.237.88.125)
X-Spam-Score: 0.9 (/)
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
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [118.143.206.90 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tbChd-0005KR-KZ
Subject: [f2fs-dev] [PATCH v3] f2fs: fix inconsistent dirty state of atomic
 file
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
Changes since v2:
- Use f2fs_inode_synced instead of just clear FI_DIRTY_INODE.
Changes since v1:
- Add comments suggested by Chao.
- Add missing stat reduction.

 fs/f2fs/segment.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dc1b47f9269a..c282e8a0a2ec 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -201,6 +201,12 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	clear_inode_flag(inode, FI_ATOMIC_FILE);
 	if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
 		clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
+		/*
+		 * The vfs inode keeps clean during commit, but the f2fs inode
+		 * doesn't. So clear the dirty state after commit and let
+		 * f2fs_mark_inode_dirty_sync ensure a consistent dirty state.
+		 */
+		f2fs_inode_synced(inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
 	stat_dec_atomic_inode(inode);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
