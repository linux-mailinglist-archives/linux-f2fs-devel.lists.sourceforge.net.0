Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 842AF3CB8E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1O-0002hQ-Cf; Fri, 16 Jul 2021 14:40:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1M-0002hE-VX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXPFQngH3wvIc4VUxvQUBKmI+D2cWA3hkXRjuD4G/sM=; b=V4CcSOrRvdHFPwAZSPIfWe9mHM
 pX0CTK/dbwHPLICTuWIBobOnIQNr7PoQvHnb1fCB1xpIPBxahlObYjczEx3UDi+196IRxVk/oP53g
 tEAU1inNaVz4dy45UdGOiniqf7SkXrbTomzOH1VS8Nen2RuFnZRn1VHnscuwCeqr8d9s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lXPFQngH3wvIc4VUxvQUBKmI+D2cWA3hkXRjuD4G/sM=; b=X8QQ88UfBCRSvxpl7fQmChrocs
 K+mP5BFHsXh7QB3CSAJIWJRBzbYX2TJ9LImzZOTbaO5yuTI9GTkYzQIIgNN7XN+8UVvEJL5xOoc2K
 kNxqE8z9BCPw8AXhpLZYjjdmBzAcw5zLSnVMij6WzEA29mZHC/auVRgpxweudVC/C3ZE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1I-0004e8-Ty
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:40:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91DAC613FD;
 Fri, 16 Jul 2021 14:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446446;
 bh=vCaSCO/j0nnx7bQBFUHP3HyLFhbsFlt0djzBlzFWNVs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=heWdLJ77bkT+cizJPQddge0HRDTv8RP4gB/Y9JoCQQ8YgeCIZs1H/JdlbkfOak+P6
 cL2Hgy4MV1eyJJdcK97O3cMaYiCpKctuiUjheBeFLum7g5IPO+Mc5ole84MqdE/lQ1
 D3hlSmfpvp+YNKOyImOgM3yigZ7jHQdZCaTR86w3HiQhBkG/ZFd+mBsEN5+vSf+CQb
 +sS2eVqTIO5N/s+fvvBfDRNDNE1esy5clptU7uzPCNmP7+JE86+Ft3nNkQwu9430r/
 ZCuuHWw95zL6ao8TmFI+SL4WHmAsl+FyhCM9dky2DfC2dk/0ppsGpd8t3tTPDa6WbW
 ojDvCSfGHmY4g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:14 -0500
Message-Id: <20210716143919.44373-5-ebiggers@kernel.org>
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
X-Headers-End: 1m4P1I-0004e8-Ty
Subject: [f2fs-dev] [PATCH 4/9] f2fs: reduce indentation in
 f2fs_file_write_iter()
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

Replace 'if (ret > 0)' with 'if (ret <= 0) goto out_unlock;'.
No change in behavior.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 73 +++++++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 36 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9b12004e78c6..878b2460f79b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4316,49 +4316,50 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	}
 
 	ret = generic_write_checks(iocb, from);
-	if (ret > 0) {
-		if (iocb->ki_flags & IOCB_NOWAIT) {
-			if (!f2fs_overwrite_io(inode, iocb->ki_pos,
-						iov_iter_count(from)) ||
-				f2fs_has_inline_data(inode) ||
-				f2fs_force_buffered_io(inode, iocb, from)) {
-				ret = -EAGAIN;
-				goto out_unlock;
-			}
-		}
-		if (iocb->ki_flags & IOCB_DIRECT) {
-			/*
-			 * Convert inline data for Direct I/O before entering
-			 * f2fs_direct_IO().
-			 */
-			ret = f2fs_convert_inline_inode(inode);
-			if (ret)
-				goto out_unlock;
-		}
+	if (ret <= 0)
+		goto out_unlock;
 
-		/* Possibly preallocate the blocks for the write. */
-		target_size = iocb->ki_pos + iov_iter_count(from);
-		preallocated = f2fs_preallocate_blocks(iocb, from);
-		if (preallocated < 0) {
-			ret = preallocated;
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		if (!f2fs_overwrite_io(inode, iocb->ki_pos,
+				       iov_iter_count(from)) ||
+		    f2fs_has_inline_data(inode) ||
+		    f2fs_force_buffered_io(inode, iocb, from)) {
+			ret = -EAGAIN;
 			goto out_unlock;
 		}
+	}
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		/*
+		 * Convert inline data for Direct I/O before entering
+		 * f2fs_direct_IO().
+		 */
+		ret = f2fs_convert_inline_inode(inode);
+		if (ret)
+			goto out_unlock;
+	}
 
-		ret = __generic_file_write_iter(iocb, from);
+	/* Possibly preallocate the blocks for the write. */
+	target_size = iocb->ki_pos + iov_iter_count(from);
+	preallocated = f2fs_preallocate_blocks(iocb, from);
+	if (preallocated < 0) {
+		ret = preallocated;
+		goto out_unlock;
+	}
 
-		/* Don't leave any preallocated blocks around past i_size. */
-		if (preallocated > 0 && inode->i_size < target_size) {
-			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			down_write(&F2FS_I(inode)->i_mmap_sem);
-			f2fs_truncate(inode);
-			up_write(&F2FS_I(inode)->i_mmap_sem);
-			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-		}
-		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+	ret = __generic_file_write_iter(iocb, from);
 
-		if (ret > 0)
-			f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
+	/* Don't leave any preallocated blocks around past i_size. */
+	if (preallocated > 0 && inode->i_size < target_size) {
+		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		down_write(&F2FS_I(inode)->i_mmap_sem);
+		f2fs_truncate(inode);
+		up_write(&F2FS_I(inode)->i_mmap_sem);
+		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	}
+	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+
+	if (ret > 0)
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
 out_unlock:
 	inode_unlock(inode);
 out:
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
