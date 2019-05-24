Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C60291BF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 09:28:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU4dF-0007J6-Qh; Fri, 24 May 2019 07:28:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hU4dE-0007Is-AV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 07:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P4Fyy7YT2ftKN89sADvdK5erj/kKYidq1mT9LIkll6Y=; b=NhmNLWxxcHI5WsuL7od7z0nDhV
 o6JokkpGw5ACzvDgyrMsL3jWrCoTAAw/VHd97RpvHORRNFToxNomDbp4l81Uw7nbiUs5jXkzvv9in
 cLwSb6nKcr159BAJ/ALP2LI/Fl3NW/SfkimVGBje1rwpgGl+bq/dUeBqEWirNhJqvYdM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P4Fyy7YT2ftKN89sADvdK5erj/kKYidq1mT9LIkll6Y=; b=W
 LxrJAfMpnRwpBeavqcFhKApkz/fGOtoNR6JDUuvrTfMRjsLtRtnGlJ3I9QyioZvla8yetZ8CqF8if
 TvNeX4FCncRKWG+Zd/QtGTLKFJJBus8t42jyM7aHZIg572ASnRPPM7I/ew//q8nmWpnGIJiMQZF7O
 0rRS7WtDGu5vAnJ0=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU4dB-00Cd46-JP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 07:28:48 +0000
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 81610F6D42798996CD6A;
 Fri, 24 May 2019 15:28:38 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 May 2019 15:28:38 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 24 May 2019 15:28:37 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 24 May 2019 15:28:11 +0800
Message-ID: <20190524072811.104813-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme707-chm.china.huawei.com (10.1.199.103) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
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
X-Headers-End: 1hU4dB-00Cd46-JP
Subject: [f2fs-dev] [PATCH] f2fs-tools: calculate inode checksum and
 writeback
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Xue Liu <liuxueliu.liu@huawei.com>

Calculate inode checksum and writeback when processing
sload or resize.

Signed-off-by: Xue Liu <liuxueliu.liu@huawei.com>
[Chao Yu: change commit message and code]
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- move write_inode() to libf2fs.c for more callers.
- cover missing case in f2fs_add_link.
- clean up update_data_blkaddr() with write_inode().
- don't assert in write_inode().
 fsck/dir.c         |  2 +-
 fsck/mount.c       | 10 +++++-----
 fsck/segment.c     | 14 +++-----------
 fsck/xattr.c       |  3 +--
 include/f2fs_fs.h  |  1 +
 lib/libf2fs.c      |  8 ++++++++
 mkfs/f2fs_format.c | 18 +++---------------
 7 files changed, 22 insertions(+), 34 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 592d9db..1e21294 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -319,7 +319,7 @@ add_dentry:
 
 	if (dn.idirty) {
 		ASSERT(parent == dn.inode_blk);
-		ret = dev_write_block(dn.inode_blk, p_blkaddr);
+		ret = write_inode(dn.inode_blk, p_blkaddr);
 		ASSERT(ret >= 0);
 	}
 
diff --git a/fsck/mount.c b/fsck/mount.c
index aecd0cd..1c5cd93 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1812,14 +1812,15 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 
 		oldaddr = le32_to_cpu(node_blk->i.i_addr[ofs + ofs_in_node]);
 		node_blk->i.i_addr[ofs + ofs_in_node] = cpu_to_le32(newaddr);
+		ret = write_inode(node_blk, ni.blk_addr);
+		ASSERT(ret >= 0);
 	} else {
 		oldaddr = le32_to_cpu(node_blk->dn.addr[ofs_in_node]);
 		node_blk->dn.addr[ofs_in_node] = cpu_to_le32(newaddr);
+		ret = dev_write_block(node_blk, ni.blk_addr);
+		ASSERT(ret >= 0);
 	}
 
-	ret = dev_write_block(node_blk, ni.blk_addr);
-	ASSERT(ret >= 0);
-
 	/* check extent cache entry */
 	if (node_blk->footer.nid != node_blk->footer.ino) {
 		get_node_info(sbi, le32_to_cpu(node_blk->footer.ino), &ni);
@@ -1835,8 +1836,7 @@ void update_data_blkaddr(struct f2fs_sb_info *sbi, nid_t nid,
 		node_blk->i.i_ext.len = 0;
 
 		/* update inode block */
-		ret = dev_write_block(node_blk, ni.blk_addr);
-		ASSERT(ret >= 0);
+		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
 	}
 	free(node_blk);
 }
diff --git a/fsck/segment.c b/fsck/segment.c
index f26e623..1b58b70 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -16,14 +16,6 @@
 #include "fsck.h"
 #include "node.h"
 
