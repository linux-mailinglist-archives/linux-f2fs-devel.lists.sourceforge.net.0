Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0A5B3E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 07:25:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhooA-0006hO-VN; Mon, 01 Jul 2019 05:24:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=078492c59=damien.lemoal@wdc.com>)
 id 1hhooA-0006hB-Jb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 05:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RYx4d5QhMaI4olPaxF+tbeMqZ8vcu19IfOWyrDQWNHg=; b=LtZTBKFgyXpOK/0TP98CHiNTX3
 TJVK4cUxqMKlR22hc4mghlo5Z2qWLjO52U8WFhw0GpURjC+Zl0lribHErKC+ZSL2vEJDgLV4ShSgA
 MYtIRmvR7jSTCxpPxi9APresCST3JH8+qS/4nbLflVxMUs4ZRrzzWfy3c3qP9CgKloPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RYx4d5QhMaI4olPaxF+tbeMqZ8vcu19IfOWyrDQWNHg=; b=Vczm3Y/NWbgSsGa9Saah4e5Hze
 IUSXt//jguXmRl07GTk3WYH2i4uGYrwNkNRPOUNDFd6DxmCU10JNZ5T3FE5lPlbnmyMlpEOHj1T+O
 BuuBNtZa6VQxaZwICBv54i6++Hy4IrUxyITRGPQo6SPwNkntZAvxRmXVpKgasUQ8cTqM=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hhooG-0037dv-UL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 05:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1561958701; x=1593494701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fiT0Q2RZAIaTc+o8PPq09fvwdcfYZE72CFvMQOosU9c=;
 b=Z+JBArhnZzXV7x8me4Se/0PkrdezRgNZrboXASUdLfUSI6VCjXYS7LxB
 91rArekV93CJcSL82ogjHJPdNIipE8QXjE0jIfqHSf1SIBCofcm6tvQ6y
 Gw+dti5SlsERlo24DK2aZzwiKEcJ1YoJk0ENNtg536jtFb+bR6YOQ1PZL
 9H9S32Ehd1yOvGvOGr9sU+TQdrpVttoBexrr9VfWvenHgzbFrYD4nFAMN
 s+TSJ7nq2RIdnbXbIFVi2185Kr2XNSSIee28tQR0KLWnVeTsDJYZhaDPf
 QlHBPmRCvF+pDqvrPzrl5IVZF5N+bJ6A2Wch3dWCHJPS7jVuyT8xvKcut A==;
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="111921731"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2019 13:09:28 +0800
IronPort-SDR: L266yQ/tnlGaVN4ZP58dyr5P2RULAXmGGJPHFQrreJ2OibpcP/6T/6LhLIGGUO6FbO8igFYkCA
 H2FcG90ma4IfJgNfYqHFiXHqBOfMlpy0v0IBj3S2X0gArWXW7ToNOtLE6/SAQmN+mmkxEYy+6K
 ERp+rvjboPTHpEpI8vcehvIsVtSxD3sSuHPkAFKKJ/wPl8o2jK5XbeTefCjhqrg5yYdBDyYuL7
 ODzbBT1jlzfJ59uekE2GKxQdvRVf4Mjvd2anR+irKk8hYe8rPCYd2rO1c/v1wEOjHQ72wUhsLi
 F/pNuNFVU/lF4RN7+r3xgdAZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 30 Jun 2019 22:08:28 -0700
IronPort-SDR: nW2I57e363zZy8ypwNj+v+eT0Z8Wy9I3uEUEDqVyL2t8v0jXQ7XAx1XyWcfk1eFd9+9RFQB592
 QiA4zT7SbZeEzOcFj0coze4NDQZYsLK8U0dcJw/arh2P8QvIV05+/CsXSgN5psbs8ptf6Hom4w
 gHpgdM3tby0LsTxJqHtCvVG29jknMcWCH2j6Li8+n7TlrHApYGDYrbSG9WzBR4OqWV3AQRHUYq
 LoKfVoevMDObQmmSzKKWOeAgSb/r69E0xBFJjQdSIWlshpY0ySpNrz7BT7Vr35a4TskJUcsc0Z
 1Ww=
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 Jun 2019 22:09:26 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  1 Jul 2019 14:09:18 +0900
Message-Id: <20190701050918.27511-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701050918.27511-1-damien.lemoal@wdc.com>
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hhooG-0037dv-UL
Subject: [f2fs-dev] [PATCH V6 4/4] block: Limit zone array allocation size
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
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Limit the size of the struct blk_zone array used in
blk_revalidate_disk_zones() to avoid memory allocation failures leading
to disk revalidation failure. Also further reduce the likelyhood of
such failures by using kvcalloc() (that is vmalloc()) instead of
allocating contiguous pages with alloc_pages().

