Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1227DAAF2B1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jcmQLzgJMIacDxoSxomfviGF3oLTia/j1borwnbAdhc=; b=c4OSDvOfOdCNkMLTcl8zqqEo/9
	0lTeLbS0yJEjmQ+sd2o5gFBDzLtV+xUsNXQ/8KimKdvTS390/V6fYtFG+OK0VvXkJc6TP5wtZv+9d
	Vh53KCWoAvS8OEMm34Jr/9rhBgttgfm15/gsimOHZY6WwNge2eZTI7uUCqu3EHvSGjWY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtbl-0004ve-1b;
	Thu, 08 May 2025 05:15:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uCtbi-0004vW-9T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NBw0CLHdLVt1ZGDaSYoCrLR9yKM+Spw9McNf7qQ/cYQ=; b=dGuAi0Kg4kGjSxBe6CP0CmSkxq
 14DbfDCGdQSkPen9+sMWzxccwlcrEYnZCfyTAyNfbqjfu2QbZMX2VPsg3h2YTtg9q5AK7T4JKyEJ0
 iZC2dJwS/WBOQ0kxFR8J/H0djiBS0PGFV7Q+/g5jDR64A6KHD14b2uNOWIEtFrrjXIYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NBw0CLHdLVt1ZGDaSYoCrLR9yKM+Spw9McNf7qQ/cYQ=; b=Mx+NrKf6cpsatLKZ/j1c9AWjMo
 P9UADsbWtEa2jRd6VxrdoAVuQwCVctn/Td0wb15KPPTP0lsBwd3RRtVqlW0DqVpRqC23SuiMzf3GW
 XUDDZqOyTdBbxz3cU8yWpKMA81uMsjaa13eQ0iQ6GRX8NblJPa8X7pYnnT8usLweP5M8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtbh-0003cd-NZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NBw0CLHdLVt1ZGDaSYoCrLR9yKM+Spw9McNf7qQ/cYQ=; b=eFzcaZ3PlEXur6fH+JW5cQPznz
 BJAN2Q55pI/AyhCuSxv3OWBcGoZ9AcscmPuthbVWD+G2yqES/rzKI7qlUsoQAPJnB6RUQYmZ5M3NN
 1o4LVau71BFyu5wZIcryfs/JE3fVJ1lqSETDAJvKz8gW9I6pahditOKfibF/2PdSwb/6mkaxV7h52
 4E+0DeA3gLZMVOWGg9PxWcyAcpFSnnexIBTXRYv148Ul6hVdyFSmDfF1znWePMMvHvmT6uhfXc/QV
 VdNh6yltD0sHkGs+DnxWcL3d7csdGSIv8nT8SLtrV78CoyPfMlqucE743lAdrIj07q9Xib9lf7Na7
 s7X0BmjQ==;
Received: from
 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uCtbc-0000000HLg6-0AnN; Thu, 08 May 2025 05:15:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  8 May 2025 07:14:29 +0200
