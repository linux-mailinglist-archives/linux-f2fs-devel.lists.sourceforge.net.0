Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 690613AE1AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jun 2021 04:39:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lv9qM-0002Ln-6N; Mon, 21 Jun 2021 02:39:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lv9qK-0002Lg-Ix
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tsJ61h0AgoG/xUG3N/uetUq7Vw6vMvzwDahbSzOsomI=; b=YTThDgTIro6hYbpEfsx0dxUhjB
 CRT91860EjAeGPvWOvZ9dsYsXXxLOnKVKr+yFTafU+4qfMjhbmPnv3RdhAOHP6K/wXmPsJ2EsCNp5
 FokylBZdfXIh0oIDb0QDeY2HZ+oeX1xaNgkhp0ml8vXr/gj6tjDsUIu5KYq4SYnQtmEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tsJ61h0AgoG/xUG3N/uetUq7Vw6vMvzwDahbSzOsomI=; b=d
 MD7e8RGoleSCn0/ZxWZe21O1U4c1EsZgx5NoSGwVoWs/FzSvuaUhauqAz8S59q0GebzqR+QlwcPjh
 Mz5X8SI2KAcEarI0zH4Y6of7qA6iHs69o2sxQ4cVWDZ4M5DkFa4arBa7eznHM13IDOsm2N0/+8tSW
 kaoK7qAgkdVwoo08=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lv9qJ-0004zs-7i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Jun 2021 02:39:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5255D60241;
 Mon, 21 Jun 2021 02:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624243150;
 bh=ctC4ZIZkoHOzjqiRQmUCwmAbQYieSLtKqOJTo8WuBRY=;
 h=From:To:Cc:Subject:Date:From;
 b=p8CXYiKXQnIUl4Pl7S5M4/jnAlbrXy/RPTAMzjMVj8VjeBi3L+qgxCuc3+nQwCYnw
 XPoD88Xp5bdgzQ9X1HByeU/tobKPqy8R0p5dq4juOw0fMEtLwTWjvQBxXz5GmEE5DT
 09bymOz0kH2kIk8uyV5QDHfsSvsl7tW1/LKttKaCoS4XMSlz8x1iVpbBP9V7m0rdRG
 b5xbhX/hQlh96PckQlV0PJYT06aCfLicHXL+7zpVAw5hjnz5R1wanqmoHjCB4DRFhu
 hFCVek7PSY6NryXEttkb8u1sJ1yqzYRtyd95NWiLhvQft26zDeE3g0bpkVAeHheQQv
 PMe/d+o9S/gYA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Jun 2021 19:39:08 -0700
Message-Id: <20210621023908.1510372-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [198.145.29.99 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lv9qJ-0004zs-7i
Subject: [f2fs-dev] [PATCH] f2fs-tools: add extent cache for each file
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
