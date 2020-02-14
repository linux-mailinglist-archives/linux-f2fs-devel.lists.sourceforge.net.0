Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E03B15D4EA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 10:45:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2XXF-00057W-Rs; Fri, 14 Feb 2020 09:45:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j2XXD-00057K-TO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 09:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BeItNmTsKyBg0+v7mAc3HeERrJxMCzWtXATfwyHCrWA=; b=ArgnFJs3Pdv2AL6Ecc9Xo0GzGh
 tB/TMF0GdczBvLu9sbtdQLbDXCtBqBKTnhLl9Bmd/zzzqdm5op/S4iEoqJ3WOqRGBFy/0BlkrkI6D
 8MVl6qtLTBrWwqH2XXWOFMgEo+SR+D0GEFGBWjl/1Wa4h3tkvIePi0I888pQcd59z+/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BeItNmTsKyBg0+v7mAc3HeERrJxMCzWtXATfwyHCrWA=; b=R
 i/kh5WW0yT+iLu2YilUreV5ZJOzAO8PYUK31mC9LE51mjYrvZNNRi86zJbcfwlf7oyVweGyUsmGpe
 ZqA4eZNiqIpmNbj+OG94eg9f9CgqBEK6Urp5IZRK/Uf4iCR/N4iXWCJ6K7vqe+GvDAR9I2mIp3U6W
 3DVU06HgWkjatPcM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2XX9-003gep-Fd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 09:45:19 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1B1926252407A682C1C8;
 Fri, 14 Feb 2020 17:45:06 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Fri, 14 Feb 2020 17:44:59 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 14 Feb 2020 17:44:10 +0800
Message-ID: <20200214094413.12784-1-yuchao0@huawei.com>
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
X-Headers-End: 1j2XX9-003gep-Fd
Subject: [f2fs-dev] [PATCH 1/4] f2fs: clean up codes with {f2fs_,
 }data_blkaddr()
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

