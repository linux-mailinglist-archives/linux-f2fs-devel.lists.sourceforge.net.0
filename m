Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 164AB94122C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jul 2024 14:45:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sYmET-0007WQ-VK;
	Tue, 30 Jul 2024 12:45:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1sYmET-0007WK-4f
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9+kHC7GC1jnSL2/QAnD5nPGUF8Gb/DBugMW83Q67Iw=; b=UL4kLpkIBeodl6RVYZM0IkdYhf
 2bHLtaCj43yVQ8MnRsiJBBKw/JOr0Gja9WS65cU5FjG/dzKPEn/KnR2d7HPYL3MwWF/RiWwIIDpFJ
 1YhFy5XvOL6K22Waq/ILQdXdomtgusG9KvsMzKgsnmOhhbGoi5EpqqpB+jrANBE0nBYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N9+kHC7GC1jnSL2/QAnD5nPGUF8Gb/DBugMW83Q67Iw=; b=DWivLwRgxq6XW4+DkTT95oNzTq
 wrAzsfoKvc8V6+womxZ444tlCZuwDpjO8EJVCtoFYWWlZRUiLt6pvk3arUfVHUo7s4IITOPPG0k8v
 4Cr/Ms7rdnuiA7g2IDbXUX57I+WHOWuDS+6HTvjbANIuR3XqQinHTZdkSQm1VweBjju0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sYmES-0007AT-7o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jul 2024 12:45:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DFFFC61EBD;
 Tue, 30 Jul 2024 12:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8C9C4AF10;
 Tue, 30 Jul 2024 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722343525;
 bh=L+peMdQr+BQ8+xAARiVijlCxQ+YZHgGxzeieBboLqUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ossomF2vzupBwva2vXnCpcqSxHmgZbX++1U1IMxzVtSiAD1yXPs8wEG10h+ynX7f2
 uboDYSiR3N+MNK+e1KPeVA+prEiEU2ZxEJcGo8zeXmzAtCApDjm0ign3VBD7qKtXET
 /bMJ7SAMbET9Xz2I7A5SYDcvwUynYaKzfYzTM+YGXAPw2N4uHxiLQ3jcYQqhBb0lcp
 enRrt+YggOqeqvsx3u74UTEUQe7sSiTZAiH1fhBg1noPptg2wWV6C3NraE6w3sfgen
 CWdWcyMyZS0ccQhUf01ACQAJEUR062I3ig1JP0GSmGl79S0N4FTfoW9nGL9tok6vk0
 7w6r2bObhpybw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 30 Jul 2024 08:45:09 -0400
Message-ID: <20240730124519.3093607-3-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730124519.3093607-1-sashal@kernel.org>
References: <20240730124519.3093607-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 d7409b05a64f212735f0d33f5f1602051a886eab
 ] syzbot reports a f2fs bug as below: 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sYmES-0007AT-7o
Subject: [f2fs-dev] [PATCH AUTOSEL 6.10 3/7] f2fs: fix to cover read extent
 cache access with lock
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 syzbot+74ebe2104433e9dc610d@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit d7409b05a64f212735f0d33f5f1602051a886eab ]

syzbot reports a f2fs bug as below:

BUG: KASAN: slab-use-after-free in sanity_check_extent_cache+0x370/0x410 fs/f2fs/extent_cache.c:46
Read of size 4 at addr ffff8880739ab220 by task syz-executor200/5097

CPU: 0 PID: 5097 Comm: syz-executor200 Not tainted 6.9.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 sanity_check_extent_cache+0x370/0x410 fs/f2fs/extent_cache.c:46
 do_read_inode fs/f2fs/inode.c:509 [inline]
 f2fs_iget+0x33e1/0x46e0 fs/f2fs/inode.c:560
 f2fs_nfs_get_inode+0x74/0x100 fs/f2fs/super.c:3237
 generic_fh_to_dentry+0x9f/0xf0 fs/libfs.c:1413
 exportfs_decode_fh_raw+0x152/0x5f0 fs/exportfs/expfs.c:444
 exportfs_decode_fh+0x3c/0x80 fs/exportfs/expfs.c:584
 do_handle_to_path fs/fhandle.c:155 [inline]
 handle_to_path fs/fhandle.c:210 [inline]
 do_handle_open+0x495/0x650 fs/fhandle.c:226
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

We missed to cover sanity_check_extent_cache() w/ extent cache lock,
so, below race case may happen, result in use after free issue.

- f2fs_iget
 - do_read_inode
  - f2fs_init_read_extent_tree
  : add largest extent entry in to cache
					- shrink
					 - f2fs_shrink_read_extent_tree
					  - __shrink_extent_tree
					   - __detach_extent_node
					   : drop largest extent entry
  - sanity_check_extent_cache
  : access et->largest w/o lock

let's refactor sanity_check_extent_cache() to avoid extent cache access
and call it before f2fs_init_read_extent_tree() to fix this issue.

