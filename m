Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6F8FE369
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2024 11:51:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sF9lq-0007sb-8Z;
	Thu, 06 Jun 2024 09:50:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sF9lo-0007sP-3j
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 09:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SFgmE/5iIZEryus4jcGS0bM7oDW7Q2T9OPQ14anUbgs=; b=NirKheJfc7FRQfIB5/xMFQ9vaE
 T/0tsZMwarpw6IotvlXbDHgODGxqCS8Ejf+b4xDgsI9F0kw6+aFPZFwprTUCKu/nyejdLN3MFoBpl
 V1Vh/Y9dBBzxBm9h4Eqe8i8eac+2X2+ZVhqId5APR8hGrwbkuocD1hx4vwbhVRXMBph0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SFgmE/5iIZEryus4jcGS0bM7oDW7Q2T9OPQ14anUbgs=; b=V
 Zk3nJqDzyUO+KpzsaseYe9XXDeceXxs4kxN6IulzYXw3BebdiZLHuCrk9UwCg2fZUf5NGxp1kJ7cg
 EcJxjHe+GSqTTQoT9ogWJ6VzqPOu0RddL7CFrhOCw2lyLOCcQXrrIasz+eTqoYrDMKtqBo0yhl1hS
 PWvwe0L/RrW/oqMY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sF9ln-0004Fr-EC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Jun 2024 09:50:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3864B61A27;
 Thu,  6 Jun 2024 09:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88755C4AF10;
 Thu,  6 Jun 2024 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717667443;
 bh=vDQ3PStLIYhurpJfOiarmGGp2OrAZI9nxuIm6i+FjVY=;
 h=From:To:Cc:Subject:Date:From;
 b=CYWhVL9sZXFjZbArdYnCVrWQcbpkgfn/D8ZaLF65iMp9YKKCDYFxPFKQ1UqSoqTe9
 X1YdaF29LohXn7daDhpV6jASPTVHnSdwnkKT7y9t1L3q0Swg14wkbZVoIliygwL6Rk
 75A8WNwrYh7A8VYJvsW+RSTr0mLj1PXwQOSJZrutxxyOqfmGueH/TUIM9YU+93yj4k
 fncVWGSFGkWQRvTu7pZv76H1fY9NE7k8HKumckTvnNZQdi2BpVtqwAi9OX1Kz9hA1Q
 IR8xLIDLFMrCk4rRBXvb1LKeefVoO9GLTOevq4XcVLWI9ZD4swe6ng6/U47oJdxVG5
 yg455KSEYraUw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu,  6 Jun 2024 17:50:37 +0800
Message-Id: <20240606095037.4086881-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: For later folio conversion. Cc: Matthew Wilcox
 <willy@infradead.org>
 Signed-off-by: Chao Yu <chao@kernel.org> --- v1: - I checked recovery flow
 of superblock w/ below testcase,
 it passes. 1. mkfs.f2fs /dev/vdd 2. dd if=/dev/zero [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sF9ln-0004Fr-EC
Subject: [f2fs-dev] [PATCH] f2fs: get rid of buffer_head use
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For later folio conversion.

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v1:
- I checked recovery flow of superblock w/ below testcase, it passes.
1. mkfs.f2fs /dev/vdd
2. dd if=/dev/zero of=/dev/vdd bs=4k count=1
3. mount /dev/vdd /mnt/f2fs
4. umount /mnt/f2fs
5. dd if=/dev/zero of=/dev/vdd bs=4k count=1 seek=1
6. mount /dev/vdd /mnt/f2fs
7. umount /mnt/f2fs

 fs/f2fs/data.c  |  1 -
 fs/f2fs/f2fs.h  |  1 -
 fs/f2fs/file.c  |  1 -
 fs/f2fs/inode.c |  1 -
 fs/f2fs/super.c | 95 ++++++++++++++++++++++++++++++-------------------
 5 files changed, 58 insertions(+), 41 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b9b0debc6b3d..ad495ea87b32 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -7,7 +7,6 @@
  */
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
-#include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
 #include <linux/mpage.h>
 #include <linux/writeback.h>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9688df332147..5ed6b689f6b3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -11,7 +11,6 @@
 #include <linux/uio.h>
 #include <linux/types.h>
 #include <linux/page-flags.h>
-#include <linux/buffer_head.h>
 #include <linux/slab.h>
 #include <linux/crc32.h>
 #include <linux/magic.h>
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c50213da474d..efc676bc7800 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -8,7 +8,6 @@
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/stat.h>
-#include <linux/buffer_head.h>
 #include <linux/writeback.h>
 #include <linux/blkdev.h>
 #include <linux/falloc.h>
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index dbfebbddf675..87982e06bbe7 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -7,7 +7,6 @@
  */
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
-#include <linux/buffer_head.h>
 #include <linux/writeback.h>
 #include <linux/sched/mm.h>
 #include <linux/lz4.h>
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4a1bc8f40f9a..e67f0ac78c00 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -11,7 +11,6 @@
 #include <linux/fs_context.h>
 #include <linux/sched/mm.h>
 #include <linux/statfs.h>
-#include <linux/buffer_head.h>
 #include <linux/kthread.h>
 #include <linux/parser.h>
 #include <linux/mount.h>
@@ -3333,24 +3332,45 @@ loff_t max_file_blocks(struct inode *inode)
 	return result;
 }
 
