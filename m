Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B79C0360
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2019 12:23:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDnPV-0003uQ-An; Fri, 27 Sep 2019 10:23:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iDnPT-0003tv-CS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 10:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o8SDA8NzTe6oqqBMRkIXScut+68Du9/flmV8txoeMuY=; b=URYVgCbHxwiee2MWnEEDGtBh2S
 NcTy/+Guxk6+s/wMaKfbioXujmIvQSs4oB9bJrQo1lJ4rYVBoRGIEYQHmdGEV5pOg7SwjJF1t7Me4
 HNC2+GHCRtIG0ZyMwDQtb4Fl1fGpq7BeLDaEBDQotyjEMh3U5R56TupKl7pEXXV5bRtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o8SDA8NzTe6oqqBMRkIXScut+68Du9/flmV8txoeMuY=; b=Y
 jpT7ohH8y7mwmDsKpo6CK+Kn5w3hL0VYy573FvWwQ7K87gF/olX9zd1MeeniacC2ntFkq1XDgPk2S
 EQlHk6qs/et60QVRQZR4YhwNyUDNzZx7PMBHXH+3tZs5VxI/YYUhktaYM/6/K0wIgEP4dXteW3zIX
 oQpsUy4SHbfgH/Ik=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDnPP-00B2qF-1n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 10:23:35 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 144E8CBF1D1123BF5CD5;
 Fri, 27 Sep 2019 18:23:24 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Fri, 27 Sep 2019 18:23:14 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 27 Sep 2019 18:23:05 +0800
Message-ID: <20190927102305.11587-1-yuchao0@huawei.com>
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
X-Headers-End: 1iDnPP-00B2qF-1n
Subject: [f2fs-dev] [PATCH] f2fs: fix inconsistent comments
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

Lack of maintenance on comments may mislead developers, fix them.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c | 18 ++++--------------
 fs/f2fs/data.c       | 19 ++++++-------------
 fs/f2fs/f2fs.h       |  2 +-
 fs/f2fs/file.c       |  1 -
 fs/f2fs/gc.c         |  5 ++++-
 fs/f2fs/inode.c      |  2 +-
 fs/f2fs/namei.c      |  2 +-
 fs/f2fs/node.c       |  6 +-----
 fs/f2fs/shrinker.c   |  2 +-
 fs/f2fs/super.c      |  4 ++--
 fs/f2fs/xattr.c      |  1 -
 11 files changed, 21 insertions(+), 41 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index a0eef95b9e0e..c9f68b7e2663 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -50,9 +50,6 @@ struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
 	return page;
 }
 
-/*
- * We guarantee no failure on the returned page.
- */
 static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 							bool is_meta)
 {
@@ -206,7 +203,7 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 }
 
 /*
- * Readahead CP/NAT/SIT/SSA pages
+ * Readahead CP/NAT/SIT/SSA/POR pages
  */
 int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 							int type, bool sync)
@@ -898,7 +895,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 	/*
 	 * Finding out valid cp block involves read both
-	 * sets( cp pack1 and cp pack 2)
+	 * sets( cp pack 1 and cp pack 2)
 	 */
 	cp_start_blk_no = le32_to_cpu(fsb->cp_blkaddr);
 	cp1 = validate_checkpoint(sbi, cp_start_blk_no, &cp1_version);
@@ -1387,10 +1384,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
 					!f2fs_cp_error(sbi));
 
-	/*
-	 * modify checkpoint
-	 * version number is already updated
-	 */
+	/* start to update checkpoint, cp ver is already updated previously */
 	ckpt->elapsed_time = cpu_to_le64(get_mtime(sbi, true));
 	ckpt->free_segment_count = cpu_to_le32(free_segments(sbi));
 	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
@@ -1543,9 +1537,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	return unlikely(f2fs_cp_error(sbi)) ? -EIO : 0;
 }
 
-/*
- * We guarantee that this checkpoint procedure will not fail.
- */
 int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 {
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
@@ -1613,7 +1604,6 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	f2fs_flush_sit_entries(sbi, cpc);
 
-	/* unlock all the fs_lock[] in do_checkpoint() */
 	err = do_checkpoint(sbi, cpc);
 	if (err)
 		f2fs_release_discard_addrs(sbi);
@@ -1626,7 +1616,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	if (cpc->reason & CP_RECOVERY)
 		f2fs_notice(sbi, "checkpoint: version = %llx", ckpt_ver);
 
-	/* do checkpoint periodically */
+	/* update CP_TIME to trigger checkpoint periodically */
 	f2fs_update_time(sbi, CP_TIME);
 	trace_f2fs_write_checkpoint(sbi->sb, cpc->reason, "finish checkpoint");
 out:
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5755e897a5f0..87a6d34db34a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -234,9 +234,6 @@ static void f2fs_write_end_io(struct bio *bio)
 	bio_put(bio);
 }
 
-/*
- * Return true, if pre_bio's bdev is same as its target device.
- */
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 				block_t blk_addr, struct bio *bio)
 {
@@ -273,6 +270,9 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 	return 0;
 }
 
