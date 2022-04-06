Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 888F64F5597
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Apr 2022 08:07:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nbyop-0005nf-3V; Wed, 06 Apr 2022 06:07:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+4210fbe0094d03a681f9+6800+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nbyoo-0005nC-2T; Wed, 06 Apr 2022 06:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M87611C6i/ov1/eZb42tZHfhB+4TDGyoM3tVyFqdBW8=; b=fbx0z68boWlKHWkcOcrb+eAn6p
 OoVgTCzcOHt0llyGaNseKvcdbz8XFPFWvyclsWvBpB4nuuTHzXsYKwOgzIcjkqvPb2UUvakpbK0LG
 fMsKzjOm6SCP36zrVErD2WuvE4Lg2zxiPi5I/M8KEx5TPrZjGDh5VPkaq+W/qigYme8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M87611C6i/ov1/eZb42tZHfhB+4TDGyoM3tVyFqdBW8=; b=Vwn+ZQe7laiwNouhSE/xiGUSRC
 Q2iQfT7rz4H6PnM1JUhl54Yv7sAkjG5ywUgk0trkUtbO+2t2uOxZUSijhLn97jN9E+tUP345Gll0V
 IEaS8Np6x6WSYgP78fIyztaC63EGkU7raXX8jrxDSyRKdfN2XvPOx/iZzK4toGv+N51o=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbyoo-0000zn-8z; Wed, 06 Apr 2022 06:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=M87611C6i/ov1/eZb42tZHfhB+4TDGyoM3tVyFqdBW8=; b=K8zhFyJNpfgn61EWvQNSpZGhoz
 IsW4d6jPg/o8RKdUEsY2I/0tp3DUigRRARrtQZS25XHPg6Ev8uZ5v/1QUVxcxn0UGRSq3QsUvtq8v
 m/wMNTUuZ0otna4wKyCKR9KuxhJuJrTxMCeQTsVHCLUaBLTq/yY7C/2YjXGPofV9QR6/pigrTQvyL
 +7FqGR+5akCXPC49M0KmVYykqYBaCN6qbVITFsaW/p3jcsFmAJQrrYOqAHtx2ogkbDQplnGNGSG9t
 hp4bnoEMlp1dxurHyPf38IfpaJHQv16bHjbw1cMsHDW5/ZArceH5PRjetepYbBzoAtUPy5j6Xetj9
 Onlv8nZg==;
Received: from 213-225-3-188.nat.highway.a1.net ([213.225.3.188]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbyoS-003vjO-9L; Wed, 06 Apr 2022 06:06:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 08:05:10 +0200
Message-Id: <20220406060516.409838-22-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406060516.409838-1-hch@lst.de>
References: <20220406060516.409838-1-hch@lst.de>
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
 Content preview: No need to inline these fairly larger helpers. Also fix the
 return value to be unsigned, just like the field in struct queue_limits.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- block/blk-settings.c | 35
 +++++++++++++++++++++++++++++++++++ include/linux/blkdev.h | 34 + 2 files
 changed, 36 inser [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nbyoo-0000zn-8z
Subject: [f2fs-dev] [PATCH 21/27] block: move {bdev,
 queue_limit}_discard_alignment out of line
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
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No need to inline these fairly larger helpers.  Also fix the return value
to be unsigned, just like the field in struct queue_limits.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-settings.c   | 35 +++++++++++++++++++++++++++++++++++
 include/linux/blkdev.h | 34 +---------------------------------
 2 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 94410a13c0dee..fd83d674afd0a 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -478,6 +478,30 @@ static int queue_limit_alignment_offset(struct queue_limits *lim,
 	return (granularity + lim->alignment_offset - alignment) % granularity;
 }
 
+static unsigned int queue_limit_discard_alignment(struct queue_limits *lim,
+		sector_t sector)
+{
+	unsigned int alignment, granularity, offset;
+
+	if (!lim->max_discard_sectors)
+		return 0;
+
+	/* Why are these in bytes, not sectors? */
+	alignment = lim->discard_alignment >> SECTOR_SHIFT;
+	granularity = lim->discard_granularity >> SECTOR_SHIFT;
+	if (!granularity)
+		return 0;
+
+	/* Offset of the partition start in 'granularity' sectors */
+	offset = sector_div(sector, granularity);
+
+	/* And why do we do this modulus *again* in blkdev_issue_discard()? */
+	offset = (granularity + alignment - offset) % granularity;
+
+	/* Turn it back into bytes, gaah */
+	return offset << SECTOR_SHIFT;
+}
+
 static unsigned int blk_round_down_sectors(unsigned int sectors, unsigned int lbs)
 {
 	sectors = round_down(sectors, lbs >> SECTOR_SHIFT);
@@ -924,3 +948,14 @@ int bdev_alignment_offset(struct block_device *bdev)
 	return q->limits.alignment_offset;
 }
 EXPORT_SYMBOL_GPL(bdev_alignment_offset);
+
+unsigned int bdev_discard_alignment(struct block_device *bdev)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+
+	if (bdev_is_partition(bdev))
+		return queue_limit_discard_alignment(&q->limits,
+				bdev->bd_start_sect);
+	return q->limits.discard_alignment;
+}
+EXPORT_SYMBOL_GPL(bdev_discard_alignment);
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 5a9b7aeda010b..34b1cfd067421 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1252,39 +1252,7 @@ bdev_zone_write_granularity(struct block_device *bdev)
 }
 
 int bdev_alignment_offset(struct block_device *bdev);
-
-static inline int queue_limit_discard_alignment(struct queue_limits *lim, sector_t sector)
-{
-	unsigned int alignment, granularity, offset;
-
-	if (!lim->max_discard_sectors)
-		return 0;
-
-	/* Why are these in bytes, not sectors? */
-	alignment = lim->discard_alignment >> SECTOR_SHIFT;
-	granularity = lim->discard_granularity >> SECTOR_SHIFT;
-	if (!granularity)
-		return 0;
-
-	/* Offset of the partition start in 'granularity' sectors */
-	offset = sector_div(sector, granularity);
-
-	/* And why do we do this modulus *again* in blkdev_issue_discard()? */
-	offset = (granularity + alignment - offset) % granularity;
-
-	/* Turn it back into bytes, gaah */
-	return offset << SECTOR_SHIFT;
-}
-
-static inline int bdev_discard_alignment(struct block_device *bdev)
-{
-	struct request_queue *q = bdev_get_queue(bdev);
-
-	if (bdev_is_partition(bdev))
-		return queue_limit_discard_alignment(&q->limits,
-				bdev->bd_start_sect);
-	return q->limits.discard_alignment;
-}
+unsigned int bdev_discard_alignment(struct block_device *bdev);
 
 static inline unsigned int bdev_write_zeroes_sectors(struct block_device *bdev)
 {
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
