Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E443F6CEC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:39:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcR-0006yO-3M; Mon, 11 Nov 2019 02:39:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcP-0006xp-K7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FrkehnrfYHhE8jYuRR7S/GmUSrPV+VhpPYfLdPPp1Yo=; b=VY8pxq0tNGKRYYLQTO3j3rMvWI
 DlatZlzYs9ByRxMAuYJiY38VRloCSaWcMD+UZOn3vFE6GWZTpRzMyubcCsj4MR7jveTvbTb9S5/Bo
 rD/rebYRirZXTO3pElNfu8Fw+OtlxZUj4sqR6OTdmmIW/7kT8HJ9asNHZYU2ztnmfJSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FrkehnrfYHhE8jYuRR7S/GmUSrPV+VhpPYfLdPPp1Yo=; b=QXPmvIotmUL1Wh3gY99WAohyRP
 /bcWWrEpP8NyXj3BC29D5z9Afg5MS2pcdk0ZY+rT3y1Ovr7dAGFcfwKBnfNEQ5MpkHP0WnJOumtSk
 8EBDjgmJuo0fSh5tOhlUxYG9RuHKqsj6WDhm7J+XdXYU4QlmTLwlGtPSkF5Or+Bmjlf8=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcO-00BS4R-Bw
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440035; x=1604976035;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Mhdy8g97yrlGhg/4RxtKDJYb9b3tPtuYVaQdVOv/e+c=;
 b=Ba79SW26r1tMkGkc692zZ6LQneuwCAgBQ32a7eUmXtOgLxNoLiWuKbym
 vmW6bxqHnRSb0v2c+emiqohpGz4KUxfyMJcmsodINEBxauzmC/m+iZ7kk
 Fu4ME8hoVx3peiO+e3G+Io65N4tkkobba+HfXnC1nCQd3+pmKbUeyWO4X
 W8TSl9VKqfCiHoPj3Cii5b3RwKb0+x5tQpoAHXk34Ag1cS1FaJA1sDj6i
 QfChkwpYfd3pGxID/XjSmCHpBtZLJDB8k5badc0LE2wofNj4bYkATyywm
 zhYRP4Mz8kNf/zM3Qlh90TMQOWbOpGKgnhSH8mcG3QM5MULRQWVr+KDqg Q==;
IronPort-SDR: tqG+53HrSJ6ioXEqXsl875gcJx6r/kKx1VvxUF/gpWTJXn8s6fQABSf8BUIX8YkDKoWWVIPSE4
 ex0TxMX5g7X0bjZEtyFxLUIZtpjW9JRVwRE3Ff4LHzXmhA5kIy/Ii3SJHiiuwUDAYOnQ0Xnyfi
 cDNICGZmt+i/E+ZT0LGirtR5Nqnr3IroF5ptRLNOyaEKp/MlrrFqYUrcK5DPm2qmY3Oi0deUGH
 FpCMKRooDtS4zL+Nqec70cTFrR7kMVfIcUaADV6j81JpaCRx6OevmECvnn1yIiQJvgjSmQSRad
 oBA=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223871008"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:18 +0800
IronPort-SDR: sKIDr/YddCgms+xqf2Ms6uCmZ4lJkEpQ3e/Czzjp17keVGfeWFzLsCFhwVr3cIbwp+Q1XRf6XM
 0rvbQpbQcba7J6eP/zyQHgVI3OK/xK7CFI6nBen7pYXs0VaoOPeS8IryHqCm0Qq7V8QQVEX3yw
 xB17SaRsqCWPaXLtSyGrP14G2OdXT9U61czWU8x9rw6/JxcV0QVW/NEeIYiRAb6mU7Yn588bTt
 0lolgCeMDxRZ80i+VHkWqA2acaFtms3kwHu57i8p0wcPXmVj9SiTaRoxx6FpGEOSnkNQZ2i7t2
 INNvybRTrFVaMDN1gzhzZaMr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:45 -0800
IronPort-SDR: NyyzMjuId9K/cwPW4JejXGl9FOwY6f4zFA0r2xaWlqpgAWgx+kRjiP8OqVZDjDYVpGEZpwSIMZ
 hPo4W3ycGN7s6Py3xxyG2l2wTUQ/d4aQg2jSYGFmjC19ej2PEMO11ERUdlhul1ZcvGNJ3lyNXt
 TwsZraiGWIr9JWb9WdpAaWwQmF+iIsp8W4sgEKr9m/r1q5emigRYnXyY5HU9WxK5wLBB9UifKr
 lZg8Zm0UZPNOJcTwRXXQwzESDgKQlU0hTaJsdD9YS951Nzj26s42T6SjnXuO1JrvfTrj2PhTSR
 Nlk=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:40 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:26 +0900
Message-Id: <20191111023930.638129-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191111023930.638129-1-damien.lemoal@wdc.com>
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTzcO-00BS4R-Bw
Subject: [f2fs-dev] [PATCH v2 5/9] null_blk: clean up the block device
 operations
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

Remove the pointless stub open and release methods, give the operations
vector a slightly less confusing name, and use normal alignment for the
assignment operators.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/null_blk_main.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 40a64bdd8ea7..89d385bab45b 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -1442,20 +1442,9 @@ static void null_config_discard(struct nullb *nullb)
 	blk_queue_flag_set(QUEUE_FLAG_DISCARD, nullb->q);
 }
 
-static int null_open(struct block_device *bdev, fmode_t mode)
-{
-	return 0;
-}
-
-static void null_release(struct gendisk *disk, fmode_t mode)
-{
-}
-
-static const struct block_device_operations null_fops = {
-	.owner =	THIS_MODULE,
-	.open =		null_open,
-	.release =	null_release,
-	.report_zones =	null_zone_report,
+static const struct block_device_operations null_ops = {
+	.owner		= THIS_MODULE,
+	.report_zones	= null_zone_report,
 };
 
 static void null_init_queue(struct nullb *nullb, struct nullb_queue *nq)
@@ -1556,7 +1545,7 @@ static int null_gendisk_register(struct nullb *nullb)
 	disk->flags |= GENHD_FL_EXT_DEVT | GENHD_FL_SUPPRESS_PARTITION_INFO;
 	disk->major		= null_major;
 	disk->first_minor	= nullb->index;
-	disk->fops		= &null_fops;
+	disk->fops		= &null_ops;
 	disk->private_data	= nullb;
 	disk->queue		= nullb->q;
 	strncpy(disk->disk_name, nullb->disk_name, DISK_NAME_LEN);
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
