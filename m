Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9F7424D7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jun 2023 13:12:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qEpZr-0006lH-5s;
	Thu, 29 Jun 2023 11:12:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qEpZj-0006lA-8f
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 11:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n0ZalJ8CwT0Qa/KI9rQ2+go46JXaq5PStumr44YU9v4=; b=F3kjuliCd+5oVcPxW01+heRsSN
 rGpvzZHmPqriwVuioDbit5khLZ3BUooWzNAGLU/C4PeMGzcQIC6/BiG1CzL+tY5OEeTuYk1zGpwa+
 AwK0uBtsSpZYypZ9dcm56Tr/CqBkTZCept2FDfFkL8848jLs6m+7S4yJU1/Wl3jBI+Yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n0ZalJ8CwT0Qa/KI9rQ2+go46JXaq5PStumr44YU9v4=; b=c
 yIsG6csOps1LWYAHpxbob3e6GdP9KbOodztCPRJId9khIepei7Rmf+aND02d+EQNt8Aswpke27RDG
 tFQeyOl4FBicUdK4Ur1uVWDc0kZkMwjMNubJGV2bO0X/HWQugXsOI4ziVV6dr/sIRiB1b+gFXDk2c
 YESO7lDYsnUckANs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qEpZF-0002bU-Eo for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jun 2023 11:12:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FF6461522;
 Thu, 29 Jun 2023 11:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5C8C433C8;
 Thu, 29 Jun 2023 11:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688037115;
 bh=VUq5wpykOeodhWHpM5uazmYCwD2kcysVzjLarP25WIc=;
 h=From:To:Cc:Subject:Date:From;
 b=E8Oxyg5B/nnKPM9CazNmkaa6z91zIuTK432RCxu9aD8jfz2gC7fnyl/OExidvtOKG
 5duMRnXNzn6HRxOARKZ8xTqnYQ8wxlIPRaJqVimA3Pf14Kbuz7J0uRkD7ADVclrYf8
 jlfaikLJPWkJGDbmX0BwjozgC8hB5Cf+UhHOqCekDyBA/iGMCsPBXCJmtE/pX0nxzw
 optZ6sqaXrYmzYsL5fmjpZiQPg3vq2jOF3I6thpYO5CT47+8IVJxh1ST+tVnxme5mG
 3jc/YyJTXqVzJ76hybFeqyeNjob+ZQA5pLuMIdL9+0DpovKOY+ZoNi023Xe6kqPPYT
 zmDitRVR4ZP9g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 29 Jun 2023 19:11:44 +0800
