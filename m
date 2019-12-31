Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C4B12D7C7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Dec 2019 11:06:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1imEPy-0001nH-It; Tue, 31 Dec 2019 10:06:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1imEPv-0001n7-SI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 10:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DYREw9DRfnwck8Lo347DqF0kcEFu//S8vgd7DHsm12U=; b=hHzY1SHw6UfQsXDyhTHZpMv/k4
 aKXD8sRZ1nXfjvd/kjGYNpShmv2AQt6ElV1fnn9pNrhCOAQnjJQM9sgSOjv2fjlEIVeBPKMQKyitJ
 WiSyG2ydU7EmhweqiNJGIl+amPPYYqhMW0Uo+wqaBYluZQSrcOw9slvvVj19z4pOKzUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DYREw9DRfnwck8Lo347DqF0kcEFu//S8vgd7DHsm12U=; b=J
 iEGVry1D1xKdZgd0dQ5CSkewVVjv3nMTLeXHBlTjMZBw+05FH+OHXWFDsqB2JnybS4nmdlpjVbjQS
 bk5S44oDgTjqyAasOKHVZVGZwpQlQWLTr3ocL7XWtFchaZhzYLqZ3APAuKn1/n0s555KMq3z13k/c
 oTOby521nKOYV/lY=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1imEPf-003Ipl-V6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Dec 2019 10:06:23 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0185D3850E905D347451;
 Tue, 31 Dec 2019 18:06:01 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Tue, 31 Dec 2019 18:05:53 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 31 Dec 2019 18:05:42 +0800
Message-ID: <20191231100542.3959-1-yuchao0@huawei.com>
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
X-Headers-End: 1imEPf-003Ipl-V6
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
Cc: linux-f2fs-devel@lists.sourceforge.net
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
 fsck/main.c | 146 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index cd4ca20..5bcbf39 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -614,12 +614,152 @@ void f2fs_parse_options(int argc, char *argv[])
 	error_out(prog);
 }
 
+bool is_root_nat_corrupted(struct f2fs_sb_info *sbi)
+{
+	struct node_info ni;
+	struct f2fs_node *node_blk = NULL;
+	nid_t root_ino = sbi->root_ino_num;
+
+	node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
+	ASSERT(node_blk != NULL);
+
+	if (!IS_VALID_NID(sbi, root_ino)) {
+		ASSERT_MSG("nid is not valid. [0x%x]", root_ino);
+		goto out;
+	}
+
+	get_node_info(sbi, root_ino, &ni);
+	if (ni.ino == 0) {
+		ASSERT_MSG("nid[0x%x] ino is 0", root_ino);
+		goto out;
+	}
+
+	if (ni.blk_addr == NEW_ADDR) {
+		ASSERT_MSG("nid is NEW_ADDR. [0x%x]", root_ino);
+		goto out;
+	}
+
+	if (ni.blk_addr == NULL_ADDR) {
+		ASSERT_MSG("nid is NULL_ADDR. [0x%x]", root_ino);
+		goto out;
+	}
+
+	if (!IS_VALID_BLK_ADDR(sbi, ni.blk_addr)) {
+		ASSERT_MSG("blkaddress is not valid. [0x%x]", ni.blk_addr);
+		goto out;
+	}
+	free(node_blk);
+	return 0;
+out:
+	free(node_blk);
+	return -EINVAL;
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
+	node_blk = calloc(BLOCK_SZ, 1);
+	ASSERT(node_blk);
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
+			if (node_blk->footer.ino == sbi->root_ino_num &&
+				node_blk->footer.nid == sbi->root_ino_num)
+				break;
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
 static void do_fsck(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
 	u32 flag = le32_to_cpu(ckpt->ckpt_flags);
 	u32 blk_cnt;
-	errcode_t ret;
+	errcode_t ret = 0;
 
 	fsck_init(sbi);
 
@@ -675,6 +815,10 @@ static void do_fsck(struct f2fs_sb_info *sbi)
 		}
 	}
 	fsck_chk_orphan_node(sbi);
+
+	if (is_root_nat_corrupted(sbi))
+		fsck_find_and_link_root(sbi);
+
 	fsck_chk_node_blk(sbi, NULL, sbi->root_ino_num,
 			F2FS_FT_DIR, TYPE_INODE, &blk_cnt, NULL);
 	fsck_chk_quota_files(sbi);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