+/*
+ * Return true, if pre_bio's bdev is same as its target device.
+ */
 static bool __same_bdev(struct f2fs_sb_info *sbi,
 				block_t blk_addr, struct bio *bio)
 {
@@ -280,9 +280,6 @@ static bool __same_bdev(struct f2fs_sb_info *sbi,
 	return bio->bi_disk == b->bd_disk && bio->bi_partno == b->bd_partno;
 }
 
-/*
- * Low-level block read/write IO operations.
- */
 static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 {
 	struct f2fs_sb_info *sbi = fio->sbi;
@@ -1142,13 +1139,9 @@ void __do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
 }
 
 /*
- * f2fs_map_blocks() now supported readahead/bmap/rw direct_IO with
- * f2fs_map_blocks structure.
- * If original data blocks are allocated, then give them to blockdev.
- * Otherwise,
- *     a. preallocate requested block addresses
- *     b. do not use extent cache for better performance
- *     c. give the block addresses to blockdev
+ * f2fs_map_blocks() tries to find or build mapping relationship which
+ * maps continuous logical blocks to physical blocks, and return such
+ * info via f2fs_map_blocks structure.
  */
 int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 						int create, int flag)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f078cd20dab8..aa2e6ddccdbf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2291,9 +2291,9 @@ static inline block_t datablock_addr(struct inode *inode,
 
 	raw_node = F2FS_NODE(node_page);
 
-	/* from GC path only */
 	if (is_inode) {
 		if (!inode)
+			/* from GC path only */
 			base = offset_in_addr(&raw_node->i);
 		else if (f2fs_has_extra_attr(inode))
 			base = get_extra_isize(inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 29bc0a542759..6ddb2f1964a9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -89,7 +89,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		goto out_sem;
 	}
 
-	/* fill the page */
 	f2fs_wait_on_page_writeback(page, DATA, false, true);
 
 	/* wait for GCed page writeback via META_MAPPING */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5877bd729689..9f6df84eb9e2 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -192,7 +192,10 @@ static void select_policy(struct f2fs_sb_info *sbi, int gc_type,
 		p->ofs_unit = sbi->segs_per_sec;
 	}
 
-	/* we need to check every dirty segments in the FG_GC case */
+	/*
+	 * adjust candidates range, should select all dirty segments for
+	 * foreground GC and urgent GC cases.
+	 */
 	if (gc_type != FG_GC &&
 			(sbi->gc_mode != GC_URGENT) &&
 			p->max_search > sbi->max_victim_search)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 8547b6f7921b..540280cee614 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -718,7 +718,7 @@ void f2fs_evict_inode(struct inode *inode)
 	else
 		f2fs_inode_synced(inode);
 
-	/* ino == 0, if f2fs_new_inode() was failed t*/
+	/* for the case f2fs_new_inode() was failed, .i_ino is zero, skip it */
 	if (inode->i_ino)
 		invalidate_mapping_pages(NODE_MAPPING(sbi), inode->i_ino,
 							inode->i_ino);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 4faf06e8bf89..c19ffcf1d987 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -167,7 +167,7 @@ static inline int is_extension_exist(const unsigned char *s, const char *sub)
 }
 
 /*
- * Set multimedia files as cold files for hot/cold data separation
+ * Set file's temperature for hot/cold data separation
  */
 static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
 		const unsigned char *name)
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 8b66bc4c004b..d35e7f953c13 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -510,9 +510,6 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
 	return nr - nr_shrink;
 }
 
-/*
- * This function always returns success
- */
 int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 						struct node_info *ni)
 {
@@ -716,8 +713,7 @@ static int get_node_path(struct inode *inode, long block,
 /*
  * Caller should call f2fs_put_dnode(dn).
  * Also, it should grab and release a rwsem by calling f2fs_lock_op() and
- * f2fs_unlock_op() only if ro is not set RDONLY_NODE.
- * In the case of RDONLY_NODE, we don't need to care about mutex.
+ * f2fs_unlock_op() only if mode is set with ALLOC_NODE.
  */
 int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 {
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index a467aca29cfe..d66de5999a26 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -58,7 +58,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 		/* count extent cache entries */
 		count += __count_extent_cache(sbi);
 
-		/* shrink clean nat cache entries */
+		/* count clean nat cache entries */
 		count += __count_nat_entries(sbi);
 
 		/* count free nids cache entries */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1443cee15863..ce012b6a9eb0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1552,7 +1552,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 out_unlock:
 	mutex_unlock(&sbi->gc_mutex);
 restore_flag:
-	sbi->sb->s_flags = s_flags;	/* Restore MS_RDONLY status */
+	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
 	return err;
 }
 
@@ -3477,7 +3477,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 			f2fs_err(sbi, "Cannot turn on quotas: error %d", err);
 	}
 #endif
-	/* if there are nt orphan nodes free them */
+	/* if there are any orphan inodes, free them */
 	err = f2fs_recover_orphan_inodes(sbi);
 	if (err)
 		goto free_meta;
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 181900af2576..66a04143768f 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -746,7 +746,6 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 	f2fs_balance_fs(sbi, true);
 
 	f2fs_lock_op(sbi);
-	/* protect xattr_ver */
 	down_write(&F2FS_I(inode)->i_sem);
 	down_write(&F2FS_I(inode)->i_xattr_sem);
 	err = __f2fs_setxattr(inode, index, name, value, size, ipage, flags);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
