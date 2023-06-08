Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8C727D9A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 13:03:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7DQX-0004xx-Qi;
	Thu, 08 Jun 2023 11:03:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+69acd89764e6999cdd63+7228+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q7DQV-0004xf-P1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FYQsICe+jkO2yrGbgRzbumctJVKnV4wWIZUy1tv1p54=; b=FUVf8GyPphWkLKrc96xep0XidP
 PtOdr/uqIqfIHr2vfqH8Ls5G+hdYjRIry2Na2LAEGv0CCNebrcYV38vtjbWGGilp07wja3L8gyM3T
 VmZzOv85RGWGSkcQAnijZE2PUQytdK3rKSKk9KF1VKNr5W7mYfImE8FiqAP5DEjLogdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FYQsICe+jkO2yrGbgRzbumctJVKnV4wWIZUy1tv1p54=; b=G6rniCl2u6k/jy9j6uxZje9rL1
 QudOqaXDlcbjymCBitRaOfpIUQTb+Lbpvr8QyfBh2lBP095N+l9TEIa/mwTzfnRJeqyJYK/aenVNj
 hXbq05jGNryUI7L0MiPj1NeU70hiMscvyABZNEwZKQvvwDej1exGdHHZcr4U9lGHXqZM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7DQU-00Edut-M8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 11:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FYQsICe+jkO2yrGbgRzbumctJVKnV4wWIZUy1tv1p54=; b=oucg3Pp/rKcskrh+Hb+2MAm4oh
 CAxirj8/J8boUvG5KuKH4XNEziwGZWCBFdjLkSPuAUYn9sLXGhsGXcPg2M6lmVYYC1OxeFi4XX36Q
 mX6ufS/9I1nDuIHYRLJpnpVCMycipoqj5pJDMjncVmj7ncRPeNeQdCfoC1C+XghtjX90w4hi7Cse9
 WqJiXO1TpgvnDBjtOlTfsZXa+pPttbNa1Qk3YLwmNPxsJ0ApRlEg2FfQvwoShtptcHJJ/EHBK67bZ
 riO/Gx/2T4VFi3othQU0kqoY1H9RFVaLIpHIcFoekDpe1RzqiRE6QCfLa+tpzrRlyc+jZL1+KdS5R
 ywv3NawA==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q7DPz-0091cl-2t; Thu, 08 Jun 2023 11:03:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  8 Jun 2023 13:02:29 +0200
Message-Id: <20230608110258.189493-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230608110258.189493-1-hch@lst.de>
References: <20230608110258.189493-1-hch@lst.de>
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
 Content preview:  For whole devices ->open is called for each open, but for
 partitions it is only called on the first open of a partition,
 e.g.: open("/dev/vdb", 
 ...) open("/dev/vdb", ...) - 2 call to ->open open("/dev/vdb1",
 ...) open("/dev/vdb", ...) - 2 call to ->open 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q7DQU-00Edut-M8
Subject: [f2fs-dev] [PATCH 01/30] block: also call ->open for incremental
 partition opens
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-nvme@lists.infradead.org,
 Phillip Potter <phil@philpotter.co.uk>, Chris Mason <clm@fb.com>,
 dm-devel@redhat.com, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Jack Wang <jinpu.wang@ionos.com>, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, linux-um@lists.infradead.org,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Christian Brauner <brauner@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For whole devices ->open is called for each open, but for partitions it
is only called on the first open of a partition, e.g.:

  open("/dev/vdb", ...)
  open("/dev/vdb", ...)
    - 2 call to ->open

  open("/dev/vdb1", ...)
  open("/dev/vdb", ...)
    - 2 call to ->open

  open("/dev/vdb", ...)
  open("/dev/vdb", ...)
    - just open call to ->open

This is problematic as various block drivers look at open flags and
might not do all the required setup if the earlier open was with an
odd flag like O_NDELAY or the magic 3 ioctl-only open mode.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Phillip Potter <phil@philpotter.co.uk>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Acked-by: Christian Brauner <brauner@kernel.org>
---
 block/bdev.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 5c46ff10770638..981f6135795138 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -683,9 +683,6 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
 	struct gendisk *disk = part->bd_disk;
 	int ret;
 
-	if (atomic_read(&part->bd_openers))
-		goto done;
-
 	ret = blkdev_get_whole(bdev_whole(part), mode);
 	if (ret)
 		return ret;
@@ -694,9 +691,10 @@ static int blkdev_get_part(struct block_device *part, fmode_t mode)
 	if (!bdev_nr_sectors(part))
 		goto out_blkdev_put;
 
-	disk->open_partitions++;
-	set_init_blocksize(part);
-done:
+	if (!atomic_read(&part->bd_openers)) {
+		disk->open_partitions++;
+		set_init_blocksize(part);
+	}
 	atomic_inc(&part->bd_openers);
 	return 0;
 
@@ -709,10 +707,10 @@ static void blkdev_put_part(struct block_device *part, fmode_t mode)
 {
 	struct block_device *whole = bdev_whole(part);
 
-	if (!atomic_dec_and_test(&part->bd_openers))
-		return;
-	blkdev_flush_mapping(part);
-	whole->bd_disk->open_partitions--;
+	if (atomic_dec_and_test(&part->bd_openers)) {
+		blkdev_flush_mapping(part);
+		whole->bd_disk->open_partitions--;
+	}
 	blkdev_put_whole(whole, mode);
 }
 
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
