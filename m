Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A36256EC520
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5n-0004dB-Bx;
	Mon, 24 Apr 2023 05:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5l-0004ch-BJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sTswUsG7V37q4lilbMJoCzI78FMLYPHsnKSU4tW14rI=; b=bAWV1BrZe3q2ZbaibdvjXUmijC
 +oDdSoD+qQsiWD+mhL1OxpoLdO1+GX3H9pezMw54fmVwwfgVBP+wjSubaMLYokRAmouFFB934m4/x
 XMRS/sPWgIOBB3lZQwsjC1lYU6hVQcpAboAkIjBatwHybibPumcZHoyrD0gGnrJG+XLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sTswUsG7V37q4lilbMJoCzI78FMLYPHsnKSU4tW14rI=; b=jk7CTrnLjcyDjzOtu7MZkiG/g3
 2kNeqdecGgug1YPv/yqMsjROv9v965qNr7ZCsdgb6vw0uYgQtnPiVApHNkkP2hDKjr+Fim18NJnJ/
 Ex6kvCZ+v4lY4AxaiZ0V/81TfpdXRjO1nh+vCwggmAD4VnSx3LdVW8yDTOvSLeDK+AvI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5j-00HHu0-Sb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sTswUsG7V37q4lilbMJoCzI78FMLYPHsnKSU4tW14rI=; b=UoeSfGuoni8M8v/l7vB42i2THY
 zMcmd34OOElv7F+mrbgD/ShZRx4itRpkQwFSxTkpmii613jhNw9WyxCQjGj7MQShQbt7WqJjepuL4
 LBmWnG81igFVQQjFpE39ugSY4dTF5078Y+qk64oapXEUft128WQk3P7Es40nmDd7R0F2d0XieesAO
 j5XAkEb++llO3yox0Qy5icXKSxnxY5rP++XJ6RqFTM31wvcDtrVuuPtN/xpgA7bZCD3wVcAXdYXYo
 jxEebVm9CoZwe3Xf0PTdYWQayQAZxQ3W9FEGkn51muLlMnnlGjCx9TQHWQLhKUkUJmMWkZDYDkloT
 v7jNugbA==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp5X-00FP9P-1d; Mon, 24 Apr 2023 05:50:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:23 +0200
Message-Id: <20230424054926.26927-15-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Open code __generic_file_write_iter to remove the indirect
 call into ->direct_IO and to prepare using the iomap based write code.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- block/fops.c | 46
 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pqp5j-00HHu0-Sb
Subject: [f2fs-dev] [PATCH 14/17] block: open code __generic_file_write_iter
 for blkdev writes
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Open code __generic_file_write_iter to remove the indirect call into
->direct_IO and to prepare using the iomap based write code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index b670aa7c5bb745..fd510b6142bd57 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -508,6 +508,29 @@ static int blkdev_close(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static ssize_t
+blkdev_direct_write(struct kiocb *iocb, struct iov_iter *from)
+{
+	size_t count = iov_iter_count(from);
+	ssize_t written;
+
+	written = kiocb_invalidate_pages(iocb, count);
+	if (written) {
+		if (written == -EBUSY)
+			return 0;
+		return written;
+	}
+
+	written = blkdev_direct_IO(iocb, from);
+	if (written > 0) {
+		kiocb_invalidate_post_write(iocb, count);
+		iocb->ki_pos += written;
+	}
+	if (written != -EIOCBQUEUED)
+		iov_iter_revert(from, count - written - iov_iter_count(from));
+	return written;
+}
+
 /*
  * Write data to the block device.  Only intended for the block device itself
  * and the raw driver which basically is a fake block device.
@@ -517,7 +540,8 @@ static int blkdev_close(struct inode *inode, struct file *filp)
  */
 static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
-	struct block_device *bdev = iocb->ki_filp->private_data;
+	struct file *file = iocb->ki_filp;
+	struct block_device *bdev = file->private_data;
 	struct inode *bd_inode = bdev->bd_inode;
 	loff_t size = bdev_nr_bytes(bdev);
 	size_t shorted = 0;
@@ -538,13 +562,31 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if ((iocb->ki_flags & (IOCB_NOWAIT | IOCB_DIRECT)) == IOCB_NOWAIT)
 		return -EOPNOTSUPP;
 
+	ret = file_remove_privs(file);
+	if (ret)
+		return ret;
+
+	ret = file_update_time(file);
+	if (ret)
+		return ret;
+
 	size -= iocb->ki_pos;
 	if (iov_iter_count(from) > size) {
 		shorted = iov_iter_count(from) - size;
 		iov_iter_truncate(from, size);
 	}
 
-	ret = __generic_file_write_iter(iocb, from);
+	current->backing_dev_info = bdev->bd_disk->bdi;
+	if (iocb->ki_flags & IOCB_DIRECT) {
+		ret = blkdev_direct_write(iocb, from);
+		if (ret >= 0 && iov_iter_count(from))
+			ret = direct_write_fallback(iocb, from, ret,
+					generic_perform_write(iocb, from));
+	} else {
+		ret = generic_perform_write(iocb, from);
+	}
+	current->backing_dev_info = NULL;
+
 	if (ret > 0)
 		ret = generic_write_sync(iocb, ret);
 	iov_iter_reexpand(from, iov_iter_count(from) + shorted);
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