Reported-by: syzbot+74ebe2104433e9dc610d@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-f2fs-devel/00000000000009beea061740a531@google.com
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/extent_cache.c | 48 +++++++++++++++++-------------------------
 fs/f2fs/f2fs.h         |  2 +-
 fs/f2fs/inode.c        | 10 ++++-----
 3 files changed, 25 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 48048fa364276..fd1fc06359eea 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -19,33 +19,23 @@
 #include "node.h"
 #include <trace/events/f2fs.h>
 
-bool sanity_check_extent_cache(struct inode *inode)
+bool sanity_check_extent_cache(struct inode *inode, struct page *ipage)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct extent_tree *et = fi->extent_tree[EX_READ];
-	struct extent_info *ei;
-
-	if (!et)
-		return true;
+	struct f2fs_extent *i_ext = &F2FS_INODE(ipage)->i_ext;
+	struct extent_info ei;
 
-	ei = &et->largest;
-	if (!ei->len)
-		return true;
+	get_read_extent_info(&ei, i_ext);
 
-	/* Let's drop, if checkpoint got corrupted. */
-	if (is_set_ckpt_flags(sbi, CP_ERROR_FLAG)) {
-		ei->len = 0;
-		et->largest_updated = true;
+	if (!ei.len)
 		return true;
-	}
 
-	if (!f2fs_is_valid_blkaddr(sbi, ei->blk, DATA_GENERIC_ENHANCE) ||
-	    !f2fs_is_valid_blkaddr(sbi, ei->blk + ei->len - 1,
+	if (!f2fs_is_valid_blkaddr(sbi, ei.blk, DATA_GENERIC_ENHANCE) ||
+	    !f2fs_is_valid_blkaddr(sbi, ei.blk + ei.len - 1,
 					DATA_GENERIC_ENHANCE)) {
 		f2fs_warn(sbi, "%s: inode (ino=%lx) extent info [%u, %u, %u] is incorrect, run fsck to fix",
 			  __func__, inode->i_ino,
-			  ei->blk, ei->fofs, ei->len);
+			  ei.blk, ei.fofs, ei.len);
 		return false;
 	}
 	return true;
@@ -394,24 +384,22 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
 
 	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
-		if (i_ext && i_ext->len) {
+		if (i_ext->len) {
 			f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 			i_ext->len = 0;
 			set_page_dirty(ipage);
 		}
-		goto out;
+		set_inode_flag(inode, FI_NO_EXTENT);
+		return;
 	}
 
 	et = __grab_extent_tree(inode, EX_READ);
 
-	if (!i_ext || !i_ext->len)
-		goto out;
-
 	get_read_extent_info(&ei, i_ext);
 
 	write_lock(&et->lock);
-	if (atomic_read(&et->node_cnt))
-		goto unlock_out;
+	if (atomic_read(&et->node_cnt) || !ei.len)
+		goto skip;
 
 	en = __attach_extent_node(sbi, et, &ei, NULL,
 				&et->root.rb_root.rb_node, true);
@@ -423,11 +411,13 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
 		list_add_tail(&en->list, &eti->extent_list);
 		spin_unlock(&eti->extent_lock);
 	}
-unlock_out:
+skip:
+	/* Let's drop, if checkpoint got corrupted. */
+	if (f2fs_cp_error(sbi)) {
+		et->largest.len = 0;
+		et->largest_updated = true;
+	}
 	write_unlock(&et->lock);
-out:
-	if (!F2FS_I(inode)->extent_tree[EX_READ])
-		set_inode_flag(inode, FI_NO_EXTENT);
 }
 
 void f2fs_init_age_extent_tree(struct inode *inode)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f463961b497c4..86d4f7b198813 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4190,7 +4190,7 @@ void f2fs_leave_shrinker(struct f2fs_sb_info *sbi);
 /*
  * extent_cache.c
  */
-bool sanity_check_extent_cache(struct inode *inode);
+bool sanity_check_extent_cache(struct inode *inode, struct page *ipage);
 void f2fs_init_extent_tree(struct inode *inode);
 void f2fs_drop_extent_tree(struct inode *inode);
 void f2fs_destroy_extent_node(struct inode *inode);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 33b2778d54525..db6a6c17114e0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -508,16 +508,16 @@ static int do_read_inode(struct inode *inode)
 
 	init_idisk_time(inode);
 
-	/* Need all the flag bits */
-	f2fs_init_read_extent_tree(inode, node_page);
-	f2fs_init_age_extent_tree(inode);
-
-	if (!sanity_check_extent_cache(inode)) {
+	if (!sanity_check_extent_cache(inode, node_page)) {
 		f2fs_put_page(node_page, 1);
 		f2fs_handle_error(sbi, ERROR_CORRUPTED_INODE);
 		return -EFSCORRUPTED;
 	}
 
+	/* Need all the flag bits */
+	f2fs_init_read_extent_tree(inode, node_page);
+	f2fs_init_age_extent_tree(inode);
+
 	f2fs_put_page(node_page, 1);
 
 	stat_inc_inline_xattr(inode);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
