Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4917A75AD17
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 13:36:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMRxR-0002ox-Se;
	Thu, 20 Jul 2023 11:36:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qMRxQ-0002on-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 11:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qx2MulVw7PoOx622BSq+XGyR5ZfrL7Z3XTg1yZeT+Sk=; b=TgPvRv5juDh35bSUTnQMmq1DKD
 afkmIMCK+XSkfzQgd7Y+iqMPo4zjXarKJqMaMpRCas706Rm/4QQUeysanIgMJhiADoS6zUp/KeJPG
 iAOZY0oV+3WZ/Z9ONyPAbAjifKVA1JMygLH3JbAupuFoNSH8PQ37n9bpzFgFcBreUTXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qx2MulVw7PoOx622BSq+XGyR5ZfrL7Z3XTg1yZeT+Sk=; b=F
 o4AuoA0zkG8jHelSh7/2lFqFNYbWB5CJrmg7mve+7hIbsw94WxoH8dAYD2TQBPVTIKaVumyPSAM5s
 kXqYHvzn3INIwL3NgSv9BUNtAM5AZtHAZPh8D5xJic20nHz8Ev/1bqoHgf8Yb82NrIinyfaDiYUMw
 6ER5jQOBSeVz9QGg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMRxN-0000yN-1K for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 11:36:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5520B61A44;
 Thu, 20 Jul 2023 11:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D01FC433C8;
 Thu, 20 Jul 2023 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689852976;
 bh=Z9BOyKoV8wDDHCwHKBuqNmTP8DWdJZf2Qr+rBuKVcsg=;
 h=From:To:Cc:Subject:Date:From;
 b=JXKUKRrrUvSTlEg4un3MoLajZjYiqo5Pau4mhRGx8f1uLJmSCO4S/dcX5VOShw/CW
 Kx+UPMsnDaNji366Ls9D1np5T6QE6wqPPM/FMh6K7qBJQQdSDSr4JCoZz2yGrNlD7H
 gruZBeA+tP45xSveoiouQN+th5pWMbbGFcbD+5vuO9RdnTdEgEW/LKRgvMrDtFzbQs
 v3Hoyv0RF0J7vKJfkoyLIDR8BvhUttFWmOiy6w2J2XLIWespe80bYQJr80gXnFBBP+
 SYky+oy7tW7tuvEumUe/FbcUZRH0rpLpnhjEjndB5zD32m5INsoR9u23GrIO3GUzkx
 EoJiEYal4uixQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 20 Jul 2023 19:29:53 +0800
Message-Id: <20230720112953.3764050-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: syzbot reports a f2fs bug as below: UBSAN:
 array-index-out-of-bounds
 in fs/f2fs/f2fs.h:3275:19 index 1409 is out of range for type '__le32[923]'
 (aka 'unsigned int[923]') Call Trace: __dump_stack lib/dump_stack.c:88
 [inline] dump_stack_ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qMRxN-0000yN-1K
Subject: [f2fs-dev] [PATCH] Revert "f2fs: fix to do sanity check on extent
 cache correctly"
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
Cc: syzbot+601018296973a481f302@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot reports a f2fs bug as below:

UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3275:19
index 1409 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_out_of_bounds+0x11c/0x150 lib/ubsan.c:348
 inline_data_addr fs/f2fs/f2fs.h:3275 [inline]
 __recover_inline_status fs/f2fs/inode.c:113 [inline]
 do_read_inode fs/f2fs/inode.c:480 [inline]
 f2fs_iget+0x4730/0x48b0 fs/f2fs/inode.c:604
 f2fs_fill_super+0x640e/0x80c0 fs/f2fs/super.c:4601
 mount_bdev+0x276/0x3b0 fs/super.c:1391
 legacy_get_tree+0xef/0x190 fs/fs_context.c:611
 vfs_get_tree+0x8c/0x270 fs/super.c:1519
 do_new_mount+0x28f/0xae0 fs/namespace.c:3335
 do_mount fs/namespace.c:3675 [inline]
 __do_sys_mount fs/namespace.c:3884 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3861
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The issue was bisected to:

commit d48a7b3a72f121655d95b5157c32c7d555e44c05
Author: Chao Yu <chao@kernel.org>
Date:   Mon Jan 9 03:49:20 2023 +0000

    f2fs: fix to do sanity check on extent cache correctly

The root cause is we applied both v1 and v2 of the patch, v2 is the right
fix, so it needs to revert v1 in order to fix reported issue.

v1:
commit d48a7b3a72f1 ("f2fs: fix to do sanity check on extent cache correctly")
https://lore.kernel.org/lkml/20230109034920.492914-1-chao@kernel.org/

v2:
commit 269d11948100 ("f2fs: fix to do sanity check on extent cache correctly")
https://lore.kernel.org/lkml/20230207134808.1827869-1-chao@kernel.org/

Reported-by: syzbot+601018296973a481f302@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/000000000000fcf0690600e4d04d@google.com/
Fixes: d48a7b3a72f1 ("f2fs: fix to do sanity check on extent cache correctly")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/inode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index a73540d9a7ec..5c70297fd480 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -496,6 +496,12 @@ static int do_read_inode(struct inode *inode)
 		fi->i_inline_xattr_size = 0;
 	}
 
+	if (!sanity_check_inode(inode, node_page)) {
+		f2fs_put_page(node_page, 1);
+		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
+		return -EFSCORRUPTED;
+	}
+
 	/* check data exist */
 	if (f2fs_has_inline_data(inode) && !f2fs_exist_data(inode))
 		__recover_inline_status(inode, node_page);
@@ -565,12 +571,6 @@ static int do_read_inode(struct inode *inode)
 	f2fs_init_read_extent_tree(inode, node_page);
 	f2fs_init_age_extent_tree(inode);
 
-	if (!sanity_check_inode(inode, node_page)) {
-		f2fs_put_page(node_page, 1);
-		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
-		return -EFSCORRUPTED;
-	}
-
 	if (!sanity_check_extent_cache(inode)) {
 		f2fs_put_page(node_page, 1);
 		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
