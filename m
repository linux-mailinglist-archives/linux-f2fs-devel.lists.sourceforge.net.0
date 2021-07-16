Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5D3CB8F0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1g-0002gr-BJ; Fri, 16 Jul 2021 14:41:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1e-0002gf-7k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9ZtVSC3ypT+cMI/luC6AuVQPbfE2JzzTPNJK++TcQpo=; b=RvrcAE4VZ8vJf+dYcNWGyCmd8C
 MUuWKCiZm7yMrycO/MlHNMusgxNxG15JxhZEKKeV4tLvYobj2rZNcaiPSYmlGeoxUDGfgY9OD4DPi
 bH0y84JNFWScmtkKEasV0+vFdRwkCCT2GJofSc83r4cXYHtsNJcJ8JhFDhJmv2L5hZVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9ZtVSC3ypT+cMI/luC6AuVQPbfE2JzzTPNJK++TcQpo=; b=ZuzUcp7YLxQmgZjqWP3QgXMsDR
 feR3AoeanLctNpeeIyKUHs6RApX0x4DqP4IM1xmikY0wfbY7DjiweWCmxBZKwFatI3/iQFPQb/1W8
 f6hIRuSeoENyivhS1vLNoijQZ4iMtDFXaC7vi+k/lrQoZDoOufSj42d6mUpTOBxvPcvs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1X-00AaVL-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 190BF61408;
 Fri, 16 Jul 2021 14:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446449;
 bh=/RhOc8Bq7RNHgkvVqF1FMpGKXnWJaq5pVVMeGpCu9qs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jTlO7lPSLBEMwcAGoXwQjyij7M3BDM07C825FUXXr7Vut3A9BZ5rrcSrTF82maUNT
 TL+lCBfTEgeKdAf1S6MNo4kspS8mEzgPmexKDcdXsR9vEqhkD26ewcADB5yKGRArHb
 Uni6w7kaVI024uogaPRMqoRr1GNLMmZZ4mIYTZe3IJKLjA/Rnf1Vp/OMWge/Xv2Ume
 NTL92aOaa26hUPAk7rEOiXqC41bTSyMHlx8jYtiFckOt0JiWYf4ZROrFShAJZ+BalN
 ZDCFH4Xk1MnneDvLVTaOWnO35xtOLBPr/MoQYS7gN+nfSacCvt3rCIg7TEMfUQg70q
 i82hV9Fs8mg0A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:18 -0500
Message-Id: <20210716143919.44373-9-ebiggers@kernel.org>
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
X-Headers-End: 1m4P1X-00AaVL-JZ
Subject: [f2fs-dev] [PATCH 8/9] f2fs: use iomap for direct I/O writes
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

Convert f2fs_file_write_iter() to use iomap_dio_rw() for direct I/O
rather than using f2fs_direct_IO() via __generic_file_write_iter().

This is more complicated than the read-side conversion, but it follows a
similar pattern.  Some logic in __generic_file_write_iter() needed to be
re-implemented, while other things are now handled by iomap_dio_rw().
Existing f2fs behavior such as the conditions for falling back to
buffered I/O is retained, except for some things which shouldn't matter
such as the exact time that the timestamps are updated.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/data.c |   7 +-
 fs/f2fs/f2fs.h |   7 +-
 fs/f2fs/file.c | 215 ++++++++++++++++++++++++++++++++++++++++---------
 3 files changed, 180 insertions(+), 49 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9243159ee753..0d2bb651483d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1363,11 +1363,6 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
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
 
@@ -3130,7 +3125,7 @@ static int f2fs_write_data_pages(struct address_space *mapping,
 			FS_CP_DATA_IO : FS_DATA_IO);
 }
 
-static void f2fs_write_failed(struct inode *inode, loff_t to)
+void f2fs_write_failed(struct inode *inode, loff_t to)
 {
 	loff_t i_size = i_size_read(inode);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f869c4a2f79f..6dbbac05a15c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3238,10 +3238,8 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 	spin_lock(&sbi->iostat_lock);
 	sbi->rw_iostat[type] += io_bytes;
 
-	if (type == APP_WRITE_IO || type == APP_DIRECT_IO)
-		sbi->rw_iostat[APP_BUFFERED_IO] =
-			sbi->rw_iostat[APP_WRITE_IO] -
-			sbi->rw_iostat[APP_DIRECT_IO];
+	if (type == APP_BUFFERED_IO || type == APP_DIRECT_IO)
+		sbi->rw_iostat[APP_WRITE_IO] += io_bytes;
 
 	if (type == APP_BUFFERED_READ_IO || type == APP_DIRECT_READ_IO)
 		sbi->rw_iostat[APP_READ_IO] += io_bytes;
@@ -3625,6 +3623,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 				struct writeback_control *wbc,
 				enum iostat_type io_type,
 				int compr_blocks, bool allow_balance);
