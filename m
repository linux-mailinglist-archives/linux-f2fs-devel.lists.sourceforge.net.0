Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 937888CECD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 10:49:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxoyF-0003Ee-4h; Wed, 14 Aug 2019 08:49:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hxoyC-0003EA-Tr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 08:49:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R7WctN4tB5oDgAmvDerYnbCLH2g2s1RvJE0/YBBYpgQ=; b=F36wgZ/ItvtoFb8rFRl1IUq+1D
 U23zaLgzWlrqpbDDlEHyHfEuKUDGV3kJSlTmH1QLXoqpGy0FVmZKDbLJOADm1fcr3qxrg5OexKaud
 5g3fNGs10uVjvqdsgwoeXnt4R1c3Zjf2MYMPo4TOwd+MXNu/4O66EzyK9p/eV6m3w03Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R7WctN4tB5oDgAmvDerYnbCLH2g2s1RvJE0/YBBYpgQ=; b=Q
 DUPoa3vIUpi5NvHxC+aL8CxvQtdnbEyZNtHaSmz+nB5Bt+5VmWI0Vxwtbzk/1An2TdifD+9KsE6nq
 RlB2rOk2O7BQEm2VcUpNk7G5POHBPEf29QKSYww6XWGpUW/ok+/V+8mxi7ii01VCYRyQschXrQMIK
 XAkFkSDTX+zj+r2g=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxoyA-005jVA-FM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 08:49:24 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 67EE6909AEE7B18602D6;
 Wed, 14 Aug 2019 16:49:14 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 16:49:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 14 Aug 2019 16:48:55 +0800
Message-ID: <20190814084855.69736-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
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
X-Headers-End: 1hxoyA-005jVA-FM
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix to skip block allocation for
 fsynced data
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

Previously, we don't allow block allocation on unclean umounted image,
result in failing to repair quota system file.

In this patch, we port most recovery codes from kernel to userspace
tools, so that on unclean image, during fsck initialization, we will
record all data/node block address we may recover in kernel, and
then during allocation of quota file repair, we can skip those blocks
to avoid block use conflict.

Eventually, if free space is enough, we can repair the quota system
file on an unclean umounted image.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/f2fs.h    |  78 ++++++++++++
 fsck/fsck.h    |   2 +
 fsck/mount.c   | 340 +++++++++++++++++++++++++++++++++++++++++++++++--
 fsck/node.c    |  22 +++-
 fsck/node.h    |  39 ++++++
 fsck/segment.c |  11 +-
 6 files changed, 466 insertions(+), 26 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 52b81ff..399c74d 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -33,10 +33,63 @@
 		typecheck(unsigned long long, b) &&                     \
 		((long long)((a) - (b)) > 0))
 
+#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
+#define container_of(ptr, type, member) ({			\
+	const typeof(((type *)0)->member) * __mptr = (ptr);	\
+	(type *)((char *)__mptr - offsetof(type, member)); })
+
 struct list_head {
 	struct list_head *next, *prev;
 };
 
+static inline void __list_add(struct list_head *new,
+				struct list_head *prev,
+				struct list_head *next)
+{
+	next->prev = new;
+	new->next = next;
+	new->prev = prev;
+	prev->next = new;
+}
+
+static inline void __list_del(struct list_head * prev, struct list_head * next)
+{
+	next->prev = prev;
+	prev->next = next;
+}
+
+static inline void list_del(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+}
+
+static inline void list_add_tail(struct list_head *new, struct list_head *head)
+{
+	__list_add(new, head->prev, head);
+}
+
+#define LIST_HEAD_INIT(name) { &(name), &(name) }
+
+#define list_entry(ptr, type, member)					\
+		container_of(ptr, type, member)
+
+#define list_first_entry(ptr, type, member)				\
+		list_entry((ptr)->next, type, member)
+
+#define list_next_entry(pos, member)					\
+		list_entry((pos)->member.next, typeof(*(pos)), member)
+
+#define list_for_each_entry(pos, head, member)				\
+	for (pos = list_first_entry(head, typeof(*pos), member);	\
+		&pos->member != (head);					\
+		pos = list_next_entry(pos, member))
+
+#define list_for_each_entry_safe(pos, n, head, member)			\
+	for (pos = list_first_entry(head, typeof(*pos), member),	\
+		n = list_next_entry(pos, member);			\
+		&pos->member != (head);					\
+		pos = n, n = list_next_entry(n, member))
+
 /*
  * indicate meta/data type
  */
