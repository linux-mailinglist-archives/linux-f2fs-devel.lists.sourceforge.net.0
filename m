Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3E04A2D0C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jan 2022 09:21:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDizE-0004AK-Ej; Sat, 29 Jan 2022 08:21:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nDiz8-000488-98
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 08:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UKPlmC4TTA2LlzSPtutDnAI9+RD3ZhXCoNEVv83mFms=; b=YUcTzMCQlWaBReS3cKlnR62tOL
 2TDMpmyHyoRO1cjNS5At+QyBwzSt2QQBGb5sL7uBw/1R4+zv7cfy4pAYcaUIG//fbuLkyyb7DVd0H
 Oh/zVgCZNVcv0uGBdlqj7YCJphlbePlS0jj+ye0qORkeSrPjHEo/sH0szj4RbsdMB/z0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UKPlmC4TTA2LlzSPtutDnAI9+RD3ZhXCoNEVv83mFms=; b=Y
 xj8N3wL/xiPQHl8vyCBLJB690vxiBsybbfWj+1F/d7oMioJkhjk6ToMMkjdsbHLQaQurZn83zB3Ji
 kjO+Y3bTnAL6yRDc6zIIAX2iiZMCCvGHHzXeXsyVfWqmIFSgXzYshCE6MH3uY+VDC9FyhA2SeB0VZ
 R4xxQkVPgkwd9mnQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDiz6-002O5z-67
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 08:21:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCBFE60BDC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 29 Jan 2022 08:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE49C340E5;
 Sat, 29 Jan 2022 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643444478;
 bh=hqF3Q+sru8JEAWqehYGk90SdFMfmsqL/jS02ZG+78zU=;
 h=From:To:Cc:Subject:Date:From;
 b=DyBGA/Z+KWhlGWy4O/b2QIXKMfq375pb0818Jk5cJQD6Lpj6IlbeZ0vf8vkn6mb7q
 ABSF8iaob3em6tSKa93YQpq8pjbH2FH7Y74uips94zOkN/0TOvvEFiZOgeaffzlCmq
 w1UeBGsNMxVgD6HB+kJvAFqTWbZ9X2gg/mC0O47L8+XzbsFJN30hWcRHRLwvpkbudB
 7s28zbT/dTq4N9wdn+8oxWYyDBlGbzLaEBwtvsy59R9eQWmRXVAOlvMEeicCfHg3FB
 CMeIzQz7Sm86tUhqKtBl1HNJ38SSiCAnEMyKKKINMZ7cRB3M1zhCoHGuRY4HlOHdhQ
 qCHtBoTRQAooA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 29 Jan 2022 16:21:12 +0800
Message-Id: <20220129082112.1814398-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In a fragmented image, entries in dnode block list may locate
 in incontiguous physical block address space, however, in recovery flow,
 we will always readahead BIO_MAX_VECS size blocks, so in such cas [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDiz6-002O5z-67
Subject: [f2fs-dev] [PATCH] f2fs: adjust readahead block number during
 recovery
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

In a fragmented image, entries in dnode block list may locate in
incontiguous physical block address space, however, in recovery flow,
we will always readahead BIO_MAX_VECS size blocks, so in such case,
current readahead policy is low efficient, let's adjust readahead
window size dynamically based on consecutiveness of dnode blocks.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c |  8 ++++++--
 fs/f2fs/f2fs.h       |  6 +++++-
 fs/f2fs/recovery.c   | 27 ++++++++++++++++++++++++---
 3 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 57a2d9164bee..203a1577942d 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -282,18 +282,22 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 	return blkno - start;
 }
 
-void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index)
+void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
+							unsigned int ra_blocks)
 {
 	struct page *page;
 	bool readahead = false;
 
+	if (ra_blocks == RECOVERY_MIN_RA_BLOCKS)
+		return;
+
 	page = find_get_page(META_MAPPING(sbi), index);
 	if (!page || !PageUptodate(page))
 		readahead = true;
 	f2fs_put_page(page, 0);
 
 	if (readahead)
-		f2fs_ra_meta_pages(sbi, index, BIO_MAX_VECS, META_POR, true);
+		f2fs_ra_meta_pages(sbi, index, ra_blocks, META_POR, true);
 }
 
 static int __f2fs_write_meta_page(struct page *page,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5af415208488..1fa6b3f98a71 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -590,6 +590,9 @@ enum {
 /* number of extent info in extent cache we try to shrink */
 #define EXTENT_CACHE_SHRINK_NUMBER	128
 
+#define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
+#define RECOVERY_MIN_RA_BLOCKS		1
+
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
 	union {
@@ -3655,7 +3658,8 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type);
 int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 			int type, bool sync);
-void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index);
+void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
+							unsigned int ra_blocks);
 long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 			long nr_to_write, enum iostat_type io_type);
 void f2fs_add_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index f69b685fb2b2..0b88d0ce284a 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -346,6 +346,19 @@ static int recover_inode(struct inode *inode, struct page *page)
 	return 0;
 }
 
+static unsigned int adjust_por_ra_blocks(struct f2fs_sb_info *sbi,
+				unsigned int ra_blocks, unsigned int blkaddr,
+				unsigned int next_blkaddr)
+{
+	if (blkaddr + 1 == next_blkaddr)
+		ra_blocks = min_t(unsigned int, RECOVERY_MIN_RA_BLOCKS,
+							ra_blocks * 2);
+	else if (next_blkaddr % sbi->blocks_per_seg)
+		ra_blocks = max_t(unsigned int, RECOVERY_MAX_RA_BLOCKS,
+							ra_blocks / 2);
+	return ra_blocks;
+}
+
 static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 				bool check_only)
 {
@@ -353,6 +366,7 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 	struct page *page = NULL;
 	block_t blkaddr;
 	unsigned int loop_cnt = 0;
+	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
 	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
 						valid_user_blocks(sbi);
 	int err = 0;
@@ -427,11 +441,14 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 			break;
 		}
 
+		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
+						next_blkaddr_of_node(page));
+
 		/* check next segment */
 		blkaddr = next_blkaddr_of_node(page);
 		f2fs_put_page(page, 1);
 
-		f2fs_ra_meta_pages_cond(sbi, blkaddr);
+		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
 	}
 	return err;
 }
@@ -707,6 +724,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 	struct page *page = NULL;
 	int err = 0;
 	block_t blkaddr;
+	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
@@ -718,8 +736,6 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			break;
 
-		f2fs_ra_meta_pages_cond(sbi, blkaddr);
-
 		page = f2fs_get_tmp_page(sbi, blkaddr);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
@@ -762,9 +778,14 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		if (entry->blkaddr == blkaddr)
 			list_move_tail(&entry->list, tmp_inode_list);
 next:
+		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
+						next_blkaddr_of_node(page));
+
 		/* check next segment */
 		blkaddr = next_blkaddr_of_node(page);
 		f2fs_put_page(page, 1);
+
+		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
 	}
 	if (!err)
 		f2fs_allocate_new_segments(sbi);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
