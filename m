Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E153FD3E5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Sep 2021 08:39:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mLJuP-0002nN-Ty; Wed, 01 Sep 2021 06:39:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mLJuO-0002nH-2s
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 06:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4uPh8bZn9jFKBVQ0wpOV2R+A636Yhm1DmOIqHwQl3rY=; b=Tiy0FdZ3ofM9oWqXyF9ek32ZS6
 hyQP6afqPLBJePjapAElUq9qTW6To4f6dzHHppMLNjzawJoGgdaitsGRWOX6f+ZyPxDGcW4hdZHWd
 yY6n2SgLA17M3uTDAhXKwLDdlEDlHe59sbS39veliy0uZxSMbDX7dCOzIM/y/8i+UG1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4uPh8bZn9jFKBVQ0wpOV2R+A636Yhm1DmOIqHwQl3rY=; b=I
 pjGy1hrfSiAJNZIdT7ATS25cJd37fMJdd/4JdQJKczrPgujMqYOPxjHQKCecL0akbIjP8qoY7ouhL
 EAvICQYgpHgBA42kc0frIvjFO4kEyhk1teJ48+MEqkVfP8bkdCJFm9l+YoFRjcgmuAdIPhldkiQwY
 LRcPPepfiRu1KL88=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mLJuK-00A3j5-OT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Sep 2021 06:39:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E08260FE6;
 Wed,  1 Sep 2021 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630478367;
 bh=9VbvbhKitVaFBqGhKs/i35OH7WOTUocLqyz0rZt+M/c=;
 h=From:To:Cc:Subject:Date:From;
 b=UXjptv/t1NYgJINl5x/GROc72dO68EQlRjGbbyekPBDrMX727b8FPQRClWvLB3WIr
 9AapY1/b2CnIMMXO1YDqBAXP/oebtGjD3dCRH4470DDy5kSWAUARh0PyJ9xMKdK7tV
 CB9S61MDVLlDY2zxEwmld8pVTOJJCGooLeK0JoKg/HKcFKXmjzzQ0pctdDuGQWD+rC
 Es1LrTRlO8X8Y1IbtDo2mzFumCgQVnBmNZh85kOTQtz0eZhurWpL2fhaaA+Gcnpjna
 KgHGqSFIcQV66RPb3Pm64FjaHfXPJfGCF6JAlbZ2ZlvP0fyOAl6AlsDyZijswgZU5B
 edvndgpbAexEA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed,  1 Sep 2021 14:39:20 +0800
Message-Id: <20210901063920.108774-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 3c62be17d4f5 ("f2fs: support multiple devices") missed
 to support direct IO for multiple device feature, this patch adds to support
 the missing part of multidevice feature. In addition, for multiple device
 image, we should be aware of any issued direct write IO rather than just
 buffered write IO, so that fsync and syncfs can issue a preflush command to
 the device where d [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mLJuK-00A3j5-OT
Subject: [f2fs-dev] [PATCH v2] f2fs: multidevice: support direct IO
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 3c62be17d4f5 ("f2fs: support multiple devices") missed
to support direct IO for multiple device feature, this patch
adds to support the missing part of multidevice feature.

In addition, for multiple device image, we should be aware of
any issued direct write IO rather than just buffered write IO,
so that fsync and syncfs can issue a preflush command to the
device where direct write IO goes, to persist user data for
posix compliant.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- do cleanup and rebase to last dev branch
- adapt trace code of f2fs_map_blocks()
- update device status in-batch in f2fs_update_device_state()
 fs/f2fs/data.c              | 57 +++++++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h              | 25 ++++++++++++++--
 fs/f2fs/segment.c           | 35 ++++++++++++++---------
 fs/f2fs/super.c             |  7 +++++
 include/trace/events/f2fs.h | 21 ++++++++++----
 5 files changed, 120 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 41d29382eced..8668c15eaf97 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1465,10 +1465,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	struct extent_info ei = {0, };
 	block_t blkaddr;
 	unsigned int start_pgofs;
+	int bidx = 0;
 
 	if (!maxblocks)
 		return 0;
 
+	map->m_bdev = inode->i_sb->s_bdev;
+	map->m_multidev_dio =
+		f2fs_allow_multi_device_dio(F2FS_I_SB(inode), flag);
+
 	map->m_len = 0;
 	map->m_flags = 0;
 
@@ -1491,6 +1496,21 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (flag == F2FS_GET_BLOCK_DIO)
 			f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
+
+		if (map->m_multidev_dio) {
+			block_t blk_addr = map->m_pblk;
+
+			bidx = f2fs_target_device_index(sbi, map->m_pblk);
+
+			map->m_bdev = FDEV(bidx).bdev;
+			map->m_pblk -= FDEV(bidx).start_blk;
+			map->m_len = min(map->m_len,
+				FDEV(bidx).end_blk + 1 - map->m_pblk);
+
+			if (map->m_may_create)
+				f2fs_update_device_state(sbi, inode->i_ino,
+							blk_addr, map->m_len);
+		}
 		goto out;
 	}
 
