Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E473CCF71
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 10:47:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5OwG-0005hU-77; Mon, 19 Jul 2021 08:47:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m5OwE-0005hK-OA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mBjq/SbqhP2+l7NFdW4jwEgSmXTGpzwTyh9Lq8m/ZH8=; b=hlaSIiCsa8sEP+ar//UuFqWiEH
 CFZJy9Dq7iu6zP1fUp6jKfymb087CyFs1boAogST0ByFpfLoPOxUAzCZnQhZb2i8e4LNQ+6aJXNoo
 CP8ACAKAt153cOmiJnnnwRGBXOXMi+wNPT1Y5psreIeNWjjOtqiUVDDP8TScUGRRcItE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mBjq/SbqhP2+l7NFdW4jwEgSmXTGpzwTyh9Lq8m/ZH8=; b=X
 fk7DD0qYJzHK2Ozi9eCNpNvB9udX3S3Pl0idtW4FqTw6iLJdkFlqSpBkNs6O4PcpzWdv+yNRFATi5
 6M38paWIk4thLn/UVdXBdAHRoC1KFONYXfdYbsJN5FOd6Za4iz7xuZ1iIEUHnYzw2HSzCAs7taBXl
 eF9uuuDGZGS/gRfI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5Ow8-0004Hg-AP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:47:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A189661009;
 Mon, 19 Jul 2021 08:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626684454;
 bh=Z8QxgJGFP3p/nfg2SDMpVEKedbs0kk0rI6anNltZnjo=;
 h=From:To:Cc:Subject:Date:From;
 b=R1unZ01KJujtGTmo/J9J6hR8G0lo1mUHWxkHcROjETXmAY3mOFr8wU7azwnyqvsrA
 bnwio/yvyJf8bAIW7xjuExhrcY709L88xKdffd72aVGMQzNXOq8ucpviRTUzFkh89G
 rhh9XHEulz76ULCMS6hNKcuJ88eBERIljROHIz0LSpLferHS2XwUFPrdMsaM0Wfkbk
 MDOQfY894w4x644N+tZcem2Aeb+76QQyNBS2PoZVKsbA2CeuwvIYE57vUHjJGkkneZ
 WtCwbZsy1OzIB6i8ArNvEPp1nhZL8HQRmut1kULhCxYma7tCwvE9M/IWRizH8VSvHy
 OcRM8B7H5Yy7Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 19 Jul 2021 16:47:29 +0800
Message-Id: <20210719084729.26117-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5Ow8-0004Hg-AP
Subject: [f2fs-dev] [PATCH] f2fs: multidevice: support direct IO
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
 fs/f2fs/data.c    | 52 +++++++++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h    | 24 +++++++++++++++++++---
 fs/f2fs/segment.c | 29 +++++++++++++-------------
 fs/f2fs/super.c   |  7 +++++++
 4 files changed, 93 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 095350ccf80d..be65dca0de40 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1451,10 +1451,16 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	struct extent_info ei = {0,0,0};
 	block_t blkaddr;
 	unsigned int start_pgofs;
+	int bidx = 0;
+	bool multidevice_dio;
 
 	if (!maxblocks)
 		return 0;
 
+	multidevice_dio = f2fs_allow_multi_device_dio(sbi, flag);
+	if (multidevice_dio)
+		map->m_bdev = sbi->sb->s_bdev;
+
 	map->m_len = 0;
 	map->m_flags = 0;
 
@@ -1477,6 +1483,16 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (flag == F2FS_GET_BLOCK_DIO)
 			f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
+
+		if (multidevice_dio) {
+			bidx = f2fs_target_device_index(sbi, map->m_pblk);
+			if (bidx) {
+				map->m_bdev = FDEV(bidx).bdev;
+				map->m_pblk -= FDEV(bidx).start_blk;
+				map->m_len = min(map->m_len,
+					FDEV(bidx).end_blk + 1 - map->m_pblk);
+			}
+		}
 		goto out;
 	}
 
@@ -1574,6 +1590,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	if (flag == F2FS_GET_BLOCK_PRE_AIO)
 		goto skip;
 
