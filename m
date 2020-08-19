Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB17324A77A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Aug 2020 22:08:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8UNR-0007U2-8d; Wed, 19 Aug 2020 20:08:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1k8UNO-0007TZ-RP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 20:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wo8SADISwwcMPiUkzFbhTWjKxz/s4NTXZaSMtO+VvfQ=; b=aTfjmf9pniL5QJ7y+C7GTERhUt
 Ssh+dgDbs7JRQmAvUO2mc0CmLdy4u5gPymhcrEiDC8ryJ4QabaiD1SSZ+KhtPLcWTxMKl9NFgkOAh
 a+Zjl2LOIZm/8kxD6jNtGAQbfacASsIFqF9q54uCRrKM8YB/z6JJbT/Cc8D2JNkz8I00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wo8SADISwwcMPiUkzFbhTWjKxz/s4NTXZaSMtO+VvfQ=; b=R5neKHwNhPz564OBkVxOcejRCZ
 EC9W16aptSd/qpRgp0oD31D4ln5Uy6QcUF3bj/LvGaSMfBxwR24FBH57eXArUHG5WWejCia1qzUf/
 QhEjyNvoafmkbFCEHJj/IvU/5S7vfp3bukgwr2GVxmNVssJipBR4+dV9fuGFQXxqtENc=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8UNK-00Cjro-JB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Aug 2020 20:08:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id ADB66299804
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: viro@zeniv.linux.org.uk,
	jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 19 Aug 2020 16:07:30 -0400
Message-Id: <20200819200731.2972195-2-krisman@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819200731.2972195-1-krisman@collabora.com>
References: <20200819200731.2972195-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [46.235.227.227 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1k8UNK-00Cjro-JB
Subject: [f2fs-dev] [PATCH 1/2] direct-io: defer alignment check until after
 EOF check
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
Cc: linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Jamie Liu <jamieliu@google.com>, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jamie Liu <jamieliu@google.com>

Prior to commit 9fe55eea7e4b ("Fix race when checking i_size on direct
i/o read"), an unaligned direct read past end of file would trigger EOF,
since generic_file_aio_read detected this read-at-EOF condition and
skipped the direct IO read entirely, returning 0. After that change, the
read now reaches dio_generic, which detects the misalignment and returns
EINVAL.

This consolidates the generic direct-io to follow the same behavior of
filesystems.  Apparently, this fix will only affect ocfs2 since other
filesystems do this verification before calling do_blockdev_direct_IO,
with the exception of f2fs, which has the same bug, but is fixed in the
next patch.

it can be verified by a read loop on a file that does a partial read
before EOF (On file that doesn't end at an aligned address).  The
following code fails on an unaligned file on filesystems without
prior validation without this patch, but not on btrfs, ext4, and xfs.

  while (done < total) {
    ssize_t delta = pread(fd, buf + done, total - done, off + done);
    if (!delta)
      break;
    ...
  }

Fix this regression by moving the misalignment check to after the EOF
check added by commit 74cedf9b6c60 ("direct-io: Fix negative return from
dio read beyond eof").

Signed-off-by: Jamie Liu <jamieliu@google.com>
Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/direct-io.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index 183299892465..77400b033d63 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -1160,19 +1160,6 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
 	struct blk_plug plug;
 	unsigned long align = offset | iov_iter_alignment(iter);
 
-	/*
-	 * Avoid references to bdev if not absolutely needed to give
-	 * the early prefetch in the caller enough time.
-	 */
-
-	if (align & blocksize_mask) {
-		if (bdev)
-			blkbits = blksize_bits(bdev_logical_block_size(bdev));
-		blocksize_mask = (1 << blkbits) - 1;
-		if (align & blocksize_mask)
-			goto out;
-	}
-
 	/* watch out for a 0 len io from a tricksy fs */
 	if (iov_iter_rw(iter) == READ && !count)
 		return 0;
@@ -1217,6 +1204,24 @@ do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
 		goto out;
 	}
 
+	/*
+	 * Avoid references to bdev if not absolutely needed to give
+	 * the early prefetch in the caller enough time.
+	 */
+
+	if (align & blocksize_mask) {
+		if (bdev)
+			blkbits = blksize_bits(bdev_logical_block_size(bdev));
+		blocksize_mask = (1 << blkbits) - 1;
+		if (align & blocksize_mask) {
+			if (iov_iter_rw(iter) == READ && dio->flags & DIO_LOCKING)
+				inode_unlock(inode);
+			kmem_cache_free(dio_cache, dio);
+			retval = -EINVAL;
+			goto out;
+		}
+	}
+
 	/*
 	 * For file extending writes updating i_size before data writeouts
 	 * complete can expose uninitialized blocks in dumb filesystems.
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
