Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4FC877DA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2Wb-0003sj-TD; Fri, 09 Aug 2019 10:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2Wa-0003sW-BW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WLMM6cZar9hVGvgbpCxh8MP0aESype36ix6OESeOilQ=; b=LujyBSVi0nizBdgrVNSBfapXO2
 UVs2X1LaHMZ6MCQ0WlsCNsc4CS+y45JMTAyL/CTsaNMlVyeuuUH5Y4Hk/xI9LcYOrf2xewoMxaCkJ
 Yr3qZGC67wiYztXsBMsA17myO7TSzbRvVsLkawPJqciIuHQi5dPygCHsGYi140mhQxLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WLMM6cZar9hVGvgbpCxh8MP0aESype36ix6OESeOilQ=; b=JwVo1eRG16uBNohb8qQF+0fd6D
 SisiCI60kj91N+U0shjNDo5BVd571DXkvAdQwMF4bHYRoOhB8AbpM8Dwar+Ceo9pnHL1rjYqu7Ajz
 EUmrmyrMNtoxYH55txSZjnXMURqzPfzhYwR2E1R7ENs4d7V59HyyKgx01BUAMjYspyBU=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WY-00HEfB-Nw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:32 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CA631F145F89E12E6756;
 Fri,  9 Aug 2019 18:53:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:52:57 +0800
Message-ID: <20190809105302.79876-5-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190809105302.79876-1-yuchao0@huawei.com>
References: <20190809105302.79876-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hw2WY-00HEfB-Nw
Subject: [f2fs-dev] [PATCH 05/10] f2fs-tools: introduce f2fs_ra_meta_pages()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce f2fs_ra_meta_pages() to readahead meta pages like we did
in kernel.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/f2fs.h       |  28 +++++++++++
 fsck/fsck.c       |   2 +
 fsck/fsck.h       |   1 +
 fsck/mount.c      | 119 ++++++++++++++++++++++++++++++++++++++++++----
 include/f2fs_fs.h |   5 ++
 5 files changed, 147 insertions(+), 8 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 6fc0bf3..52b81ff 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -37,6 +37,20 @@ struct list_head {
 	struct list_head *next, *prev;
 };
 
+/*
+ * indicate meta/data type
+ */
+enum {
+	META_CP,
+	META_NAT,
+	META_SIT,
+	META_SSA,
+	META_MAX,
+	META_POR,
+};
+
+#define MAX_RA_BLOCKS	64
+
 enum {
 	NAT_BITMAP,
 	SIT_BITMAP
@@ -329,6 +343,13 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 	((t == CURSEG_HOT_NODE) || (t == CURSEG_COLD_NODE) ||           \
 	 (t == CURSEG_WARM_NODE))
 
+#define MAIN_BLKADDR(sbi)						\
+	(SM_I(sbi) ? SM_I(sbi)->main_blkaddr :				\
+		le32_to_cpu(F2FS_RAW_SUPER(sbi)->main_blkaddr))
+#define SEG0_BLKADDR(sbi)						\
+	(SM_I(sbi) ? SM_I(sbi)->seg0_blkaddr :				\
+		le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment0_blkaddr))
+
 #define GET_SUM_BLKADDR(sbi, segno)					\
 	((sbi->sm_info->ssa_blkaddr) + segno)
 
@@ -345,9 +366,16 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
 #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
 
+#define MAIN_SEGS(sbi)	(SM_I(sbi)->main_segments)
+#define TOTAL_BLKS(sbi)	(TOTAL_SEGS(sbi) << (sbi)->log_blocks_per_seg)
+#define MAX_BLKADDR(sbi)	(SEG0_BLKADDR(sbi) + TOTAL_BLKS(sbi))
+
 #define START_BLOCK(sbi, segno)	(SM_I(sbi)->main_blkaddr +		\
 	((segno) << sbi->log_blocks_per_seg))
 
+#define SIT_BLK_CNT(sbi)						\
+	((MAIN_SEGS(sbi) + SIT_ENTRY_PER_BLOCK - 1) / SIT_ENTRY_PER_BLOCK)
+
 static inline struct curseg_info *CURSEG_I(struct f2fs_sb_info *sbi, int type)
 {
 	return (struct curseg_info *)(SM_I(sbi)->curseg_array + type);
diff --git a/fsck/fsck.c b/fsck/fsck.c
index e835a22..d53317c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1665,6 +1665,8 @@ int fsck_chk_orphan_node(struct f2fs_sb_info *sbi)
 	start_blk = __start_cp_addr(sbi) + 1 + get_sb(cp_payload);
 	orphan_blkaddr = __start_sum_addr(sbi) - 1 - get_sb(cp_payload);
 
+	f2fs_ra_meta_pages(sbi, start_blk, orphan_blkaddr, META_CP);
+
 	orphan_blk = calloc(BLOCK_SZ, 1);
 	ASSERT(orphan_blk);
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index aabe4a3..f7ddf50 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -180,6 +180,7 @@ extern int f2fs_set_sit_bitmap(struct f2fs_sb_info *, u32);
 extern void fsck_init(struct f2fs_sb_info *);
 extern int fsck_verify(struct f2fs_sb_info *);
 extern void fsck_free(struct f2fs_sb_info *);
+extern int f2fs_ra_meta_pages(struct f2fs_sb_info *, block_t, int, int);
 extern int f2fs_do_mount(struct f2fs_sb_info *);
 extern void f2fs_do_umount(struct f2fs_sb_info *);
 extern int f2fs_sparse_initialize_meta(struct f2fs_sb_info *);
diff --git a/fsck/mount.c b/fsck/mount.c
index eed27bf..46fe1be 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -473,6 +473,94 @@ void print_sb_state(struct f2fs_super_block *sb)
 	MSG(0, "\n");
 }
 
+bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
+					block_t blkaddr, int type)
+{
+	switch (type) {
+	case META_NAT:
+		break;
+	case META_SIT:
+		if (blkaddr >= SIT_BLK_CNT(sbi))
+			return 0;
+		break;
+	case META_SSA:
+		if (blkaddr >= MAIN_BLKADDR(sbi) ||
+			blkaddr < SM_I(sbi)->ssa_blkaddr)
+			return 0;
+		break;
+	case META_CP:
+		if (blkaddr >= SIT_I(sbi)->sit_base_addr ||
+			blkaddr < __start_cp_addr(sbi))
+			return 0;
+		break;
+	case META_POR:
+		if (blkaddr >= MAX_BLKADDR(sbi) ||
+			blkaddr < MAIN_BLKADDR(sbi))
+			return 0;
+		break;
+	default:
+		ASSERT(0);
+	}
+
+	return 1;
+}
+
+static inline block_t current_sit_addr(struct f2fs_sb_info *sbi,
+						unsigned int start);
+
+/*
+ * Readahead CP/NAT/SIT/SSA pages
+ */
+int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
+							int type)
+{
+	block_t blkno = start;
+	block_t blkaddr, start_blk = 0, len = 0;
+
+	for (; nrpages-- > 0; blkno++) {
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkno, type))
+			goto out;
+
+		switch (type) {
+		case META_NAT:
+			if (blkno >= NAT_BLOCK_OFFSET(NM_I(sbi)->max_nid))
+				blkno = 0;
+			/* get nat block addr */
+			blkaddr = current_nat_addr(sbi,
+					blkno * NAT_ENTRY_PER_BLOCK, NULL);
+			break;
+		case META_SIT:
+			/* get sit block addr */
+			blkaddr = current_sit_addr(sbi,
+					blkno * SIT_ENTRY_PER_BLOCK);
+			break;
+		case META_SSA:
+		case META_CP:
+		case META_POR:
+			blkaddr = blkno;
+			break;
+		default:
+			ASSERT(0);
+		}
+
+		if (!len) {
+			start_blk = blkaddr;
+			len = 1;
+		} else if (start_blk + len == blkaddr) {
+			len++;
+		} else {
+			dev_readahead(start_blk << F2FS_BLKSIZE_BITS,
+						len << F2FS_BLKSIZE_BITS);
+		}
+	}
+out:
+	if (len)
+		dev_readahead(start_blk << F2FS_BLKSIZE_BITS,
+					len << F2FS_BLKSIZE_BITS);
+	return blkno - start;
+}
+
 void update_superblock(struct f2fs_super_block *sb, int sb_mask)
 {
 	int addr, ret;
@@ -1133,6 +1221,9 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 	}
 
+	f2fs_ra_meta_pages(sbi, 0, NAT_BLOCK_OFFSET(nm_i->max_nid),
+							META_NAT);
+
 	for (nid = 0; nid < nm_i->max_nid; nid++) {
 		if (!(nid % NAT_ENTRY_PER_BLOCK)) {
 			int ret;
@@ -1983,7 +2074,9 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	struct f2fs_sit_block *sit_blk;
 	struct seg_entry *se;
 	struct f2fs_sit_entry sit;
-	unsigned int i, segno;
+	int sit_blk_cnt = SIT_BLK_CNT(sbi);
+	unsigned int i, segno, end;
+	unsigned int readed, start_blk = 0;
 
 	sit_blk = calloc(BLOCK_SZ, 1);
 	if (!sit_blk) {
@@ -1991,15 +2084,25 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 	}
 
-	for (segno = 0; segno < TOTAL_SEGS(sbi); segno++) {
-		se = &sit_i->sentries[segno];
+	do {
+		readed = f2fs_ra_meta_pages(sbi, start_blk, MAX_RA_BLOCKS,
+								META_SIT);
 
-		get_current_sit_page(sbi, segno, sit_blk);
-		sit = sit_blk->entries[SIT_ENTRY_OFFSET(sit_i, segno)];
+		segno = start_blk * sit_i->sents_per_block;
+		end = (start_blk + readed) * sit_i->sents_per_block;
+
+		for (; segno < end && segno < TOTAL_SEGS(sbi); segno++) {
+			se = &sit_i->sentries[segno];
+
+			get_current_sit_page(sbi, segno, sit_blk);
+			sit = sit_blk->entries[SIT_ENTRY_OFFSET(sit_i, segno)];
+
+			check_block_count(sbi, segno, &sit);
+			seg_info_from_raw_sit(se, &sit);
+		}
+		start_blk += readed;
+	} while (start_blk < sit_blk_cnt);
 
-		check_block_count(sbi, segno, &sit);
-		seg_info_from_raw_sit(se, &sit);
-	}
 
 	free(sit_blk);
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 2dda901..942c8dc 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1186,6 +1186,11 @@ extern int f2fs_finalize_device(void);
 extern int f2fs_fsync_device(void);
 
 extern int dev_read(void *, __u64, size_t);
+#ifdef POSIX_FADV_WILLNEED
+extern int dev_readahead(__u64, size_t);
+#else
+extern int dev_readahead(__u64, size_t UNUSED(len));
+#endif
 extern int dev_write(void *, __u64, size_t);
 extern int dev_write_block(void *, __u64);
 extern int dev_write_dump(void *, __u64, size_t);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
