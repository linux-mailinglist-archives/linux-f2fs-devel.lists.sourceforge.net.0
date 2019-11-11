Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C059F6CF1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:40:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcV-0006zm-8g; Mon, 11 Nov 2019 02:39:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcT-0006zG-55
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YQGhq97E+CPWhpWoX+fP4sdiyd2gS7SuRw/KC0NmFlA=; b=czBA6XgInQxMtG+6EibD8ZRZfz
 y/Bl3C4yZd3+d7MjblPZDSw6vVhNMj5Qh1eyqM9c9O37BnE1kzuR51uIT9G2l3vl5ykTsL6qjMxoH
 ZlgXlJyXHA1ZBUYu+vscoXqXvz6K7Jr/6gla+LwgGd9KGxhpLHWniSDqmEvdYqpC7ueQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YQGhq97E+CPWhpWoX+fP4sdiyd2gS7SuRw/KC0NmFlA=; b=LhKIN79nsskJAEWpQjzE3eYnrd
 qqPnLanbdSAo8O+ocix0/STlMJFCFWKAtxloKg2NYmOOuzDL/32dfNh4XwAfqho/hNbjBDFRBiRJI
 y070sT7YRz34mS1oK7SpRphF0vJUy7y2xvnzxtWHdFPUFWKa7A0ZF4TIYPNdW4fh4PS0=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcP-00BS4R-K2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440037; x=1604976037;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1sZL6pRQBdfWfCo5BBLxp9YY078NIfK2LTB4YfkymDk=;
 b=fYQWYpwjjiMgQpUUsvWDNgsgR1/uLu+litRUTimolYHcGJx6Dw0iP0rB
 C+LEUZyKL5OSPIsbD9NvD4U6k3n2u+i8+0js0wtXckndVbpwTiT/MHM6I
 Hdndj3oBe6S6KVxrhm8KzJsEpPqbUkVzXCU8Z+6iDjK8JGaOXMxon2zx2
 EIlpMMR7r0nqudGnVXtFVJbqyB8foal7FNmrV3v/XyM4+D+MGB3BDuVKZ
 T5R0pqooJGWG0p0nbKAniUI16saTMg+Au/PMUfWpBORlUZwXVqjAl49Is
 Q5ocvbfiL3H78tI4T8z2WGfXdMzp3sFg8vrkzFW25eDo/ej6Mz/AMG9Zd w==;
IronPort-SDR: nGqx0kMJhQ4vjPdygTbLnxYiN36Xlm7Qz3XjZk1QaeeFvYUlRCBZ7Ed1Lxavcti/5y0UjMreuo
 F36I4E9N+NPuCe6rJIFoyesAETI12TC4aHcK/hgUPULzCTA9fxnyk/Vfz/2pVWKrU3pMTnYnoZ
 Jc9/GVBsGt73+FupZUX3vpZYKdetJEnJGgoRqzzXCJ3aFypie1M3PFhNczBpSJRS7XqQtwxJ4z
 UT+qtBnk37EkaUQjl/ViQJpQEbIEL/P/vZ6TTPg92XVOrqV/Wp+dZUzc8krmxgMpcGSmV5CbGP
 UIA=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223871013"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:20 +0800
IronPort-SDR: lMpYZk/5W1XzPROd65Xm51CbxkefWb9fMSTV3nSHnabJAyYL0mrqTbd9nUveukTANJDDagU0xh
 l6I2RiOUnV3hs1GNuo0EZgbHaHIRLzpnyqkVMk4BASmTrOKaCfZ3A7FZbsQ8mZ35vuYSJqlXWV
 Bp4qSl3wnuV0XWo3kK5tHYUqQOUZp6uZL6/wufSAHtcC83nN/IRpN4gkSsV4I+BcgzK5Mp4oME
 PN94aYFZDBj0z461TZtldfSO/5KGn71Z7W4JqKlXd+N6uhVByqofI7EhOhNptHqpuRyG/tFN7X
 MUeVzgma4NqNB0Ejm/JoLFL5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:47 -0800
