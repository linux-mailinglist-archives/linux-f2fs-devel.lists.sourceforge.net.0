Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF39453BDB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Nov 2021 22:45:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mn6Gn-0003by-Um; Tue, 16 Nov 2021 21:45:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mn6Gi-0003bU-4h
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Nov 2021 21:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a++E+5TGFZtQq6+FiHwS2oJ2Jz6155cPXs7dxwMNuh0=; b=KmpHdAGpRCqWQlgQ58JNThwkJf
 Jf61w3zjSH45uF8OiFfpeVieDDIoWOt4y5k0haOi2WDzaBmCIbXBiCqSFWXXRg98Nvn1XVD1aRt1j
 bxPt6GF6kcMmxjyzceyV+MN1oyc7cNVBaNc5WymK1Jd9PTiN3JWOehz4iUMG3igj9Blg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a++E+5TGFZtQq6+FiHwS2oJ2Jz6155cPXs7dxwMNuh0=; b=O
 8FARxPKn6ZDgT2rdDgZhdvadG4gUcJrk8FvNSEfteXWhOpvLxsXuUYOykQ9WoMcUnfIYuFc7ZLyVX
 EVAHqwGneQqSz4aj1/Gpjy6yqJSmEwD6l+DLqFqluO+tJueXYJSAS+PzDSg2bjuhArqckjFTHm8d7
 Axh8HgIcHmdztLOM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mn6Gd-00FLnw-5w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Nov 2021 21:45:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D196D61A64;
 Tue, 16 Nov 2021 21:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637099117;
 bh=ZQEeWNCefRAQKzAbFIvzGe3ybEPLrzVqw9ktsJrDCik=;
 h=From:To:Cc:Subject:Date:From;
 b=jHlYOy+paQgU8HjCDRHXeH397oHDTas1uw9S6UfURS8zGcQCqQB4OBmYYIL7kPjLL
 42yZyIhCUUVN9xmvnlMH+YVD3J8hGJrTAWuzsAzGqW18QcQNcWDabG3ZJCWCFY5nYh
 Z6nLR28STiWVRKi/TMrIfZ4J1s5/omumaD/RgOlLhrWjGGOVdZZEfFd6JsfZ/qt1O7
 VwYHVyq8JW1RZjwn77puPTAbvivc0pbEvhxK1c14ivJCpd1tVZDEREjVj6By5WLb4g
 bmnndDS1tXWF0AsM5ics61sZrfVV4SZBORqSbj6CUNGDvqUSv7pr1SaHzcKSEJuuck
 wnyGoaZPi/F5w==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 16 Nov 2021 13:45:05 -0800