Message-Id: <20230629111144.3582787-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot reports below bug: BUG: KASAN: slab-use-after-free
 in f2fs_truncate_data_blocks_range+0x122a/0x14c0 fs/f2fs/file.c:574 Read of
 size 4 at addr ffff88802a25c000 by task syz-executor148/5000 CPU: 1 PID:
 5000 Comm: syz-executor148 Not tainted 6.4.0-rc7-syzkaller-00041-ge660abd551f1
 #0 Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
 Google 05/27/2023 Call Trace: <TAS [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qEpZF-0002bU-Eo
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on direct node in
 truncate_dnode()
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+12cb4425b22169b52036@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports below bug:

BUG: KASAN: slab-use-after-free in f2fs_truncate_data_blocks_range+0x122a/0x14c0 fs/f2fs/file.c:574
Read of size 4 at addr ffff88802a25c000 by task syz-executor148/5000

CPU: 1 PID: 5000 Comm: syz-executor148 Not tainted 6.4.0-rc7-syzkaller-00041-ge660abd551f1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 print_address_description.constprop.0+0x2c/0x3c0 mm/kasan/report.c:351
 print_report mm/kasan/report.c:462 [inline]
 kasan_report+0x11c/0x130 mm/kasan/report.c:572
 f2fs_truncate_data_blocks_range+0x122a/0x14c0 fs/f2fs/file.c:574
 truncate_dnode+0x229/0x2e0 fs/f2fs/node.c:944
 f2fs_truncate_inode_blocks+0x64b/0xde0 fs/f2fs/node.c:1154
 f2fs_do_truncate_blocks+0x4ac/0xf30 fs/f2fs/file.c:721
 f2fs_truncate_blocks+0x7b/0x300 fs/f2fs/file.c:749
 f2fs_truncate.part.0+0x4a5/0x630 fs/f2fs/file.c:799
 f2fs_truncate include/linux/fs.h:825 [inline]
 f2fs_setattr+0x1738/0x2090 fs/f2fs/file.c:1006
 notify_change+0xb2c/0x1180 fs/attr.c:483
 do_truncate+0x143/0x200 fs/open.c:66
 handle_truncate fs/namei.c:3295 [inline]
 do_open fs/namei.c:3640 [inline]
 path_openat+0x2083/0x2750 fs/namei.c:3791
 do_filp_open+0x1ba/0x410 fs/namei.c:3818
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1356
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_creat fs/open.c:1448 [inline]
 __se_sys_creat fs/open.c:1442 [inline]
 __x64_sys_creat+0xcd/0x120 fs/open.c:1442
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The root cause is, inodeA references inodeB via inodeB's ino, once inodeA
is truncated, it calls truncate_dnode() to truncate data blocks in inodeB's
node page, it traverse mapping data from node->i.i_addr[0] to
node->i.i_addr[ADDRS_PER_BLOCK() - 1], result in out-of-boundary access.

This patch fixes to add sanity check on dnode page in truncate_dnode(),
so that, it can help to avoid triggering such issue, and once it encounters
such issue, it will record newly introduced ERROR_INVALID_NODE_REFERENCE
error into superblock, later fsck can detect such issue and try repairing.

Also, it removes f2fs_truncate_data_blocks() for cleanup due to the
function has only one caller, and uses f2fs_truncate_data_blocks_range()
instead.

Reported-and-tested-by: syzbot+12cb4425b22169b52036@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/000000000000f3038a05fef867f8@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h          |  1 -
 fs/f2fs/file.c          |  5 -----
 fs/f2fs/node.c          | 14 ++++++++++++--
 include/linux/f2fs_fs.h |  1 +
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 10a463f984a4..a4a6a5efcb48 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3464,7 +3464,6 @@ static inline bool __is_valid_data_blkaddr(block_t blkaddr)
  * file.c
  */
 int f2fs_sync_file(struct file *file, loff_t start, loff_t end, int datasync);
-void f2fs_truncate_data_blocks(struct dnode_of_data *dn);
 int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock);
 int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock);
 int f2fs_truncate(struct inode *inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3356f6502c70..743420b1ab57 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -630,11 +630,6 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 					 dn->ofs_in_node, nr_free);
 }
 
-void f2fs_truncate_data_blocks(struct dnode_of_data *dn)
-{
-	f2fs_truncate_data_blocks_range(dn, ADDRS_PER_BLOCK(dn->inode));
-}
-
 static int truncate_partial_data_page(struct inode *inode, u64 from,
 								bool cache_only)
 {
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3e1fa564db8f..ee2e1dd64f25 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -925,6 +925,7 @@ static int truncate_node(struct dnode_of_data *dn)
 
 static int truncate_dnode(struct dnode_of_data *dn)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	struct page *page;
 	int err;
 
@@ -932,16 +933,25 @@ static int truncate_dnode(struct dnode_of_data *dn)
 		return 1;
 
 	/* get direct node */
-	page = f2fs_get_node_page(F2FS_I_SB(dn->inode), dn->nid);
+	page = f2fs_get_node_page(sbi, dn->nid);
 	if (PTR_ERR(page) == -ENOENT)
 		return 1;
 	else if (IS_ERR(page))
 		return PTR_ERR(page);
 
+	if (IS_INODE(page) || ino_of_node(page) != dn->inode->i_ino) {
+		f2fs_err(sbi, "incorrect node reference, ino: %lu, nid: %u, ino_of_node: %u",
+				dn->inode->i_ino, dn->nid, ino_of_node(page));
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_handle_error(sbi, ERROR_INVALID_NODE_REFERENCE);
+		f2fs_put_page(page, 1);
+		return -EFSCORRUPTED;
+	}
+
 	/* Make dnode_of_data for parameter */
 	dn->node_page = page;
 	dn->ofs_in_node = 0;
-	f2fs_truncate_data_blocks(dn);
+	f2fs_truncate_data_blocks_range(dn, ADDRS_PER_BLOCK(dn->inode));
 	err = truncate_node(dn);
 	if (err) {
 		f2fs_put_page(page, 1);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 4638f7b2f96f..c58f1ce2217e 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -103,6 +103,7 @@ enum f2fs_error {
 	ERROR_INCONSISTENT_SIT,
 	ERROR_CORRUPTED_VERITY_XATTR,
 	ERROR_CORRUPTED_XATTR,
+	ERROR_INVALID_NODE_REFERENCE,
 	ERROR_MAX,
 };
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
