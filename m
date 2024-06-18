Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 439E990C443
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2024 09:26:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sJTEp-0008D9-Tm;
	Tue, 18 Jun 2024 07:26:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sJTEn-0008D3-ON
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 07:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vJa2e1iCjlK4yMFTDHNPxVwcdClaye4AD268smSkez0=; b=bJi3BJH043rY8IQ8UUwFQ2lI9t
 eSDZFLQC6Cev08EDg2yuWaraCVqkZGyYS9SFvG/KKQ1BrF6Xh+Dkh12WAYIFKByqyITXG5pfQ9EpJ
 XNJY1DcgDWLVHp3h8OH32uIuhl0k6LluOAd52R042T8Q355iZ/0LlYyKDFlydW3xSIOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vJa2e1iCjlK4yMFTDHNPxVwcdClaye4AD268smSkez0=; b=h
 bJHEBOhr11BgT8ZLDTdX2YXj85Owwd0KJwvpKfDmTDLjGRPRmkYCLmPghWOCm95U1qlS0o7DltI2Q
 bK/rf+9MYvy4SOKCBOoY5iSjIVN06FaL4LuSlxPYhtkC5Zi0rZWZa6RwjDy21qNRTgUWWZhGQ0GD9
 cX0pcdFrhbdN1jjQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sJTEn-0004eF-PM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Jun 2024 07:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A4A8061705;
 Tue, 18 Jun 2024 07:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF46EC4AF1D;
 Tue, 18 Jun 2024 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718695590;
 bh=KONhJvRsGKe9Je25O438ETYA1LD2QrAImWkgO4iDTkE=;
 h=From:To:Cc:Subject:Date:From;
 b=X8HBx8AaJTixloScUfXKYiN8u5tzU+rzS9gH2zqvDNRSnKD0VfCmNk09o3JMVKHUm
 UR4J8B5JP+5pnGNQxLsLuqDgtMQvBDDRa/GUScgLMvVOAZb/m3d4j3vOsBiRY23eqh
 qrqM/Y5EUdgyLpkiBe+TN6XkZMJgeBA4fBD8FN0e87b7II7yAMaSBdq78Ivl/5jKvv
 qWRUV+5BbZOBp7bAM7XZYZD4GZKnuPv7guKz5kOq8wUj8f9rPbB8galgaf/boDtaDJ
 TBIPPmRDcpmxsaVthDN3dw4BWkb3mXqxq7Xd+ZXJKx2fQdIKAY7ovGQfb/HKZ59z/J
 VFXVhxkpwhP/g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 18 Jun 2024 15:26:20 +0800
Message-Id: <20240618072620.720535-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert to use folio and related functionality. Cc: Matthew
 Wilcox <willy@infradead.org> Signed-off-by: Chao Yu <chao@kernel.org> ---
 - support large folio - use bd_mapping instead of bd_inode->i_mapping
 fs/f2fs/data.c | 1 - fs/f2fs/f2fs.h | 11 +++ [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJTEn-0004eF-PM
Subject: [f2fs-dev] [PATCH v3] f2fs: get rid of buffer_head use
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

Convert to use folio and related functionality.

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
- support large folio
- use bd_mapping instead of bd_inode->i_mapping
 fs/f2fs/data.c  |  1 -
 fs/f2fs/f2fs.h  | 11 +++++-
 fs/f2fs/file.c  |  1 -
 fs/f2fs/inode.c |  1 -
 fs/f2fs/super.c | 93 +++++++++++++++++++++++++++++--------------------
 5 files changed, 66 insertions(+), 41 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b6dcb3bcaef7..0b4f563f2361 100644
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
index f7ee6c5e371e..777497919c62 100644
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
@@ -1990,6 +1989,16 @@ static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
 	return (struct f2fs_super_block *)(sbi->raw_super);
 }
 
+static inline struct f2fs_super_block *F2FS_SUPER_BLOCK(struct folio *folio,
+								pgoff_t index)
+{
+	pgoff_t idx_in_folio = index % (1 << folio_order(folio));
+
+	return (struct f2fs_super_block *)
+		(page_address(folio_page(folio, idx_in_folio)) +
+						F2FS_SUPER_OFFSET);
+}
+
 static inline struct f2fs_checkpoint *F2FS_CKPT(struct f2fs_sb_info *sbi)
 {
 	return (struct f2fs_checkpoint *)(sbi->ckpt);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e4a7cff00796..7508c744c157 100644
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
index 4a1bc8f40f9a..c664db2b2a5e 100644
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
@@ -3333,24 +3332,42 @@ loff_t max_file_blocks(struct inode *inode)
 	return result;
 }
 
-static int __f2fs_commit_super(struct buffer_head *bh,
-			struct f2fs_super_block *super)
+static int __f2fs_commit_super(struct f2fs_sb_info *sbi, struct folio *folio,
+						pgoff_t index, bool update)
 {
-	lock_buffer(bh);
-	if (super)
-		memcpy(bh->b_data + F2FS_SUPER_OFFSET, super, sizeof(*super));
-	set_buffer_dirty(bh);
-	unlock_buffer(bh);
-
+	struct bio *bio;
 	/* it's rare case, we can do fua all the time */
-	return __sync_dirty_buffer(bh, REQ_SYNC | REQ_PREFLUSH | REQ_FUA);
+	blk_opf_t opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH | REQ_FUA;
+	int ret;
+
+	folio_lock(folio);
+	folio_wait_writeback(folio);
+	if (update)
+		memcpy(F2FS_SUPER_BLOCK(folio, index), F2FS_RAW_SUPER(sbi),
+					sizeof(struct f2fs_super_block));
+	folio_mark_dirty(folio);
+	folio_clear_dirty_for_io(folio);
+	folio_start_writeback(folio);
+	folio_unlock(folio);
+
+	bio = bio_alloc(sbi->sb->s_bdev, 1, opf, GFP_NOFS);
+
+	/* it doesn't need to set crypto context for superblock update */
+	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(folio_index(folio));
+
+	if (!bio_add_folio(bio, folio, folio_size(folio), 0))
+		f2fs_bug_on(sbi, 1);
+
+	ret = submit_bio_wait(bio);
+	folio_end_writeback(folio);
+
+	return ret;
 }
 
 static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
