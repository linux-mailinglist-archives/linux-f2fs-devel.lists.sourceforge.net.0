Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A98C97177C0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 09:20:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4G8L-0001JT-PN;
	Wed, 31 May 2023 07:20:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b81a8c9a6d22e8bb2302+7220+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q4G8J-0001JM-H9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zBZfLo79n2onda8TMRoaSImQJ1x4yClUpeA3xrekMTk=; b=icRXXoXgn7p/JtwNLA1xHmqOR6
 0t/FXq2YuMLyS1trUKVgJ1kkIEqf/SdxHWHCCS3C/OJuxP1akHfxbBcF8oTf9B0wgLGGcYkN1XvMz
 FIetp6RxVtWWA0k5Mw9EfB7Wq/OxQ1up3ZF3ZMC+1JsnNSv+V1C4AQu6JZav4hz1yYS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zBZfLo79n2onda8TMRoaSImQJ1x4yClUpeA3xrekMTk=; b=RM5mxKqZRTT+s+NrdCbGEKgEYg
 +f1n3KAsUFV/A9BVQjnEUbmOSELUj9AtMLKMZPuTzVq77QTZ9MfDeOkOxqCd7YN/Dq296tY4AFVIc
 wXtQZr0Owd6soWw3Je5YqpJHrc1k8DGZ5bFNQ3G69zR5DXi4FNVNvqGq85GLTqYDCJmw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4G8H-0004qQ-Pe for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 07:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=zBZfLo79n2onda8TMRoaSImQJ1x4yClUpeA3xrekMTk=; b=WIvJCu2WcZCPxyyElumOzaF+3c
 /RvEl7Rd3lQdRO0Twp9TVret57OwjxhPz2wC4zzHR9NJ2222yBJnOaOpx+0Kw5lvEwSA8dKaL3vWX
 mI+t/R/Z5f8hm++0kU6KUHfULeRm8WoThwXgVOgmdYePJYzaXGiGOzdJaJBR5bsYUTmXW990744su
 +5OM2lso0jyefF2GTzsaJGS5INdouHWmZpaAEh6NceGkwXox+v1NXwvj8UpFQCWcZ4zvAS0tKBu3X
 pXSuBa7GfyBqpWj1/Wfh248oclvoi6NKSkGEzi4PjB4d0yeGNgQaw31c5eU17cE8JTvWdyvAbZWmW
 WoLOfN0A==;
Received: from [2001:4bb8:182:6d06:f5c3:53d7:b5aa:b6a7] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4G81-00GPiD-0U; Wed, 31 May 2023 07:20:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Date: Wed, 31 May 2023 09:20:01 +0200
Message-Id: <20230531072006.476386-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531072006.476386-1-hch@lst.de>
References: <20230531072006.476386-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  All callers of generic_perform_write need to updated ki_pos, 
 move it into common code. Signed-off-by: Christoph Hellwig <hch@lst.de>
 Reviewed-by:
 Xiubo Li <xiubli@redhat.com> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
 Reviewed-by: Hannes Reinecke <hare@suse.de> Acked-by: Darrick J [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q4G8H-0004qQ-Pe
Subject: [f2fs-dev] [PATCH 3/8] filemap: update ki_pos in
 generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers of generic_perform_write need to updated ki_pos, move it into
common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Xiubo Li <xiubli@redhat.com>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Darrick J. Wong <djwong@kernel.org>
---
 fs/ceph/file.c | 2 --
 fs/ext4/file.c | 9 +++------
 fs/f2fs/file.c | 1 -
 fs/nfs/file.c  | 1 -
 mm/filemap.c   | 8 ++++----
 5 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index c8ef72f723badd..767f4dfe7def64 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -1891,8 +1891,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		 * can not run at the same time
 		 */
 		written = generic_perform_write(iocb, from);
-		if (likely(written >= 0))
-			iocb->ki_pos = pos + written;
 		ceph_end_io_write(inode);
 	}
 
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index bc430270c23c19..ea0ada3985cba2 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -289,12 +289,9 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
 
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
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4f423d367a44b9..7134fe8bd008cb 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4520,7 +4520,6 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	ret = generic_perform_write(iocb, from);
 
 	if (ret > 0) {
-		iocb->ki_pos += ret;
 		f2fs_update_iostat(F2FS_I_SB(inode), inode,
 						APP_BUFFERED_IO, ret);
 	}
diff --git a/fs/nfs/file.c b/fs/nfs/file.c
index 665ce3fc62eaf4..e8bb4c48a3210a 100644
--- a/fs/nfs/file.c
+++ b/fs/nfs/file.c
@@ -655,7 +655,6 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
 		goto out;
 
 	written = result;
-	iocb->ki_pos += written;
 	nfs_add_stats(inode, NFSIOS_NORMALWRITTENBYTES, written);
 
 	if (mntflags & NFS_MOUNT_WRITE_EAGER) {
diff --git a/mm/filemap.c b/mm/filemap.c
index 33b54660ad2b39..15907af4a57ff5 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3957,7 +3957,10 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
 		balance_dirty_pages_ratelimited(mapping);
 	} while (iov_iter_count(i));
 
-	return written ? written : status;
+	if (!written)
+		return status;
+	iocb->ki_pos += written;
+	return written;
 }
 EXPORT_SYMBOL(generic_perform_write);
 
@@ -4034,7 +4037,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		endbyte = pos + status - 1;
 		err = filemap_write_and_wait_range(mapping, pos, endbyte);
 		if (err == 0) {
-			iocb->ki_pos = endbyte + 1;
 			written += status;
 			invalidate_mapping_pages(mapping,
 						 pos >> PAGE_SHIFT,
@@ -4047,8 +4049,6 @@ ssize_t __generic_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		}
 	} else {
 		written = generic_perform_write(iocb, from);
-		if (likely(written > 0))
-			iocb->ki_pos += written;
 	}
 out:
 	return written ? written : err;
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
