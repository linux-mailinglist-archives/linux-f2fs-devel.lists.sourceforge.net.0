Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A293AE1AF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jun 2021 04:40:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lv9qv-0004ZW-Ey; Mon, 21 Jun 2021 02:39:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lv9qr-0004Yz-To
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tsJ61h0AgoG/xUG3N/uetUq7Vw6vMvzwDahbSzOsomI=; b=jqe/XJYAqaQna0/LqhQLQbYIuF
 YmeMJ1d/JCn1vQb7zRONp0gGxOKI/Vx+SFjL7dx8Vz/pl9VUDP1qsP+cWO1N2gAW3LBtYjQDwH1gD
 f+rEnxGt9jH4b0WXnfACEfkViHSeTFjTqF9VrTYt3XAq30h+bRM9J5kd/R0Np1iDQEdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tsJ61h0AgoG/xUG3N/uetUq7Vw6vMvzwDahbSzOsomI=; b=R37gbspDI3LU3Eddd2iDSG0o5o
 mwT1rIeIdq6PJBQdld7llCJKqN6Mn/EDWCIREmN0MBK3J/8fd8JH/ZqE2pzH1T1oaitBlxl7RmXrk
 Z+TiiEn+B6/4HAL4WzuECh8UllN9vkf6XMeEBcXTqzftV11e5qPPW6lZmCNsmu+24FhE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lv9ql-00056A-M7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:39:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1548611ED;
 Mon, 21 Jun 2021 02:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624243183;
 bh=ctC4ZIZkoHOzjqiRQmUCwmAbQYieSLtKqOJTo8WuBRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rJgcoKCtJ6Kb795ql+8HRzsh2P71Y48C+hYsWcSw3fM/nLfb1bY57KyU2k1x+t10X
 6RvHblCYfI27wFOCatZ3sWU25+RJn03M+yBkoBNr2lSg4VYS64oPp/iIEilk+W6Xqe
 fJeyJb3zgVBRJfDq0hIM0AAd1eA2yGd0oKcEX9t/RYyz6MxXdS8tn1pFMWyqVdoNdI
 plqvhqHhuNCkxgidECPW/BBDaWO1E3BvIIOcWEfY/v+4JSlMZNWcSKBMqe/oXIm6k7
 qi9/ML80osjyHM57eit2XTs4kD8zwlUePhp+cBygPZoBH27TExWY1dwwNTPxrpI3uK
 p3i+U+Jjtc88g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Jun 2021 19:39:39 -0700
Message-Id: <20210621023939.1510591-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210621023939.1510591-1-jaegeuk@kernel.org>
References: <20210621023939.1510591-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [198.145.29.99 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lv9ql-00056A-M7
Subject: [f2fs-dev] [PATCH 4/4] f2fs-tools: add extent cache for each file
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

This patch adds an extent cache for ro partition.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/f2fs.h    |   8 ++++
 fsck/mount.c   |   8 ----
 fsck/segment.c | 105 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+), 8 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 9c6b0e4ad7b0..7fb328ff8861 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -527,6 +527,14 @@ static inline bool IS_VALID_BLK_ADDR(struct f2fs_sb_info *sbi, u32 addr)
 	return 1;
 }
 
+static inline bool is_valid_data_blkaddr(block_t blkaddr)
+{
+	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR ||
+				blkaddr == COMPRESS_ADDR)
+		return 0;
+	return 1;
+}
+
 static inline int IS_CUR_SEGNO(struct f2fs_sb_info *sbi, u32 segno)
 {
 	int i;
diff --git a/fsck/mount.c b/fsck/mount.c
index 598410e5f4fa..1f2d7e059454 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -582,14 +582,6 @@ void print_sb_state(struct f2fs_super_block *sb)
 	MSG(0, "\n");
 }
 
-static inline bool is_valid_data_blkaddr(block_t blkaddr)
-{
-	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR ||
-				blkaddr == COMPRESS_ADDR)
-		return 0;
-	return 1;
-}
-
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
diff --git a/fsck/segment.c b/fsck/segment.c
index 0156690ed9aa..fe63615423f7 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -450,6 +450,109 @@ u64 f2fs_fix_mutable(struct f2fs_sb_info *sbi, nid_t ino, pgoff_t offset,
 	return 0;
 }
 
