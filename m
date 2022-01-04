Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736C4849D0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jan 2022 22:24:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n4rIX-0007hz-Nk; Tue, 04 Jan 2022 21:24:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n4rIV-0007hf-JD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 21:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UWHt1NLGFHi96Byx1AY/Ihspq9NllnWwEJhVPZM0Qw4=; b=ONli4T6JiIYfoYvSFCKUhoSA10
 P/9DuGCXhWJ2s8JRkk6q19y+xp5kOU/XFp2rgLeGq218YgHUr6pWFfwsAYv7RVl9yoLPImUi6ye7h
 stzhbqnH7bcA89g817DwZHsioAHDgcnlSEdPTmRaT5M6xAAJ7Z0LuJLQXYfMUN/Q7iMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UWHt1NLGFHi96Byx1AY/Ihspq9NllnWwEJhVPZM0Qw4=; b=Z5NvTR8BPVKI6jKb9g7kKzF64v
 5VkY6imCECvQ0GKmhXPBQCw9yN96WF1OEJD0N0s02lkxzEgCmu4jtoLQOUkVUip76x61KgqJw3cr0
 j59hRBQQoOb3olZHH+/KkJJWbxyG5YLA9h2rN/eKLlbMTgO+eLqubyEKeKl8+TmPfQkU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n4rIU-0007hF-6m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Jan 2022 21:24:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC08C615B6;
 Tue,  4 Jan 2022 21:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D30C36AED;
 Tue,  4 Jan 2022 21:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641331474;
 bh=xemVjhJxtJPKMf44Cx8+jitOD0E3Fr+GQ3P1MnApG8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OHsMLPq0iaoD9AmgsLZHg9IVv04Idig0ZkOKZ50nLEjj8Mz3U/wFpLU9I1HBqT1OG
 rUTQXRcDDEFoSMZy2B4bInQfR67/3FqiLQu++ATAvSAxS059haOVxlnCTLON4bIQJD
 YFDvu57EDHfBCkzlUfXVp/RPBaMNhSjxo14PpUTXFT9nJagOB2oY85YqwH6rRsM+iz
 Ib8v8c2x9BiudBbUgg/4CQAd9KJUhnHw0thQkuUjELO5yFCMVpMD6V/tUN8wbPmsm+
 vDdtARc2Y+gerypcrFZELgjqbRXxnhydlQHV0NNVssY7HoZSNS1nCpyDNlR6Cf/YPj
 gLxZ/fM6AHTCQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  4 Jan 2022 13:24:19 -0800
Message-Id: <20220104212419.1879225-6-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220104212419.1879225-1-jaegeuk@kernel.org>
References: <20220104212419.1879225-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make
 f2fs_file_read_iter()
 and f2fs_file_write_iter() use the iomap direct I/O implementation instead
 of the fs/direct-io.c one. The iomap implementation is more efficient, and
 it also avoids the need to add new features and optimizations to the old
 implementation. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n4rIU-0007hF-6m
Subject: [f2fs-dev] [PATCH 6/6] f2fs: use iomap for direct I/O
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make f2fs_file_read_iter() and f2fs_file_write_iter() use the iomap
direct I/O implementation instead of the fs/direct-io.c one.

The iomap implementation is more efficient, and it also avoids the need
to add new features and optimizations to the old implementation.

This new implementation also eliminates the need for f2fs to hook bio
submission and completion and to allocate memory per-bio.  This is
because it's possible to correctly update f2fs's in-flight DIO counters
using __iomap_dio_rw() in combination with an implementation of
iomap_dio_ops::end_io() (as suggested by Christoph Hellwig).

When possible, this new implementation preserves existing f2fs behavior
such as the conditions for falling back to buffered I/O.

This patch has been tested with xfstests by running 'gce-xfstests -c
f2fs -g auto -X generic/017' with and without this patch; no regressions
were seen.  (Some tests fail both before and after.  generic/017 hangs
both before and after, so it had to be excluded.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
[Jaegeuk Kim: use spin_lock_bh for f2fs_update_iostat in softirq]
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c   | 205 +---------------------------
 fs/f2fs/f2fs.h   |   8 +-
 fs/f2fs/file.c   | 342 +++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/iostat.c |  40 +++---
 4 files changed, 322 insertions(+), 273 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 57e6a6f0daf9..a9652a8e669b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1377,11 +1377,6 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 		f2fs_invalidate_compress_page(sbi, old_blkaddr);
 	}
 	f2fs_update_data_blkaddr(dn, dn->data_blkaddr);