Message-ID: <20250508051520.4169795-4-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since commits 7ff0104a8052 ("f2fs: Remove
 f2fs_write_node_page()")
 and 3b47398d9861 ("f2fs: Remove f2fs_write_meta_page()'), f2fs can't be called
 from reclaim context any more. Remove all code keyed o [...] 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uCtbh-0003cd-NZ
Subject: [f2fs-dev] [PATCH 3/6] f2fs: remove wbc->for_reclaim handling
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

Since commits 7ff0104a8052 ("f2fs: Remove f2fs_write_node_page()") and
3b47398d9861 ("f2fs: Remove f2fs_write_meta_page()'), f2fs can't be
called from reclaim context any more.  Remove all code keyed of the
wbc->for_rename flag, which is now only set for writing out swap or
shmem pages inside the swap code, but never passed to file systems.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/checkpoint.c        | 14 ++------------
 fs/f2fs/data.c              | 17 ++---------------
 fs/f2fs/file.c              |  1 -
 fs/f2fs/node.c              | 13 +------------
 include/trace/events/f2fs.h |  5 +----
 5 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 595d6e87aa2f..e7907858eb70 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -359,15 +359,10 @@ static bool __f2fs_write_meta_folio(struct folio *folio,
 	}
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
-	if (wbc->for_reclaim && folio->index < GET_SUM_BLOCK(sbi, 0))
-		goto redirty_out;
 
 	f2fs_do_write_meta_page(sbi, folio, io_type);
 	dec_page_count(sbi, F2FS_DIRTY_META);
 
-	if (wbc->for_reclaim)
-		f2fs_submit_merged_write_cond(sbi, NULL, &folio->page, 0, META);
-
 	folio_unlock(folio);
 
 	if (unlikely(f2fs_cp_error(sbi)))
@@ -420,9 +415,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 	struct folio_batch fbatch;
 	long nwritten = 0;
 	int nr_folios;
-	struct writeback_control wbc = {
-		.for_reclaim = 0,
-	};
+	struct writeback_control wbc = {};
 	struct blk_plug plug;
 
 	folio_batch_init(&fbatch);
@@ -1215,7 +1208,6 @@ static int block_operations(struct f2fs_sb_info *sbi)
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_ALL,
 		.nr_to_write = LONG_MAX,
-		.for_reclaim = 0,
 	};
 	int err = 0, cnt = 0;
 
@@ -1399,9 +1391,7 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	void *src, block_t blk_addr)
 {
-	struct writeback_control wbc = {
-		.for_reclaim = 0,
-	};
+	struct writeback_control wbc = {};
 
 	/*
 	 * filemap_get_folios_tag and folio_lock again will take
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a1eb740a2b5c..160c7b39d967 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2856,13 +2856,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		goto done;
 	}
 
-	if (!wbc->for_reclaim)
-		need_balance_fs = true;
-	else if (has_not_enough_free_secs(sbi, 0, 0))
-		goto redirty_out;
-	else
-		set_inode_flag(inode, FI_HOT_DATA);
-
+	need_balance_fs = true;
 	err = -EAGAIN;
 	if (f2fs_has_inline_data(inode)) {
 		err = f2fs_write_inline_data(inode, folio);
@@ -2898,13 +2892,6 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		folio_clear_uptodate(folio);
 		clear_page_private_gcing(page);
 	}
-
-	if (wbc->for_reclaim) {
-		f2fs_submit_merged_write_cond(sbi, NULL, page, 0, DATA);
-		clear_inode_flag(inode, FI_HOT_DATA);
-		f2fs_remove_dirty_inode(inode);
-		submitted = NULL;
-	}
 	folio_unlock(folio);
 	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode) &&
 			!F2FS_I(inode)->wb_task && allow_balance)
@@ -2930,7 +2917,7 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	 * file_write_and_wait_range() will see EIO error, which is critical
 	 * to return value of fsync() followed by atomic_write failure to user.
 	 */
-	if (!err || wbc->for_reclaim)
+	if (!err)
 		return AOP_WRITEPAGE_ACTIVATE;
 	folio_unlock(folio);
 	return err;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 93d85defac53..6bd3de64f2a8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -261,7 +261,6 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_ALL,
 		.nr_to_write = LONG_MAX,
-		.for_reclaim = 0,
 	};
 	unsigned int seq_id = 0;
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 69308523c34e..f6e98c9fac95 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1699,12 +1699,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 	if (f2fs_get_node_info(sbi, nid, &ni, !do_balance))
 		goto redirty_out;
 
-	if (wbc->for_reclaim) {
-		if (!f2fs_down_read_trylock(&sbi->node_write))
-			goto redirty_out;
-	} else {
-		f2fs_down_read(&sbi->node_write);
-	}
+	f2fs_down_read(&sbi->node_write);
 
 	/* This page is already truncated */
 	if (unlikely(ni.blk_addr == NULL_ADDR)) {
@@ -1740,11 +1735,6 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 	dec_page_count(sbi, F2FS_DIRTY_NODES);
 	f2fs_up_read(&sbi->node_write);
 
-	if (wbc->for_reclaim) {
-		f2fs_submit_merged_write_cond(sbi, NULL, &folio->page, 0, NODE);
-		submitted = NULL;
-	}
-
 	folio_unlock(folio);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
@@ -1771,7 +1761,6 @@ int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
 		struct writeback_control wbc = {
 			.sync_mode = WB_SYNC_ALL,
 			.nr_to_write = 1,
-			.for_reclaim = 0,
 		};
 
 		f2fs_folio_wait_writeback(node_folio, NODE, true, true);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index eb3b2f1326b1..edbbd869078f 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1472,7 +1472,6 @@ TRACE_EVENT(f2fs_writepages,
 		__field(char,	for_kupdate)
 		__field(char,	for_background)
 		__field(char,	tagged_writepages)
-		__field(char,	for_reclaim)
 		__field(char,	range_cyclic)
 		__field(char,	for_sync)
 	),
@@ -1491,14 +1490,13 @@ TRACE_EVENT(f2fs_writepages,
 		__entry->for_kupdate	= wbc->for_kupdate;
 		__entry->for_background	= wbc->for_background;
 		__entry->tagged_writepages	= wbc->tagged_writepages;
-		__entry->for_reclaim	= wbc->for_reclaim;
 		__entry->range_cyclic	= wbc->range_cyclic;
 		__entry->for_sync	= wbc->for_sync;
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, %s, %s, nr_to_write %ld, "
 		"skipped %ld, start %lld, end %lld, wb_idx %lu, sync_mode %d, "
-		"kupdate %u background %u tagged %u reclaim %u cyclic %u sync %u",
+		"kupdate %u background %u tagged %u cyclic %u sync %u",
 		show_dev_ino(__entry),
 		show_block_type(__entry->type),
 		show_file_type(__entry->dir),
@@ -1511,7 +1509,6 @@ TRACE_EVENT(f2fs_writepages,
 		__entry->for_kupdate,
 		__entry->for_background,
 		__entry->tagged_writepages,
-		__entry->for_reclaim,
 		__entry->range_cyclic,
 		__entry->for_sync)
 );
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
