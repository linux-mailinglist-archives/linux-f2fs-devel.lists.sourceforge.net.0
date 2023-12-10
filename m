Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0126180B9FB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Dec 2023 10:21:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rCFzx-0002Yd-3M;
	Sun, 10 Dec 2023 09:21:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rCFzu-0002YR-HF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cxckw0x/9Kqnap6ztx3O7T5K6wGg+pZ+aRth6VeFPbc=; b=jPAI1LIP2NGQxkDt6UteIqd6i3
 sLULloXxhtQp9QGgnzb/yLDzRzOLhb1ioyPz38fxl3pi6USPH9S6QjnSMKyz+nyraalz0uaMzciuy
 0Hl9/FvhxSJwABKOSujyorlBSh0TS9f720XaP6xGFvWw0gxxAzm4sNZeW7KgZFnv/wGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Cxckw0x/9Kqnap6ztx3O7T5K6wGg+pZ+aRth6VeFPbc=; b=B
 asUuIK9U0Q7T0ay4xrnLhFrvK8GHGbwojPWqPIqdnVMBLUC/TUwWQEOHtlkHCxRs3BmXl9GbEAcv+
 Je5dcPYVdwE+qb4KzE5M4JlS9HhE/F1LFEIc2nW5fbb1yu6ymMYqriME5Me1e976ChKgF4wpQ7waT
 kH5CaCo18AwN5Nn0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rCFzp-0002mz-1X for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Dec 2023 09:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6A598B8085F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Dec 2023 09:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35EEC433C8;
 Sun, 10 Dec 2023 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702200047;
 bh=c1XbgCcpxu3d0B/1CATk98nDLk0XqyEJ9d7k2gjQZM8=;
 h=From:To:Cc:Subject:Date:From;
 b=ih4AafpLeUQyDzAUdh8J9F7WUFdiDG6H+E8KdJ1BitFkJ6vjAwXbJft2PvHru8VaF
 gWit9nM9FUzXDDy/xgbfyH7WfoUEUkjO7osz4/hj5jdoeS1S/3JuQJvh5tvZ2J6pPM
 luLUwllV8invWxjOlNNxp18PnIySvO4hfzj5IXHE+CQO2DBMhRmZ6AfIXx5S0ApECC
 iNH+eeWUgEJMJ14gRyl32kNwd5zty4XyLBGFKfix2HFyRWNjDDs41VDQMo58xSh5XN
 QSpdH9VT2oY+XqtnaOxEU+JKAszpPXz0nq9qT13BebnwSJV4iBPBOpC8BazuFCddeU
 XEn1tofwaPofg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 10 Dec 2023 17:20:35 +0800