@@ -80,9 +133,12 @@ struct f2fs_nm_info {
 
 struct seg_entry {
 	unsigned short valid_blocks;    /* # of valid blocks */
+	unsigned short ckpt_valid_blocks;	/* # of valid blocks last cp, for recovered data/node */
 	unsigned char *cur_valid_map;   /* validity bitmap of blocks */
+	unsigned char *ckpt_valid_map;	/* validity bitmap of blocks last cp, for recovered data/node */
 	unsigned char type;             /* segment type like CURSEG_XXX_TYPE */
 	unsigned char orig_type;        /* segment type like CURSEG_XXX_TYPE */
+	unsigned char ckpt_type;        /* segment type like CURSEG_XXX_TYPE , for recovered data/node */
 	unsigned long long mtime;       /* modification time of the segment */
 	int dirty;
 };
@@ -258,6 +314,17 @@ static inline unsigned int ofs_of_node(struct f2fs_node *node_blk)
 	return flag >> OFFSET_BIT_SHIFT;
 }
 
+static inline unsigned long long cur_cp_version(struct f2fs_checkpoint *cp)
+{
+	return le64_to_cpu(cp->checkpoint_ver);
+}
+
+static inline __u64 cur_cp_crc(struct f2fs_checkpoint *cp)
+{
+	size_t crc_offset = le32_to_cpu(cp->checksum_offset);
+	return le32_to_cpu(*((__le32 *)((unsigned char *)cp + crc_offset)));
+}
+
 static inline bool is_set_ckpt_flags(struct f2fs_checkpoint *cp, unsigned int f)
 {
 	unsigned int ckpt_flags = le32_to_cpu(cp->ckpt_flags);
@@ -373,6 +440,9 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
 #define START_BLOCK(sbi, segno)	(SM_I(sbi)->main_blkaddr +		\
 	((segno) << sbi->log_blocks_per_seg))
 
+#define NEXT_FREE_BLKADDR(sbi, curseg)					\
+	(START_BLOCK(sbi, (curseg)->segno) + (curseg)->next_blkoff)
+
 #define SIT_BLK_CNT(sbi)						\
 	((MAIN_SEGS(sbi) + SIT_ENTRY_PER_BLOCK - 1) / SIT_ENTRY_PER_BLOCK)
 
@@ -392,6 +462,14 @@ static inline block_t sum_blk_addr(struct f2fs_sb_info *sbi, int base, int type)
 		- (base + 1) + type;
 }
 
+/* for the list of fsync inodes, used only during recovery */
+struct fsync_inode_entry {
+	struct list_head list;	/* list head */
+	nid_t ino;		/* inode number */
+	block_t blkaddr;	/* block address locating the last fsync */
+	block_t last_dentry;	/* block address locating the last dentry */
+};
+
 #define nats_in_cursum(jnl)             (le16_to_cpu(jnl->n_nats))
 #define sits_in_cursum(jnl)             (le16_to_cpu(jnl->n_sits))
 
diff --git a/fsck/fsck.h b/fsck/fsck.h
index f7ddf50..ccf4a39 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -230,6 +230,8 @@ extern void sit_dump(struct f2fs_sb_info *, unsigned int, unsigned int);
 extern void ssa_dump(struct f2fs_sb_info *, int, int);
 extern void dump_node(struct f2fs_sb_info *, nid_t, int);
 extern int dump_info_from_blkaddr(struct f2fs_sb_info *, u32);
