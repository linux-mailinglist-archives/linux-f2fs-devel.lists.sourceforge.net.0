Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02C403AD2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Sep 2021 15:40:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mNxnt-0003Cj-T8; Wed, 08 Sep 2021 13:39:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fengnanchang@gmail.com>) id 1mNxnr-0003Cc-7e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 13:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3JzmC1iMbtJ8lKa+5/HQetLUROz4VpZNIg4UQOjFiNo=; b=CxRPwB6rQrfmO5svd8QaVSB3Gw
 dbeM0RaYkU/yu7b4OhwmejOnWYDzbvIyezRcAN0DNJNfdE7AFw/qs/sFTsbBDS4BzAp+1uNUls8ME
 HZAAZ1QyYOOcNApTmv74p0ociu4VCoofWyRSzPjaXi+iwuNGIr6nVrKM0skA5fnCSaCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3JzmC1iMbtJ8lKa+5/HQetLUROz4VpZNIg4UQOjFiNo=; b=D
 9GMQw8IR3iPyJjTaq8aaAWLczg6hgg4jPFUtIW+ji/N+yYuN4RdbY/EiQhKT+1Xcju4M6k9Gwepdr
 nGn6qW0qo3QstDDrVQ2zC/+n4MSVU4ZD1dDlQlHDZMIudwz1sZOl5J5MP3xCQY4amkNPHBKsIMONM
 pOj9kNXXg3LfgWxs=;
