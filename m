Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA80B5021AC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 06:54:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfDyG-0002Pe-8V; Fri, 15 Apr 2022 04:54:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+2d633663de0085320ac7+6809+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nfDyF-0002OZ-3u; Fri, 15 Apr 2022 04:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2RG8/4DncVNJBVxiwRZlDWFw3of1TwdfVdHLgkB+Spw=; b=YSQY1a3DVGz18T/vgAmam1gLgc
 mXiDWrFh+TNjr+cqP/1ICC0jkiTM1j7/RMOwrjRP/+GVi1TgwSM46EawdGAsSJRXCbafc5YBWfkMr
 gsNfzCjZ6MlfXhS8J4jM8/HV6p4ZU0XAgkut8Q8JLPUmxdqnlyHF8hkB0xzcHBO6Mou4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2RG8/4DncVNJBVxiwRZlDWFw3of1TwdfVdHLgkB+Spw=; b=VzO+C499PaxXN2j2gfco6T+vSY
 0Y0ASEMYWvThLwbGSekh9nm09cMB6BvYO7AWV70OFrSQuEHPMELmGbJQ4BlPWDZRwjPsJBAwASW1j
 ihJ7YQFd+hr82h+6FeXHUNr29tjaHTNMwqKEYlSq6t2mkjl33ZgxYq5zv934ng+paOE0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfDyD-00085O-8l; Fri, 15 Apr 2022 04:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2RG8/4DncVNJBVxiwRZlDWFw3of1TwdfVdHLgkB+Spw=; b=TPuJfqXQYB+IC35ZbEz9CiQlaP
 djXIx0VTkzhzaYzpf2LZ0DDooPinTXguiju0AYCGSu3XAhEA+wzVismYaoX+3FR9eNAg3biu1OIj0
 CNWcQrqG9KwJqTbS05bqC74Hcp5G8fJ5Dpqbc41a5wovtXyrz6AnrzdO6HJSlv+co9m5WLmUX5I/2
 1vg6dJgX8fRkFI9MMSOkSfnCdkNwHb1kqsdqtSSukL34iYYeRnM6jabi2m1nx/iB0bJqJyAfSKPi1
 QfdCggnyqMztz/KBp1d+dGH+Q0SMobP0ybTMhNnUN2Xr4FneN5Nr0VM4ULPM98M5hdJ71ysDrIM3k
 XuXkKxgg==;
Received: from [2a02:1205:504b:4280:f5dd:42a4:896c:d877] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfDxt-008PFj-9w; Fri, 15 Apr 2022 04:53:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 15 Apr 2022 06:52:45 +0200
Message-Id: <20220415045258.199825-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220415045258.199825-1-hch@lst.de>
References: <20220415045258.199825-1-hch@lst.de>
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
 Content preview:  Add a helper to check the stable writes flag based on the
 block_device instead of having to poke into the block layer internal
 request_queue.
 Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by: Martin K. Petersen
 <martin.petersen@oracle.com> --- drivers/md/dm-table.c | 4 +--- fs/super.c
 | 2 +- include/linux/blkdev.h | 6 ++++++ mm/swa [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nfDyD-00085O-8l
Subject: [f2fs-dev] [PATCH 14/27] block: add a bdev_stable_writes helper
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, linux-mmc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add a helper to check the stable writes flag based on the block_device
instead of having to poke into the block layer internal request_queue.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
 drivers/md/dm-table.c  | 4 +---
 fs/super.c             | 2 +-
 include/linux/blkdev.h | 6 ++++++
 mm/swapfile.c          | 2 +-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 5e38d0dd009d5..d46839faa0ca5 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1950,9 +1950,7 @@ static int device_requires_stable_pages(struct dm_target *ti,
 					struct dm_dev *dev, sector_t start,
 					sector_t len, void *data)
 {
-	struct request_queue *q = bdev_get_queue(dev->bdev);
-
-	return blk_queue_stable_writes(q);
+	return bdev_stable_writes(dev->bdev);
 }
 
 int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
diff --git a/fs/super.c b/fs/super.c
index f1d4a193602d6..60f57c7bc0a69 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1204,7 +1204,7 @@ static int set_bdev_super(struct super_block *s, void *data)
 	s->s_dev = s->s_bdev->bd_dev;
 	s->s_bdi = bdi_get(s->s_bdev->bd_disk->bdi);
 
-	if (blk_queue_stable_writes(s->s_bdev->bd_disk->queue))
+	if (bdev_stable_writes(s->s_bdev))
 		s->s_iflags |= SB_I_STABLE_WRITES;
 	return 0;
 }
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 075b16d4560e7..a433798c3343e 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1330,6 +1330,12 @@ static inline bool bdev_nonrot(struct block_device *bdev)
 	return blk_queue_nonrot(bdev_get_queue(bdev));
 }
 
+static inline bool bdev_stable_writes(struct block_device *bdev)
+{
+	return test_bit(QUEUE_FLAG_STABLE_WRITES,
+			&bdev_get_queue(bdev)->queue_flags);
+}
+
 static inline bool bdev_write_cache(struct block_device *bdev)
 {
 	return test_bit(QUEUE_FLAG_WC, &bdev_get_queue(bdev)->queue_flags);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index d5ab7ec4d92ca..4069f17a82c8e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3065,7 +3065,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto bad_swap_unlock_inode;
 	}
 
-	if (p->bdev && blk_queue_stable_writes(p->bdev->bd_disk->queue))
+	if (p->bdev && bdev_stable_writes(p->bdev))
 		p->flags |= SWP_STABLE_WRITES;
 
 	if (p->bdev && p->bdev->bd_disk->fops->rw_page)
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