-static int __f2fs_commit_super(struct buffer_head *bh,
-			struct f2fs_super_block *super)
+static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct page *page,
+								bool update)
 {
-	lock_buffer(bh);
-	if (super)
-		memcpy(bh->b_data + F2FS_SUPER_OFFSET, super, sizeof(*super));
-	set_buffer_dirty(bh);
-	unlock_buffer(bh);
-
+	struct f2fs_super_block *super;
+	struct bio *bio;
 	/* it's rare case, we can do fua all the time */
-	return __sync_dirty_buffer(bh, REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
+	blk_opf_t opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH | REQ_FUA;
+	int ret;
+
+	lock_page(page);
+	if (update) {
+		super = F2FS_RAW_SUPER(sbi);
+		memcpy(page_address(page) + F2FS_SUPER_OFFSET,
+						super, sizeof(*super));
+	}
+	set_page_dirty(page);
+	clear_page_dirty_for_io(page);
+	set_page_writeback(page);
+	unlock_page(page);
+
+	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
+
+	/* it doesn't need to set crypto context for superblock update */
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(page->index);
+
+	if (bio_add_page(bio, page, PAGE_SIZE, 0) != PAGE_SIZE)
+		f2fs_bug_on(sbi, 1);
+
+	ret = submit_bio_wait(bio);
+	end_page_writeback(page);
+
+	return ret;
 }
 
 static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
-					struct buffer_head *bh)
+							struct page *page)
 {
 	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
-					(bh->b_data + F2FS_SUPER_OFFSET);
+				(page_address(page) + F2FS_SUPER_OFFSET);
 	struct super_block *sb = sbi->sb;
 	u32 segment0_blkaddr = le32_to_cpu(raw_super->segment0_blkaddr);
 	u32 cp_blkaddr = le32_to_cpu(raw_super->cp_blkaddr);
@@ -3425,7 +3445,7 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 			set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 			res = "internally";
 		} else {
-			err = __f2fs_commit_super(bh, NULL);
+			err = __f2fs_commit_super(sbi, page, false);
 			res = err ? "failed" : "done";
 		}
 		f2fs_info(sbi, "Fix alignment : %s, start(%u) end(%llu) block(%u)",
@@ -3437,13 +3457,12 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 	return false;
 }
 
-static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
-				struct buffer_head *bh)
+static int sanity_check_raw_super(struct f2fs_sb_info *sbi, struct page *page)
 {
 	block_t segment_count, segs_per_sec, secs_per_zone, segment_count_main;
 	block_t total_sections, blocks_per_seg;
 	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
-					(bh->b_data + F2FS_SUPER_OFFSET);
+				(page_address(page) + F2FS_SUPER_OFFSET);
 	size_t crc_offset = 0;
 	__u32 crc = 0;
 
@@ -3601,7 +3620,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 
 	/* check CP/SIT/NAT/SSA/MAIN_AREA area boundary */
-	if (sanity_check_area_boundary(sbi, bh))
+	if (sanity_check_area_boundary(sbi, page))
 		return -EFSCORRUPTED;
 
 	return 0;
@@ -3948,7 +3967,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 {
 	struct super_block *sb = sbi->sb;
 	int block;
-	struct buffer_head *bh;
+	struct page *page;
 	struct f2fs_super_block *super;
 	int err = 0;
 
@@ -3957,32 +3976,32 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 		return -ENOMEM;
 
 	for (block = 0; block < 2; block++) {
-		bh = sb_bread(sb, block);
-		if (!bh) {
+		page = read_mapping_page(sb->s_bdev->bd_inode->i_mapping,
+								block, NULL);
+		if (IS_ERR(page)) {
 			f2fs_err(sbi, "Unable to read %dth superblock",
 				 block + 1);
-			err = -EIO;
+			err = PTR_ERR(page);
 			*recovery = 1;
-			continue;
 		}
 
 		/* sanity checking of raw super */
-		err = sanity_check_raw_super(sbi, bh);
+		err = sanity_check_raw_super(sbi, page);
 		if (err) {
 			f2fs_err(sbi, "Can't find valid F2FS filesystem in %dth superblock",
 				 block + 1);
-			brelse(bh);
+			put_page(page);
 			*recovery = 1;
 			continue;
 		}
 
 		if (!*raw_super) {
-			memcpy(super, bh->b_data + F2FS_SUPER_OFFSET,
+			memcpy(super, page_address(page) + F2FS_SUPER_OFFSET,
 							sizeof(*super));
 			*valid_super_block = block;
 			*raw_super = super;
 		}
-		brelse(bh);
+		put_page(page);
 	}
 
 	/* No valid superblock */
@@ -3996,7 +4015,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 {
-	struct buffer_head *bh;
+	struct page *page;
 	__u32 crc = 0;
 	int err;
 
@@ -4014,22 +4033,24 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	}
 
 	/* write back-up superblock first */
-	bh = sb_bread(sbi->sb, sbi->valid_super_block ? 0 : 1);
-	if (!bh)
-		return -EIO;
-	err = __f2fs_commit_super(bh, F2FS_RAW_SUPER(sbi));
-	brelse(bh);
+	page = read_mapping_page(sbi->sb->s_bdev->bd_inode->i_mapping,
+				sbi->valid_super_block ? 0 : 1, NULL);
+	if (IS_ERR(page))
+		return PTR_ERR(page);
+	err = __f2fs_commit_super(sbi, page, true);
+	put_page(page);
 
 	/* if we are in recovery path, skip writing valid superblock */
 	if (recover || err)
 		return err;
 
 	/* write current valid superblock */
-	bh = sb_bread(sbi->sb, sbi->valid_super_block);
-	if (!bh)
-		return -EIO;
-	err = __f2fs_commit_super(bh, F2FS_RAW_SUPER(sbi));
-	brelse(bh);
+	page = read_mapping_page(sbi->sb->s_bdev->bd_inode->i_mapping,
+					sbi->valid_super_block, NULL);
+	if (IS_ERR(page))
+		return PTR_ERR(page);
+	err = __f2fs_commit_super(sbi, page, true);
+	put_page(page);
 	return err;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