Message-Id: <20231210092040.3374741-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit 3c6c2bebef79 ("f2fs: avoid punch_hole overhead when
 releasing volatile data") introduced FI_FIRST_BLOCK_WRITTEN as below reason:
 This patch is to avoid some punch_hole overhead when releasing volatile data.
 If volatile data was not written yet, we just can make the first page as
 zero. Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rCFzp-0002mz-1X
Subject: [f2fs-dev] [PATCH 1/6] f2fs: delete obsolete FI_FIRST_BLOCK_WRITTEN
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 3c6c2bebef79 ("f2fs: avoid punch_hole overhead when releasing
volatile data") introduced FI_FIRST_BLOCK_WRITTEN as below reason:

This patch is to avoid some punch_hole overhead when releasing volatile
data. If volatile data was not written yet, we just can make the first
page as zero.

After commit 7bc155fec5b3 ("f2fs: kill volatile write support"), we
won't support volatile write, but it missed to remove obsolete
FI_FIRST_BLOCK_WRITTEN, delete it in this patch.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c |  2 --
 fs/f2fs/data.c     |  2 --
 fs/f2fs/f2fs.h     |  6 ------
 fs/f2fs/file.c     |  3 ---
 fs/f2fs/gc.c       |  2 --
 fs/f2fs/inode.c    | 25 -------------------------
 6 files changed, 40 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 36e5dab6baae..b35be5799726 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1369,8 +1369,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	add_compr_block_stat(inode, cc->valid_nr_cpages);
 
 	set_inode_flag(cc->inode, FI_APPEND_WRITE);
-	if (cc->cluster_idx == 0)
-		set_inode_flag(inode, FI_FIRST_BLOCK_WRITTEN);
 
 	f2fs_put_dnode(&dn);
 	if (quota_inode)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 42f0f6184f73..73d0726ac366 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2810,8 +2810,6 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 	f2fs_outplace_write_data(&dn, fio);
 	trace_f2fs_do_write_data_page(page, OPU);
 	set_inode_flag(inode, FI_APPEND_WRITE);
-	if (page->index == 0)
-		set_inode_flag(inode, FI_FIRST_BLOCK_WRITTEN);
 out_writepage:
 	f2fs_put_dnode(&dn);
 out:
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 86a145be4e53..be9a8e50ac50 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -781,7 +781,6 @@ enum {
 	FI_UPDATE_WRITE,	/* inode has in-place-update data */
 	FI_NEED_IPU,		/* used for ipu per file */
 	FI_ATOMIC_FILE,		/* indicate atomic file */
-	FI_FIRST_BLOCK_WRITTEN,	/* indicate #0 data block was written */
 	FI_DROP_CACHE,		/* drop dirty page cache */
 	FI_DATA_EXIST,		/* indicate data exists */
 	FI_INLINE_DOTS,		/* indicate inline dot dentries */
@@ -3279,11 +3278,6 @@ static inline bool f2fs_is_cow_file(struct inode *inode)
 	return is_inode_flag_set(inode, FI_COW_FILE);
 }
 
-static inline bool f2fs_is_first_block_written(struct inode *inode)
-{
-	return is_inode_flag_set(inode, FI_FIRST_BLOCK_WRITTEN);
-}
-
 static inline bool f2fs_is_drop_cache(struct inode *inode)
 {
 	return is_inode_flag_set(inode, FI_DROP_CACHE);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 325dab01a29d..5025abf2d995 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -599,9 +599,6 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
 				valid_blocks++;
 		}
 
-		if (dn->ofs_in_node == 0 && IS_INODE(dn->node_page))
-			clear_inode_flag(dn->inode, FI_FIRST_BLOCK_WRITTEN);
-
 		f2fs_invalidate_blocks(sbi, blkaddr);
 
 		if (!released || blkaddr != COMPRESS_ADDR)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f550cdeaa663..2fbe16ad726f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1405,8 +1405,6 @@ static int move_data_block(struct inode *inode, block_t bidx,
 
 	f2fs_update_data_blkaddr(&dn, newaddr);
 	set_inode_flag(inode, FI_APPEND_WRITE);
-	if (page->index == 0)
-		set_inode_flag(inode, FI_FIRST_BLOCK_WRITTEN);
 put_page_out:
 	f2fs_put_page(fio.encrypted_page, 1);
 recover_block:
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 560bfcad1af2..108e3d00028a 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -76,20 +76,6 @@ static void __get_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
 	}
 }
 
-static int __written_first_block(struct f2fs_sb_info *sbi,
-					struct f2fs_inode *ri)
-{
-	block_t addr = le32_to_cpu(ri->i_addr[offset_in_addr(ri)]);
-
-	if (!__is_valid_data_blkaddr(addr))
-		return 1;
-	if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC_ENHANCE)) {
-		f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
-		return -EFSCORRUPTED;
-	}
-	return 0;
-}
-
 static void __set_inode_rdev(struct inode *inode, struct f2fs_inode *ri)
 {
 	int extra_size = get_extra_isize(inode);
@@ -398,7 +384,6 @@ static int do_read_inode(struct inode *inode)
 	struct page *node_page;
 	struct f2fs_inode *ri;
 	projid_t i_projid;
-	int err;
 
 	/* Check if ino is within scope */
 	if (f2fs_check_nid_range(sbi, inode->i_ino))
@@ -480,16 +465,6 @@ static int do_read_inode(struct inode *inode)
 	/* get rdev by using inline_info */
 	__get_inode_rdev(inode, ri);
 
-	if (S_ISREG(inode->i_mode)) {
-		err = __written_first_block(sbi, ri);
-		if (err < 0) {
-			f2fs_put_page(node_page, 1);
-			return err;
-		}
-		if (!err)
-			set_inode_flag(inode, FI_FIRST_BLOCK_WRITTEN);
-	}
-
 	if (!f2fs_need_inode_block_update(sbi, inode->i_ino))
 		fi->last_disk_size = inode->i_size;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