Received: from mail-pf1-f173.google.com ([209.85.210.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mNxno-0001dx-W9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Sep 2021 13:39:51 +0000
Received: by mail-pf1-f173.google.com with SMTP id q22so2133756pfu.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Sep 2021 06:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3JzmC1iMbtJ8lKa+5/HQetLUROz4VpZNIg4UQOjFiNo=;
 b=WRPmSrXc3HbhLgSZgXLgpwKOgQCEiND/dUGHI5GfOTKd47PTNF7KMDlGoptss8dDXO
 lTdpdUq80d0IcvWVvzdx5HOLepmSPZQ0AiDWeHuKBaigx94aLfAkF00ELMCAHH9fLss9
 I3LxjUbseTyfYspzcxh5fpFOjIhW9yz06mM08C7ycr4CQh040DkBg+tw+AuifpSOEqh0
 m4t/zLFPGcI7F42V4TDYVKV5NPeRrkEpO2+0v+vLOeoWJPOFaCdghaiH+4HarfCOAZ19
 N7i/EWCSSzQRCgJ/8hL+XQ8J0nYui9Gk85eVTJIIsUKX86XWne97fWD/jEiMO46oMLD7
 T2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3JzmC1iMbtJ8lKa+5/HQetLUROz4VpZNIg4UQOjFiNo=;
 b=ibfKvqajHMHlptjy+uoGYOUTOe3hS3qFqglgF6U7XJvd/JB60Hbnm/OcB2aWL0LVI3
 3j+TE5lHC38MBGHXAWFG8ZaTLXWtnCPEqOfVQPgJVJqPrXoq7UUbiTBw3sPt/4lD3174
 TSsi1tVTW267t/J7zcubY8DHnW8WTHfMSOoLT55LUP1/L7oEjZprdn/pRPShNh6l1JTJ
 uI7zDuA0UFWShjgp/ZsLcZRKPC/EjKFurZgJk8BsZy3cRI9M9J6ltF3KzHfGKchYSLZv
 V/pt7I6qOQWAfQkoxK2XA75Yk/jqSodQ2dEV8LOCAiSyKAvro5A7Xkt0UkRlUSEMAqWh
 lW7A==
X-Gm-Message-State: AOAM532eBcD/lovVLtLt2yxpz2nssy+E4BC7vwtAT0vzfI8EeYyoo4uL
 mohlEBoNFvXSkGKQI5K+iPk=
X-Google-Smtp-Source: ABdhPJyifvZm/59bbPXd46+/3fkBCDHiNTzAvB30Pcby0oNJ2s2z/eOHxF7gMd4w8Q+vkkHt80CjMA==
X-Received: by 2002:a62:6103:0:b0:405:2c7a:9ee9 with SMTP id
 v3-20020a626103000000b004052c7a9ee9mr3891692pfb.71.1631108383310; 
 Wed, 08 Sep 2021 06:39:43 -0700 (PDT)
Received: from localhost.localdomain (061239141224.ctinets.com.
 [61.239.141.224])
 by smtp.googlemail.com with ESMTPSA id u24sm2565487pfm.85.2021.09.08.06.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 06:39:42 -0700 (PDT)
From: Fengnan Chang <fengnanchang@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  8 Sep 2021 21:39:23 +0800
Message-Id: <20210908133923.12836-1-fengnanchang@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.173 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (fengnanchang[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.173 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1mNxno-0001dx-W9
Subject: [f2fs-dev] [PATCH] f2fs: improve block allocation statistics
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Fengnan Chang <changfengnan@vivo.com>

improve block allocation statistics:
1. fix missing inplace count in overwrite with direct io.
2. separate buffer and direct io.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c    | 17 ++++++++++++-----
 fs/f2fs/debug.c   | 24 +++++++++++++++---------
 fs/f2fs/f2fs.h    | 35 ++++++++++++++++++++++++++---------
 fs/f2fs/gc.c      |  2 +-
 fs/f2fs/segment.c |  8 ++++----
 5 files changed, 58 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 41d29382eced..c563004b643e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1342,7 +1342,7 @@ struct page *f2fs_get_new_data_page(struct inode *inode,
 	return page;
 }
 
-static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
+static int __allocate_data_block(struct dnode_of_data *dn, int seg_type, bool direct_io)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	struct f2fs_summary sum;
@@ -1369,7 +1369,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
-				&sum, seg_type, NULL);
+				&sum, seg_type, NULL, direct_io);
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
@@ -1491,6 +1491,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (flag == F2FS_GET_BLOCK_DIO)
 			f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
+		if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_add_inplace_blocks(sbi, map->m_len, true);
 		goto out;
 	}
 
@@ -1548,12 +1551,14 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		/* use out-place-update for driect IO under LFS mode */
 		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
 							map->m_may_create) {
-			err = __allocate_data_block(&dn, map->m_seg_type);
+			err = __allocate_data_block(&dn, map->m_seg_type, true);
 			if (err)
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
 			set_inode_flag(inode, FI_APPEND_WRITE);
-		}
+		} else if (!create && !f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_inc_inplace_blocks(sbi, true);
 	} else {
 		if (create) {
 			if (unlikely(f2fs_cp_error(sbi))) {
@@ -1569,7 +1574,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				WARN_ON(flag != F2FS_GET_BLOCK_PRE_DIO &&
 					flag != F2FS_GET_BLOCK_DIO);
 				err = __allocate_data_block(&dn,
-							map->m_seg_type);
+					map->m_seg_type,
+					flag == F2FS_GET_BLOCK_PRE_DIO ||
+					flag == F2FS_GET_BLOCK_DIO);
 				if (!err)
 					set_inode_flag(inode, FI_APPEND_WRITE);
 			}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 8c50518475a9..e1aa843b067c 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -64,7 +64,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
-	int i;
+	int i, j;
 
 	/* these will be changed if online resize is done */
 	si->main_area_segs = le32_to_cpu(raw_super->segment_count_main);
@@ -210,10 +210,12 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 
 	for (i = 0; i < 2; i++) {
 		si->segment_count[i] = sbi->segment_count[i];
-		si->block_count[i] = sbi->block_count[i];
+		for (j = 0; j < 2; j++)
+			si->block_count[i][j] = sbi->block_count[i][j];
 	}
 
-	si->inplace_count = atomic_read(&sbi->inplace_count);
+	for (i = 0; i < 2; i++)
+		si->inplace_count[i] = atomic_read(&sbi->inplace_count[i]);
 }
 
 /*
@@ -551,11 +553,14 @@ static int stat_show(struct seq_file *s, void *v)
 		for (j = 0; j < si->util_free; j++)
 			seq_putc(s, '-');
 		seq_puts(s, "]\n\n");
-		seq_printf(s, "IPU: %u blocks\n", si->inplace_count);
-		seq_printf(s, "SSR: %u blocks in %u segments\n",
-			   si->block_count[SSR], si->segment_count[SSR]);
-		seq_printf(s, "LFS: %u blocks in %u segments\n",
-			   si->block_count[LFS], si->segment_count[LFS]);
+
+		seq_printf(s, "       %10s %10s %10s\n", "buffer", "direct", "segments");
+		seq_printf(s,   "IPU:   %10d %10d        N/A\n", si->inplace_count[1],
+				si->inplace_count[0]);
+		seq_printf(s,   "SSR:   %10d %10d %10d\n", si->block_count[1][SSR],
+				si->block_count[0][SSR], si->segment_count[SSR]);
+		seq_printf(s,   "LFS:   %10d %10d %10d\n", si->block_count[1][LFS],
+				si->block_count[0][LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
 		f2fs_update_sit_info(si->sbi);
@@ -611,7 +616,8 @@ int f2fs_build_stats(struct f2fs_sb_info *sbi)
 	atomic_set(&sbi->inline_dir, 0);
 	atomic_set(&sbi->compr_inode, 0);
 	atomic64_set(&sbi->compr_blocks, 0);
-	atomic_set(&sbi->inplace_count, 0);
+	for (i = 0; i < 2; i++)
+		atomic_set(&sbi->inplace_count[i], 0);
 	for (i = META_CP; i < META_MAX; i++)
 		atomic_set(&sbi->meta_count[i], 0);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c24f03e054cb..c83c998fe19c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1693,8 +1693,8 @@ struct f2fs_sb_info {
 	struct f2fs_stat_info *stat_info;	/* FS status information */
 	atomic_t meta_count[META_MAX];		/* # of meta blocks */
 	unsigned int segment_count[2];		/* # of allocated segments */
