Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889763A498
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFP-000835-98;
	Mon, 28 Nov 2022 09:16:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaFE-00081V-Dy for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8s3rxAzQu+htiUwLlh9QCIBBE1AS2bm0uC/WxXgSyLo=; b=mQzkd8GD0RqVTLGHGDZlinf/PK
 hNBGAK6TnIYjXI/lZ6qGu4cPxfzFRaOdFQWgNt8rfOZO+v87YJjYqmJk3J3FTgVYOv7ngZqdzTp2+
 82SEcwKF7IGTcwDboA6n5ETnQcjyWKW7Vj80SyLa3GyfOdssqHZMqeyUIgrC9su53v9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8s3rxAzQu+htiUwLlh9QCIBBE1AS2bm0uC/WxXgSyLo=; b=RUsXcCIxiBz4nEnKeSsPgPVnvY
 iiV+O9ortvXrFwUmvfJsJhoLEYISVRAxvhzqf8LN2TU7RqxYDTBPvuN8kK/bolELQk7mfR7We2OUD
 mciRknxv1TErMwZTwDqN8gPeoMzfrwWaz6MkYzdrxYA6NIvgqEJ25F3/DRxaHCCu0Eow=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaFC-00GRSH-0s for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8s3rxAzQu+htiUwLlh9QCIBBE1AS2bm0uC/WxXgSyLo=; b=YLHv9i/qDKYks/P5Tl8Zo6lna6
 kG/+qpB4Zrq/pdwe2H7IVwJBM+mG/V7rUXqXMorAYtOiFZm7nxPL52DG9TGcuZZRxmFF3F9fPJgus
 oSk0j6o1RjNGADoA7VdPmTcLUOsEutnFDDTk0bVk1qt+uzLa54wcuEjE06KpkFkshqrbdZYlb7Ffu
 N0jDF2xo2Lwczm12zSgigK2zhFiFT00G6qZA7JlgkXFC+1JoDirxuBgvHUKkidXRrF+rqa0t+FOVE
 TBwSyZdqEdwQBWHer5SIEBHnV54808JEuLhVrgAzCRvY04cbKUK2L9UFoCwjS5poIpAZ1aLYi/esd
 O3WZkgZg==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaF6-000Z0z-5P; Mon, 28 Nov 2022 09:16:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:20 +0100
Message-Id: <20221128091523.1242584-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The create argument is always identicaly to map->m_may_create,
 so use that consistently. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/f2fs/data.c | 32 ++++++++++ fs/f2fs/f2fs.h | 3 +-- fs/f2fs/file.c | 12
 ++++++------ include/trace/events/f2fs.h | 11 ++++---- [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ozaFC-00GRSH-0s
Subject: [f2fs-dev] [PATCH 12/15] f2fs: remove the create argument to
 f2fs_map_blocks
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

The create argument is always identicaly to map->m_may_create, so use
that consistently.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c              | 32 ++++++++++----------------------
 fs/f2fs/f2fs.h              |  3 +--
 fs/f2fs/file.c              | 12 ++++++------
 include/trace/events/f2fs.h | 11 ++++-------
 4 files changed, 21 insertions(+), 37 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2ae8fcf7cf49f4..730b58ba97c0ae 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1454,8 +1454,7 @@ int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
  * maps continuous logical blocks to physical blocks, and return such
  * info via f2fs_map_blocks structure.
  */
-int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
-						int create, int flag)
+int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 {
 	unsigned int maxblocks = map->m_len;
 	struct dnode_of_data dn;
@@ -1484,11 +1483,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	pgofs =	(pgoff_t)map->m_lblk;
 	end = pgofs + maxblocks;
 
-	if (!create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
-		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
-							map->m_may_create)
-			goto next_dnode;
-
+	if (!map->m_may_create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
 		map->m_pblk = ei.blk + pgofs - ei.fofs;
 		map->m_len = min((pgoff_t)maxblocks, ei.fofs + ei.len - pgofs);
 		map->m_flags = F2FS_MAP_MAPPED;
@@ -1501,18 +1496,12 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 						map->m_pblk, map->m_len);
 
 		if (map->m_multidev_dio) {
-			block_t blk_addr = map->m_pblk;
-
 			bidx = f2fs_target_device_index(sbi, map->m_pblk);
 
 			map->m_bdev = FDEV(bidx).bdev;
 			map->m_pblk -= FDEV(bidx).start_blk;
 			map->m_len = min(map->m_len,
 				FDEV(bidx).end_blk + 1 - map->m_pblk);
-
-			if (map->m_may_create)
-				f2fs_update_device_state(sbi, inode->i_ino,
-							blk_addr, map->m_len);
 		}
 		goto out;
 	}
@@ -1579,7 +1568,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 			set_inode_flag(inode, FI_APPEND_WRITE);
 		}
 	} else {
-		if (create) {
+		if (map->m_may_create) {
 			if (unlikely(f2fs_cp_error(sbi))) {
 				err = -EIO;
 				goto sync_out;
@@ -1753,7 +1742,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 out:
-	trace_f2fs_map_blocks(inode, map, create, flag, err);
+	trace_f2fs_map_blocks(inode, map, flag, err);
 	return err;
 }
 
@@ -1775,7 +1764,7 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
 
 	while (map.m_lblk < last_lblk) {
 		map.m_len = last_lblk - map.m_lblk;
-		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_DEFAULT);
+		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
 		if (err || map.m_len == 0)
 			return false;
 		map.m_lblk += map.m_len;
@@ -1949,7 +1938,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		map.m_len = cluster_size - count_in_cluster;
 	}
 
-	ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
+	ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_FIEMAP);
 	if (ret)
 		goto out;
 
@@ -2082,7 +2071,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 	map->m_lblk = block_in_file;
 	map->m_len = last_block - block_in_file;
 
-	ret = f2fs_map_blocks(inode, map, 0, F2FS_GET_BLOCK_DEFAULT);
+	ret = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_DEFAULT);
 	if (ret)
 		goto out;
 got_it:
