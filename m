Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE10C29CF7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 02:49:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:In-Reply-To:Date:From:To:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=T1X+RJc36vxrxz37ppm8PZGWv0skzuQ29sYrzVj6GnE=; b=N+c/eD/7LMYqAr1OCtnSAy+4q7
	TTRCl9dgs6YjCSYTAHHuj9ttxXe4uY019fD3YZpYe7wDUnSEMoWY7G9z8yUYILcD9bGouLbt2an6k
	THnZeyavv4G+7kK3OutwEswnb61ytxsYYIS+Kg1AiQOpHssGyjgWEadEm2J9pxiIH7oQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFjh3-0007IF-T9;
	Mon, 03 Nov 2025 01:49:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1vFjh1-0007I3-Si
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/MXTxbhVJZb/aKJlnz5Ar0qHYhtM+uQHxmwfG7X7yNg=; b=inu+nairh1AGjY+TGzib/bbe2/
 a9NZFPp7teej7cXaDPpex6qTeUHBXC6slI2wH6isv0jtQA9JKqcj3hH4o3+o0XE6/UTPTgFXHyPg0
 dRemf13FA53IaqhnL6PU6asLrzeBw/ykPOV/iiz8Q0yo1b25i01S5SYGZhNKwEpx80IM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/MXTxbhVJZb/aKJlnz5Ar0qHYhtM+uQHxmwfG7X7yNg=; b=FpblWF9GVxjJkhcNLn1KDLw5YB
 j3vZhKDhFDP9FiJytZyZcsh/ajdTfU88CeXyfGygilUxH0ifOwrlN8vfqi9OU0q7OIfInBxcaXGXg
 ji9tTf8n2O6iF2RDdHSuIEQj2AL554NPQPBLvwLmZyMnurDuBJfeXyKs1AYFH0PY+Xyg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFjh1-0007Lk-5Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8F00260283;
 Mon,  3 Nov 2025 01:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA21C4CEFB;
 Mon,  3 Nov 2025 01:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1762134540;
 bh=4yyEDFex+hFxF/7qryJOkq9qNYQH9VKVpDG2zfmDNTc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=nbvoeVZtikZi+yV3cKHBOWJ0EIVhO8NUBFAIlLkmALjnt6JqtvAzb1s9fv6fc6dQR
 djFnluCmpGYQ2MKFc/Rl0nSW5EuCoS0OnBdvEZvOxl6OFIFJNIw2BB66nXZwDx7EnM
 jgYn2WZhwdMygabB4+QF82hIBXJCpoAYDegKstzQ=
To: adilger.kernel@dilger.ca, agruenba@redhat.com, akpm@linux-foundation.org,
 anna@kernel.org, axboe@kernel.dk, brauner@kernel.org, chao@kernel.org,
 djwong@kernel.org, dlemoal@kernel.org, gregkh@linuxfoundation.org,
 hare@suse.de, hch@infradead.org, hch@lst.de, idryomov@gmail.com,
 jaegeuk@kernel.org, jlayton@kernel.org, johannes.thumshirn@wdc.com,
 konishi.ryusuke@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, mcgrof@kernel.org, miklos@szeredi.hu, mngyadam@amazon.de,
 mszeredi@redhat.com, nagy@khwaternagy.com, trond.myklebust@hammerspace.com,
 tytso@mit.edu, viro@zeniv.linux.org.uk, willy@infradead.org, xiubli@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 03 Nov 2025 10:46:57 +0900
In-Reply-To: <20251021070353.96705-5-mngyadam@amazon.de>
Message-ID: <2025110357-playgroup-surpass-150c@gregkh>
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
 titled filemap: update ki_pos in generic_perform_write to the 6.1-stable
 tree which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1vFjh1-0007Lk-5Q
