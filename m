Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C06909FEF33
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Dec 2024 12:57:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tSasJ-0005x7-QZ;
	Tue, 31 Dec 2024 11:57:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kovalev@altlinux.org>) id 1tSasI-0005wt-DR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Dec 2024 11:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l/Nnv1VpJOSVMMKSyEqpGYDBCYXcfg1zyX6sGfGIRes=; b=ZpHnsr71qh5aFUJg7w00pTqaM7
 B5jHsGnAApP4i2k8PtixkksFYkzDl2rdKHDVc7rcV7osam+zesresOsQjfsyux8C4N2F86uY8BgAt
 wYDzztsQS8U08YMxacOCJSdm7flPMnhaa/mcJiZT5zdx07mRV9qLsHxO/1mgpFZOLkVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l/Nnv1VpJOSVMMKSyEqpGYDBCYXcfg1zyX6sGfGIRes=; b=K
 R5jYr3tGRemJ7O+b9EjLYRsbRRcYWNOUeEgya7m2RqpPDnR26rur8Ga3TwAvF71Anvs7AVGgYgxE1
 jjCP3HkVMIx1ShV2zNAA+T+qguYDY+7PDinYmwqQppx7KbiP+lHnPjmPtE9s+79u4XubcagXRvD2x
 bw7SEYk67IGDEK7Y=;
Received: from air.basealt.ru ([193.43.8.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tSasH-0000jM-KN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Dec 2024 11:57:26 +0000
Received: from altlinux.ipa.basealt.ru (unknown [178.76.204.78])
 by air.basealt.ru (Postfix) with ESMTPSA id F03942333B;
 Tue, 31 Dec 2024 14:57:13 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: stable@vger.kernel.org
Date: Tue, 31 Dec 2024 14:57:13 +0300
Message-Id: <20241231115713.1308081-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 fc01008c92f40015aeeced94750855a7111b6929
 ] syzbot reports a f2fs bug as below: 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [193.43.8.18 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [193.43.8.18 listed in bl.score.senderscore.com]
X-Headers-End: 1tSasH-0000jM-KN
Subject: [f2fs-dev] [PATCH 5.15.y] f2fs: fix to do sanity check on
 F2FS_INLINE_DATA flag in inode during GC
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
Cc: kovalev@altlinux.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit fc01008c92f40015aeeced94750855a7111b6929 ]

syzbot reports a f2fs bug as below:

------------[ cut here ]------------
kernel BUG at fs/f2fs/inline.c:258!
CPU: 1 PID: 34 Comm: kworker/u8:2 Not tainted 6.9.0-rc6-syzkaller-00012-g9e4bc4bcae01 #0
RIP: 0010:f2fs_write_inline_data+0x781/0x790 fs/f2fs/inline.c:258
Call Trace:
 f2fs_write_single_data_page+0xb65/0x1d60 fs/f2fs/data.c:2834
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3288 [inline]
 f2fs_write_data_pages+0x1efe/0x3a90 fs/f2fs/data.c:3315
 do_writepages+0x35b/0x870 mm/page-writeback.c:2612
 __writeback_single_inode+0x165/0x10b0 fs/fs-writeback.c:1650
 writeback_sb_inodes+0x905/0x1260 fs/fs-writeback.c:1941
 wb_writeback+0x457/0xce0 fs/fs-writeback.c:2117
 wb_do_writeback fs/fs-writeback.c:2264 [inline]
 wb_workfn+0x410/0x1090 fs/fs-writeback.c:2304
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa12/0x17c0 kernel/workqueue.c:3335
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
 kthread+0x2f2/0x390 kernel/kthread.c:388
 ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The root cause is: inline_data inode can be fuzzed, so that there may
be valid blkaddr in its direct node, once f2fs triggers background GC
to migrate the block, it will hit f2fs_bug_on() during dirty page
writeback.

Let's add sanity check on F2FS_INLINE_DATA flag in inode during GC,
so that, it can forbid migrating inline_data inode's data block for
fixing.

Reported-by: syzbot+848062ba19c8782ca5c8@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/000000000000d103ce06174d7ec3@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
[kovalev: Replaced f2fs_err_ratelimited() with printk_ratelimited()
to use a supported function]
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
Backport to fix CVE-2024-44942
Link: https://www.cve.org/CVERecord/?id=CVE-2024-44942
---
 fs/f2fs/gc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 9a57754e6e0c1d..ef09b7fc065fab 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1479,6 +1479,17 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 					special_file(inode->i_mode))
 				continue;
 
+			if (f2fs_has_inline_data(inode)) {
+				iput(inode);
+				set_sbi_flag(sbi, SBI_NEED_FSCK);
+				printk_ratelimited("%sF2FS-fs (%s): "
+					"inode %lx has both inline_data flag and "
+					"data block, nid=%u, ofs_in_node=%u",
+					KERN_INFO, sbi->sb->s_id,
+					inode->i_ino, dni.nid, ofs_in_node);
+				continue;
+			}
+
 			if (!down_write_trylock(
 				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
 				iput(inode);
-- 
2.33.8



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
