Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8CCC29CF4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 02:49:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:In-Reply-To:Date:From:To:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tZCt6KeMW4paLJeAWQZrq3khQbsAPLXFiI+7fmSfuqs=; b=GD3jk3Hrf95xUkDh+TFzkukTy6
	pqp6P9mUibzjA1xwdyANMBy9mBMnrN+MlyZBoCldmzviq8tFMbSNfIC6mEBJAyk0o8txdO+Wh4/GI
	RmgvuIMQ0PH9TWKCnzn3llAE1zrYQ5OxgyFPxiUqhr3OB3jet7YIvbBtvASw2T4aMVo0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFjh1-0004A3-3E;
	Mon, 03 Nov 2025 01:49:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1vFjgy-00049h-G2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ng1L4mgaMfjyUoixnhV1UePdLKnKRGbfTBsi3P0YK14=; b=DwNSQGw6iz78PgTuEO7NU5JWcx
 N7W+xAuMC0uTB7t3VDQYoJVVnxFujxuDSDs+jyBirelLR+7th+Sl13GWvUkA9j6eT7HteERS8OrAs
 7zVFqiQTyPQq+mOPS9j9YmEwxFJf3OjiwAIFtDf7PCV5GLt7RJwGtBLHqzkCNfBaA+nw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ng1L4mgaMfjyUoixnhV1UePdLKnKRGbfTBsi3P0YK14=; b=VvNMnT+LiQreC5VtO/bsn9oo0h
 0Tyc7s2tfMZq6DdfcUPT/pspEVRgYF/UzFCNL5TOagO/Sl+DipMPIlavAF+iusbjgU4XFX3N+bBSj
 Yaf3YUYLBjMkXPXjjOUXl9H6MH6Fcsb2t74S1jAy7ZHiTElwux5Cb6Px11tgvFyffPc8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFjgy-0007Lc-Ea for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2A28040590;
 Mon,  3 Nov 2025 01:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C27AC4CEFB;
 Mon,  3 Nov 2025 01:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762134538;
 bh=zmE4vYPhLsLlNZClDX7jMxJnkyssWUT8qSU9Q8+p7ag=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=xPitT/Na85xDwv2HMLA4Egk9QxDKIa95C+3IASHiprddm75cMGFSNVjt6YsX9FPTZ
 JyOpvuQAIlaQuOEBCn0JAp0ZH6IF6GCV2q2FHW+VJ0Yeq72GRLyuUCE2JFyJVSVh2w
 ynhticRcUerSZwNOIZG0hrrkHQSBxCVnO8BeTPiM=
To: adilger.kernel@dilger.ca, akpm@linux-foundation.org, anna@kernel.org,
 axboe@kernel.dk, chao@kernel.org, djwong@kernel.org, dlemoal@kernel.org,
 gregkh@linuxfoundation.org, hare@suse.de, hch@infradead.org, hch@lst.de,
 idryomov@gmail.com, jaegeuk@kernel.org, jlayton@kernel.org,
 konishi.ryusuke@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, mcgrof@kernel.org, mngyadam@amazon.de,
 nagy@khwaternagy.com, shinichiro.kawasaki@wdc.com,
 trond.myklebust@hammerspace.com, tytso@mit.edu, viro@zeniv.linux.org.uk,
 willy@infradead.org, xiubli@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 03 Nov 2025 10:46:56 +0900
In-Reply-To: <20251021070353.96705-9-mngyadam@amazon.de>
Message-ID: <2025110356-shrapnel-squash-a5dc@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a note to let you know that I've just added the patch
 titled block: fix race between set_blocksize and read paths to the 6.1-stable
 tree which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1vFjgy-0007Lc-Ea
Subject: [f2fs-dev] Patch "block: fix race between set_blocksize and read
 paths" has been added to the 6.1-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


This is a note to let you know that I've just added the patch titled

    block: fix race between set_blocksize and read paths

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     block-fix-race-between-set_blocksize-and-read-paths.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-188302-greg=kroah.com@vger.kernel.org Tue Oct 21 16:13:58 2025
From: Mahmoud Adam <mngyadam@amazon.de>
Date: Tue, 21 Oct 2025 09:03:42 +0200
Subject: block: fix race between set_blocksize and read paths
To: <stable@vger.kernel.org>
Cc: <gregkh@linuxfoundation.org>, <nagy@khwaternagy.com>, "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>, Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, "Jens Axboe" <axboe@kernel.dk>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jeff Layton <jlayton@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Christoph Hellwig <hch@infradead.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, "Ryusuke Konishi" <konishi.ryusuke@gmail.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, "Hannes Reinecke" <hare@suse.de>, Damien Le Moal <dlemoal@kernel.org>, <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <ceph-devel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, <linux-ext4
 @vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>, <linux-xfs@vger.kernel.org>, <linux-nfs@vger.kernel.org>, <linux-nilfs@vger.kernel.org>, <linux-mm@kvack.org>