+extern unsigned int start_bidx_of_node(unsigned int, struct f2fs_node *);
+
 
 /* defrag.c */
 int f2fs_defragment(struct f2fs_sb_info *, u64, u64, u64, int);
diff --git a/fsck/mount.c b/fsck/mount.c
index 409d129..d830007 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -9,6 +9,7 @@
  * published by the Free Software Foundation.
  */
 #include "fsck.h"
+#include "node.h"
 #include "xattr.h"
 #include <locale.h>
 #ifdef HAVE_LINUX_POSIX_ACL_H
@@ -476,6 +477,13 @@ void print_sb_state(struct f2fs_super_block *sb)
 	MSG(0, "\n");
 }
 
+static inline bool is_valid_data_blkaddr(block_t blkaddr)
+{
+	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR)
+		return 0;
+	return 1;
+}
+
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
@@ -1517,6 +1525,9 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 
 	bitmap_size = TOTAL_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
 
+	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
+		bitmap_size += bitmap_size;
+
 	sit_i->bitmap = calloc(bitmap_size, 1);
 	if (!sit_i->bitmap) {
 		MSG(1, "\tError: Calloc failed for build_sit_info!!\n");
@@ -1528,6 +1539,11 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 	for (start = 0; start < TOTAL_SEGS(sbi); start++) {
 		sit_i->sentries[start].cur_valid_map = bitmap;
 		bitmap += SIT_VBLOCK_MAP_SIZE;
+
+		if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
+			sit_i->sentries[start].ckpt_valid_map = bitmap;
+			bitmap += SIT_VBLOCK_MAP_SIZE;
+		}
 	}
 
 	sit_segs = get_sb(segment_count_sit) >> 1;
@@ -1856,7 +1872,7 @@ void check_block_count(struct f2fs_sb_info *sbi,
 				segno, GET_SIT_TYPE(raw_sit));
 }
 
-void seg_info_from_raw_sit(struct seg_entry *se,
+void __seg_info_from_raw_sit(struct seg_entry *se,
 		struct f2fs_sit_entry *raw_sit)
 {
 	se->valid_blocks = GET_SIT_VBLOCKS(raw_sit);
@@ -1866,6 +1882,18 @@ void seg_info_from_raw_sit(struct seg_entry *se,
 	se->mtime = le64_to_cpu(raw_sit->mtime);
 }
 
+void seg_info_from_raw_sit(struct f2fs_sb_info *sbi, struct seg_entry *se,
+						struct f2fs_sit_entry *raw_sit)
+{
+	__seg_info_from_raw_sit(se, raw_sit);
+
+	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+		return;
+	se->ckpt_valid_blocks = se->valid_blocks;
+	memcpy(se->ckpt_valid_map, se->cur_valid_map, SIT_VBLOCK_MAP_SIZE);
+	se->ckpt_type = se->type;
+}
+
 struct seg_entry *get_seg_entry(struct f2fs_sb_info *sbi,
 		unsigned int segno)
 {
@@ -1873,6 +1901,30 @@ struct seg_entry *get_seg_entry(struct f2fs_sb_info *sbi,
 	return &sit_i->sentries[segno];
 }
 
+unsigned short get_seg_vblocks(struct f2fs_sb_info *sbi, struct seg_entry *se)
+{
+	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+		return se->valid_blocks;
+	else
+		return se->ckpt_valid_blocks;
+}
+
+unsigned char *get_seg_bitmap(struct f2fs_sb_info *sbi, struct seg_entry *se)
+{
+	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+		return se->cur_valid_map;
+	else
+		return se->ckpt_valid_map;
+}
+
+unsigned char get_seg_type(struct f2fs_sb_info *sbi, struct seg_entry *se)
+{
+	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+		return se->type;
+	else
+		return se->ckpt_type;
+}
+
 struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
 				unsigned int segno, int *ret_type)
 {
@@ -2101,7 +2153,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 			sit = sit_blk->entries[SIT_ENTRY_OFFSET(sit_i, segno)];
 
 			check_block_count(sbi, segno, &sit);
-			seg_info_from_raw_sit(se, &sit);
+			seg_info_from_raw_sit(sbi, se, &sit);
 		}
 		start_blk += readed;
 	} while (start_blk < sit_blk_cnt);
@@ -2131,7 +2183,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 		sit = sit_in_journal(journal, i);
 
 		check_block_count(sbi, segno, &sit);
-		seg_info_from_raw_sit(se, &sit);
+		seg_info_from_raw_sit(sbi, se, &sit);
 	}
 	return 0;
 }
