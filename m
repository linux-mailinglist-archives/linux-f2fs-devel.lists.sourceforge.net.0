Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6584C76D287
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzZ-0000Os-5n;
	Wed, 02 Aug 2023 15:42:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDzY-0000Ol-Ak for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i4RVxh7cqcfhStKnrFuIVUqPlurNIlyMZ1NDN212nv0=; b=HBxqRc1RqMJkhP0vcZ5O+b2Sme
 5lCPfyEJKHOt1VYQtlH+1qCc+N3UoB4riOgsPCyUKwHYdGg3xNsj0HsKiRT/4IxxQitOVejudamzQ
 TI+VkNJUaSLcZ2xux5ZSCXLEqDrF4AvRuUKsAAVIye6UWOb9afBZH0yCJmgxJm/hrVL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i4RVxh7cqcfhStKnrFuIVUqPlurNIlyMZ1NDN212nv0=; b=F4qNfwCFrI4Zdo+hUCR4x7JKOQ
 AVOaYkWy6yld2HgFhRnzpKmIxTTKvpz9DeO7n85Dc5hjB3aKBHg7ssO7WGP7VlAHhpzYLtux5uNXS
 TcNOzhe+fdGP6TxIOI756Fbw1Efc3YF6IMgibkniYO51k09KyjE3czT+qKZnl2ZS0NlU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDzY-00ArOy-Sk for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=i4RVxh7cqcfhStKnrFuIVUqPlurNIlyMZ1NDN212nv0=; b=m9OaeC94Czmbb5hPBahN8SXBqI
 HNi7Mt4xq8QD0KfNROKtIz4cWo24dWSBz7X8e50X0RB4sQ5tkio4jz+r4r8ZXafkW2ww175yxfozT
 NCUZO2qzsSFjl3BFFlIRN3Wfa2mzIAi3PGZkD8Cd957ycv8VcxS6B+Gl86ETq6tCRKfhACSRqvwK7
 ZdYNXIQB/XHcCPAEwZsU/ppTsd8l/Kd7bPks6ODFCghe5WMh0L9iLVh6NfcG8q01AnZzhLKiyX/4B
 4MY4Wr/7eVJVJE1UTa4EMeC4cbXZti0JxzrFZGHMr43Ix5mWyHHev/cZbWwF9pp4HCsk18N+iH6el
 wjXcrqPw==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDzN-005GOT-0f; Wed, 02 Aug 2023 15:42:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:31 +0200
Message-Id: <20230802154131.2221419-13-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802154131.2221419-1-hch@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
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
 Content preview:  Use the generic fs_holder_ops to shut down the file system
 when the log or RT device goes away instead of duplicating the logic.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/xfs/xfs_super.c | 17 +++ 1 file changed, 
 3 insertions(+), 14 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRDzY-00ArOy-Sk
Subject: [f2fs-dev] [PATCH 12/12] xfs use fs_holder_ops for the log and RT
 devices
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use the generic fs_holder_ops to shut down the file system when the
log or RT device goes away instead of duplicating the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_super.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index d5042419ed9997..338eba71ff8667 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -377,17 +377,6 @@ xfs_setup_dax_always(
 	return 0;
 }
 
-static void
-xfs_bdev_mark_dead(
-	struct block_device	*bdev)
-{
-	xfs_force_shutdown(bdev->bd_holder, SHUTDOWN_DEVICE_REMOVED);
-}
-
-static const struct blk_holder_ops xfs_holder_ops = {
-	.mark_dead		= xfs_bdev_mark_dead,
-};
-
 STATIC int
 xfs_blkdev_get(
 	xfs_mount_t		*mp,
@@ -396,8 +385,8 @@ xfs_blkdev_get(
 {
 	int			error = 0;
 
-	*bdevp = blkdev_get_by_path(name, BLK_OPEN_READ | BLK_OPEN_WRITE, mp,
-				    &xfs_holder_ops);
+	*bdevp = blkdev_get_by_path(name, BLK_OPEN_READ | BLK_OPEN_WRITE,
+				    mp->m_super, &fs_holder_ops);
 	if (IS_ERR(*bdevp)) {
 		error = PTR_ERR(*bdevp);
 		xfs_warn(mp, "Invalid device [%s], error=%d", name, error);
@@ -412,7 +401,7 @@ xfs_blkdev_put(
 	struct block_device	*bdev)
 {
 	if (bdev)
-		blkdev_put(bdev, mp);
+		blkdev_put(bdev, mp->m_super);
 }
 
 STATIC void
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
