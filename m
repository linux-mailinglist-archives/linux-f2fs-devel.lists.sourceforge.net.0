Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3FD6EC522
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 07:50:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pqp5p-0007LN-7p;
	Mon, 24 Apr 2023 05:50:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e16e2fc4419b117693a1+7183+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pqp5o-0007LG-AB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ygZamnLPppSKQbVI2TYtcZ1SuuieTgm7wFWt/6s68PI=; b=jHymY7eKSp7P02fXB6wteRQF+A
 LnMHDX9LFba91WZyw2+L74N3LKM7DwSo1XBaFZfNyTR6OJw9iQ3TX0VVvuKbFXmsi536y9SwgMOEh
 zdk0z9KJWf3Y7MMdnfJpcbDRuwhhcSz9/OpWFnNr62EQNxc2s8CoL86s1djBSGODembo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ygZamnLPppSKQbVI2TYtcZ1SuuieTgm7wFWt/6s68PI=; b=kjDM1TC078bM1rfIg+agqmPLA7
 H1e5vmASlMlLcdg8mVDpLH/mLs3+0rMpVb0BcdtgFU4KpM7iyffXJrDPyPBQ2Gb6RxGVbY/OWx77v
 Ze0t3qkBWRCszdCT9j4NgSlly2eksLX+KVd8L2fJcUh8G+vblkKnlEOAXqJJMUoDYmBA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pqp5o-00HHuC-3e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 05:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ygZamnLPppSKQbVI2TYtcZ1SuuieTgm7wFWt/6s68PI=; b=wpOqw6FzWnc2w4juTchLC7VO9t
 ir9ELtuxBb0jOKnL07jIkpyJF+L1nWBSzPVGIhqVdKTgVpv8nsOhz6XqjGvbC4V9beDfWCniIGswt
 O9bKd9P+QqRipzQOTI8TmgW/aUC2QEQw/GLLlogXyX29WSz+zFQVPjQfpsqKsOQNqIIlcpMnx4i9l
 eK8Ns7AAgVVLldGZlqGnxg0NNJ4YeF6tqzIBhBzJQw7Kon0F3ruc0VhAPDYUTJO+38G7SJ6XlYNkX
 v0ncA0oNgduUMDrajW3dXaIsa/P7DAZvC/IznI7HvWu6OsI4XjPKJ/KK+z4OqYXElqnES62wVc7FU
 cqsVOn2Q==;
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp5b-00FPB8-1e; Mon, 24 Apr 2023 05:50:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:24 +0200
Message-Id: <20230424054926.26927-16-hch@lst.de>
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
 Content preview: Direct I/O on block devices now nevers goes through
 aops->direct_IO.
 Stop setting it and set the FMODE_CAN_ODIRECT in ->open instead.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- block/fops.c | 3 +-- 1 file changed, 1
 insertion(+), 2 deletions(-) 
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
X-Headers-End: 1pqp5o-00HHuC-3e
Subject: [f2fs-dev] [PATCH 15/17] block: stop setting ->direct_IO
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

Direct I/O on block devices now nevers goes through aops->direct_IO.
Stop setting it and set the FMODE_CAN_ODIRECT in ->open instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/fops.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/block/fops.c b/block/fops.c
index fd510b6142bd57..318247832a7bcf 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -428,7 +428,6 @@ const struct address_space_operations def_blk_aops = {
 	.writepage	= blkdev_writepage,
 	.write_begin	= blkdev_write_begin,
 	.write_end	= blkdev_write_end,
-	.direct_IO	= blkdev_direct_IO,
 	.migrate_folio	= buffer_migrate_folio_norefs,
 	.is_dirty_writeback = buffer_check_dirty_writeback,
 };
@@ -481,7 +480,7 @@ static int blkdev_open(struct inode *inode, struct file *filp)
 	 * during an unstable branch.
 	 */
 	filp->f_flags |= O_LARGEFILE;
-	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC;
+	filp->f_mode |= FMODE_CAN_ODIRECT | FMODE_NOWAIT | FMODE_BUF_RASYNC;
 
 	if (filp->f_flags & O_NDELAY)
 		filp->f_mode |= FMODE_NDELAY;
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