@@ -2398,19 +2450,19 @@ int relocate_curseg_offset(struct f2fs_sb_info *sbi, int type)
 
 void set_section_type(struct f2fs_sb_info *sbi, unsigned int segno, int type)
 {
-	struct seg_entry *se;
 	unsigned int i;
 
 	if (sbi->segs_per_sec == 1)
 		return;
 
 	for (i = 0; i < sbi->segs_per_sec; i++) {
-		se = get_seg_entry(sbi, segno + i);
+		struct seg_entry *se = get_seg_entry(sbi, segno + i);
+
 		se->type = type;
 	}
 }
 
-int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int type)
+int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int want_type)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct seg_entry *se;
@@ -2426,42 +2478,50 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left, int type)
 		not_enough = 1;
 
 	while (*to >= SM_I(sbi)->main_blkaddr && *to < end_blkaddr) {
+		unsigned short vblocks;
+		unsigned char *bitmap;
+		unsigned char type;
+
 		segno = GET_SEGNO(sbi, *to);
 		offset = OFFSET_IN_SEG(sbi, *to);
 
 		se = get_seg_entry(sbi, segno);
 
-		if (se->valid_blocks == sbi->blocks_per_seg ||
+		vblocks = get_seg_vblocks(sbi, se);
+		bitmap = get_seg_bitmap(sbi, se);
+		type = get_seg_type(sbi, se);
+
+		if (vblocks == sbi->blocks_per_seg ||
 				IS_CUR_SEGNO(sbi, segno)) {
 			*to = left ? START_BLOCK(sbi, segno) - 1:
 						START_BLOCK(sbi, segno + 1);
 			continue;
 		}
 
-		if (se->valid_blocks == 0 && not_enough) {
+		if (vblocks == 0 && not_enough) {
 			*to = left ? START_BLOCK(sbi, segno) - 1:
 						START_BLOCK(sbi, segno + 1);
 			continue;
 		}
 
-		if (se->valid_blocks == 0 && !(segno % sbi->segs_per_sec)) {
+		if (vblocks == 0 && !(segno % sbi->segs_per_sec)) {
 			struct seg_entry *se2;
 			unsigned int i;
 
 			for (i = 1; i < sbi->segs_per_sec; i++) {
 				se2 = get_seg_entry(sbi, segno + i);
-				if (se2->valid_blocks)
+				if (get_seg_vblocks(sbi, se2))
 					break;
 			}
 
 			if (i == sbi->segs_per_sec) {
-				set_section_type(sbi, segno, type);
+				set_section_type(sbi, segno, want_type);
 				return 0;
 			}
 		}
 
-		if (se->type == type &&
-			!f2fs_test_bit(offset, (const char *)se->cur_valid_map))
+		if (type == want_type &&
+			!f2fs_test_bit(offset, (const char *)bitmap))
 			return 0;
 
 		*to = left ? *to - 1: *to + 1;
@@ -2937,6 +2997,255 @@ static int tune_sb_features(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
+static struct fsync_inode_entry *get_fsync_inode(struct list_head *head,
+								nid_t ino)
+{
+	struct fsync_inode_entry *entry;
+
+	list_for_each_entry(entry, head, list)
+		if (entry->ino == ino)
+			return entry;
+
+	return NULL;
+}
+
+static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
+					struct list_head *head, nid_t ino)
+{
+	struct fsync_inode_entry *entry;
+
+	entry = calloc(sizeof(struct fsync_inode_entry), 1);
+	if (!entry)
+		return NULL;
+	entry->ino = ino;
+	list_add_tail(&entry->list, head);
+	return entry;
+}
+
+static void del_fsync_inode(struct fsync_inode_entry *entry)
+{
+	list_del(&entry->list);
+	free(entry);
+}
+
+static void destroy_fsync_dnodes(struct list_head *head)
+{
+	struct fsync_inode_entry *entry, *tmp;
+
+	list_for_each_entry_safe(entry, tmp, head, list)
+		del_fsync_inode(entry);
+}
+
+static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
+{
+	struct curseg_info *curseg;
+	struct f2fs_node *node_blk;
+	block_t blkaddr;
+	unsigned int loop_cnt = 0;
+	unsigned int free_blocks = TOTAL_SEGS(sbi) * sbi->blocks_per_seg -
+						sbi->total_valid_block_count;
+	int err = 0;
+
+	/* get node pages in the current segment */
+	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
+	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
+
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk);
+
+	while (1) {
+		struct fsync_inode_entry *entry;
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
+			break;
+
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			break;
+
+		if (!is_recoverable_dnode(sbi, node_blk))
+			break;
+
+		if (!is_fsync_dnode(node_blk))
+			goto next;
+
+		entry = get_fsync_inode(head, ino_of_node(node_blk));
+		if (!entry) {
+			entry = add_fsync_inode(sbi, head,
+						ino_of_node(node_blk));
+			if (!entry) {
+				err = -1;
+				break;
+			}
+		}
+		entry->blkaddr = blkaddr;
+
+		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
+			entry->last_dentry = blkaddr;
+next:
+		/* sanity check in order to detect looped node chain */
+		if (++loop_cnt >= free_blocks ||
+			blkaddr == next_blkaddr_of_node(node_blk)) {
+			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
+				    blkaddr,
+				    next_blkaddr_of_node(node_blk));
+			err = -1;
+			break;
+		}
+
+		blkaddr = next_blkaddr_of_node(node_blk);
+	}
+
+	free(node_blk);
+	return err;
+}
+
+static int do_record_fsync_data(struct f2fs_sb_info *sbi,
+					struct f2fs_node *node_blk,
+					block_t blkaddr)
+{
+	unsigned int segno, offset;
+	struct seg_entry *se;
+	unsigned int ofs_in_node = 0;
+	unsigned int start, end;
+	int err = 0, recorded = 0;
+
+	segno = GET_SEGNO(sbi, blkaddr);
+	se = get_seg_entry(sbi, segno);
+	offset = OFFSET_IN_SEG(sbi, blkaddr);
+
+	if (f2fs_test_bit(offset, (char *)se->cur_valid_map)) {
+		ASSERT(0);
+		return -1;
+	}
+	if (f2fs_test_bit(offset, (char *)se->ckpt_valid_map)) {
+		ASSERT(0);
+		return -1;
+	}
+
+	if (!se->ckpt_valid_blocks)
+		se->ckpt_type = CURSEG_WARM_NODE;
+
+	se->ckpt_valid_blocks++;
+	f2fs_set_bit(offset, (char *)se->ckpt_valid_map);
+
+	MSG(1, "do_record_fsync_data: [node] ino = %u, nid = %u, blkaddr = %u\n",
+	    ino_of_node(node_blk), ofs_of_node(node_blk), blkaddr);
+
+	/* inline data */
+	if (IS_INODE(node_blk) && (node_blk->i.i_inline & F2FS_INLINE_DATA))
+		return 0;
+	/* xattr node */
+	if (ofs_of_node(node_blk) == XATTR_NODE_OFFSET)
+		return 0;
+
+	/* step 3: recover data indices */
+	start = start_bidx_of_node(ofs_of_node(node_blk), node_blk);
+	end = start + ADDRS_PER_PAGE(node_blk);
+
+	for (; start < end; start++, ofs_in_node++) {
+		blkaddr = datablock_addr(node_blk, ofs_in_node);
+
+		if (!is_valid_data_blkaddr(blkaddr))
+			continue;
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR)) {
+			err = -1;
+			goto out;
+		}
+
+		segno = GET_SEGNO(sbi, blkaddr);
+		se = get_seg_entry(sbi, segno);
+		offset = OFFSET_IN_SEG(sbi, blkaddr);
+
+		if (f2fs_test_bit(offset, (char *)se->cur_valid_map))
+			continue;
+		if (f2fs_test_bit(offset, (char *)se->ckpt_valid_map))
+			continue;
+
+		if (!se->ckpt_valid_blocks)
+			se->ckpt_type = CURSEG_WARM_DATA;
+
+		se->ckpt_valid_blocks++;
+		f2fs_set_bit(offset, (char *)se->ckpt_valid_map);
+
+		MSG(1, "do_record_fsync_data: [data] ino = %u, nid = %u, blkaddr = %u\n",
+		    ino_of_node(node_blk), ofs_of_node(node_blk), blkaddr);
+
+		recorded++;
+	}
+out:
+	MSG(1, "recover_data: ino = %u, nid = %u, recorded = %d, err = %d\n",
+		    ino_of_node(node_blk), ofs_of_node(node_blk),
+		    recorded, err);
+	return err;
+}
+
+static int traverse_dnodes(struct f2fs_sb_info *sbi,
+				struct list_head *inode_list)
+{
+	struct curseg_info *curseg;
+	struct f2fs_node *node_blk;
+	block_t blkaddr;
+	int err = 0;
+
+	/* get node pages in the current segment */
+	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
+	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
+
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk);
+
+	while (1) {
+		struct fsync_inode_entry *entry;
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
+			break;
+
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			break;
+
+		if (!is_recoverable_dnode(sbi, node_blk))
+			break;
+
+		entry = get_fsync_inode(inode_list,
+					ino_of_node(node_blk));
+		if (!entry)
+			goto next;
+
+		err = do_record_fsync_data(sbi, node_blk, blkaddr);
+		if (err)
+			break;
+
+		if (entry->blkaddr == blkaddr)
+			del_fsync_inode(entry);
+next:
+		blkaddr = next_blkaddr_of_node(node_blk);
+	}
+
+	free(node_blk);
+	return err;
+}
+
+static int record_fsync_data(struct f2fs_sb_info *sbi)
+{
+	struct list_head inode_list = LIST_HEAD_INIT(inode_list);
+	int ret;
+
+	if (is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG))
+		return 0;
+
+	ret = find_fsync_inode(sbi, &inode_list);
+	if (ret)
+		goto out;
+
+	ret = traverse_dnodes(sbi, &inode_list);
+out:
+	destroy_fsync_dnodes(&inode_list);
+	return ret;
+}
+
 int f2fs_do_mount(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_checkpoint *cp = NULL;
@@ -3011,6 +3320,11 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 		return -1;
 	}
 
