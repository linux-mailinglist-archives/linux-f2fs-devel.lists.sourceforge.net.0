Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C489B090F6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jul 2025 17:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xwyLruOFHAGtI1GIuy4wXDYunzPc0+pNeIsNBZfYjQQ=; b=Jatnb7OH7QoVoHe7uZRAKbQFB/
	hPbcZIUapuuOHES3TIQaACzuvN8DWKowLmsOufYT6EO3oFjcvyiwaUZcYHt8cJLYsa0p1PKF5uKhJ
	ojDw3ZJ9FhrAZjLlpTe2k3jivyJgyqA4RiY7aDp7tEhASr7eZeIKrpsmsuWmMHpzuKQM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucQuo-0004Z5-Jy;
	Thu, 17 Jul 2025 15:52:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ucQun-0004Yy-PO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 15:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kkk30icKwJza30nJyBwiJpEmiPkz1o53gAz+qkBwu2U=; b=UD8QfZS6H6LZqk2UR2kMY/XuMe
 qbmVazE98xBQAzW12z8gVq8GBOq3N4LQZ/fW0XXYGEcugdGwRkjYtjey1gyz5nnXJVfPykFw70hLs
 YuMfRP4YnTKgrrjS85jEI2iNZexqSxxj/u5q1jKbpYNAYzkTCPm47zIqPK84kglZlivY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kkk30icKwJza30nJyBwiJpEmiPkz1o53gAz+qkBwu2U=; b=M
 IQbXKKiej71TFQScDAFphWz5IlDXuIyP7mKWP+WuNk/UbVuIxc8UPXffzAgl/6kZ0T+72U42WZyTf
 hIm0ruKIVKlK20PghC5qhzVV391aDOExZVXj/TRLPgwHsE2O+aq41soVPYOyYvEM4eNUJLf7AGIFO
 3EnWQmofEerx5z00=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ucQun-0001AF-9g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 15:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C50FA578B1;
 Thu, 17 Jul 2025 13:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399EFC4CEEB;
 Thu, 17 Jul 2025 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752758803;
 bh=xwH9KsVkA9xR3sdKvSoirJ1o44ujVkiSADhgE4jH1cA=;
 h=From:To:Cc:Subject:Date:From;
 b=BsHcZe/xmFtJQuC3is2g8dqOg6oTys7hTJb5VVqNhx3RFbWHKoK2innuiDnsyckwf
 DDrmgyEUsk7BBD7FgAt1kRuChlk7vum/DUThYuL/eIrvqsn7Bp8dUgzribxQsa6Hpy
 8BZy0LNHkLqfS5X8XpXjWN++Bd4Lg/EZanMzhBhyfyfFwY5g2AlgZn5h/S7Oo3lpr3
 0D91bQvLqJLVrn6RFaLRodx8zszmUmrS0CPGTnhXFtmVzUiMtLfZrX8qZkz8UR6oT+
 uYfCLkqefWza4fIe/XjR8BR69uci+KHsnjVMW0zhjFZwuJj9v+EyNQbGYjjIWX5pnZ
 r4vU+RM9Y2p0A==
To: jaegeuk@kernel.org
Date: Thu, 17 Jul 2025 21:26:33 +0800
Message-ID: <20250717132633.1339965-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Jiaming Zhang reported: <TASK> __dump_stack
 lib/dump_stack.c:94
 [inline] dump_stack_lvl+0x1c1/0x2a0 lib/dump_stack.c:120
 print_address_description
 mm/kasan/report.c:378 [inline] print_report+0x17e/0x800 mm/kasan/report.c:48
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ucQun-0001AF-9g
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid out-of-boundary access in
 dnode page
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
Cc: Jiaming Zhang <r772577952@gmail.com>, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Jiaming Zhang reported:

 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x1c1/0x2a0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x17e/0x800 mm/kasan/report.c:480
 kasan_report+0x147/0x180 mm/kasan/report.c:593
 data_blkaddr fs/f2fs/f2fs.h:3053 [inline]
 f2fs_data_blkaddr fs/f2fs/f2fs.h:3058 [inline]
 f2fs_get_dnode_of_data+0x1a09/0x1c40 fs/f2fs/node.c:855
 f2fs_reserve_block+0x53/0x310 fs/f2fs/data.c:1195
 prepare_write_begin fs/f2fs/data.c:3395 [inline]
 f2fs_write_begin+0xf39/0x2190 fs/f2fs/data.c:3594
 generic_perform_write+0x2c7/0x910 mm/filemap.c:4112
 f2fs_buffered_write_iter fs/f2fs/file.c:4988 [inline]
 f2fs_file_write_iter+0x1ec8/0x2410 fs/f2fs/file.c:5216
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x546/0xa90 fs/read_write.c:686
 ksys_write+0x149/0x250 fs/read_write.c:738
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf3/0x3d0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The root cause is in the corrupted image, there is a dnode has the same
node id w/ its inode, so during f2fs_get_dnode_of_data(), it tries to
access block address in dnode at offset 934, however it parses the dnode
as inode node, so that get_dnode_addr() returns 360, then it tries to
access page address from 360 + 934 * 4 = 4096 w/ 4 bytes.

To fix this issue, let's add sanity check for node id of all direct nodes
during f2fs_get_dnode_of_data().

Cc: stable@kernel.org
Reported-by: Jiaming Zhang <r772577952@gmail.com>
Closes: https://groups.google.com/g/syzkaller/c/-ZnaaOOfO3M
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 651537598759..12cab5c69fcd 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -815,6 +815,16 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	for (i = 1; i <= level; i++) {
 		bool done = false;
 
+		if (nids[i] && nids[i] == dn->inode->i_ino) {
+			err = -EFSCORRUPTED;
+			f2fs_err_ratelimited(sbi,
+				"inode mapping table is corrupted, run fsck to fix it, "
+				"ino:%lu, nid:%u, level:%d, offset:%d",
+				dn->inode->i_ino, nids[i], level, offset[level]);
+			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			goto release_pages;
+		}
+
 		if (!nids[i] && mode == ALLOC_NODE) {
 			/* alloc new node */
 			if (!f2fs_alloc_nid(sbi, &(nids[i]))) {
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