@@ -1609,6 +1629,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	if (flag == F2FS_GET_BLOCK_PRE_AIO)
 		goto skip;
 
+	if (map->m_multidev_dio)
+		bidx = f2fs_target_device_index(sbi, blkaddr);
+
 	if (map->m_len == 0) {
 		/* preallocated unwritten block should be mapped for fiemap. */
 		if (blkaddr == NEW_ADDR)
@@ -1617,10 +1640,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 
 		map->m_pblk = blkaddr;
 		map->m_len = 1;
+
+		if (map->m_multidev_dio)
+			map->m_bdev = FDEV(bidx).bdev;
 	} else if ((map->m_pblk != NEW_ADDR &&
 			blkaddr == (map->m_pblk + ofs)) ||
 			(map->m_pblk == NEW_ADDR && blkaddr == NEW_ADDR) ||
 			flag == F2FS_GET_BLOCK_PRE_DIO) {
+		if (map->m_multidev_dio && map->m_bdev != FDEV(bidx).bdev)
+			goto sync_out;
 		ofs++;
 		map->m_len++;
 	} else {
@@ -1673,11 +1701,31 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 
 sync_out:
 
-	/* for hardware encryption, but to avoid potential issue in future */
-	if (flag == F2FS_GET_BLOCK_DIO && map->m_flags & F2FS_MAP_MAPPED)
+	if (flag == F2FS_GET_BLOCK_DIO && map->m_flags & F2FS_MAP_MAPPED) {
+		/*
+		 * for hardware encryption, but to avoid potential issue
+		 * in future
+		 */
 		f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
 
+		if (map->m_multidev_dio) {
+			block_t blk_addr = map->m_pblk;
+
+			bidx = f2fs_target_device_index(sbi, map->m_pblk);
+
+			map->m_bdev = FDEV(bidx).bdev;
+			map->m_pblk -= FDEV(bidx).start_blk;
+
+			if (map->m_may_create)
+				f2fs_update_device_state(sbi, inode->i_ino,
+							blk_addr, map->m_len);
+
+			f2fs_bug_on(sbi, blk_addr + map->m_len >
+						FDEV(bidx).end_blk + 1);
+		}
+	}
+
 	if (flag == F2FS_GET_BLOCK_PRECACHE) {
 		if (map->m_flags & F2FS_MAP_MAPPED) {
 			unsigned int ofs = start_pgofs - map->m_lblk;
@@ -1696,7 +1744,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		f2fs_balance_fs(sbi, dn.node_changed);
 	}
 out:
-	trace_f2fs_map_blocks(inode, map, err);
+	trace_f2fs_map_blocks(inode, map, create, flag, err);
 	return err;
 }
 
@@ -1755,6 +1803,9 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
 		map_bh(bh, inode->i_sb, map.m_pblk);
 		bh->b_state = (bh->b_state & ~F2FS_MAP_FLAGS) | map.m_flags;
 		bh->b_size = blks_to_bytes(inode, map.m_len);
+
+		if (map.m_multidev_dio)
+			bh->b_bdev = map.m_bdev;
 	}
 	return err;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c24f03e054cb..e666ca1e98c8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -617,6 +617,7 @@ struct extent_tree {
 				F2FS_MAP_UNWRITTEN)
 
 struct f2fs_map_blocks {
+	struct block_device *m_bdev;	/* for multi-device dio */
 	block_t m_pblk;
 	block_t m_lblk;
 	unsigned int m_len;
@@ -625,6 +626,7 @@ struct f2fs_map_blocks {
 	pgoff_t *m_next_extent;		/* point to next possible extent */
 	int m_seg_type;
 	bool m_may_create;		/* indicate it is from write path */
+	bool m_multidev_dio;		/* indicate it allows multi-device dio */
 };
 
 /* for flag in get_data_block */
@@ -1729,12 +1731,15 @@ struct f2fs_sb_info {
 
 	/* For shrinker support */
 	struct list_head s_list;
+	struct mutex umount_mutex;
+	unsigned int shrinker_run_no;
+
+	/* For multi devices */
 	int s_ndevs;				/* number of devices */
 	struct f2fs_dev_info *devs;		/* for device list */
 	unsigned int dirty_device;		/* for checkpoint data flush */
 	spinlock_t dev_lock;			/* protect dirty_device */
-	struct mutex umount_mutex;
-	unsigned int shrinker_run_no;
+	bool aligned_blksize;			/* all devices has the same logical blksize */
 
 	/* For write statistics */
 	u64 sectors_written_start;
@@ -3493,6 +3498,8 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
 			struct f2fs_io_info *fio);
+void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
+					block_t blkaddr, unsigned int blkcnt);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered, bool locked);
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
@@ -4303,6 +4310,16 @@ static inline int block_unaligned_IO(struct inode *inode,
 	return align & blocksize_mask;
 }
 