+	if (record_fsync_data(sbi)) {
+		ERR_MSG("record_fsync_data failed\n");
+		return -1;
+	}
+
 	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
 		u32 flag = get_cp(ckpt_flags);
 
diff --git a/fsck/node.c b/fsck/node.c
index 6bb5484..d76e3bc 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -30,6 +30,16 @@ void f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
 	*nid = i;
 }
 
+void f2fs_release_nid(struct f2fs_sb_info *sbi, nid_t nid)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+
+	ASSERT(nid < nm_i->max_nid);
+	ASSERT(f2fs_test_bit(nid, nm_i->nid_bitmap));
+
+	f2fs_clear_bit(nid, nm_i->nid_bitmap);
+}
+
 void set_data_blkaddr(struct dnode_of_data *dn)
 {
 	__le32 *addr_array;
@@ -203,12 +213,6 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 
 	for (i = 1; i <= level; i++) {
 		if (!nids[i] && mode == ALLOC_NODE) {
-			struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
-
-			if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
-				c.alloc_failed = 1;
-				return -EINVAL;
-			}
 			f2fs_alloc_nid(sbi, &nids[i]);
 
 			dn->nid = nids[i];
@@ -216,7 +220,11 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 			/* Function new_node_blk get a new f2fs_node blk and update*/
 			/* We should make sure that dn->node_blk == NULL*/
 			nblk[i] = new_node_block(sbi, dn, noffset[i]);
-			ASSERT(nblk[i]);
+			if (!nblk[i]) {
+				f2fs_release_nid(sbi, nids[i]);
+				c.alloc_failed = 1;
+				return -EINVAL;
+			}
 
 			set_nid(parent, offset[i - 1], nids[i], i == 1);
 		} else {
diff --git a/fsck/node.h b/fsck/node.h
index cbf7ed7..d927a09 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -103,4 +103,43 @@ static inline int IS_DNODE(struct f2fs_node *node_page)
 	return 1;
 }
 
+static inline nid_t ino_of_node(struct f2fs_node *node_blk)
+{
+	return le32_to_cpu(node_blk->footer.ino);
+}
+
+static inline __u64 cpver_of_node(struct f2fs_node *node_blk)
+{
+	return le64_to_cpu(node_blk->footer.cp_ver);
+}
+
+static inline bool is_recoverable_dnode(struct f2fs_sb_info *sbi,
+						struct f2fs_node *node_blk)
+{
+	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
+	__u64 cp_ver = cur_cp_version(ckpt);
+
+	/* Don't care crc part, if fsck.f2fs sets it. */
+	if (is_set_ckpt_flags(ckpt, CP_NOCRC_RECOVERY_FLAG))
+		return (cp_ver << 32) == (cpver_of_node(node_blk) << 32);
+
+	if (is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
+		cp_ver |= (cur_cp_crc(ckpt) << 32);
+
+	return cp_ver == cpver_of_node(node_blk);
+}
+
+static inline block_t next_blkaddr_of_node(struct f2fs_node *node_blk)
+{
+	return le32_to_cpu(node_blk->footer.next_blkaddr);
+}
+
+static inline int is_node(struct f2fs_node *node_blk, int type)
+{
+	return le32_to_cpu(node_blk->footer.flag) & (1 << type);
+}
+
+#define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
+#define is_dent_dnode(node_blk)		is_node(node_blk, DENT_BIT_SHIFT)
+
 #endif
diff --git a/fsck/segment.c b/fsck/segment.c
index b0c6889..e3a90da 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -62,6 +62,11 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 	se->type = type;
 	se->valid_blocks++;
 	f2fs_set_bit(offset, (char *)se->cur_valid_map);
+	if (!is_set_ckpt_flags(F2FS_CKPT(sbi), CP_UMOUNT_FLAG)) {
+		se->ckpt_type = type;
+		se->ckpt_valid_blocks++;
+		f2fs_set_bit(offset, (char *)se->ckpt_valid_map);
+	}
 	if (c.func == FSCK) {
 		f2fs_set_main_bitmap(sbi, blkaddr, type);
 		f2fs_set_sit_bitmap(sbi, blkaddr);
@@ -98,14 +103,8 @@ int new_data_block(struct f2fs_sb_info *sbi, void *block,
 	struct f2fs_summary sum;
 	struct node_info ni;
 	unsigned int blkaddr = datablock_addr(dn->node_blk, dn->ofs_in_node);
-	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 	int ret;
 
-	if (!is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
-		c.alloc_failed = 1;
-		return -EINVAL;
-	}
-
 	ASSERT(dn->node_blk);
 	memset(block, 0, BLOCK_SZ);
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