+	if (multidevice_dio)
+		bidx = f2fs_target_device_index(sbi, blkaddr);
+
 	if (map->m_len == 0) {
 		/* preallocated unwritten block should be mapped for fiemap. */
 		if (blkaddr == NEW_ADDR)
@@ -1582,10 +1601,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 
 		map->m_pblk = blkaddr;
 		map->m_len = 1;
+
+		if (multidevice_dio && map->m_bdev != FDEV(bidx).bdev)
+			map->m_bdev = FDEV(bidx).bdev;
 	} else if ((map->m_pblk != NEW_ADDR &&
 			blkaddr == (map->m_pblk + ofs)) ||
 			(map->m_pblk == NEW_ADDR && blkaddr == NEW_ADDR) ||
 			flag == F2FS_GET_BLOCK_PRE_DIO) {
+		if (multidevice_dio && map->m_bdev != FDEV(bidx).bdev)
+			goto sync_out;
 		ofs++;
 		map->m_len++;
 	} else {
@@ -1638,11 +1662,27 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 
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
 
+		if (multidevice_dio) {
+			bidx = f2fs_target_device_index(sbi, map->m_pblk);
+			if (bidx) {
+				map->m_bdev = FDEV(bidx).bdev;
+				map->m_pblk -= FDEV(bidx).start_blk;
+				f2fs_bug_on(sbi,
+					map->m_bdev != FDEV(bidx).bdev ||
+					map->m_pblk + map->m_len >
+						FDEV(bidx).end_blk + 1);
+			}
+		}
+	}
+
 	if (flag == F2FS_GET_BLOCK_PRECACHE) {
 		if (map->m_flags & F2FS_MAP_MAPPED) {
 			unsigned int ofs = start_pgofs - map->m_lblk;
@@ -1720,6 +1760,9 @@ static int __get_data_block(struct inode *inode, sector_t iblock,
 		map_bh(bh, inode->i_sb, map.m_pblk);
 		bh->b_state = (bh->b_state & ~F2FS_MAP_FLAGS) | map.m_flags;
 		bh->b_size = blks_to_bytes(inode, map.m_len);
+
+		if (f2fs_allow_multi_device_dio(F2FS_I_SB(inode), flag))
+			bh->b_bdev = map.m_bdev;
 	}
 	return err;
 }
@@ -3511,6 +3554,7 @@ static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
 {
 	struct f2fs_private_dio *dio;
 	bool write = (bio_op(bio) == REQ_OP_WRITE);
+	block_t blkaddr = SECTOR_TO_BLOCK(bio->bi_iter.bi_sector);
 	unsigned int blkcnt = bio_sectors(bio) >> F2FS_LOG_SECTORS_PER_BLOCK;
 
 	dio = f2fs_kzalloc(F2FS_I_SB(inode),
@@ -3527,6 +3571,10 @@ static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
 	bio->bi_end_io = f2fs_dio_end_io;
 	bio->bi_private = dio;
 
+	if (write)
+		f2fs_update_device_state(F2FS_I_SB(inode), inode->i_ino,
+							blkaddr, blkcnt);
+
 	inc_page_counts(F2FS_I_SB(inode),
 			write ? F2FS_DIO_WRITE : F2FS_DIO_READ, dio->blkcnt);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7369f8087f64..f3ac3cbad2e3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -607,6 +607,7 @@ struct extent_tree {
 				F2FS_MAP_UNWRITTEN)
 
 struct f2fs_map_blocks {
+	struct block_device *m_bdev;	/* for multi-device */
 	block_t m_pblk;
 	block_t m_lblk;
 	unsigned int m_len;
@@ -1712,12 +1713,15 @@ struct f2fs_sb_info {
 
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
@@ -3527,6 +3531,8 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 			block_t old_blkaddr, block_t *new_blkaddr,
 			struct f2fs_summary *sum, int type,
 			struct f2fs_io_info *fio);
+void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
+					block_t blkaddr, unsigned int blkcnt);
 void f2fs_wait_on_page_writeback(struct page *page,
 			enum page_type type, bool ordered, bool locked);
 void f2fs_wait_on_block_writeback(struct inode *inode, block_t blkaddr);
@@ -4334,6 +4340,16 @@ static inline int allow_outplace_dio(struct inode *inode,
 				!block_unaligned_IO(inode, iocb, iter));
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
@@ -4342,7 +4358,9 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 
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
index 15cc89eef28d..6fcfd234108a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3442,24 +3442,24 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
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
+	for (; blkcnt > 0; blkcnt--, blkaddr++) {
+		unsigned int devidx = f2fs_target_device_index(sbi, blkaddr);
 
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
 	}
 }
 
@@ -3486,7 +3486,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 		goto reallocate;
 	}
 
-	update_device_state(fio);
+	f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
 
 	if (keep_order)
 		up_read(&fio->sbi->io_order_lock);
@@ -3575,7 +3575,8 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	else
 		err = f2fs_submit_page_bio(fio);
 	if (!err) {
-		update_device_state(fio);
+		f2fs_update_device_state(fio->sbi, fio->ino,
+						fio->new_blkaddr, 1);
 		f2fs_update_iostat(fio->sbi, fio->io_type, F2FS_BLKSIZE);
 	}
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 72eb9d70969f..dced7778d530 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3646,6 +3646,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	unsigned int max_devices = MAX_DEVICES;
+	unsigned int logical_blksize;
 	int i;
 
 	/* Initialize single device information */
@@ -3666,6 +3667,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	if (!sbi->devs)
 		return -ENOMEM;
 
+	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
+	sbi->aligned_blksize = true;
+
 	for (i = 0; i < max_devices; i++) {
 
 		if (i > 0 && !RDEV(i).path[0])
@@ -3702,6 +3706,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 		/* to release errored devices */
 		sbi->s_ndevs = i + 1;
 
+		if (logical_blksize != bdev_logical_block_size(FDEV(i).bdev))
+			sbi->aligned_blksize = false;
+
 #ifdef CONFIG_BLK_DEV_ZONED
 		if (bdev_zoned_model(FDEV(i).bdev) == BLK_ZONED_HM &&
 				!f2fs_sb_has_blkzoned(sbi)) {
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
