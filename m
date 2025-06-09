Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F305AD191A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jun 2025 09:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NKM9QQYp0+fBaDeUQZwyPtFPvxTMR7EK/p68iRQWoA=; b=en2nbc/ZaI0s6+hIsCmXItWR45
	+5IOJsfOEMWRj8H1DJTYGikSFaDBNVmbluop95ACpyoB/WmR9UtRYRxv5e+Q99PP9+7UGh3aGgqbw
	o/0958An0pqd305+alMACsDaIcQU0DmgF7b3TcGmLQIkSX0NbNkYVn3fyQQiLVp5QDDI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uOX5v-00042g-AE;
	Mon, 09 Jun 2025 07:38:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uOX5u-00042Z-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 07:38:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6ag6QZLkd/E8WmfMQe2dj8JfYGbyVdKaz4tZwzDmexk=; b=CI9YfMyZlvnASPyOgqr7XzrF/X
 +hWPx5IU+svI0HCFFHZPgqEOOeA2ppKzOINMA71L7n1piamgvuOtDRG0LJZCu6iMje7KK6r3YLmMa
 lWTk8Fw2Yc0lKE+AWhXe6LlkD1iuqeO6vNex+ElySaEGH07jsgxIscZHbFVMgaIjIVhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6ag6QZLkd/E8WmfMQe2dj8JfYGbyVdKaz4tZwzDmexk=; b=F
 QFfIrneVleQ/jlHeBKM6CZTGmbdl+F2VZcV6xVM54sfeFUj1LEDSj+GBO4djuCKAlykGpfAqpPYtA
 /Agcf2l/vYK0EyqQ2tPwegTJPUHGg0PHg7UgP0aTIrh7We4ECssWGy5ZiQMqRg/B0cqJNQigSUcBh
 c47HlyX2m0fLvksE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uOX5t-0007zR-IM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 07:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 282564AC7D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Jun 2025 07:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6376C4CEEB;
 Mon,  9 Jun 2025 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749454732;
 bh=y8JjxmlE4cJ3pc5jJ/Zy0F6Jhoc6ohXXRZRnqJJ877A=;
 h=From:To:Cc:Subject:Date:From;
 b=WewtOZylmuyK9mQ7FMEctf/8NrSdU0sgAoF4nTKot4y90Xuo7tkAk0xjFzb0z32+u
 gq+elNWSI5WT833QpJIb1sHepKww081CWEJz/vmnDF10DT4aeaJ2wGON13cHvC4xvm
 PywjR1F0PFKgF74JBJN9anRsxxswW58hBMj5tAjBww6Juuk6DUgXZWIFbMnvq9/fqx
 Gh3gplFzoWXWNfGwR742TDhSFL8//XkO+2SCg967oCeMzYt1IadCf+FsqS14MKGY3O
 nbvUIYhjP7iPPYM5viKtUHuSpNXpNcz+QIFdbUnV/FHN7MvxVPCk0+H8/mQ0enRleQ
 aNnIIbnjczijA==
To: jaegeuk@kernel.org
Date: Mon,  9 Jun 2025 15:27:12 +0800
Message-ID: <20250609072712.792834-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS-fs (dm-55): access invalid blkaddr:972878540 Call trace:
 dump_backtrace+0xec/0x128 show_stack+0x18/0x28 dump_stack_lvl+0x40/0x88
 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4 f2fs_is_v [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uOX5t-0007zR-IM
Subject: [f2fs-dev] [PATCH] f2fs: handle nat.blkaddr corruption in
 f2fs_get_node_info()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS-fs (dm-55): access invalid blkaddr:972878540
Call trace:
 dump_backtrace+0xec/0x128
 show_stack+0x18/0x28
 dump_stack_lvl+0x40/0x88
 dump_stack+0x18/0x24
 __f2fs_is_valid_blkaddr+0x360/0x3b4
 f2fs_is_valid_blkaddr+0x10/0x20
 f2fs_get_node_info+0x21c/0x60c
 __write_node_page+0x15c/0x734
 f2fs_sync_node_pages+0x4f8/0x700
 f2fs_write_checkpoint+0x4a8/0x99c
 __checkpoint_and_complete_reqs+0x7c/0x20c
 issue_checkpoint_thread+0x4c/0xd8
 kthread+0x11c/0x1b0
 ret_from_fork+0x10/0x20

If nat.blkaddr is corrupted, during checkpoint, f2fs_sync_node_pages()
will loop to flush node page w/ corrupted nat.blkaddr.

Although, it tags SBI_NEED_FSCK, checkpoint can not persist it due
to deadloop.

Let's call f2fs_handle_error(, ERROR_INCONSISTENT_NAT) to record such
error into superblock, it expects fsck can detect the error and repair
inconsistent nat.blkaddr after device reboot.

Note that, let's add sanity check in f2fs_get_node_info() to detect
in-memory nat.blkaddr inconsistency, but only if CONFIG_F2FS_CHECK_FS
is enabled.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 8b5cd764226a..519c4c114607 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -555,8 +555,8 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	struct f2fs_nat_entry ne;
 	struct nat_entry *e;
 	pgoff_t index;
-	block_t blkaddr;
 	int i;
+	bool need_cache = true;
 
 	ni->flag = 0;
 	ni->nid = nid;
@@ -569,6 +569,10 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 		ni->blk_addr = nat_get_blkaddr(e);
 		ni->version = nat_get_version(e);
 		f2fs_up_read(&nm_i->nat_tree_lock);
+		if (IS_ENABLED(CONFIG_F2FS_CHECK_FS)) {
+			need_cache = false;
+			goto sanity_check;
+		}
 		return 0;
 	}
 
@@ -594,7 +598,7 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	up_read(&curseg->journal_rwsem);
 	if (i >= 0) {
 		f2fs_up_read(&nm_i->nat_tree_lock);
-		goto cache;
+		goto sanity_check;
 	}
 
 	/* Fill node_info from nat page */
@@ -609,14 +613,23 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 	ne = nat_blk->entries[nid - start_nid];
 	node_info_from_raw_nat(ni, &ne);
 	f2fs_folio_put(folio, true);
-cache:
-	blkaddr = le32_to_cpu(ne.block_addr);
-	if (__is_valid_data_blkaddr(blkaddr) &&
-		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE))
-		return -EFAULT;
+sanity_check:
+	if (__is_valid_data_blkaddr(ni->blk_addr) &&
+		!f2fs_is_valid_blkaddr(sbi, ni->blk_addr,
+					DATA_GENERIC_ENHANCE)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_err_ratelimited(sbi,
+			"f2fs_get_node_info of %pS: inconsistent nat entry, "
+			"ino:%u, nid:%u, blkaddr:%u, ver:%u, flag:%u",
+			__builtin_return_address(0),
+			ni->ino, ni->nid, ni->blk_addr, ni->version, ni->flag);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_NAT);
+		return -EFSCORRUPTED;
+	}
 
 	/* cache nat entry */
-	cache_nat_entry(sbi, nid, &ne);
+	if (need_cache)
+		cache_nat_entry(sbi, nid, &ne);
 	return 0;
 }
 
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