+void f2fs_write_failed(struct inode *inode, loff_t to);
 void f2fs_invalidate_page(struct page *page, unsigned int offset,
 			unsigned int length);
 int f2fs_release_page(struct page *page, gfp_t wait);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 52de655ef833..6b8eac6b25d4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4292,6 +4292,29 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
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
@@ -4299,15 +4322,14 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
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
 
@@ -4352,13 +4374,153 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
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
+	unsigned int dio_flags = 0;
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
+	} else {
+		ret = f2fs_convert_inline_inode(inode);
+		if (ret)
+			goto out;
+	}
+
+	if (iocb->ki_flags & IOCB_NOWAIT) {
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
+		down_read(&fi->i_gc_rwsem[WRITE]);
+		if (do_opu)
+			down_read(&fi->i_gc_rwsem[READ]);
+	}
+
+	if (whint_mode == WHINT_MODE_OFF)
+		iocb->ki_hint = WRITE_LIFE_NOT_SET;
+
+	if (pos + count > inode->i_size)
+		dio_flags |= IOMAP_DIO_FORCE_WAIT;
+	ret = iomap_dio_rw(iocb, from, &f2fs_iomap_ops, &f2fs_iomap_dio_ops,
+			   dio_flags);
+	if (ret == -ENOTBLK)
+		ret = 0;
+
+	if (whint_mode == WHINT_MODE_OFF)
+		iocb->ki_hint = hint;
+
+	if (do_opu)
+		up_read(&fi->i_gc_rwsem[READ]);
+
+	up_read(&fi->i_gc_rwsem[WRITE]);
+
+	if (ret < 0) {
+		if (ret == -EIOCBQUEUED)
+			f2fs_update_iostat(sbi, APP_DIRECT_IO,
+					   count - iov_iter_count(from));
+		goto out;
+	}
+	if (pos + ret > inode->i_size)
+		f2fs_i_size_write(inode, pos + ret);
+	f2fs_update_iostat(sbi, APP_DIRECT_IO, ret);
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
 
@@ -4381,48 +4543,26 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
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
-				       iov_iter_count(from)) ||
-		    f2fs_has_inline_data(inode) ||
-		    f2fs_force_buffered_io(inode, iocb, from)) {
-			ret = -EAGAIN;
-			goto out_unlock;
-		}
-	}
-	if (iocb->ki_flags & IOCB_DIRECT) {
-		/*
-		 * Convert inline data for Direct I/O before entering
-		 * f2fs_direct_IO().
-		 */
-		ret = f2fs_convert_inline_inode(inode);
-		if (ret)
-			goto out_unlock;
-	}
+	/* Determine whether we will do a direct write or a buffered write. */
+	dio = f2fs_should_use_dio(inode, iocb, from);
 
 	/* Possibly preallocate the blocks for the write. */
 	target_size = iocb->ki_pos + iov_iter_count(from);
-	preallocated = f2fs_preallocate_blocks(iocb, from);
+	preallocated = f2fs_preallocate_blocks(iocb, from, dio);
 	if (preallocated < 0) {
 		ret = preallocated;
 		goto out_unlock;
 	}
 
-	ret = __generic_file_write_iter(iocb, from);
+	/* Do the actual write. */
+	if (dio)
+		ret = f2fs_dio_write_iter(iocb, from, &may_need_sync);
+	else
+		ret = f2fs_buffered_write_iter(iocb, from);
 
 	/* Don't leave any preallocated blocks around past i_size. */
 	if (preallocated > 0 && inode->i_size < target_size) {
@@ -4433,14 +4573,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	}
 	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
-
-	if (ret > 0)
-		f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
 out_unlock:
 	inode_unlock(inode);
 out:
 	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
-	if (ret > 0)
+	if (ret > 0 && may_need_sync)
 		ret = generic_write_sync(iocb, ret);
 	return ret;
 }
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