+static inline int is_consecutive(u32 prev_addr, u32 cur_addr)
+{
+	if (is_valid_data_blkaddr(cur_addr) && (cur_addr == prev_addr + 1))
+		return 1;
+	return 0;
+}
+
+static inline void copy_extent_info(struct extent_info *t_ext,
+				struct extent_info *s_ext)
+{
+	t_ext->fofs = s_ext->fofs;
+	t_ext->blk = s_ext->blk;
+	t_ext->len = s_ext->len;
+}
+
+static inline void update_extent_info(struct f2fs_node *inode,
+				struct extent_info *ext)
+{
+	inode->i.i_ext.fofs = cpu_to_le32(ext->fofs);
+	inode->i.i_ext.blk_addr = cpu_to_le32(ext->blk);
+	inode->i.i_ext.len = cpu_to_le32(ext->len);
+}
+
+static void update_largest_extent(struct f2fs_sb_info *sbi, nid_t ino)
+{
+	struct dnode_of_data dn;
+	struct node_info ni;
+	struct f2fs_node *inode;
+	u32 blkaddr, prev_blkaddr, cur_blk = 0, end_blk;
+	struct extent_info largest_ext, cur_ext;
+	u64 remained_blkentries = 0;
+	u32 cluster_size;
+	int count;
+	void *index_node = NULL;
+
+	memset(&dn, 0, sizeof(dn));
+	largest_ext.len = cur_ext.len = 0;
+
+	inode = (struct f2fs_node *) calloc(BLOCK_SZ, 1);
+	ASSERT(inode);
+
+	/* Read inode info */
+	get_node_info(sbi, ino, &ni);
+	ASSERT(dev_read_block(inode, ni.blk_addr) >= 0);
+	cluster_size = 1 << inode->i.i_log_cluster_size;
+
+	if (inode->i.i_inline & F2FS_INLINE_DATA)
+		goto exit;
+
+	end_blk  = f2fs_max_file_offset(&inode->i) >> F2FS_BLKSIZE_BITS;
+
+	while (cur_blk <= end_blk) {
+		if (remained_blkentries == 0) {
+			set_new_dnode(&dn, inode, NULL, ino);
+			get_dnode_of_data(sbi, &dn, cur_blk, LOOKUP_NODE);
+			if (index_node)
+				free(index_node);
+			index_node = (dn.node_blk == dn.inode_blk) ?
+				NULL : dn.node_blk;
+			remained_blkentries = ADDRS_PER_PAGE(sbi,
+					dn.node_blk, dn.inode_blk);
+		}
+		ASSERT(remained_blkentries > 0);
+
+		blkaddr = datablock_addr(dn.node_blk, dn.ofs_in_node);
+		if (cur_ext.len > 0) {
+			if (is_consecutive(prev_blkaddr, blkaddr))
+				cur_ext.len++;
+			else {
+				if (cur_ext.len > largest_ext.len)
+					copy_extent_info(&largest_ext,
+							&cur_ext);
+				cur_ext.len = 0;
+			}
+		}
+
+		if (cur_ext.len == 0 && is_valid_data_blkaddr(blkaddr)) {
+			cur_ext.fofs = cur_blk;
+			cur_ext.len = 1;
+			cur_ext.blk = blkaddr;
+		}
+
+		prev_blkaddr = blkaddr;
+		count = blkaddr == COMPRESS_ADDR ? cluster_size : 1;
+		cur_blk += count;
+		dn.ofs_in_node += count;
+		remained_blkentries -= count;
+		ASSERT(remained_blkentries >= 0);
+	}
+
+exit:
+	if (cur_ext.len > largest_ext.len)
+		copy_extent_info(&largest_ext, &cur_ext);
+	if (largest_ext.len > 0) {
+		update_extent_info(inode, &largest_ext);
+		ASSERT(write_inode(inode, ni.blk_addr) >= 0);
+	}
+
+	if (index_node)
+		free(index_node);
+	free(inode);
+}
+
 int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 {
 	int fd, n;
@@ -595,6 +698,8 @@ int f2fs_build_file(struct f2fs_sb_info *sbi, struct dentry *de)
 	if (n < 0)
 		return -1;
 
+	if (!c.compress.enabled || (c.feature & cpu_to_le32(F2FS_FEATURE_RO)))
+		update_largest_extent(sbi, de->ino);
 	update_free_segments(sbi);
 
 	MSG(1, "Info: Create %s -> %s\n"
-- 
2.32.0.288.g62a8d224e6-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
