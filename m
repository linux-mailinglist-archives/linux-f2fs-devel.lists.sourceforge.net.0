Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7055815C4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 11:44:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huZXc-0007FC-Hm; Mon, 05 Aug 2019 09:44:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huZXa-0007Ei-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 09:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rIdVpa9TPezEZkyLREFqqn9YeJJHghxoK5k4ikp9SUE=; b=E5hSNDq/gx8hSMUGt5LQbNBlrh
 f087IFzVyXBQMgAZrzn+K8fovrLZ7xKQWHxoY68EOvjTLsMqCu5vLOeApvE90eRPNmVrhG6CWGaH2
 TJBvn7MfxJCRDg57GolA1HYGK7D6lCPZmVBa/mNl1MaYEZ6oFmB0ZUcJGnHUqbqLVaCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rIdVpa9TPezEZkyLREFqqn9YeJJHghxoK5k4ikp9SUE=; b=H
 5bTfiecdIJNksVep9v4IUj3ucchGbcDTzfkdx7zpH5gonVbGxDZTsCuvY7nC8CLy8kqcpCoJrXfxX
 HYVezogsMJfV8QfvpTsscTYwSbLrkwwAyYCbhA2fnb7SzA9uQNuHcdYsCCRON5TwXrhrFIDKdJAxG
 swFchz+XUIgMHlQA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huZXY-00BUAO-6s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 09:44:30 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id A106714B67F677F65158;
 Mon,  5 Aug 2019 17:44:18 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Mon, 5 Aug 2019 17:44:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 5 Aug 2019 17:44:06 +0800
Message-ID: <20190805094406.21614-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huZXY-00BUAO-6s
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix stat update in sload/fsck
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

Change logic as below:
- fix to account block/node/inode stats correctly in reserve_new_block()
- check overflow in reserve_new_block()
- move stat update from f2fs_alloc_nid() to reserve_new_block()
- adjust write_checkpoint() to update stat for sload/fsck

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/dir.c     |  8 ++++----
 fsck/fsck.c    |  3 +++
 fsck/fsck.h    |  4 ++--
 fsck/mount.c   | 12 +++++++++++-
 fsck/node.c    | 15 ++++-----------
 fsck/segment.c | 25 ++++++++++++++++++++++---
 fsck/xattr.c   |  2 +-
 7 files changed, 47 insertions(+), 22 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 0984d26..5f4f75e 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -363,7 +363,7 @@ static void make_empty_dir(struct f2fs_sb_info *sbi, struct f2fs_node *inode)
 	test_and_set_bit_le(1, dent_blk->dentry_bitmap);
 
 	set_summary(&sum, ino, 0, ni.version);
-	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_DATA);
+	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_DATA, 0);
 	ASSERT(!ret);
 
 	ret = dev_write_block(dent_blk, blkaddr);
@@ -399,7 +399,7 @@ static void page_symlink(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 	memcpy(data_blk, symname, symlen);
 
 	set_summary(&sum, ino, 0, ni.version);
-	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_WARM_DATA);
+	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_WARM_DATA, 1);
 	ASSERT(!ret);
 
 	ret = dev_write_block(data_blk, blkaddr);
@@ -673,7 +673,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 	child = calloc(BLOCK_SZ, 1);
 	ASSERT(child);
 
-	f2fs_alloc_nid(sbi, &de->ino, 1);
+	f2fs_alloc_nid(sbi, &de->ino);
 
 	init_inode_block(sbi, child, de);
 
@@ -690,7 +690,7 @@ int f2fs_create(struct f2fs_sb_info *sbi, struct dentry *de)
 
 	/* write child */
 	set_summary(&sum, de->ino, 0, ni.version);
-	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE);
+	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_HOT_NODE, 1);
 	ASSERT(!ret);
 
 	/* update nat info */
diff --git a/fsck/fsck.c b/fsck/fsck.c
index ccebad1..e835a22 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2056,6 +2056,9 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 	int ret;
 	u_int32_t crc = 0;
 
+	/* should call from fsck */
+	ASSERT(c.func == FSCK);
+
 	if (is_set_ckpt_flags(cp, CP_ORPHAN_PRESENT_FLAG)) {
 		orphan_blks = __start_sum_addr(sbi) - 1;
 		flags |= CP_ORPHAN_PRESENT_FLAG;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 5733785..aabe4a3 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -241,11 +241,11 @@ int f2fs_sload(struct f2fs_sb_info *);
 
 /* segment.c */
 int reserve_new_block(struct f2fs_sb_info *, block_t *,
-					struct f2fs_summary *, int);
+					struct f2fs_summary *, int, bool);
 int new_data_block(struct f2fs_sb_info *, void *,
 					struct dnode_of_data *, int);
 int f2fs_build_file(struct f2fs_sb_info *, struct dentry *);
-void f2fs_alloc_nid(struct f2fs_sb_info *, nid_t *, int);
+void f2fs_alloc_nid(struct f2fs_sb_info *, nid_t *);
 void set_data_blkaddr(struct dnode_of_data *);
 block_t new_node_block(struct f2fs_sb_info *,
 					struct dnode_of_data *, unsigned int);
diff --git a/fsck/mount.c b/fsck/mount.c
index e5f7f3b..0d378e5 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2548,7 +2548,17 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	}
 
 	set_cp(free_segment_count, get_free_segments(sbi));