-
-	/*
-	 * i_size will be updated by direct_IO. Otherwise, we'll get stale
-	 * data from unwritten block via dio_read.
-	 */
 	return 0;
 }
 
@@ -1743,50 +1738,6 @@ static inline u64 blks_to_bytes(struct inode *inode, u64 blks)
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
-
-		if (map.m_multidev_dio)
-			bh->b_bdev = map.m_bdev;
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
@@ -3263,7 +3214,7 @@ static int f2fs_write_data_pages(struct address_space *mapping,
 			FS_CP_DATA_IO : FS_DATA_IO);
 }
 
-static void f2fs_write_failed(struct inode *inode, loff_t to)
+void f2fs_write_failed(struct inode *inode, loff_t to)
 {
 	loff_t i_size = i_size_read(inode);
 
@@ -3551,158 +3502,6 @@ static int f2fs_write_end(struct file *file,
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
-static void f2fs_dio_end_io(struct bio *bio)
-{
-	struct f2fs_private_dio *dio = bio->bi_private;
-
-	dec_page_count(F2FS_I_SB(dio->inode),
-			dio->write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
-
-	bio->bi_private = dio->orig_private;
-	bio->bi_end_io = dio->orig_end_io;
-
-	kfree(dio);
-
-	bio_endio(bio);
-}
-
-static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
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
-	do_opu = rw == WRITE && f2fs_lfs_mode(sbi);
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
-			get_data_block_dio, NULL, f2fs_dio_submit_bio,
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
@@ -4158,7 +3957,7 @@ const struct address_space_operations f2fs_dblock_aops = {
 	.set_page_dirty	= f2fs_set_data_page_dirty,
 	.invalidatepage	= f2fs_invalidate_page,
 	.releasepage	= f2fs_release_page,
-	.direct_IO	= f2fs_direct_IO,
+	.direct_IO	= noop_direct_IO,
 	.bmap		= f2fs_bmap,
 	.swap_activate  = f2fs_swap_activate,
 	.swap_deactivate = f2fs_swap_deactivate,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8242f47304a5..ac6dda6c4c5a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1807,13 +1807,6 @@ struct f2fs_sb_info {
 #endif
 };
 
-struct f2fs_private_dio {
-	struct inode *inode;
-	void *orig_private;
-	bio_end_io_t *orig_end_io;
-	bool write;
-};
-
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 #define f2fs_show_injection_info(sbi, type)					\
 	printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",	\
@@ -3642,6 +3635,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
+void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_page(struct page *page, unsigned int offset,
 			unsigned int length);
 int f2fs_release_page(struct page *page, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 048db4852b28..7516d97d5016 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -24,6 +24,7 @@
 #include <linux/sched/signal.h>
 #include <linux/fileattr.h>
 #include <linux/fadvise.h>
+#include <linux/iomap.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -4219,23 +4220,145 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	return __f2fs_ioctl(filp, cmd, arg);
 }
 
-static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
+/*
+ * Return %true if the given read or write request should use direct I/O, or
+ * %false if it should use buffered I/O.
+ */
+static bool f2fs_should_use_dio(struct inode *inode, struct kiocb *iocb,
+				struct iov_iter *iter)
+{
+	unsigned int align;
+
+	if (!(iocb->ki_flags & IOCB_DIRECT))
+		return false;
+
+	if (f2fs_force_buffered_io(inode, iocb, iter))
+		return false;
+
+	/*
+	 * Direct I/O not aligned to the disk's logical_block_size will be
+	 * attempted, but will fail with -EINVAL.
+	 *
+	 * f2fs additionally requires that direct I/O be aligned to the
+	 * filesystem block size, which is often a stricter requirement.
+	 * However, f2fs traditionally falls back to buffered I/O on requests
+	 * that are logical_block_size-aligned but not fs-block aligned.
+	 *
+	 * The below logic implements this behavior.
+	 */
+	align = iocb->ki_pos | iov_iter_alignment(iter);
+	if (!IS_ALIGNED(align, i_blocksize(inode)) &&
+	    IS_ALIGNED(align, bdev_logical_block_size(inode->i_sb->s_bdev)))
+		return false;
+
+	return true;
+}
+
+static int f2fs_dio_read_end_io(struct kiocb *iocb, ssize_t size, int error,
+				unsigned int flags)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(iocb->ki_filp));
+
+	dec_page_count(sbi, F2FS_DIO_READ);
+	if (error)
+		return error;
+	f2fs_update_iostat(sbi, APP_DIRECT_READ_IO, size);
+	return 0;
+}
+
+static const struct iomap_dio_ops f2fs_iomap_dio_read_ops = {
+	.end_io = f2fs_dio_read_end_io,
+};
+
+static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
-	int ret;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	const loff_t pos = iocb->ki_pos;
+	const size_t count = iov_iter_count(to);
+	struct iomap_dio *dio;
+	ssize_t ret;
+
+	if (count == 0)
+		return 0; /* skip atime update */
+
+	trace_f2fs_direct_IO_enter(inode, pos, count, READ);
+
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		if (!down_read_trylock(&fi->i_gc_rwsem[READ])) {
+			ret = -EAGAIN;
+			goto out;
+		}
+	} else {
+		down_read(&fi->i_gc_rwsem[READ]);
+	}
+
+	/*
+	 * We have to use __iomap_dio_rw() and iomap_dio_complete() instead of
+	 * the higher-level function iomap_dio_rw() in order to ensure that the
+	 * F2FS_DIO_READ counter will be decremented correctly in all cases.
+	 */
+	inc_page_count(sbi, F2FS_DIO_READ);
+	dio = __iomap_dio_rw(iocb, to, &f2fs_iomap_ops,
+			     &f2fs_iomap_dio_read_ops, 0, 0);
+	if (IS_ERR_OR_NULL(dio)) {
+		ret = PTR_ERR_OR_ZERO(dio);
+		if (ret != -EIOCBQUEUED)
+			dec_page_count(sbi, F2FS_DIO_READ);
+	} else {
+		ret = iomap_dio_complete(dio);
+	}
+
+	up_read(&fi->i_gc_rwsem[READ]);
+
+	file_accessed(file);
+out:
+	trace_f2fs_direct_IO_exit(inode, pos, count, READ, ret);
+	return ret;
+}
+
+static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	ssize_t ret;
 
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	ret = generic_file_read_iter(iocb, iter);
+	if (f2fs_should_use_dio(inode, iocb, to))
+		return f2fs_dio_read_iter(iocb, to);
 
