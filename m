Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE83CB8EA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1W-0002fj-41; Fri, 16 Jul 2021 14:41:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1T-0002fN-FX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kTCW18c2I8sGXB2dklYOKCNNNVBLQAgXJNpSyh7I0vQ=; b=GKdnK9OLAwttqSFGDRe4+X4FU4
 Wfelt6DhvLFxa7hjlM2lcyOJQNqufXmgzpYExv7ocDKLzmY6blNBbPm7B2f7+ouvx/gMajsgPNSl0
 G4sQ+kekg5ZXfBUPi7rBEsM4LuH3SIGGo/8sCtpWTY9Bv5IYhj5yTWsTxE/aQQFtEkn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kTCW18c2I8sGXB2dklYOKCNNNVBLQAgXJNpSyh7I0vQ=; b=YeP6/64sEDOqNGZFwaanj9TCn+
 Qe0TAIu7I80KG8JU7qCw2m3drZYEFCvZWeak9PjJhMqjhRmu8SLzpYeR7KZEVCkjE+0vwYmZjLn+5
 32jCq157H/+rx93Y2NqGmEA8k6vI21rlBO2gC805ifRwLK0gpn6b6mAH20pkDUKD8VG0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1S-0004ex-6R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 332E461402;
 Fri, 16 Jul 2021 14:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446448;
 bh=3us48jNa9I6IXFuMymwZsiIPZW4iBWQog9USG1tv/Hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VPzme+1YH9+pJGMmH+B7yMOcWBcNLcaRgKEWnlef7evwiL8MLTPxjl+WlFfZKHUNC
 nxSr9WTzXgFR0jDJMLZ+RifFTUJbGnq95c222aNVMpBK+IDk5wndqTvW1mIwDm5Fpy
 MMWYQPLv0/wvyUnB3ZYLeo0JNg6WXZtJcQp+JfESh7bmrsIlQycJMnBR2pxrj5lNHb
 +ddNU9dJQycz9ciN/+ijalSmTCvenB2SyFMYHJ/AOiOS5xZcjdrXrIVWFEeznoeYet
 s7IIRwtvj+usVaOFg/LydfdFuhG/qQVSmkXpHxuzpzNqCesmrXxKnwzJo3LjTBYIt6
 TJs4zJpFMZ+vQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:17 -0500
Message-Id: <20210716143919.44373-8-ebiggers@kernel.org>
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
X-Headers-End: 1m4P1S-0004ex-6R
Subject: [f2fs-dev] [PATCH 7/9] f2fs: use iomap for direct I/O reads
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

Convert f2fs_file_read_iter() to use iomap_dio_rw() for direct I/O
rather than using f2fs_direct_IO() via generic_file_read_iter().

Besides the new direct I/O implementation being more efficient
(especially with regards to the block mapping), this change retains the
existing f2fs behavior such as the conditions for falling back to
buffered I/O, the locking of i_gc_rwsem[READ], the iostat gathering, and
the f2fs_direct_IO_{enter,exit} tracepoints.  An exception is that we no
longer fall back to a buffered I/O read if a direct I/O read returns a
short read (previously this was done by generic_file_read_iter()), as
this doesn't appear to be a useful thing to do on f2fs.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/f2fs.h |  7 ++---
 fs/f2fs/file.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 82 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d2b1ef6976c4..f869c4a2f79f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3243,10 +3243,9 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 			sbi->rw_iostat[APP_WRITE_IO] -
 			sbi->rw_iostat[APP_DIRECT_IO];
 
-	if (type == APP_READ_IO || type == APP_DIRECT_READ_IO)
-		sbi->rw_iostat[APP_BUFFERED_READ_IO] =
-			sbi->rw_iostat[APP_READ_IO] -
-			sbi->rw_iostat[APP_DIRECT_READ_IO];
+	if (type == APP_BUFFERED_READ_IO || type == APP_DIRECT_READ_IO)
+		sbi->rw_iostat[APP_READ_IO] += io_bytes;
+
 	spin_unlock(&sbi->iostat_lock);
 
 	f2fs_record_iostat(sbi);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 279252c7f7bc..52de655ef833 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -23,6 +23,7 @@
 #include <linux/nls.h>
 #include <linux/sched/signal.h>
 #include <linux/fileattr.h>
+#include <linux/iomap.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -4201,20 +4202,93 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
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
+static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
-	int ret;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	const loff_t pos = iocb->ki_pos;
+	const size_t count = iov_iter_count(to);
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
+	ret = iomap_dio_rw(iocb, to, &f2fs_iomap_ops, &f2fs_iomap_dio_ops, 0);
+
+	up_read(&fi->i_gc_rwsem[READ]);
+
+	file_accessed(file);
+
+	if (ret > 0)
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_READ_IO, ret);
+	else if (ret == -EIOCBQUEUED)
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_READ_IO,
+				   count - iov_iter_count(to));
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
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
