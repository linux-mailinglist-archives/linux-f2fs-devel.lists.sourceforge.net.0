Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C07093CB8EE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1b-0004xv-HD; Fri, 16 Jul 2021 14:41:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1Z-0004xM-F4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XqWzNiRjPrlOt7N68eArOxPCfI4Nih73NKHI4X6XI58=; b=PU2WxEiuktUuh96kcOrvAY9paU
 QLOUKCxuJKp1tpba44ggGxWj4xYGuQUf5FnOsy5x5s6sbM9QjmWVby6riY0/Q5+dDezWzJArhoeXD
 wkTOug7jUej7J70Muu1tR4q0cJ4lmGjQfCefH0wlsYozkJpgcGYZYl4g0Pdrxka3hAC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XqWzNiRjPrlOt7N68eArOxPCfI4Nih73NKHI4X6XI58=; b=dLSARl7GW7FKO9NnSCpYBzYouh
 tYrMy4ZOEMUFopTnPgmTgtsd4t2+Brl8E/H75WE/fQt0tLRrow6CbAz54gpwqyr8jTri6cBR4rmNn
 eqA3WY7QHQL0sJfz4nkGyDvQpThHA3nx7rEoasCvUHeZfgkr4qSUiVeAhD9FFbGcSmnM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1T-0004f4-09
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C1F161406;
 Fri, 16 Jul 2021 14:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446450;
 bh=aw4O7H66/f2LfOr5ltGk8A3nBKyRFz2VLyMrawYdLsw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=krh0VESz4Kjd88k9e6OiXT2L80R84tOL3XuT6WS+uiDOnZRizAcCLjS8C8Wd052qe
 vZcMHvxcKAUI/e9WJBZ9xFCVLzHJvaG8Nh6MfPuLCyeb4CtPr1ZoEaE3uyRmSIkIfy
 fWv5WgcUq25ytImHiC+13Qf+6ahzQNKgAVsXbSJm0IYj5ybpHE3o4/b40CBqs3bHdh
 7fLD914XW50bVv0eJLxTzTvUzVrPrvkD7qhExBDwBJzVO2/VDEuGhFUH7YI7JXs9YO
 vi62IeE2r2YXUd0r7AibZF/r5a7s/9VoWbpW+XxdfvhN40l/+c9OVdhAiByYhmDvqO
 Pmzy6+cBRFdEA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:19 -0500
Message-Id: <20210716143919.44373-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716143919.44373-1-ebiggers@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m4P1T-0004f4-09
Subject: [f2fs-dev] [PATCH 9/9] f2fs: remove f2fs_direct_IO()
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Remove f2fs_direct_IO(), since it is no longer used because f2fs now
uses iomap_dio_rw() instead.

Set ->direct_IO to noop_direct_IO rather than NULL.  This is needed to
continue to mark the inodes as supporting direct I/O, as mentioned in
the comment for noop_direct_IO().

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/data.c | 180 +------------------------------------------------
 1 file changed, 1 insertion(+), 179 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0d2bb651483d..4fbf28f5aaab 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1650,47 +1650,6 @@ static inline u64 blks_to_bytes(struct inode *inode, u64 blks)
 	return (blks << inode->i_blkbits);
 }
 