+	ret = filemap_read(iocb, to, 0);
 	if (ret > 0)
-		f2fs_update_iostat(F2FS_I_SB(inode), APP_READ_IO, ret);
-
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
 	return ret;
 }
 
+static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
+	ssize_t count;
+	int err;
+
+	if (IS_IMMUTABLE(inode))
+		return -EPERM;
+
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
+		return -EPERM;
+
+	count = generic_write_checks(iocb, from);
+	if (count <= 0)
+		return count;
+
+	err = file_modified(file);
+	if (err)
+		return err;
+	return count;
+}
+
 /*
  * Preallocate blocks for a write request, if it is possible and helpful to do
  * so.  Returns a positive number if blocks may have been preallocated, 0 if no
@@ -4243,15 +4366,14 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
  * seriously wrong.  Also sets FI_PREALLOCATED_ALL on the inode if *all* the
  * requested blocks (not just some of them) have been allocated.
  */
-static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
+static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
+				   bool dio)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	const loff_t pos = iocb->ki_pos;
 	const size_t count = iov_iter_count(iter);
 	struct f2fs_map_blocks map = {};
-	bool dio = (iocb->ki_flags & IOCB_DIRECT) &&
-		   !f2fs_force_buffered_io(inode, iocb, iter);
 	int flag;
 	int ret;
 
@@ -4308,13 +4430,174 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
 	return map.m_len;
 }
 