Message-Id: <20211116214510.2934905-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> f2fs_write_begin()
 assumes that all blocks were preallocated by default unless FI_NO_PREALLOC
 is explicitly set. This invites data corruption, as there are cases in which
 not all blocks are preallocat [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mn6Gd-00FLnw-5w
Subject: [f2fs-dev] [PATCH 1/6] f2fs: rework write preallocations
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

f2fs_write_begin() assumes that all blocks were preallocated by
default unless FI_NO_PREALLOC is explicitly set.  This invites data
corruption, as there are cases in which not all blocks are preallocated.
Commit 47501f87c61a ("f2fs: preallocate DIO blocks when forcing
buffered_io") fixed one case, but there are others remaining.

Fix up this logic by replacing this flag with FI_PREALLOCATED_ALL, which
only gets set if all blocks for the current write were preallocated.

Also clean up f2fs_preallocate_blocks(), move it to file.c, and make it
handle some of the logic that was previously in write_iter() directly.

Jaegeuk:
DIO to holes are turning into buffered IO in f2fs_direct_IO, so we should
not preallocate blocks.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c |  55 ++-------------------
 fs/f2fs/f2fs.h |   3 +-
 fs/f2fs/file.c | 130 +++++++++++++++++++++++++++++++------------------
 3 files changed, 87 insertions(+), 101 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9f754aaef558..3b27fb7daa8b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1384,53 +1384,6 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	return 0;
 }
 
-int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
-{
-	struct inode *inode = file_inode(iocb->ki_filp);
-	struct f2fs_map_blocks map;
-	int flag;
-	int err = 0;
-	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
-
-	map.m_lblk = F2FS_BLK_ALIGN(iocb->ki_pos);
-	map.m_len = F2FS_BYTES_TO_BLK(iocb->ki_pos + iov_iter_count(from));
-	if (map.m_len > map.m_lblk)
-		map.m_len -= map.m_lblk;
-	else
-		map.m_len = 0;
-
-	map.m_next_pgofs = NULL;
-	map.m_next_extent = NULL;
-	map.m_seg_type = NO_CHECK_TYPE;
-	map.m_may_create = true;
-
-	if (direct_io) {
-		map.m_seg_type = f2fs_rw_hint_to_seg_type(iocb->ki_hint);
-		flag = f2fs_force_buffered_io(inode, iocb, from) ?
-					F2FS_GET_BLOCK_PRE_AIO :
-					F2FS_GET_BLOCK_PRE_DIO;
-		goto map_blocks;
-	}
-	if (iocb->ki_pos + iov_iter_count(from) > MAX_INLINE_DATA(inode)) {
-		err = f2fs_convert_inline_inode(inode);
-		if (err)
-			return err;
-	}
-	if (f2fs_has_inline_data(inode))
-		return err;
-
-	flag = F2FS_GET_BLOCK_PRE_AIO;
-
-map_blocks:
-	err = f2fs_map_blocks(inode, &map, 1, flag);
-	if (map.m_len > 0 && err == -ENOSPC) {
-		if (!direct_io)
-			set_inode_flag(inode, FI_NO_PREALLOC);
-		err = 0;
-	}
-	return err;
-}
-
 void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
 {
 	if (flag == F2FS_GET_BLOCK_PRE_AIO) {
@@ -3339,12 +3292,10 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	int flag;
 
 	/*
-	 * we already allocated all the blocks, so we don't need to get
-	 * the block addresses when there is no need to fill the page.
+	 * If a whole page is being written and we already preallocated all the
+	 * blocks, then there is no need to get a block address now.
 	 */
-	if (!f2fs_has_inline_data(inode) && len == PAGE_SIZE &&
-	    !is_inode_flag_set(inode, FI_NO_PREALLOC) &&
-	    !f2fs_verity_in_progress(inode))
+	if (len == PAGE_SIZE && is_inode_flag_set(inode, FI_PREALLOCATED_ALL))
 		return 0;
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ce9fc9f13000..be871a79c634 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -715,7 +715,7 @@ enum {
 	FI_INLINE_DOTS,		/* indicate inline dot dentries */
 	FI_DO_DEFRAG,		/* indicate defragment is running */
 	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
-	FI_NO_PREALLOC,		/* indicate skipped preallocated blocks */
+	FI_PREALLOCATED_ALL,	/* all blocks for write were preallocated */
 	FI_HOT_DATA,		/* indicate file is hot */
 	FI_EXTRA_ATTR,		/* indicate file has extra attribute */
 	FI_PROJ_INHERIT,	/* indicate file inherits projectid */
@@ -3614,7 +3614,6 @@ void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
 int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
 int f2fs_reserve_new_block(struct dnode_of_data *dn);
 int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
-int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
 int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
 struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
 			int op_flags, bool for_write);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 92ec2699bc85..4bf77a5bf998 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4235,10 +4235,76 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 	return ret;
 }
 
+/*
+ * Preallocate blocks for a write request, if it is possible and helpful to do
+ * so.  Returns a positive number if blocks may have been preallocated, 0 if no
+ * blocks were preallocated, or a negative errno value if something went
+ * seriously wrong.  Also sets FI_PREALLOCATED_ALL on the inode if *all* the
+ * requested blocks (not just some of them) have been allocated.
+ */
+static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct inode *inode = file_inode(iocb->ki_filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	const loff_t pos = iocb->ki_pos;
+	const size_t count = iov_iter_count(iter);
+	struct f2fs_map_blocks map = {};
+	bool dio = (iocb->ki_flags & IOCB_DIRECT) &&
+		   !f2fs_force_buffered_io(inode, iocb, iter);
+	int flag;
+	int ret;
+
+	/* If it will be an out-of-place direct write, don't bother. */
+	if (dio && f2fs_lfs_mode(sbi))
+		return 0;
+
+	/* No-wait I/O can't allocate blocks. */
+	if (iocb->ki_flags & IOCB_NOWAIT)
+		return 0;
+
+	/* If it will be a short write, don't bother. */
+	if (fault_in_iov_iter_readable(iter, count))
+		return 0;
+
+	if (f2fs_has_inline_data(inode)) {
+		/* If the data will fit inline, don't bother. */
+		if (pos + count <= MAX_INLINE_DATA(inode))
+			return 0;
+		ret = f2fs_convert_inline_inode(inode);
+		if (ret)
+			return ret;
+	}
+
+	map.m_lblk = F2FS_BLK_ALIGN(pos);
+	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
+	if (map.m_len > map.m_lblk)
+		map.m_len -= map.m_lblk;
+	else
+		map.m_len = 0;
+	map.m_may_create = true;
+	if (dio) {
+		map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
+		flag = F2FS_GET_BLOCK_PRE_DIO;
+	} else {
+		map.m_seg_type = NO_CHECK_TYPE;
+		flag = F2FS_GET_BLOCK_PRE_AIO;
+	}
+
+	ret = f2fs_map_blocks(inode, &map, 1, flag);
+	/* -ENOSPC is only a fatal error if no blocks could be allocated. */
+	if (ret < 0 && !(ret == -ENOSPC && map.m_len > 0))
+		return ret;
+	if (ret == 0)
+		set_inode_flag(inode, FI_PREALLOCATED_ALL);
+	return map.m_len;
+}
+
 static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
+	loff_t target_size;
+	int preallocated;
 	ssize_t ret;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode)))) {
@@ -4262,84 +4328,54 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 
 	if (unlikely(IS_IMMUTABLE(inode))) {
 		ret = -EPERM;
-		goto unlock;
+		goto out_unlock;
 	}
 
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		ret = -EPERM;
-		goto unlock;
+		goto out_unlock;
 	}
 
 	ret = generic_write_checks(iocb, from);
 	if (ret > 0) {
-		bool preallocated = false;
-		size_t target_size = 0;
-		int err;
-
-		if (fault_in_iov_iter_readable(from, iov_iter_count(from)))
-			set_inode_flag(inode, FI_NO_PREALLOC);
-
-		if ((iocb->ki_flags & IOCB_NOWAIT)) {
+		if (iocb->ki_flags & IOCB_NOWAIT) {
 			if (!f2fs_overwrite_io(inode, iocb->ki_pos,
 						iov_iter_count(from)) ||
 				f2fs_has_inline_data(inode) ||
 				f2fs_force_buffered_io(inode, iocb, from)) {
-				clear_inode_flag(inode, FI_NO_PREALLOC);
-				inode_unlock(inode);
 				ret = -EAGAIN;
-				goto out;
+				goto out_unlock;
 			}
-			goto write;
 		}
-
-		if (is_inode_flag_set(inode, FI_NO_PREALLOC))
-			goto write;
-
 		if (iocb->ki_flags & IOCB_DIRECT) {
-			/*
-			 * Convert inline data for Direct I/O before entering
-			 * f2fs_direct_IO().
-			 */
-			err = f2fs_convert_inline_inode(inode);
-			if (err)
-				goto out_err;
-			/*
-			 * If force_buffere_io() is true, we have to allocate
-			 * blocks all the time, since f2fs_direct_IO will fall
-			 * back to buffered IO.
-			 */
-			if (!f2fs_force_buffered_io(inode, iocb, from) &&
-					f2fs_lfs_mode(F2FS_I_SB(inode)))
-				goto write;
+			ret = f2fs_convert_inline_inode(inode);
+			if (ret)
+				goto out_unlock;
 		}
-		preallocated = true;
+		/* Possibly preallocate the blocks for the write. */
 		target_size = iocb->ki_pos + iov_iter_count(from);
-
-		err = f2fs_preallocate_blocks(iocb, from);
-		if (err) {
-out_err:
-			clear_inode_flag(inode, FI_NO_PREALLOC);
-			inode_unlock(inode);
-			ret = err;
-			goto out;
+		preallocated = f2fs_preallocate_blocks(iocb, from);
+		if (preallocated < 0) {
+			ret = preallocated;
+			goto out_unlock;
 		}
-write:
+
 		ret = __generic_file_write_iter(iocb, from);
-		clear_inode_flag(inode, FI_NO_PREALLOC);
 
-		/* if we couldn't write data, we should deallocate blocks. */
-		if (preallocated && i_size_read(inode) < target_size) {
+		/* Don't leave any preallocated blocks around past i_size. */
+		if (preallocated > 0 && i_size_read(inode) < target_size) {
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 			filemap_invalidate_lock(inode->i_mapping);
 			f2fs_truncate(inode);
 			filemap_invalidate_unlock(inode->i_mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		}
+		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
 
 		if (ret > 0)
 			f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
 	}
-unlock:
+out_unlock:
 	inode_unlock(inode);
 out:
 	trace_f2fs_file_write_iter(inode, iocb->ki_pos,
-- 
2.34.0.rc1.387.gb447b232ab-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
