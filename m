Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7997239A3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jun 2023 09:41:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6RKC-0003Tz-Lm;
	Tue, 06 Jun 2023 07:41:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c7f58ba0a08136e81302+7226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1q6RKA-0003Tb-0y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yxIRWZa8a4c10jlD/hxxOaC/39H/36XgCLysJAxK/Uc=; b=TsShadVkkqAFCMZOIWhBLvTm2K
 w0Tg0SZ5UDoiobzyEhujVDKwaKAZSQCuvSFXEGuQreV+NGlA8uaqIShPKjE0xIdMWZrQgV+ocDGh+
 hEeHEgW5eRhRWN0URLYUkr0w1S0Ng32YY5Kt/OBxwwcb5QHlQW1vyt/TqJH6yWTykFT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yxIRWZa8a4c10jlD/hxxOaC/39H/36XgCLysJAxK/Uc=; b=F8GgVCHxWDy3Q9hyjvV8hDNNch
 MzBN5XXCwFwG+B+O1zJCg5Lpt+CykOZqZINIG8sroqk/Ol8haIKxqeplaPkL5fAd7kYF2xEzIIca6
 2WRJh1P2TCAVG3fRA5AqWdA+BaB9T+CF8luOLQmt0eG+mj04n1IvEotLgaak6HrOU4wE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6RK9-00CVB4-P5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jun 2023 07:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yxIRWZa8a4c10jlD/hxxOaC/39H/36XgCLysJAxK/Uc=; b=ZHDdG0EFcXc5UPjPD5C1V8tMWY
 0wg4WSp0EyM/PKYqmKByIxeZoimaq1FGf5uLN8PSOWEphKGtNHdcL9MrOITJxUFMvHABpHnp1eTqN
 Us5G2NJvDemgudbw47ugTej4AQP5Kz3M8T547mpeKkuwl4qDwRprqXMAyEyHcg5ipZFTdetM/i02W
 K/d1xSWJ5kYObzzC2umR5wQqwLwHtg+tsCYhJ73t3cFCeZIhBK0K/MHtWb0lU6krvh92MYZN86BhW
 9oijve1xPe9x8uAFIFrmWv/xvcZuXCAzpzT0z1hBGTmW4MEUPBZQL7Bf+wTCAitpfaqvj5JUkFdKD
 X+wdeqwA==;
Received: from
 2a02-8389-2341-5b80-39d3-4735-9a3c-88d8.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:39d3:4735:9a3c:88d8] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q6RJg-000Zye-0A; Tue, 06 Jun 2023 07:41:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue,  6 Jun 2023 09:39:46 +0200
Message-Id: <20230606073950.225178-28-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606073950.225178-1-hch@lst.de>
References: <20230606073950.225178-1-hch@lst.de>
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
 Content preview: A few ioctl handlers have fmode_t arguments that are entirely
 unused,
 remove them. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 block/blk-zoned.c
 | 4 ++-- block/blk.h | 6 +++--- block/ioctl.c | 14 +++++++------- 3 files
 changed, 12 insertions(+), 12 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q6RK9-00CVB4-P5
Subject: [f2fs-dev] [PATCH 27/31] block: remove unused fmode_t arguments
 from ioctl handlers
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
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A few ioctl handlers have fmode_t arguments that are entirely unused,
remove them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-zoned.c |  4 ++--
 block/blk.h       |  6 +++---
 block/ioctl.c     | 14 +++++++-------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 096b6b47561f83..02cc2c629ac9be 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -323,8 +323,8 @@ static int blkdev_copy_zone_to_user(struct blk_zone *zone, unsigned int idx,
  * BLKREPORTZONE ioctl processing.
  * Called from blkdev_ioctl.
  */
-int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t mode,
-			      unsigned int cmd, unsigned long arg)
+int blkdev_report_zones_ioctl(struct block_device *bdev, unsigned int cmd,
+		unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
 	struct zone_report_args args;
diff --git a/block/blk.h b/block/blk.h
index 6910220aa030f1..e28d5d67d31a28 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -394,15 +394,15 @@ static inline struct bio *blk_queue_bounce(struct bio *bio,
 #ifdef CONFIG_BLK_DEV_ZONED
 void disk_free_zone_bitmaps(struct gendisk *disk);
 void disk_clear_zone_settings(struct gendisk *disk);
-int blkdev_report_zones_ioctl(struct block_device *bdev, fmode_t mode,
-		unsigned int cmd, unsigned long arg);
+int blkdev_report_zones_ioctl(struct block_device *bdev, unsigned int cmd,
+		unsigned long arg);
 int blkdev_zone_mgmt_ioctl(struct block_device *bdev, fmode_t mode,
 		unsigned int cmd, unsigned long arg);
 #else /* CONFIG_BLK_DEV_ZONED */
 static inline void disk_free_zone_bitmaps(struct gendisk *disk) {}
 static inline void disk_clear_zone_settings(struct gendisk *disk) {}
 static inline int blkdev_report_zones_ioctl(struct block_device *bdev,
-		fmode_t mode, unsigned int cmd, unsigned long arg)
+		unsigned int cmd, unsigned long arg)
 {
 	return -ENOTTY;
 }
diff --git a/block/ioctl.c b/block/ioctl.c
index b39bd5b41ee492..3a10c34b8ef6d3 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -344,8 +344,8 @@ static int blkdev_pr_clear(struct block_device *bdev,
 	return ops->pr_clear(bdev, c.key);
 }
 
-static int blkdev_flushbuf(struct block_device *bdev, fmode_t mode,
-		unsigned cmd, unsigned long arg)
+static int blkdev_flushbuf(struct block_device *bdev, unsigned cmd,
+		unsigned long arg)
 {
 	if (!capable(CAP_SYS_ADMIN))
 		return -EACCES;
@@ -354,8 +354,8 @@ static int blkdev_flushbuf(struct block_device *bdev, fmode_t mode,
 	return 0;
 }
 
-static int blkdev_roset(struct block_device *bdev, fmode_t mode,
-		unsigned cmd, unsigned long arg)
+static int blkdev_roset(struct block_device *bdev, unsigned cmd,
+		unsigned long arg)
 {
 	int ret, n;
 
@@ -475,9 +475,9 @@ static int blkdev_common_ioctl(struct block_device *bdev, fmode_t mode,
 
 	switch (cmd) {
 	case BLKFLSBUF:
-		return blkdev_flushbuf(bdev, mode, cmd, arg);
+		return blkdev_flushbuf(bdev, cmd, arg);
 	case BLKROSET:
-		return blkdev_roset(bdev, mode, cmd, arg);
+		return blkdev_roset(bdev, cmd, arg);
 	case BLKDISCARD:
 		return blk_ioctl_discard(bdev, mode, arg);
 	case BLKSECDISCARD:
@@ -487,7 +487,7 @@ static int blkdev_common_ioctl(struct block_device *bdev, fmode_t mode,
 	case BLKGETDISKSEQ:
 		return put_u64(argp, bdev->bd_disk->diskseq);
 	case BLKREPORTZONE:
-		return blkdev_report_zones_ioctl(bdev, mode, cmd, arg);
+		return blkdev_report_zones_ioctl(bdev, cmd, arg);
 	case BLKRESETZONE:
 	case BLKOPENZONE:
 	case BLKCLOSEZONE:
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