-	set_cp(valid_block_count, sbi->total_valid_block_count);
+	if (c.func == FSCK) {
+		struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
+
+		set_cp(valid_block_count, fsck->chk.valid_blk_cnt);
+		set_cp(valid_node_count, fsck->chk.valid_node_cnt);
+		set_cp(valid_inode_count, fsck->chk.valid_inode_cnt);
+	} else {
+		set_cp(valid_block_count, sbi->total_valid_block_count);
+		set_cp(valid_node_count, sbi->total_valid_node_count);
+		set_cp(valid_inode_count, sbi->total_valid_inode_count);
+	}
 	set_cp(cp_pack_total_block_count, 8 + orphan_blks + get_sb(cp_payload));
 
 	flags = update_nat_bits_flags(sb, cp, flags);
diff --git a/fsck/node.c b/fsck/node.c
index 882f355..6bb5484 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -16,11 +16,10 @@
 #include "fsck.h"
 #include "node.h"
 
-void f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid, int inode)
+void f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
-	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
-	nid_t i, inode_cnt, node_cnt;
+	nid_t i;
 
 	for (i = 0; i < nm_i->max_nid; i++)
 		if(f2fs_test_bit(i, nm_i->nid_bitmap) == 0)
@@ -29,12 +28,6 @@ void f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid, int inode)
 	ASSERT(i < nm_i->max_nid);
 	f2fs_set_bit(i, nm_i->nid_bitmap);
 	*nid = i;
-
-	inode_cnt = get_cp(valid_inode_count);
-	node_cnt = get_cp(valid_node_count);
-	if (inode)
-		set_cp(valid_inode_count, inode_cnt + 1);
-	set_cp(valid_node_count, node_cnt + 1);
 }
 
 void set_data_blkaddr(struct dnode_of_data *dn)
@@ -87,7 +80,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 
 	get_node_info(sbi, dn->nid, &ni);
 	set_summary(&sum, dn->nid, 0, ni.version);
-	ret = reserve_new_block(sbi, &blkaddr, &sum, type);
+	ret = reserve_new_block(sbi, &blkaddr, &sum, type, !ofs);
 	if (ret) {
 		free(node_blk);
 		return 0;
@@ -216,7 +209,7 @@ int get_dnode_of_data(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
 				c.alloc_failed = 1;
 				return -EINVAL;
 			}
-			f2fs_alloc_nid(sbi, &nids[i], 0);
+			f2fs_alloc_nid(sbi, &nids[i]);
 
 			dn->nid = nids[i];
 
diff --git a/fsck/segment.c b/fsck/segment.c
index 367865a..2d18358 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -17,12 +17,13 @@
 #include "node.h"
 
 int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
-			struct f2fs_summary *sum, int type)
+			struct f2fs_summary *sum, int type, bool is_inode)
 {
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct seg_entry *se;
 	u64 blkaddr, offset;
 	u64 old_blkaddr = *to;
+	bool is_node = IS_NODESEG(type);
 
 	if (old_blkaddr == NULL_ADDR) {
 		if (c.func == FSCK) {
@@ -30,12 +31,22 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 				ERR_MSG("Not enough space");
 				return -ENOSPC;
 			}
+			if (is_node && fsck->chk.valid_node_cnt >=
+					sbi->total_valid_node_count) {
+				ERR_MSG("Not enough space for node block");
+				return -ENOSPC;
+			}
 		} else {
 			if (sbi->total_valid_block_count >=
 						sbi->user_block_count) {
 				ERR_MSG("Not enough space");
 				return -ENOSPC;
 			}
+			if (is_node && sbi->total_valid_node_count >=
+						sbi->total_node_count) {
+				ERR_MSG("Not enough space for node block");
+				return -ENOSPC;
+			}
 		}
 	}
 
@@ -58,10 +69,18 @@ int reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 
 	if (old_blkaddr == NULL_ADDR) {
 		sbi->total_valid_block_count++;
+		if (is_node) {
+			sbi->total_valid_node_count++;
+			if (is_inode)
+				sbi->total_valid_inode_count++;
+		}
 		if (c.func == FSCK) {
 			fsck->chk.valid_blk_cnt++;
-			if (IS_NODESEG(type))
+			if (is_node) {
 				fsck->chk.valid_node_cnt++;
+				if (is_inode)
+					fsck->chk.valid_inode_cnt++;
+			}
 		}
 	}
 	se->dirty = 1;
@@ -92,7 +111,7 @@ int new_data_block(struct f2fs_sb_info *sbi, void *block,
 
 	get_node_info(sbi, dn->nid, &ni);
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
-	ret = reserve_new_block(sbi, &dn->data_blkaddr, &sum, type);
+	ret = reserve_new_block(sbi, &dn->data_blkaddr, &sum, type, 0);
 	if (ret) {
 		c.alloc_failed = 1;
 		return ret;
diff --git a/fsck/xattr.c b/fsck/xattr.c
index 98cbb0c..d51a08a 100644
--- a/fsck/xattr.c
+++ b/fsck/xattr.c
@@ -83,7 +83,7 @@ static void write_all_xattrs(struct f2fs_sb_info *sbi,
 		return;
 
 	if (!xnid) {
-		f2fs_alloc_nid(sbi, &new_nid, 0);
+		f2fs_alloc_nid(sbi, &new_nid);
 
 		set_new_dnode(&dn, inode, NULL, new_nid);
 		/* NAT entry would be updated by new_node_page. */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