+static inline bool f2fs_allow_multi_device_dio(struct f2fs_sb_info *sbi,
+								int flag)
+{
+	if (!f2fs_is_multi_device(sbi))
+		return false;
+	if (flag != F2FS_GET_BLOCK_DIO)
+		return false;
+	return sbi->aligned_blksize;
+}
+
 static inline bool f2fs_force_buffered_io(struct inode *inode,
 				struct kiocb *iocb, struct iov_iter *iter)
 {
@@ -4311,7 +4328,9 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 
 	if (f2fs_post_read_required(inode))
 		return true;
-	if (f2fs_is_multi_device(sbi))
+
+	/* disallow direct IO if any of devices has unaligned blksize */
+	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
 		return true;
 	/*
 	 * for blkzoned device, fallback direct IO to buffered IO, so
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a135d2247415..6cfbd62262f2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3485,24 +3485,30 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	up_read(&SM_I(sbi)->curseg_lock);
 }
 
-static void update_device_state(struct f2fs_io_info *fio)
+void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
+					block_t blkaddr, unsigned int blkcnt)
 {
-	struct f2fs_sb_info *sbi = fio->sbi;
-	unsigned int devidx;
-
 	if (!f2fs_is_multi_device(sbi))
 		return;
 
-	devidx = f2fs_target_device_index(sbi, fio->new_blkaddr);
+	while (1) {
+		unsigned int devidx = f2fs_target_device_index(sbi, blkaddr);
+		unsigned int blks = FDEV(devidx).end_blk - blkaddr + 1;
 
-	/* update device state for fsync */
-	f2fs_set_dirty_device(sbi, fio->ino, devidx, FLUSH_INO);
+		/* update device state for fsync */
+		f2fs_set_dirty_device(sbi, ino, devidx, FLUSH_INO);
 
-	/* update device state for checkpoint */
-	if (!f2fs_test_bit(devidx, (char *)&sbi->dirty_device)) {
-		spin_lock(&sbi->dev_lock);
-		f2fs_set_bit(devidx, (char *)&sbi->dirty_device);
-		spin_unlock(&sbi->dev_lock);
+		/* update device state for checkpoint */
+		if (!f2fs_test_bit(devidx, (char *)&sbi->dirty_device)) {
+			spin_lock(&sbi->dev_lock);
+			f2fs_set_bit(devidx, (char *)&sbi->dirty_device);
+			spin_unlock(&sbi->dev_lock);
+		}
+
+		if (blkcnt <= blks)
+			break;
+		blkcnt -= blks;
+		blkaddr += blks;
 	}
 }
 