-					struct buffer_head *bh)
+					struct folio *folio, pgoff_t index)
 {
-	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
-					(bh->b_data + F2FS_SUPER_OFFSET);
+	struct f2fs_super_block *raw_super = F2FS_SUPER_BLOCK(folio, index);
 	struct super_block *sb = sbi->sb;
 	u32 segment0_blkaddr = le32_to_cpu(raw_super->segment0_blkaddr);
 	u32 cp_blkaddr = le32_to_cpu(raw_super->cp_blkaddr);
@@ -3425,7 +3442,7 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 			set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 			res = "internally";
 		} else {
-			err = __f2fs_commit_super(bh, NULL);
+			err = __f2fs_commit_super(sbi, folio, index, false);
 			res = err ? "failed" : "done";
 		}
 		f2fs_info(sbi, "Fix alignment : %s, start(%u) end(%llu) block(%u)",
@@ -3438,12 +3455,11 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 }
 
 static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
-				struct buffer_head *bh)
+					struct folio *folio, pgoff_t index)
 {
 	block_t segment_count, segs_per_sec, secs_per_zone, segment_count_main;
 	block_t total_sections, blocks_per_seg;
-	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
-					(bh->b_data + F2FS_SUPER_OFFSET);
+	struct f2fs_super_block *raw_super = F2FS_SUPER_BLOCK(folio, index);
 	size_t crc_offset = 0;
 	__u32 crc = 0;
 
@@ -3601,7 +3617,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 
 	/* check CP/SIT/NAT/SSA/MAIN_AREA area boundary */
-	if (sanity_check_area_boundary(sbi, bh))
+	if (sanity_check_area_boundary(sbi, folio, index))
 		return -EFSCORRUPTED;
 
 	return 0;
@@ -3948,7 +3964,7 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 {
 	struct super_block *sb = sbi->sb;
 	int block;
-	struct buffer_head *bh;
+	struct folio *folio;
 	struct f2fs_super_block *super;
 	int err = 0;
 
@@ -3957,32 +3973,32 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 		return -ENOMEM;
 
 	for (block = 0; block < 2; block++) {
-		bh = sb_bread(sb, block);
-		if (!bh) {
+		folio = read_mapping_folio(sb->s_bdev->bd_mapping, block, NULL);
+		if (IS_ERR(folio)) {
 			f2fs_err(sbi, "Unable to read %dth superblock",
 				 block + 1);
-			err = -EIO;
+			err = PTR_ERR(folio);
 			*recovery = 1;
 			continue;
 		}
 
 		/* sanity checking of raw super */
-		err = sanity_check_raw_super(sbi, bh);
+		err = sanity_check_raw_super(sbi, folio, block);
 		if (err) {
 			f2fs_err(sbi, "Can't find valid F2FS filesystem in %dth superblock",
 				 block + 1);
-			brelse(bh);
+			folio_put(folio);
 			*recovery = 1;
 			continue;
 		}
 
 		if (!*raw_super) {
-			memcpy(super, bh->b_data + F2FS_SUPER_OFFSET,
+			memcpy(super, F2FS_SUPER_BLOCK(folio, block),
 							sizeof(*super));
 			*valid_super_block = block;
 			*raw_super = super;
 		}
-		brelse(bh);
+		folio_put(folio);
 	}
 
 	/* No valid superblock */
@@ -3996,7 +4012,8 @@ static int read_raw_super_block(struct f2fs_sb_info *sbi,
 
 int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 {
-	struct buffer_head *bh;
+	struct folio *folio;
+	pgoff_t index;
 	__u32 crc = 0;
 	int err;
 
@@ -4014,22 +4031,24 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
 	}
 
 	/* write back-up superblock first */
-	bh = sb_bread(sbi->sb, sbi->valid_super_block ? 0 : 1);
-	if (!bh)
-		return -EIO;
-	err = __f2fs_commit_super(bh, F2FS_RAW_SUPER(sbi));
-	brelse(bh);
+	index = sbi->valid_super_block ? 0 : 1;
+	folio = read_mapping_folio(sbi->sb->s_bdev->bd_mapping, index, NULL);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
+	err = __f2fs_commit_super(sbi, folio, index, true);
+	folio_put(folio);
 
 	/* if we are in recovery path, skip writing valid superblock */
 	if (recover || err)
 		return err;
 
 	/* write current valid superblock */
-	bh = sb_bread(sbi->sb, sbi->valid_super_block);
-	if (!bh)
-		return -EIO;
-	err = __f2fs_commit_super(bh, F2FS_RAW_SUPER(sbi));
-	brelse(bh);
+	index = sbi->valid_super_block;
+	folio = read_mapping_folio(sbi->sb->s_bdev->bd_mapping, index, NULL);
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
+	err = __f2fs_commit_super(sbi, folio, index, true);
+	folio_put(folio);
 	return err;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