-static int __get_data_block(struct inode *inode, sector_t iblock,
-			struct buffer_head *bh, int create, int flag,
-			pgoff_t *next_pgofs, int seg_type, bool may_write)
-{
-	struct f2fs_map_blocks map;
-	int err;
-
-	map.m_lblk = iblock;
-	map.m_len = bytes_to_blks(inode, bh->b_size);
-	map.m_next_pgofs = next_pgofs;
-	map.m_next_extent = NULL;
-	map.m_seg_type = seg_type;
-	map.m_may_create = may_write;
-
-	err = f2fs_map_blocks(inode, &map, create, flag);
-	if (!err) {
-		map_bh(bh, inode->i_sb, map.m_pblk);
-		bh->b_state = (bh->b_state & ~F2FS_MAP_FLAGS) | map.m_flags;
-		bh->b_size = blks_to_bytes(inode, map.m_len);
-	}
-	return err;
-}
-
-static int get_data_block_dio_write(struct inode *inode, sector_t iblock,
-			struct buffer_head *bh_result, int create)
-{
-	return __get_data_block(inode, iblock, bh_result, create,
-				F2FS_GET_BLOCK_DIO, NULL,
-				f2fs_rw_hint_to_seg_type(inode->i_write_hint),
-				true);
-}
-
-static int get_data_block_dio(struct inode *inode, sector_t iblock,
-			struct buffer_head *bh_result, int create)
-{
-	return __get_data_block(inode, iblock, bh_result, create,
-				F2FS_GET_BLOCK_DIO, NULL,
-				f2fs_rw_hint_to_seg_type(inode->i_write_hint),
-				false);
-}
-
 static int f2fs_xattr_fiemap(struct inode *inode,
 				struct fiemap_extent_info *fieinfo)
 {
@@ -3410,29 +3369,6 @@ static int f2fs_write_end(struct file *file,
 	return copied;
 }
 
-static int check_direct_IO(struct inode *inode, struct iov_iter *iter,
-			   loff_t offset)
-{
-	unsigned i_blkbits = READ_ONCE(inode->i_blkbits);
-	unsigned blkbits = i_blkbits;
-	unsigned blocksize_mask = (1 << blkbits) - 1;
-	unsigned long align = offset | iov_iter_alignment(iter);
-	struct block_device *bdev = inode->i_sb->s_bdev;
-
-	if (iov_iter_rw(iter) == READ && offset >= i_size_read(inode))
-		return 1;
-
-	if (align & blocksize_mask) {
-		if (bdev)
-			blkbits = blksize_bits(bdev_logical_block_size(bdev));
-		blocksize_mask = (1 << blkbits) - 1;
-		if (align & blocksize_mask)
-			return -EINVAL;
-		return 1;
-	}
-	return 0;
-}
-
 static void f2fs_dio_end_io(struct bio *bio)
 {
 	struct f2fs_private_dio *dio = bio->bi_private;
@@ -3448,35 +3384,6 @@ static void f2fs_dio_end_io(struct bio *bio)
 	bio_endio(bio);
 }
 
-static void f2fs_dio_submit_bio_old(struct bio *bio, struct inode *inode,
-							loff_t file_offset)
-{
-	struct f2fs_private_dio *dio;
-	bool write = (bio_op(bio) == REQ_OP_WRITE);
-
-	dio = f2fs_kzalloc(F2FS_I_SB(inode),
-			sizeof(struct f2fs_private_dio), GFP_NOFS);
-	if (!dio)
-		goto out;
-
-	dio->inode = inode;
-	dio->orig_end_io = bio->bi_end_io;
-	dio->orig_private = bio->bi_private;
-	dio->write = write;
-
-	bio->bi_end_io = f2fs_dio_end_io;
-	bio->bi_private = dio;
-
-	inc_page_count(F2FS_I_SB(inode),
-			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
-
-	submit_bio(bio);
-	return;
-out:
-	bio->bi_status = BLK_STS_IOERR;
-	bio_endio(bio);
-}
-
 static blk_qc_t f2fs_dio_submit_bio(struct inode *inode, struct iomap *iomap,
 				    struct bio *bio, loff_t file_offset)
 {
@@ -3506,91 +3413,6 @@ static blk_qc_t f2fs_dio_submit_bio(struct inode *inode, struct iomap *iomap,
 	return BLK_QC_T_NONE;
 }
 
-static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
-{
-	struct address_space *mapping = iocb->ki_filp->f_mapping;
-	struct inode *inode = mapping->host;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_inode_info *fi = F2FS_I(inode);
-	size_t count = iov_iter_count(iter);
-	loff_t offset = iocb->ki_pos;
-	int rw = iov_iter_rw(iter);
-	int err;
-	enum rw_hint hint = iocb->ki_hint;
-	int whint_mode = F2FS_OPTION(sbi).whint_mode;
-	bool do_opu;
-
-	err = check_direct_IO(inode, iter, offset);
-	if (err)
-		return err < 0 ? err : 0;
-
-	if (f2fs_force_buffered_io(inode, iocb, iter))
-		return 0;
-
-	do_opu = (rw == WRITE && f2fs_lfs_mode(sbi));
-
-	trace_f2fs_direct_IO_enter(inode, offset, count, rw);
-
-	if (rw == WRITE && whint_mode == WHINT_MODE_OFF)
-		iocb->ki_hint = WRITE_LIFE_NOT_SET;
-
-	if (iocb->ki_flags & IOCB_NOWAIT) {
-		if (!down_read_trylock(&fi->i_gc_rwsem[rw])) {
-			iocb->ki_hint = hint;
-			err = -EAGAIN;
-			goto out;
-		}
-		if (do_opu && !down_read_trylock(&fi->i_gc_rwsem[READ])) {
-			up_read(&fi->i_gc_rwsem[rw]);
-			iocb->ki_hint = hint;
-			err = -EAGAIN;
-			goto out;
-		}
-	} else {
-		down_read(&fi->i_gc_rwsem[rw]);
-		if (do_opu)
-			down_read(&fi->i_gc_rwsem[READ]);
-	}
-
-	err = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
-			iter, rw == WRITE ? get_data_block_dio_write :
-			get_data_block_dio, NULL, f2fs_dio_submit_bio_old,
-			rw == WRITE ? DIO_LOCKING | DIO_SKIP_HOLES :
-			DIO_SKIP_HOLES);
-
-	if (do_opu)
-		up_read(&fi->i_gc_rwsem[READ]);
-
-	up_read(&fi->i_gc_rwsem[rw]);
-
-	if (rw == WRITE) {
-		if (whint_mode == WHINT_MODE_OFF)
-			iocb->ki_hint = hint;
-		if (err > 0) {
-			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_IO,
-									err);
-			if (!do_opu)
-				set_inode_flag(inode, FI_UPDATE_WRITE);
-		} else if (err == -EIOCBQUEUED) {
-			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_IO,
-						count - iov_iter_count(iter));
-		} else if (err < 0) {
-			f2fs_write_failed(inode, offset + count);
-		}
-	} else {
-		if (err > 0)
-			f2fs_update_iostat(sbi, APP_DIRECT_READ_IO, err);
-		else if (err == -EIOCBQUEUED)
-			f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_READ_IO,
-						count - iov_iter_count(iter));
-	}
-
-out:
-	trace_f2fs_direct_IO_exit(inode, offset, count, rw, err);
-
-	return err;
-}
-
 void f2fs_invalidate_page(struct page *page, unsigned int offset,
 							unsigned int length)
 {
@@ -4046,7 +3868,7 @@ const struct address_space_operations f2fs_dblock_aops = {
 	.set_page_dirty	= f2fs_set_data_page_dirty,
 	.invalidatepage	= f2fs_invalidate_page,
 	.releasepage	= f2fs_release_page,
-	.direct_IO	= f2fs_direct_IO,
+	.direct_IO	= noop_direct_IO,
 	.bmap		= f2fs_bmap,
 	.swap_activate  = f2fs_swap_activate,
 	.swap_deactivate = f2fs_swap_deactivate,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