@@ -3529,7 +3535,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		goto reallocate;
 	}
 
-	update_device_state(fio);
+	f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
 
 	if (keep_order)
 		up_read(&fio->sbi->io_order_lock);
@@ -3618,7 +3624,8 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	else
 		err = f2fs_submit_page_bio(fio);
 	if (!err) {
-		update_device_state(fio);
+		f2fs_update_device_state(fio->sbi, fio->ino,
+						fio->new_blkaddr, 1);
 		f2fs_update_iostat(fio->sbi, fio->io_type, F2FS_BLKSIZE);
 	}
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a29e6714c610..98942bbbc03c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3748,6 +3748,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	unsigned int max_devices = MAX_DEVICES;
+	unsigned int logical_blksize;
 	int i;
 
 	/* Initialize single device information */
@@ -3768,6 +3769,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	if (!sbi->devs)
 		return -ENOMEM;
 
+	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
+	sbi->aligned_blksize = true;
+
 	for (i = 0; i < max_devices; i++) {
 
 		if (i > 0 && !RDEV(i).path[0])
@@ -3804,6 +3808,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 		/* to release errored devices */
 		sbi->s_ndevs = i + 1;
 
+		if (logical_blksize != bdev_logical_block_size(FDEV(i).bdev))
+			sbi->aligned_blksize = false;
+
 #ifdef CONFIG_BLK_DEV_ZONED
 		if (bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HM &&
 				!f2fs_sb_has_blkzoned(sbi)) {
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 4e881d91c874..467cd517bb12 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -570,9 +570,10 @@ TRACE_EVENT(f2fs_file_write_iter,
 );
 
 TRACE_EVENT(f2fs_map_blocks,
-	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map, int ret),
+	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map,
+				int create, int flag, int ret),
 
-	TP_ARGS(inode, map, ret),
+	TP_ARGS(inode, map, create, flag, ret),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
@@ -583,11 +584,14 @@ TRACE_EVENT(f2fs_map_blocks,
 		__field(unsigned int,	m_flags)
 		__field(int,	m_seg_type)
 		__field(bool,	m_may_create)
+		__field(bool,	m_multidev_dio)
+		__field(int,	create)
+		__field(int,	flag)
 		__field(int,	ret)
 	),
 
 	TP_fast_assign(
-		__entry->dev		= inode->i_sb->s_dev;
+		__entry->dev		= map->m_bdev->bd_dev;
 		__entry->ino		= inode->i_ino;
 		__entry->m_lblk		= map->m_lblk;
 		__entry->m_pblk		= map->m_pblk;
@@ -595,12 +599,16 @@ TRACE_EVENT(f2fs_map_blocks,
 		__entry->m_flags	= map->m_flags;
 		__entry->m_seg_type	= map->m_seg_type;
 		__entry->m_may_create	= map->m_may_create;
+		__entry->m_multidev_dio	= map->m_multidev_dio;
+		__entry->create		= create;
+		__entry->flag		= flag;
 		__entry->ret		= ret;
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, file offset = %llu, "
-		"start blkaddr = 0x%llx, len = 0x%llx, flags = %u,"
-		"seg_type = %d, may_create = %d, err = %d",
+		"start blkaddr = 0x%llx, len = 0x%llx, flags = %u, "
+		"seg_type = %d, may_create = %d, multidevice = %d, "
+		"create = %d, flag = %d, err = %d",
 		show_dev_ino(__entry),
 		(unsigned long long)__entry->m_lblk,
 		(unsigned long long)__entry->m_pblk,
@@ -608,6 +616,9 @@ TRACE_EVENT(f2fs_map_blocks,
 		__entry->m_flags,
 		__entry->m_seg_type,
 		__entry->m_may_create,
+		__entry->m_multidev_dio,
+		__entry->create,
+		__entry->flag,
 		__entry->ret)
 );
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