-	unsigned int block_count[2];		/* # of allocated blocks */
-	atomic_t inplace_count;		/* # of inplace update */
+	unsigned int block_count[2][2];		/* # of allocated blocks */
+	atomic_t inplace_count[2];		/* # of inplace update */
 	atomic64_t total_hit_ext;		/* # of lookup extent cache */
 	atomic64_t read_hit_rbtree;		/* # of hit rbtree extent node */
 	atomic64_t read_hit_largest;		/* # of hit largest extent node */
@@ -3492,7 +3492,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
-			struct f2fs_io_info *fio);
+			struct f2fs_io_info *fio, bool direct_io);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered, bool locked);
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
@@ -3700,8 +3700,8 @@ struct f2fs_stat_info {
 
 	unsigned int meta_count[META_MAX];
 	unsigned int segment_count[2];
-	unsigned int block_count[2];
-	unsigned int inplace_count;
+	unsigned int block_count[2][2];
+	unsigned int inplace_count[2];
 	unsigned long long base_mem, cache_mem, page_mem;
 };
 
@@ -3779,10 +3779,27 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 	} while (0)
 #define stat_inc_seg_type(sbi, curseg)					\
 		((sbi)->segment_count[(curseg)->alloc_type]++)
-#define stat_inc_block_count(sbi, curseg)				\
-		((sbi)->block_count[(curseg)->alloc_type]++)
-#define stat_inc_inplace_blocks(sbi)					\
-		(atomic_inc(&(sbi)->inplace_count))
+#define stat_inc_block_count(sbi, curseg, direct_io)			\
+	do {								\
+		if (direct_io)						\
+			((sbi)->block_count[0][(curseg)->alloc_type]++);	\
+		else								\
+			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
+	} while (0)
+#define stat_inc_inplace_blocks(sbi, direct_io)					\
+	do {								\
+		if (direct_io)						\
+			(atomic_inc(&(sbi)->inplace_count[0]));		\
+		else								\
+			(atomic_inc(&(sbi)->inplace_count[1]));		\
+	} while (0)
+#define stat_add_inplace_blocks(sbi, count, direct_io)			\
+	do {								\
+		if (direct_io)						\
+			(atomic_add(count, &(sbi)->inplace_count[0]));  \
+		else								\
+			(atomic_add(count, &(sbi)->inplace_count[1]));	\
+	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
 		int cur = F2FS_I_SB(inode)->atomic_files;	\
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 77391e3b7d68..7c47082f73cc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1247,7 +1247,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 
 	/* allocate block address */
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
-				&sum, type, NULL);
+				&sum, type, NULL, false);
 
 	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
 				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a135d2247415..ded744e880d0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3391,7 +3391,7 @@ static int __get_segment_type(struct f2fs_io_info *fio)
 void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 		block_t old_blkaddr, block_t *new_blkaddr,
 		struct f2fs_summary *sum, int type,
-		struct f2fs_io_info *fio)
+		struct f2fs_io_info *fio, bool direct_io)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
@@ -3425,7 +3425,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 
 	__refresh_next_blkoff(sbi, curseg);
 
-	stat_inc_block_count(sbi, curseg);
+	stat_inc_block_count(sbi, curseg, direct_io);
 
 	if (from_gc) {
 		old_mtime = get_segment_mtime(sbi, old_blkaddr);
@@ -3515,7 +3515,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		down_read(&fio->sbi->io_order_lock);
 reallocate:
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
-			&fio->new_blkaddr, sum, type, fio);
+			&fio->new_blkaddr, sum, type, fio, false);
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO) {
 		invalidate_mapping_pages(META_MAPPING(fio->sbi),
 					fio->old_blkaddr, fio->old_blkaddr);
@@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi);
+	stat_inc_inplace_blocks(fio->sbi, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