-static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
+static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
+					struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
+	ssize_t ret;
+
+	if (iocb->ki_flags & IOCB_NOWAIT)
+		return -EOPNOTSUPP;
+
+	current->backing_dev_info = inode_to_bdi(inode);
+	ret = generic_perform_write(file, from, iocb->ki_pos);
+	current->backing_dev_info = NULL;
+
+	if (ret > 0) {
+		iocb->ki_pos += ret;
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_IO, ret);
+	}
+	return ret;
+}
+
+static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
+				 unsigned int flags)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(iocb->ki_filp));
+
+	dec_page_count(sbi, F2FS_DIO_WRITE);
+	if (error)
+		return error;
+	f2fs_update_iostat(sbi, APP_DIRECT_IO, size);
+	return 0;
+}
+
+static const struct iomap_dio_ops f2fs_iomap_dio_write_ops = {
+	.end_io = f2fs_dio_write_end_io,
+};
+
+static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
+				   bool *may_need_sync)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	const bool do_opu = f2fs_lfs_mode(sbi);
+	const int whint_mode = F2FS_OPTION(sbi).whint_mode;
+	const loff_t pos = iocb->ki_pos;
+	const ssize_t count = iov_iter_count(from);
+	const enum rw_hint hint = iocb->ki_hint;
+	unsigned int dio_flags;
+	struct iomap_dio *dio;
+	ssize_t ret;
+
+	trace_f2fs_direct_IO_enter(inode, pos, count, WRITE);
+
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		/* f2fs_convert_inline_inode() and block allocation can block */
+		if (f2fs_has_inline_data(inode) ||
+		    !f2fs_overwrite_io(inode, pos, count)) {
+			ret = -EAGAIN;
+			goto out;
+		}
+
+		if (!down_read_trylock(&fi->i_gc_rwsem[WRITE])) {
+			ret = -EAGAIN;
+			goto out;
+		}
+		if (do_opu && !down_read_trylock(&fi->i_gc_rwsem[READ])) {
+			up_read(&fi->i_gc_rwsem[WRITE]);
+			ret = -EAGAIN;
+			goto out;
+		}
+	} else {
+		ret = f2fs_convert_inline_inode(inode);
+		if (ret)
+			goto out;
+
+		down_read(&fi->i_gc_rwsem[WRITE]);
+		if (do_opu)
+			down_read(&fi->i_gc_rwsem[READ]);
+	}
+	if (whint_mode == WHINT_MODE_OFF)
+		iocb->ki_hint = WRITE_LIFE_NOT_SET;
+
+	/*
+	 * We have to use __iomap_dio_rw() and iomap_dio_complete() instead of
+	 * the higher-level function iomap_dio_rw() in order to ensure that the
+	 * F2FS_DIO_WRITE counter will be decremented correctly in all cases.
+	 */
+	inc_page_count(sbi, F2FS_DIO_WRITE);
+	dio_flags = 0;
+	if (pos + count > inode->i_size)
+		dio_flags |= IOMAP_DIO_FORCE_WAIT;
+	dio = __iomap_dio_rw(iocb, from, &f2fs_iomap_ops,
+			     &f2fs_iomap_dio_write_ops, dio_flags, 0);
+	if (IS_ERR_OR_NULL(dio)) {
+		ret = PTR_ERR_OR_ZERO(dio);
+		if (ret == -ENOTBLK)
+			ret = 0;
+		if (ret != -EIOCBQUEUED)
+			dec_page_count(sbi, F2FS_DIO_WRITE);
+	} else {
+		ret = iomap_dio_complete(dio);
+	}
+
+	if (whint_mode == WHINT_MODE_OFF)
+		iocb->ki_hint = hint;
+	if (do_opu)
+		up_read(&fi->i_gc_rwsem[READ]);
+	up_read(&fi->i_gc_rwsem[WRITE]);
+
+	if (ret < 0)
+		goto out;
+	if (pos + ret > inode->i_size)
+		f2fs_i_size_write(inode, pos + ret);
+	if (!do_opu)
+		set_inode_flag(inode, FI_UPDATE_WRITE);
+
+	if (iov_iter_count(from)) {
+		ssize_t ret2;
+		loff_t bufio_start_pos = iocb->ki_pos;
+
+		/*
+		 * The direct write was partial, so we need to fall back to a
+		 * buffered write for the remainder.
+		 */
+
+		ret2 = f2fs_buffered_write_iter(iocb, from);
+		if (iov_iter_count(from))
+			f2fs_write_failed(inode, iocb->ki_pos);
+		if (ret2 < 0)
+			goto out;
+
+		/*
+		 * Ensure that the pagecache pages are written to disk and
+		 * invalidated to preserve the expected O_DIRECT semantics.
+		 */
+		if (ret2 > 0) {
+			loff_t bufio_end_pos = bufio_start_pos + ret2 - 1;
+
+			ret += ret2;
+
+			ret2 = filemap_write_and_wait_range(file->f_mapping,
+							    bufio_start_pos,
+							    bufio_end_pos);
+			if (ret2 < 0)
+				goto out;
+			invalidate_mapping_pages(file->f_mapping,
+						 bufio_start_pos >> PAGE_SHIFT,
+						 bufio_end_pos >> PAGE_SHIFT);
+		}
+	} else {
+		/* iomap_dio_rw() already handled the generic_write_sync(). */
+		*may_need_sync = false;
+	}
+out:
+	trace_f2fs_direct_IO_exit(inode, pos, count, WRITE, ret);
+	return ret;
+}
+
+static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
 	const loff_t orig_pos = iocb->ki_pos;
 	const size_t orig_count = iov_iter_count(from);
 	loff_t target_size;