Message-ID: <20251021070353.96705-9-mngyadam@amazon.de>

From: "Darrick J. Wong" <djwong@kernel.org>

commit c0e473a0d226479e8e925d5ba93f751d8df628e9 upstream.

With the new large sector size support, it's now the case that
set_blocksize can change i_blksize and the folio order in a manner that
conflicts with a concurrent reader and causes a kernel crash.

Specifically, let's say that udev-worker calls libblkid to detect the
labels on a block device.  The read call can create an order-0 folio to
read the first 4096 bytes from the disk.  But then udev is preempted.

Next, someone tries to mount an 8k-sectorsize filesystem from the same
block device.  The filesystem calls set_blksize, which sets i_blksize to
8192 and the minimum folio order to 1.

Now udev resumes, still holding the order-0 folio it allocated.  It then
tries to schedule a read bio and do_mpage_readahead tries to create
bufferheads for the folio.  Unfortunately, blocks_per_folio == 0 because
the page size is 4096 but the blocksize is 8192 so no bufferheads are
attached and the bh walk never sets bdev.  We then submit the bio with a
NULL block device and crash.

Therefore, truncate the page cache after flushing but before updating
i_blksize.  However, that's not enough -- we also need to lock out file
IO and page faults during the update.  Take both the i_rwsem and the
invalidate_lock in exclusive mode for invalidations, and in shared mode
for read/write operations.

I don't know if this is the correct fix, but xfs/259 found it.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Link: https://lore.kernel.org/r/174543795699.4139148.2086129139322431423.stgit@frogsfrogsfrogs
Signed-off-by: Jens Axboe <axboe@kernel.dk>
[use bdev->bd_inode instead & fix small contextual changes]
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 block/bdev.c      |   17 +++++++++++++++++
 block/blk-zoned.c |    5 ++++-
 block/fops.c      |   16 ++++++++++++++++
 block/ioctl.c     |    6 ++++++
 4 files changed, 43 insertions(+), 1 deletion(-)

--- a/block/bdev.c
+++ b/block/bdev.c
@@ -147,9 +147,26 @@ int set_blocksize(struct block_device *b
 
 	/* Don't change the size if it is same as current */
 	if (bdev->bd_inode->i_blkbits != blksize_bits(size)) {
+		/*
+		 * Flush and truncate the pagecache before we reconfigure the
+		 * mapping geometry because folio sizes are variable now.  If a
+		 * reader has already allocated a folio whose size is smaller
+		 * than the new min_order but invokes readahead after the new
+		 * min_order becomes visible, readahead will think there are
+		 * "zero" blocks per folio and crash.  Take the inode and
+		 * invalidation locks to avoid racing with
+		 * read/write/fallocate.
+		 */
+		inode_lock(bdev->bd_inode);
+		filemap_invalidate_lock(bdev->bd_inode->i_mapping);
+
 		sync_blockdev(bdev);
+		kill_bdev(bdev);
+
 		bdev->bd_inode->i_blkbits = blksize_bits(size);
 		kill_bdev(bdev);
+		filemap_invalidate_unlock(bdev->bd_inode->i_mapping);
+		inode_unlock(bdev->bd_inode);
 	}
 	return 0;
 }
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -417,6 +417,7 @@ int blkdev_zone_mgmt_ioctl(struct block_
 		op = REQ_OP_ZONE_RESET;
 
 		/* Invalidate the page cache, including dirty pages. */
+		inode_lock(bdev->bd_inode);
 		filemap_invalidate_lock(bdev->bd_inode->i_mapping);
 		ret = blkdev_truncate_zone_range(bdev, mode, &zrange);
 		if (ret)
@@ -439,8 +440,10 @@ int blkdev_zone_mgmt_ioctl(struct block_
 			       GFP_KERNEL);
 
 fail:
-	if (cmd == BLKRESETZONE)
+	if (cmd == BLKRESETZONE) {
 		filemap_invalidate_unlock(bdev->bd_inode->i_mapping);
+		inode_unlock(bdev->bd_inode);
+	}
 
 	return ret;
 }
