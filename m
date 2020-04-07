Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 788161A0ABC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Apr 2020 12:04:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jLl5e-0006gy-ON; Tue, 07 Apr 2020 10:04:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jLl5d-0006gb-O1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ln94r0TH6lQ7X0pLp8l7p0I70VNmU6Z+7zPIxeTBiE=; b=eHeMFnxUV1A76KnOq81D+e4oWm
 p48dzHuXk0mg42uaynXStBVrDUXc3n/S7sDIYiMPFFkTKt/tXWLwJZZ8+74hskNAbUgTjuGagurV/
 3WXOH78nPSBT49BKeohwfN/gEpzVFWSPD7q8S9cBjFE1cYTTOOz5MxRfPsHY73If2/L0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4ln94r0TH6lQ7X0pLp8l7p0I70VNmU6Z+7zPIxeTBiE=; b=Z
 ojq+b2bJP1wjuzq5pLmY18ZuA3Ung2ob6ZA6nrRr2yks0TMa51FqYyzNH3SQuItoThM82E/mXy4d2
 7184Y5se0YS5CzbaPPJ2sb6bMVWqszWaHC6XOwWM0TKSkczhMqBfw7LDhAKI7QWCRF4JoF9eSsGWT
 r6zJpMfk0rchlLXs=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jLl5b-005Sr4-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:04:17 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 384349ABB3AEC517DB9E;
 Tue,  7 Apr 2020 18:04:07 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Apr 2020 18:03:57 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 7 Apr 2020 18:03:54 +0800
Message-ID: <20200407100354.4971-1-yuchao0@huawei.com>
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
X-Headers-End: 1jLl5b-005Sr4-IQ
Subject: [f2fs-dev] [PATCH] fsck.f2fs: lookup and relink root inode
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
Cc: kilobyte@angband.pl, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Stephanos reported in mailing list:

Info: checkpoint state = 1 :  unmount
[ASSERT] (sanity_check_nid: 362)  --> nid[0x3] ino is 0

The root cause is root inode's nat entry is corrupted, this patch
add logic to search root inode from all node blocks, try to relink
root inode's nat to target node block.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 135 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h |   1 +
 2 files changed, 136 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 0389146..e22ed4a 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -572,6 +572,141 @@ err:
 	return -EINVAL;
 }
 
+static int is_root_nat_corrupted(struct f2fs_sb_info *sbi)
+{
+	struct node_info ni;
+	struct f2fs_node *node_blk = NULL;
+	int ret;
+
+	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	ASSERT(node_blk != NULL);
+
+	ret = sanity_check_nid(sbi, sbi->root_ino_num, node_blk,
+					F2FS_FT_DIR, TYPE_INODE, &ni);
+
+	free(node_blk);
+	return ret;
+}
+
+static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
+{
+	struct seg_entry *se;
+	u32 offset;
+
+	se = get_seg_entry(sbi, GET_SEGNO(sbi, blk_addr));
+	offset = OFFSET_IN_SEG(sbi, blk_addr);
+
+	return f2fs_test_bit(offset,
+			(const char *)se->cur_valid_map) != 0;
+}
+
+int fsck_find_and_link_root(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_node *node_blk;
+	int segment_count = SM_I(sbi)->main_segments;
+	int segno;
+	bool valid_bitmap = true;
+	block_t last_blkaddr = NULL_ADDR;
+	u64 last_ctime = 0;
+	u32 last_ctime_nsec = 0;
+	int ret = -EINVAL;
+
+	if (!is_root_nat_corrupted(sbi))
+		return 0;
+
+	node_blk = calloc(BLOCK_SZ, 1);
+	ASSERT(node_blk);
+
+	printf("fsck_find_and_link_root\n");
+
+retry:
+	for (segno = 0; segno < segment_count; segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, segno);
+		block_t blkaddr = START_BLOCK(sbi, segno);
+		int ret;
+		int i;
+
+		if (IS_DATASEG(se->type))
+			continue;
+
+		dev_readahead(blkaddr << F2FS_BLKSIZE_BITS,
+				sbi->blocks_per_seg << F2FS_BLKSIZE_BITS);
+
+		for (i = 0; i < sbi->blocks_per_seg; i++, blkaddr++) {
+			if (valid_bitmap && !is_sit_bitmap_set(sbi, blkaddr))
+				continue;
+			if (!valid_bitmap && is_sit_bitmap_set(sbi, blkaddr))
+				continue;
+			ret = dev_read_block(node_blk, blkaddr);
+			ASSERT(ret >= 0);
+
+			if (le32_to_cpu(node_blk->footer.ino) !=
+					sbi->root_ino_num ||
+				le32_to_cpu(node_blk->footer.nid) !=
+					sbi->root_ino_num)
+				continue;
+
+			if (!IS_INODE(node_blk))
+				continue;
+
+			if (le32_to_cpu(node_blk->i.i_generation) ||
+					le32_to_cpu(node_blk->i.i_namelen))
+				continue;
+
+			printf("possible valid_bitmap: %d, nid: %u, blkaddr:%u\n",
+				valid_bitmap,
+				le32_to_cpu(node_blk->footer.nid),
+				blkaddr);
+			break;
+		}
+
+		if (i != sbi->blocks_per_seg) {
+			if (valid_bitmap) {
+				if (c.fix_on) {
+					FIX_MSG("Relink root inode, blkaddr: 0x%x",
+						blkaddr);
+					update_nat_blkaddr(sbi, sbi->root_ino_num,
+							sbi->root_ino_num, blkaddr);
+					ret = 0;
+				}
+				goto out;
+			} else {
+				if (last_blkaddr == NULL_ADDR)
+					goto init;
+				if (le64_to_cpu(node_blk->i.i_ctime) <
+					last_ctime)
+					continue;
+				if (le64_to_cpu(node_blk->i.i_ctime) ==
+					last_ctime &&
+					le32_to_cpu(node_blk->i.i_ctime_nsec) <=
+					last_ctime_nsec)
+					continue;
+init:
+				last_blkaddr = blkaddr;
+				last_ctime =
+					le64_to_cpu(node_blk->i.i_ctime);
+				last_ctime_nsec =
+					le32_to_cpu(node_blk->i.i_ctime_nsec);
+			}
+		}
+	}
+
+	if (valid_bitmap) {
+		valid_bitmap = false;
+		goto retry;
+	} else {
+		if (last_blkaddr && c.fix_on) {
+			FIX_MSG("Relink root inode, blkaddr: 0x%x", last_blkaddr);
+			update_nat_blkaddr(sbi, sbi->root_ino_num,
+					sbi->root_ino_num, last_blkaddr);
+			ret = 0;
+		}
+	}
+out:
+	free(node_blk);
+	return ret;
+}
+
 static inline void get_extent_info(struct extent_info *ext,
 					struct f2fs_extent *i_ext)
 {
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 2de6f62..4ce51d7 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -150,6 +150,7 @@ extern int fsck_sanity_check_nid(struct f2fs_sb_info *, u32,
 extern int fsck_chk_node_blk(struct f2fs_sb_info *, struct f2fs_inode *, u32,
 		enum FILE_TYPE, enum NODE_TYPE, u32 *,
 		struct child_info *);
+extern int fsck_find_and_link_root(struct f2fs_sb_info *);
 extern void fsck_chk_inode_blk(struct f2fs_sb_info *, u32, enum FILE_TYPE,
 		struct f2fs_node *, u32 *, struct node_info *, struct child_info *);
 extern int fsck_chk_dnode_blk(struct f2fs_sb_info *, struct f2fs_inode *,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