+	bool dio;
+	bool may_need_sync = true;
 	int preallocated;
 	ssize_t ret;
 
@@ -4337,42 +4620,23 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		inode_lock(inode);
 	}
 
-	if (unlikely(IS_IMMUTABLE(inode))) {
-		ret = -EPERM;
-		goto out_unlock;
-	}
-
-	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
-		ret = -EPERM;
-		goto out_unlock;
-	}
-
-	ret = generic_write_checks(iocb, from);
+	ret = f2fs_write_checks(iocb, from);
 	if (ret <= 0)
 		goto out_unlock;
 
-	if (iocb->ki_flags & IOCB_NOWAIT) {
-		if (!f2fs_overwrite_io(inode, iocb->ki_pos,
-					iov_iter_count(from)) ||
-				f2fs_has_inline_data(inode) ||
-				f2fs_force_buffered_io(inode, iocb, from)) {
-			ret = -EAGAIN;
-			goto out_unlock;
-		}
-	}
+	/* Determine whether we will do a direct write or a buffered write. */
+	dio = f2fs_should_use_dio(inode, iocb, from);
 
-	if (iocb->ki_flags & IOCB_DIRECT) {
-		ret = f2fs_convert_inline_inode(inode);
-		if (ret)
-			goto out_unlock;
-	}
 	/* Possibly preallocate the blocks for the write. */
 	target_size = iocb->ki_pos + iov_iter_count(from);
-	preallocated = f2fs_preallocate_blocks(iocb, from);
+	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
 	if (preallocated < 0)
 		ret = preallocated;
 	else
-		ret = __generic_file_write_iter(iocb, from);
+		/* Do the actual write. */
+		ret = dio ?
+			f2fs_dio_write_iter(iocb, from, &may_need_sync):
+			f2fs_buffered_write_iter(iocb, from);
 
 	/* Don't leave any preallocated blocks around past i_size. */
 	if (preallocated && i_size_read(inode) < target_size) {
@@ -4387,15 +4651,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
-
-	if (ret > 0)
-		f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
-
 out_unlock:
 	inode_unlock(inode);
 out:
 	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
-	if (ret > 0)
+	if (ret > 0 && may_need_sync)
 		ret = generic_write_sync(iocb, ret);
 	return ret;
 }
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index cdcf54ae0db8..be599f31d3c4 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -92,7 +92,7 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
 
-	spin_lock_irq(&sbi->iostat_lat_lock);
+	spin_lock_bh(&sbi->iostat_lat_lock);
 	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
 		for (io = 0; io < NR_PAGE_TYPE; io++) {
 			cnt = io_lat->bio_cnt[idx][io];
@@ -106,7 +106,7 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 			io_lat->bio_cnt[idx][io] = 0;
 		}
 	}