-static void write_inode(u64 blkaddr, struct f2fs_node *inode)
-{
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
-		inode->i.i_inode_checksum =
-			cpu_to_le32(f2fs_inode_chksum(inode));
-	ASSERT(dev_write_block(inode, blkaddr) >= 0);
-}
-
 int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 			struct f2fs_summary *sum, int type)
 {
@@ -278,7 +270,7 @@ u64 f2fs_write(struct f2fs_sb_info *sbi, nid_t ino, u8 *buffer,
 	}
 	if (idirty) {
 		ASSERT(inode == dn.inode_blk);
-		write_inode(ni.blk_addr, inode);
+		ASSERT(write_inode(inode, ni.blk_addr) >= 0);
 	}
 	if (index_node)
 		free(index_node);
@@ -303,7 +295,7 @@ void f2fs_filesize_update(struct f2fs_sb_info *sbi, nid_t ino, u64 filesize)
 
 	inode->i.i_size = cpu_to_le64(filesize);
 
-	write_inode(ni.blk_addr, inode);
+	ASSERT(write_inode(inode, ni.blk_addr) >= 0);
 	free(inode);
 }
 
@@ -348,7 +340,7 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 		ASSERT((unsigned long)n == de->size);
 		memcpy(inline_data_addr(node_blk), buffer, de->size);
 		node_blk->i.i_size = cpu_to_le64(de->size);
-		write_inode(ni.blk_addr, node_blk);
+		ASSERT(write_inode(node_blk, ni.blk_addr) >= 0);
 		free(node_blk);
 	} else {
 		while ((n = read(fd, buffer, BLOCK_SZ)) > 0) {
diff --git a/fsck/xattr.c b/fsck/xattr.c
index b13e5ee..98cbb0c 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -223,8 +223,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
 	write_all_xattrs(sbi, inode, new_hsize, base_addr);
 
 	/* inode need update */
-	ret = dev_write_block(inode, ni.blk_addr);
-	ASSERT(ret >= 0);
+	ASSERT(write_inode(inode, ni.blk_addr) >= 0);
 exit:
 	free(inode);
 	free(base_addr);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 1890975..120f861 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1145,6 +1145,7 @@ extern int log_base_2(u_int32_t);
 extern unsigned int addrs_per_inode(struct f2fs_inode *);
 extern __u32 f2fs_inode_chksum(struct f2fs_node *);
 extern __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *);
+extern int write_inode(struct f2fs_node *, u64);
 
 extern int get_bits_in_byte(unsigned char n);
 extern int test_and_set_bit_le(u32, u8 *);
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 986bf29..88ab70f 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -546,6 +546,14 @@ __u32 f2fs_checkpoint_chksum(struct f2fs_checkpoint *cp)
 	return chksum;
 }
 
+int write_inode(struct f2fs_node *inode, u64 blkaddr)
+{
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
+		inode->i.i_inode_checksum =
+			cpu_to_le32(f2fs_inode_chksum(inode));
+	return dev_write_block(inode, blkaddr);
+}
+
 /*
  * try to identify the root device
  */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f2265bb..8f41052 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1149,10 +1149,6 @@ static int f2fs_write_root_inode(void)
 	raw_node->i.i_ext.blk_addr = 0;
 	raw_node->i.i_ext.len = 0;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
-		raw_node->i.i_inode_checksum =
-			cpu_to_le32(f2fs_inode_chksum(raw_node));
-
 	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
 	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
 					c.blks_per_seg;
@@ -1161,7 +1157,7 @@ static int f2fs_write_root_inode(void)
 			get_sb(main_blkaddr),
 			c.cur_seg[CURSEG_HOT_NODE],
 			c.blks_per_seg, main_area_node_seg_blk_offset);
-	if (dev_write_block(raw_node, main_area_node_seg_blk_offset)) {
+	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
 		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
 		free(raw_node);
 		return -1;
@@ -1320,10 +1316,6 @@ static int f2fs_write_qf_inode(int qtype)
 	raw_node->i.i_ext.blk_addr = 0;
 	raw_node->i.i_ext.len = 0;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
-		raw_node->i.i_inode_checksum =
-			cpu_to_le32(f2fs_inode_chksum(raw_node));
-
 	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
 	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
 					c.blks_per_seg + qtype + 1;
@@ -1332,7 +1324,7 @@ static int f2fs_write_qf_inode(int qtype)
 			get_sb(main_blkaddr),
 			c.cur_seg[CURSEG_HOT_NODE],
 			c.blks_per_seg, main_area_node_seg_blk_offset);
-	if (dev_write_block(raw_node, main_area_node_seg_blk_offset)) {
+	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
 		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
 		free(raw_node);
 		return -1;
@@ -1507,10 +1499,6 @@ static int f2fs_write_lpf_inode(void)
 	}
 	raw_node->i.i_addr[get_extra_isize(raw_node)] = cpu_to_le32(data_blk_nor);
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
-		raw_node->i.i_inode_checksum =
-			cpu_to_le32(f2fs_inode_chksum(raw_node));
-
 	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
 	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
 		c.blks_per_seg + c.quota_inum + 1;
@@ -1519,7 +1507,7 @@ static int f2fs_write_lpf_inode(void)
 			get_sb(main_blkaddr),
 			c.cur_seg[CURSEG_HOT_NODE],
 			c.blks_per_seg, main_area_node_seg_blk_offset);
-	if (dev_write_block(raw_node, main_area_node_seg_blk_offset)) {
+	if (write_inode(raw_node, main_area_node_seg_blk_offset) < 0) {
 		MSG(1, "\tError: While writing the raw_node to disk!!!\n");
 		err = -1;
 		goto exit;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