Subject: [f2fs-dev] Patch "filemap: update ki_pos in generic_perform_write"
 has been added to the 6.1-stable tree
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

    filemap: update ki_pos in generic_perform_write

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     filemap-update-ki_pos-in-generic_perform_write.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-188298-greg=kroah.com@vger.kernel.org Tue Oct 21 16:16:51 2025
From: Mahmoud Adam <mngyadam@amazon.de>
Date: Tue, 21 Oct 2025 09:03:38 +0200
Subject: filemap: update ki_pos in generic_perform_write
To: <stable@vger.kernel.org>
Cc: <gregkh@linuxfoundation.org>, <nagy@khwaternagy.com>, Christoph Hellwig <hch@lst.de>, Xiubo Li <xiubli@redhat.com>, Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>, Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Andreas Gruenbacher <agruenba@redhat.com>, "Anna Schumaker" <anna@kernel.org>, Chao Yu <chao@kernel.org>, Christian Brauner <brauner@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, Matthew Wilcox <willy@infradead.org>, "Miklos Szeredi" <miklos@szeredi.hu>, Miklos Szeredi <mszeredi@redhat.com>, "Trond Myklebust" <trond.myklebust@hammerspace.com>, Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Christoph Hellwig <hch@infradead.org>, "Ryusuke Konishi" <konishi.ryusuke@gmail.com>, Luis Chamberlain <mcgrof@kernel.org>,
  <linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <ceph-devel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>, <linux-xfs@vger.kernel.org>, <linux-nfs@vger.kernel.org>, <linux-nilfs@vger.kernel.org>, <linux-mm@kvack.org>
Message-ID: <20251021070353.96705-5-mngyadam@amazon.de>

From: Christoph Hellwig <hch@lst.de>

commit 182c25e9c157f37bd0ab5a82fe2417e2223df459 upstream.

All callers of generic_perform_write need to updated ki_pos, move it into
common code.

Link: https://lkml.kernel.org/r/20230601145904.1385409-4-hch@lst.de
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Xiubo Li <xiubli@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Theodore Ts'o <tytso@mit.edu>
Acked-by: Darrick J. Wong <djwong@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Anna Schumaker <anna@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Ilya Dryomov <idryomov@gmail.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Mahmoud Adam <mngyadam@amazon.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ceph/file.c |    2 --
 fs/ext4/file.c |    9 +++------
 fs/f2fs/file.c |    1 -
 fs/nfs/file.c  |    1 -
 mm/filemap.c   |    8 ++++----
 5 files changed, 7 insertions(+), 14 deletions(-)

--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1891,8 +1891,6 @@ retry_snap:
 		 * can not run at the same time
 		 */
 		written = generic_perform_write(iocb, from);
-		if (likely(written >= 0))
-			iocb->ki_pos = pos + written;
 		ceph_end_io_write(inode);
 	}
 
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -287,12 +287,9 @@ static ssize_t ext4_buffered_write_iter(
 
 out:
 	inode_unlock(inode);
-	if (likely(ret > 0)) {
-		iocb->ki_pos += ret;
-		ret = generic_write_sync(iocb, ret);
-	}
-
-	return ret;
+	if (unlikely(ret <= 0))
+		return ret;
+	return generic_write_sync(iocb, ret);
 }
 
 static ssize_t ext4_handle_inode_extension(struct inode *inode, loff_t offset,
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4659,7 +4659,6 @@ static ssize_t f2fs_buffered_write_iter(
 	current->backing_dev_info = NULL;
 
 	if (ret > 0) {
-		iocb->ki_pos += ret;
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
 						APP_BUFFERED_IO, ret);
 	}
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -645,7 +645,6 @@ ssize_t nfs_file_write(struct kiocb *ioc
 		goto out;
 
 	written = result;
-	iocb->ki_pos += written;
 	nfs_add_stats(inode, NFSIOS_NORMALWRITTENBYTES, written);
 
 	if (mntflags & NFS_MOUNT_WRITE_EAGER) {
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3891,7 +3891,10 @@ again:
 		balance_dirty_pages_ratelimited(mapping);
 	} while (iov_iter_count(i));
 
-	return written ? written : status;
+	if (!written)
+		return status;
+	iocb->ki_pos += written;
+	return written;
 }
 EXPORT_SYMBOL(generic_perform_write);
 
@@ -3970,7 +3973,6 @@ ssize_t __generic_file_write_iter(struct
 		endbyte = pos + status - 1;
 		err = filemap_write_and_wait_range(mapping, pos, endbyte);
 		if (err == 0) {
-			iocb->ki_pos = endbyte + 1;
 			written += status;
 			invalidate_mapping_pages(mapping,
 						 pos >> PAGE_SHIFT,
@@ -3983,8 +3985,6 @@ ssize_t __generic_file_write_iter(struct
 		}
 	} else {
 		written = generic_perform_write(iocb, from);
-		if (likely(written > 0))
-			iocb->ki_pos += written;
 	}
 out:
 	current->backing_dev_info = NULL;


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