-	spin_unlock_irq(&sbi->iostat_lat_lock);
+	spin_unlock_bh(&sbi->iostat_lat_lock);
 
 	trace_f2fs_iostat_latency(sbi, iostat_lat);
 }
@@ -120,9 +120,9 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 		return;
 
 	/* Need double check under the lock */
-	spin_lock(&sbi->iostat_lock);
+	spin_lock_bh(&sbi->iostat_lock);
 	if (time_is_after_jiffies(sbi->iostat_next_period)) {
-		spin_unlock(&sbi->iostat_lock);
+		spin_unlock_bh(&sbi->iostat_lock);
 		return;
 	}
 	sbi->iostat_next_period = jiffies +
@@ -133,7 +133,7 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 				sbi->prev_rw_iostat[i];
 		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
 	}
-	spin_unlock(&sbi->iostat_lock);
+	spin_unlock_bh(&sbi->iostat_lock);
 
 	trace_f2fs_iostat(sbi, iostat_diff);
 
@@ -145,16 +145,16 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
 	int i;
 
-	spin_lock(&sbi->iostat_lock);
+	spin_lock_bh(&sbi->iostat_lock);
 	for (i = 0; i < NR_IO_TYPE; i++) {
 		sbi->rw_iostat[i] = 0;
 		sbi->prev_rw_iostat[i] = 0;
 	}
-	spin_unlock(&sbi->iostat_lock);
+	spin_unlock_bh(&sbi->iostat_lock);
 
-	spin_lock_irq(&sbi->iostat_lat_lock);
+	spin_lock_bh(&sbi->iostat_lat_lock);
 	memset(io_lat, 0, sizeof(struct iostat_lat_info));
-	spin_unlock_irq(&sbi->iostat_lat_lock);
+	spin_unlock_bh(&sbi->iostat_lat_lock);
 }
 
 void f2fs_update_iostat(struct f2fs_sb_info *sbi,
@@ -163,19 +163,16 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 	if (!sbi->iostat_enable)
 		return;
 
-	spin_lock(&sbi->iostat_lock);
+	spin_lock_bh(&sbi->iostat_lock);
 	sbi->rw_iostat[type] += io_bytes;
 
-	if (type == APP_WRITE_IO || type == APP_DIRECT_IO)
-		sbi->rw_iostat[APP_BUFFERED_IO] =
-			sbi->rw_iostat[APP_WRITE_IO] -
-			sbi->rw_iostat[APP_DIRECT_IO];
+	if (type == APP_BUFFERED_IO || type == APP_DIRECT_IO)
+		sbi->rw_iostat[APP_WRITE_IO] += io_bytes;
 
-	if (type == APP_READ_IO || type == APP_DIRECT_READ_IO)
-		sbi->rw_iostat[APP_BUFFERED_READ_IO] =
-			sbi->rw_iostat[APP_READ_IO] -
-			sbi->rw_iostat[APP_DIRECT_READ_IO];
-	spin_unlock(&sbi->iostat_lock);
+	if (type == APP_BUFFERED_READ_IO || type == APP_DIRECT_READ_IO)
+		sbi->rw_iostat[APP_READ_IO] += io_bytes;
+
+	spin_unlock_bh(&sbi->iostat_lock);
 
 	f2fs_record_iostat(sbi);
 }
@@ -185,7 +182,6 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
 {
 	unsigned long ts_diff;
 	unsigned int iotype = iostat_ctx->type;
-	unsigned long flags;
 	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
 	int idx;
@@ -206,12 +202,12 @@ static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
 			idx = WRITE_ASYNC_IO;
 	}
 
-	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
+	spin_lock_bh(&sbi->iostat_lat_lock);
 	io_lat->sum_lat[idx][iotype] += ts_diff;
 	io_lat->bio_cnt[idx][iotype]++;
 	if (ts_diff > io_lat->peak_lat[idx][iotype])
 		io_lat->peak_lat[idx][iotype] = ts_diff;
-	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
+	spin_unlock_bh(&sbi->iostat_lat_lock);
 }
 
 void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
-- 
2.34.1.448.ga2b2bfdf31-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