Fixes: 515ce6061312 ("scsi: sd_zbc: Fix sd_zbc_report_zones() buffer allocation")
Fixes: e76239a3748c ("block: add a report_zones method")
Cc: stable@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c      | 36 ++++++++++++++++++++----------------
 include/linux/blkdev.h |  5 +++++
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 60dfc3f22350..79ad269b545d 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -14,6 +14,8 @@
 #include <linux/rbtree.h>
 #include <linux/blkdev.h>
 #include <linux/blk-mq.h>
+#include <linux/mm.h>
+#include <linux/vmalloc.h>
 #include <linux/sched/mm.h>
 
 #include "blk.h"
@@ -371,22 +373,25 @@ static inline unsigned long *blk_alloc_zone_bitmap(int node,
  * Allocate an array of struct blk_zone to get nr_zones zone information.
  * The allocated array may be smaller than nr_zones.
  */
-static struct blk_zone *blk_alloc_zones(int node, unsigned int *nr_zones)
+static struct blk_zone *blk_alloc_zones(unsigned int *nr_zones)
 {
-	size_t size = *nr_zones * sizeof(struct blk_zone);
-	struct page *page;
-	int order;
-
-	for (order = get_order(size); order >= 0; order--) {
-		page = alloc_pages_node(node, GFP_NOIO | __GFP_ZERO, order);
-		if (page) {
-			*nr_zones = min_t(unsigned int, *nr_zones,
-				(PAGE_SIZE << order) / sizeof(struct blk_zone));
-			return page_address(page);
-		}
+	struct blk_zone *zones;
+	size_t nrz = min(*nr_zones, BLK_ZONED_REPORT_MAX_ZONES);
+
+	/*
+	 * GFP_KERNEL here is meaningless as the caller task context has
+	 * the PF_MEMALLOC_NOIO flag set in blk_revalidate_disk_zones()
+	 * with memalloc_noio_save().
+	 */
+	zones = kvcalloc(nrz, sizeof(struct blk_zone), GFP_KERNEL);
+	if (!zones) {
+		*nr_zones = 0;
+		return NULL;
 	}
 
-	return NULL;
+	*nr_zones = nrz;
+
+	return zones;
 }
 
 void blk_queue_free_zone_bitmaps(struct request_queue *q)
@@ -448,7 +453,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 
 	/* Get zone information and initialize seq_zones_bitmap */
 	rep_nr_zones = nr_zones;
-	zones = blk_alloc_zones(q->node, &rep_nr_zones);
+	zones = blk_alloc_zones(&rep_nr_zones);
 	if (!zones)
 		goto out;
 
@@ -487,8 +492,7 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 out:
 	memalloc_noio_restore(noio_flag);
 
-	free_pages((unsigned long)zones,
-		   get_order(rep_nr_zones * sizeof(struct blk_zone)));
+	kvfree(zones);
 	kfree(seq_zones_wlock);
 	kfree(seq_zones_bitmap);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 472ba74ca968..5ace0bb77213 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -344,6 +344,11 @@ struct queue_limits {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 
+/*
+ * Maximum number of zones to report with a single report zones command.
+ */
+#define BLK_ZONED_REPORT_MAX_ZONES	8192U
+
 extern unsigned int blkdev_nr_zones(struct block_device *bdev);
 extern int blkdev_report_zones(struct block_device *bdev,
 			       sector_t sector, struct blk_zone *zones,
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