@@ -3779,7 +3768,7 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
 		map.m_next_pgofs = NULL;
 		map.m_seg_type = NO_CHECK_TYPE;
 
-		if (!f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_BMAP))
+		if (!f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_BMAP))
 			blknr = map.m_pblk;
 	}
 out:
@@ -3887,7 +3876,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 		map.m_seg_type = NO_CHECK_TYPE;
 		map.m_may_create = false;
 
-		ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
+		ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_FIEMAP);
 		if (ret)
 			goto out;
 
@@ -4116,8 +4105,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if (flags & IOMAP_WRITE)
 		map.m_may_create = true;
 
-	err = f2fs_map_blocks(inode, &map, flags & IOMAP_WRITE,
-			      F2FS_GET_BLOCK_DIO);
+	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a3789dab0aade9..2c49714ac176f3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3801,8 +3801,7 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
 struct page *f2fs_get_new_data_page(struct inode *inode,
 			struct page *ipage, pgoff_t index, bool new_i_size);
 int f2fs_do_write_data_page(struct f2fs_io_info *fio);
-int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
-			int create, int flag);
+int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 			u64 start, u64 len);
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cbeb7bd880046e..cb3fce6eec6db9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1742,7 +1742,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 		f2fs_unlock_op(sbi);
 
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
-		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
+		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_DIO);
 		file_dont_truncate(inode);
 
 		f2fs_up_write(&sbi->pin_sem);
@@ -1755,7 +1755,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 
 		map.m_len = expanded;
 	} else {
-		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
+		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_AIO);
 		expanded = map.m_len;
 	}
 out_err:
@@ -2588,7 +2588,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	 */
 	while (map.m_lblk < pg_end) {
 		map.m_len = pg_end - map.m_lblk;
-		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_DEFAULT);
+		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
 		if (err)
 			goto out;
 
@@ -2635,7 +2635,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 do_map:
 		map.m_len = pg_end - map.m_lblk;
-		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_DEFAULT);
+		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
 		if (err)
 			goto clear_out;
 
@@ -3209,7 +3209,7 @@ int f2fs_precache_extents(struct inode *inode)
 		map.m_len = end - map.m_lblk;
 
 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
-		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_PRECACHE);
+		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRECACHE);
 		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 		if (err)
 			return err;
@@ -4446,7 +4446,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 		flag = F2FS_GET_BLOCK_PRE_AIO;
 	}
 
-	ret = f2fs_map_blocks(inode, &map, 1, flag);
+	ret = f2fs_map_blocks(inode, &map, flag);
 	/* -ENOSPC|-EDQUOT are fine to report the number of allocated blocks. */
 	if (ret < 0 && !((ret == -ENOSPC || ret == -EDQUOT) && map.m_len > 0))
 		return ret;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index c6b372401c2787..cbf7e0d1a22387 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -562,10 +562,10 @@ TRACE_EVENT(f2fs_file_write_iter,
 );
 
 TRACE_EVENT(f2fs_map_blocks,
-	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map,
-				int create, int flag, int ret),
+	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map, int flag,
+		 int ret),
 
-	TP_ARGS(inode, map, create, flag, ret),
+	TP_ARGS(inode, map, flag, ret),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
@@ -577,7 +577,6 @@ TRACE_EVENT(f2fs_map_blocks,
 		__field(int,	m_seg_type)
 		__field(bool,	m_may_create)
 		__field(bool,	m_multidev_dio)
-		__field(int,	create)
 		__field(int,	flag)
 		__field(int,	ret)
 	),
@@ -592,7 +591,6 @@ TRACE_EVENT(f2fs_map_blocks,
 		__entry->m_seg_type	= map->m_seg_type;
 		__entry->m_may_create	= map->m_may_create;
 		__entry->m_multidev_dio	= map->m_multidev_dio;
-		__entry->create		= create;
 		__entry->flag		= flag;
 		__entry->ret		= ret;
 	),
@@ -600,7 +598,7 @@ TRACE_EVENT(f2fs_map_blocks,
 	TP_printk("dev = (%d,%d), ino = %lu, file offset = %llu, "
 		"start blkaddr = 0x%llx, len = 0x%llx, flags = %u, "
 		"seg_type = %d, may_create = %d, multidevice = %d, "
-		"create = %d, flag = %d, err = %d",
+		"flag = %d, err = %d",
 		show_dev_ino(__entry),
 		(unsigned long long)__entry->m_lblk,
 		(unsigned long long)__entry->m_pblk,
@@ -609,7 +607,6 @@ TRACE_EVENT(f2fs_map_blocks,
 		__entry->m_seg_type,
 		__entry->m_may_create,
 		__entry->m_multidev_dio,
-		__entry->create,
 		__entry->flag,
 		__entry->ret)
 );
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