- rename datablock_addr() to data_blkaddr().
- wrap data_blkaddr() with f2fs_data_blkaddr() to clean up
parameters.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c |  7 +++----
 fs/f2fs/data.c     | 12 +++++-------
 fs/f2fs/f2fs.h     |  7 ++++++-
 fs/f2fs/file.c     | 15 +++++----------
 fs/f2fs/gc.c       |  2 +-
 fs/f2fs/node.c     |  3 +--
 fs/f2fs/recovery.c |  7 +++----
 7 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d8a64be90a50..0282149aa4c8 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -554,7 +554,7 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 		for (i = 1; i < cc->cluster_size; i++) {
 			block_t blkaddr;
 
-			blkaddr = datablock_addr(dn.inode,
+			blkaddr = data_blkaddr(dn.inode,
 					dn.node_page, dn.ofs_in_node + i);
 			if (blkaddr != NULL_ADDR)
 				ret++;
@@ -794,7 +794,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		goto out_unlock_op;
 
 	for (i = 0; i < cc->cluster_size; i++) {
-		if (datablock_addr(dn.inode, dn.node_page,
+		if (data_blkaddr(dn.inode, dn.node_page,
 					dn.ofs_in_node + i) == NULL_ADDR)
 			goto out_put_dnode;
 	}
@@ -843,8 +843,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	for (i = 0; i < cc->cluster_size; i++, dn.ofs_in_node++) {
 		block_t blkaddr;
 
-		blkaddr = datablock_addr(dn.inode, dn.node_page,
-							dn.ofs_in_node);
+		blkaddr = f2fs_data_blkaddr(&dn);
 		fio.page = cic->rpages[i];
 		fio.old_blkaddr = blkaddr;
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1f9f755dc8c2..ec4b030e2466 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1047,8 +1047,7 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
 	f2fs_wait_on_page_writeback(dn->node_page, NODE, true, true);
 
 	for (; count > 0; dn->ofs_in_node++) {
-		block_t blkaddr = datablock_addr(dn->inode,
-					dn->node_page, dn->ofs_in_node);
+		block_t blkaddr = f2fs_data_blkaddr(dn);
 		if (blkaddr == NULL_ADDR) {
 			dn->data_blkaddr = NEW_ADDR;
 			__set_data_blkaddr(dn);
@@ -1300,8 +1299,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	if (err)
 		return err;
 
-	dn->data_blkaddr = datablock_addr(dn->inode,
-				dn->node_page, dn->ofs_in_node);
+	dn->data_blkaddr = f2fs_data_blkaddr(dn);
 	if (dn->data_blkaddr != NULL_ADDR)
 		goto alloc;
 
@@ -1467,7 +1465,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
 
 next_block:
-	blkaddr = datablock_addr(dn.inode, dn.node_page, dn.ofs_in_node);
+	blkaddr = f2fs_data_blkaddr(&dn);
 
 	if (__is_valid_data_blkaddr(blkaddr) &&
 		!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
@@ -2067,7 +2065,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	for (i = 1; i < cc->cluster_size; i++) {
 		block_t blkaddr;
 
-		blkaddr = datablock_addr(dn.inode, dn.node_page,
+		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i);
 
 		if (!__is_valid_data_blkaddr(blkaddr))
@@ -2096,7 +2094,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		struct page *page = dic->cpages[i];
 		block_t blkaddr;
 
-		blkaddr = datablock_addr(dn.inode, dn.node_page,
+		blkaddr = data_blkaddr(dn.inode, dn.node_page,
 						dn.ofs_in_node + i + 1);
 
 		if (bio && !page_is_mergeable(sbi, bio,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755..5152e9bf432b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2378,7 +2378,7 @@ static inline __le32 *blkaddr_in_node(struct f2fs_node *node)
 }
 
 static inline int f2fs_has_extra_attr(struct inode *inode);
-static inline block_t datablock_addr(struct inode *inode,
+static inline block_t data_blkaddr(struct inode *inode,
 			struct page *node_page, unsigned int offset)
 {
 	struct f2fs_node *raw_node;
@@ -2400,6 +2400,11 @@ static inline block_t datablock_addr(struct inode *inode,
 	return le32_to_cpu(addr_array[base + offset]);
 }
 
+static inline block_t f2fs_data_blkaddr(struct dnode_of_data *dn)
+{
+	return data_blkaddr(dn->inode, dn->node_page, dn->ofs_in_node);
+}
+
 static inline int f2fs_test_bit(unsigned int nr, char *addr)
 {
 	int mask;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c9dd45f82fbd..5a0f84751091 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -455,8 +455,7 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
 				data_ofs = (loff_t)pgofs << PAGE_SHIFT) {
 			block_t blkaddr;
 
-			blkaddr = datablock_addr(dn.inode,
-					dn.node_page, dn.ofs_in_node);
+			blkaddr = f2fs_data_blkaddr(&dn);
 
 			if (__is_valid_data_blkaddr(blkaddr) &&
 				!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
@@ -1122,8 +1121,7 @@ static int __read_out_blkaddrs(struct inode *inode, block_t *blkaddr,
 	done = min((pgoff_t)ADDRS_PER_PAGE(dn.node_page, inode) -
 							dn.ofs_in_node, len);
 	for (i = 0; i < done; i++, blkaddr++, do_replace++, dn.ofs_in_node++) {
-		*blkaddr = datablock_addr(dn.inode,
-					dn.node_page, dn.ofs_in_node);
+		*blkaddr = f2fs_data_blkaddr(&dn);
 
 		if (__is_valid_data_blkaddr(*blkaddr) &&
 			!f2fs_is_valid_blkaddr(sbi, *blkaddr,
@@ -1212,8 +1210,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				ADDRS_PER_PAGE(dn.node_page, dst_inode) -
 						dn.ofs_in_node, len - i);
 			do {
-				dn.data_blkaddr = datablock_addr(dn.inode,
-						dn.node_page, dn.ofs_in_node);
+				dn.data_blkaddr = f2fs_data_blkaddr(&dn);
 				f2fs_truncate_data_blocks_range(&dn, 1);
 
 				if (do_replace[i]) {
@@ -1389,8 +1386,7 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 	int ret;
 
 	for (; index < end; index++, dn->ofs_in_node++) {
-		if (datablock_addr(dn->inode, dn->node_page,
-					dn->ofs_in_node) == NULL_ADDR)
+		if (f2fs_data_blkaddr(dn) == NULL_ADDR)
 			count++;
 	}
 
@@ -1401,8 +1397,7 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
 
 	dn->ofs_in_node = ofs_in_node;
 	for (index = start; index < end; index++, dn->ofs_in_node++) {
-		dn->data_blkaddr = datablock_addr(dn->inode,
-					dn->node_page, dn->ofs_in_node);
+		dn->data_blkaddr = f2fs_data_blkaddr(dn);
 		/*
 		 * f2fs_reserve_new_blocks will not guarantee entire block
 		 * allocation.
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index db8725d473b5..53312d7bc78b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -634,7 +634,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	}
 
 	*nofs = ofs_of_node(node_page);
-	source_blkaddr = datablock_addr(NULL, node_page, ofs_in_node);
+	source_blkaddr = data_blkaddr(NULL, node_page, ofs_in_node);
 	f2fs_put_page(node_page, 1);
 
 	if (source_blkaddr != blkaddr) {
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3314a0f3405e..332cebc2033c 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -809,8 +809,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	dn->nid = nids[level];
 	dn->ofs_in_node = offset[level];
 	dn->node_page = npage[level];
-	dn->data_blkaddr = datablock_addr(dn->inode,
-				dn->node_page, dn->ofs_in_node);
+	dn->data_blkaddr = f2fs_data_blkaddr(dn);
 	return 0;
 
 release_pages:
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 763d5c0951d1..348e8d463b3e 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -496,8 +496,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	return 0;
 
 truncate_out:
-	if (datablock_addr(tdn.inode, tdn.node_page,
-					tdn.ofs_in_node) == blkaddr)
+	if (f2fs_data_blkaddr(&tdn) == blkaddr)
 		f2fs_truncate_data_blocks_range(&tdn, 1);
 	if (dn->inode->i_ino == nid && !dn->inode_page_locked)
 		unlock_page(dn->inode_page);
@@ -560,8 +559,8 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	for (; start < end; start++, dn.ofs_in_node++) {
 		block_t src, dest;
 
-		src = datablock_addr(dn.inode, dn.node_page, dn.ofs_in_node);
-		dest = datablock_addr(dn.inode, page, dn.ofs_in_node);
+		src = f2fs_data_blkaddr(&dn);
+		dest = data_blkaddr(dn.inode, page, dn.ofs_in_node);
 
 		if (__is_valid_data_blkaddr(src) &&
 			!f2fs_is_valid_blkaddr(sbi, src, META_POR)) {
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