IronPort-SDR: lRZvIR/O5C0FpMyv+zvFumbYyQBnPVJ1FnoQZqkVLMMooNpJ/0rjTHZmZrD0WyLE2miEIqSrqF
 3qm5nhqw7bx89FHZ+2c0CEbg6mgkTF5Wn9pJmNykmdtz+KiVQd5tZCWpERfIuyJiJNk/psksj5
 5qAfYNqbiGrsIRZhQaWEG3Ew0fTF+bL3Dw2Nz4hvT8fwQI7uGQJemGKVZYXfZ0mV4OJ1xcXCLj
 7bJqos/8t3hXxm7xir3bif0kRptpQdRgHnmsNIx9erUM5fPxVSQHGUpaCqVC2Ud65pA5T2XHA4
 2nE=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:42 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:27 +0900
Message-Id: <20191111023930.638129-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111023930.638129-1-damien.lemoal@wdc.com>
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTzcP-00BS4R-K2
Subject: [f2fs-dev] [PATCH v2 6/9] null_blk: clean up report zones
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Christoph Hellwig <hch@lst.de>

Make the instance name match the method name and define the name to NULL
instead of providing an inline stub, which is rather pointless for a
method call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/null_blk.h       | 11 +++--------
 drivers/block/null_blk_main.c  |  2 +-
 drivers/block/null_blk_zoned.c |  4 ++--
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/block/null_blk.h b/drivers/block/null_blk.h
index 93c2a3d403da..9bf56fbab091 100644
--- a/drivers/block/null_blk.h
+++ b/drivers/block/null_blk.h
@@ -91,8 +91,8 @@ struct nullb {
 #ifdef CONFIG_BLK_DEV_ZONED
 int null_zone_init(struct nullb_device *dev);
 void null_zone_exit(struct nullb_device *dev);
-int null_zone_report(struct gendisk *disk, sector_t sector,
-		     struct blk_zone *zones, unsigned int *nr_zones);
+int null_report_zones(struct gendisk *disk, sector_t sector,
+		      struct blk_zone *zones, unsigned int *nr_zones);
 blk_status_t null_handle_zoned(struct nullb_cmd *cmd,
 				enum req_opf op, sector_t sector,
 				sector_t nr_sectors);
@@ -105,12 +105,6 @@ static inline int null_zone_init(struct nullb_device *dev)
 	return -EINVAL;
 }
 static inline void null_zone_exit(struct nullb_device *dev) {}
-static inline int null_zone_report(struct gendisk *disk, sector_t sector,
-				   struct blk_zone *zones,
-				   unsigned int *nr_zones)
-{
-	return -EOPNOTSUPP;
-}
 static inline blk_status_t null_handle_zoned(struct nullb_cmd *cmd,
 					     enum req_opf op, sector_t sector,
 					     sector_t nr_sectors)
@@ -123,5 +117,6 @@ static inline size_t null_zone_valid_read_len(struct nullb *nullb,
 {
 	return len;
 }
+#define null_report_zones	NULL
 #endif /* CONFIG_BLK_DEV_ZONED */
 #endif /* __NULL_BLK_H */
diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 89d385bab45b..2687eb36441c 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -1444,7 +1444,7 @@ static void null_config_discard(struct nullb *nullb)
 
 static const struct block_device_operations null_ops = {
 	.owner		= THIS_MODULE,
-	.report_zones	= null_zone_report,
+	.report_zones	= null_report_zones,
 };
 
 static void null_init_queue(struct nullb *nullb, struct nullb_queue *nq)
diff --git a/drivers/block/null_blk_zoned.c b/drivers/block/null_blk_zoned.c
index 02f41a3bc4cb..00696f16664b 100644
--- a/drivers/block/null_blk_zoned.c
+++ b/drivers/block/null_blk_zoned.c
@@ -66,8 +66,8 @@ void null_zone_exit(struct nullb_device *dev)
 	kvfree(dev->zones);
 }
 
-int null_zone_report(struct gendisk *disk, sector_t sector,
-		     struct blk_zone *zones, unsigned int *nr_zones)
+int null_report_zones(struct gendisk *disk, sector_t sector,
+		      struct blk_zone *zones, unsigned int *nr_zones)
 {
 	struct nullb *nullb = disk->private_data;
 	struct nullb_device *dev = nullb->dev;
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
