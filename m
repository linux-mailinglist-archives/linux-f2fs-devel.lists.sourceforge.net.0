Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE476D285
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Aug 2023 17:42:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRDzX-0004Eq-6Y;
	Wed, 02 Aug 2023 15:42:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e55ed01a16a80b75ffb8+7283+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1qRDzV-0004Eb-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XMPneISqjawu91NBggI2WgeuEkyhCfHxDeU0xyhMo0U=; b=co0kcfFiO5C6ZYVa8unWD/I4oN
 qzmX+iZbLTam+WC5ZRXzJeXClghafe6xvTvHcmzwhgDnIkFrjGKdomMqdJYag6JdrMU8AfGctlUw2
 KZJcv0sYRgsKLx3enmhluGXgvRMbkkb+pSugmIhkwkT+YLEkYnTaqMqajthnK6pG2AQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XMPneISqjawu91NBggI2WgeuEkyhCfHxDeU0xyhMo0U=; b=V/h95Q7a2/3mRjoptJYBHmzol+
 i4aU9m/siomMsG9Xs3MCq/oEV423+qEFhT51VLt5hvRxs7bhmjBUQsfBm9+xgZ4SNKA+gTFAiWQpC
 Scw9XFgP1vL9ibtFr4/q01ijfzIbGg6QyRi3LlNTpp1M2DBDfmKkbtEBqIrkMzCe9J/M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRDzV-00ArOs-18 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Aug 2023 15:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XMPneISqjawu91NBggI2WgeuEkyhCfHxDeU0xyhMo0U=; b=wnYWuPX2W/dInPzieM+5Nh7pFL
 yIbFDEQk+eNqVEdJoQhGrQssG8MD2wHclg6aOXifn09aXcAq8V27JW/r7ja+SWV6mZhkDFDa0CDRn
 6gYzRyFjyjcdl+b9xxl1DXwN+YXWYNIQ1Jue9GjQ+XQ1GW1Fro1lrksi5uq0Ntp7kJQibSu59UXTh
 cIzojbnQjsVpPhFzkvrfICDJvZcqUbq5GMec/iIkf5Pd/l1XbuXi10+P9uSEM1S7AEGp5h9z1D9p7
 MXW0mFULgs9ZUOsSMjkKYYaYpalbMkrjOrK9FxENDFgakDcsjltK7IL0c3TwE6zk0MvlZ3bec+4bi
 Z0cMSQtg==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRDzJ-005GNC-2t; Wed, 02 Aug 2023 15:42:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Date: Wed,  2 Aug 2023 17:41:30 +0200
Message-Id: <20230802154131.2221419-12-hch@lst.de>
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
 Content preview: Just like get_tree_bdev needs to drop s_umount when opening
 the main device, we need to do the same for the xfs log and RT devices to
 avoid a potential lock order reversal with s_unmount for the mark_ [...] 
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
X-Headers-End: 1qRDzV-00ArOs-18
Subject: [f2fs-dev] [PATCH 11/12] xfs: drop s_umount over opening the log
 and RT devices
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

Just like get_tree_bdev needs to drop s_umount when opening the main
device, we need to do the same for the xfs log and RT devices to avoid a
potential lock order reversal with s_unmount for the mark_dead path.

It might be preferable to just drop s_umount over ->fill_super entirely,
but that will require a fairly massive audit first, so we'll do the easy
version here first.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_super.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 8185102431301d..d5042419ed9997 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -448,17 +448,21 @@ STATIC int
 xfs_open_devices(
 	struct xfs_mount	*mp)
 {
-	struct block_device	*ddev = mp->m_super->s_bdev;
+	struct super_block	*sb = mp->m_super;
+	struct block_device	*ddev = sb->s_bdev;
 	struct block_device	*logdev = NULL, *rtdev = NULL;
 	int			error;
 
+	/* see get_tree_bdev why this is needed and safe */
+	up_write(&sb->s_umount);
+
 	/*
 	 * Open real time and log devices - order is important.
 	 */
 	if (mp->m_logname) {
 		error = xfs_blkdev_get(mp, mp->m_logname, &logdev);
 		if (error)
-			return error;
+			goto out_unlock;
 	}
 
 	if (mp->m_rtname) {
@@ -496,7 +500,10 @@ xfs_open_devices(
 		mp->m_logdev_targp = mp->m_ddev_targp;
 	}
 
-	return 0;
+	error = 0;
+out_unlock:
+	down_write(&sb->s_umount);
+	return error;
 
  out_free_rtdev_targ:
 	if (mp->m_rtdev_targp)
@@ -508,7 +515,7 @@ xfs_open_devices(
  out_close_logdev:
 	if (logdev && logdev != ddev)
 		xfs_blkdev_put(mp, logdev);
-	return error;
+	goto out_unlock;
 }
 
 /*
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