--- a/block/fops.c
+++ b/block/fops.c
@@ -592,7 +592,14 @@ static ssize_t blkdev_write_iter(struct
 			ret = direct_write_fallback(iocb, from, ret,
 					generic_perform_write(iocb, from));
 	} else {
+		/*
+		 * Take i_rwsem and invalidate_lock to avoid racing with
+		 * set_blocksize changing i_blkbits/folio order and punching
+		 * out the pagecache.
+		 */
+		inode_lock_shared(bd_inode);
 		ret = generic_perform_write(iocb, from);
+		inode_unlock_shared(bd_inode);
 	}
 
 	if (ret > 0)
@@ -605,6 +612,7 @@ static ssize_t blkdev_write_iter(struct
 static ssize_t blkdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 {
 	struct block_device *bdev = iocb->ki_filp->private_data;
+	struct inode *bd_inode = bdev->bd_inode;
 	loff_t size = bdev_nr_bytes(bdev);
 	loff_t pos = iocb->ki_pos;
 	size_t shorted = 0;
@@ -652,7 +660,13 @@ static ssize_t blkdev_read_iter(struct k
 			goto reexpand;
 	}
 
+	/*
+	 * Take i_rwsem and invalidate_lock to avoid racing with set_blocksize
+	 * changing i_blkbits/folio order and punching out the pagecache.
+	 */
+	inode_lock_shared(bd_inode);
 	ret = filemap_read(iocb, to, ret);
+	inode_unlock_shared(bd_inode);
 
 reexpand:
 	if (unlikely(shorted))
@@ -695,6 +709,7 @@ static long blkdev_fallocate(struct file
 	if ((start | len) & (bdev_logical_block_size(bdev) - 1))
 		return -EINVAL;
 
+	inode_lock(inode);
 	filemap_invalidate_lock(inode->i_mapping);
 
 	/*
@@ -735,6 +750,7 @@ static long blkdev_fallocate(struct file
 
  fail:
 	filemap_invalidate_unlock(inode->i_mapping);
+	inode_unlock(inode);
 	return error;
 }
 
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -114,6 +114,7 @@ static int blk_ioctl_discard(struct bloc
 	    end > bdev_nr_bytes(bdev))
 		return -EINVAL;
 
+	inode_lock(inode);
 	filemap_invalidate_lock(inode->i_mapping);
 	err = truncate_bdev_range(bdev, mode, start, end - 1);
 	if (err)
@@ -121,6 +122,7 @@ static int blk_ioctl_discard(struct bloc
 	err = blkdev_issue_discard(bdev, start >> 9, len >> 9, GFP_KERNEL);
 fail:
 	filemap_invalidate_unlock(inode->i_mapping);
+	inode_unlock(inode);
 	return err;
 }
 
@@ -146,12 +148,14 @@ static int blk_ioctl_secure_erase(struct
 	    end > bdev_nr_bytes(bdev))
 		return -EINVAL;
 
+	inode_lock(bdev->bd_inode);
 	filemap_invalidate_lock(bdev->bd_inode->i_mapping);
 	err = truncate_bdev_range(bdev, mode, start, end - 1);
 	if (!err)
 		err = blkdev_issue_secure_erase(bdev, start >> 9, len >> 9,
 						GFP_KERNEL);
 	filemap_invalidate_unlock(bdev->bd_inode->i_mapping);
+	inode_unlock(bdev->bd_inode);
 	return err;
 }
 
@@ -184,6 +188,7 @@ static int blk_ioctl_zeroout(struct bloc
 		return -EINVAL;
 
 	/* Invalidate the page cache, including dirty pages */
+	inode_lock(inode);
 	filemap_invalidate_lock(inode->i_mapping);
 	err = truncate_bdev_range(bdev, mode, start, end);
 	if (err)
@@ -194,6 +199,7 @@ static int blk_ioctl_zeroout(struct bloc
 
 fail:
 	filemap_invalidate_unlock(inode->i_mapping);
+	inode_unlock(inode);
 	return err;
 }
 


Patches currently in stable-queue which might be from mngyadam@amazon.de are

queue-6.1/block-fix-race-between-set_blocksize-and-read-paths.patch
queue-6.1/filemap-add-a-kiocb_invalidate_pages-helper.patch
queue-6.1/fs-factor-out-a-direct_write_fallback-helper.patch
queue-6.1/direct_write_fallback-on-error-revert-the-ki_pos-update-from-buffered-write.patch
queue-6.1/filemap-update-ki_pos-in-generic_perform_write.patch
queue-6.1/filemap-add-a-kiocb_invalidate_post_direct_write-helper.patch
queue-6.1/nilfs2-fix-deadlock-warnings-caused-by-lock-dependency-in-init_nilfs.patch
queue-6.1/block-open-code-__generic_file_write_iter-for-blkdev-writes.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
