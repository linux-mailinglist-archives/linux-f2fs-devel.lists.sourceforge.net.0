Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F3DF6CEB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:39:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcQ-0006xw-1N; Mon, 11 Nov 2019 02:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcO-0006xh-CC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+RXz5Qq4ebwXpNNHfmbIeV4K5ZxRTqWSDaY/7EN9tj0=; b=a0TadkEmJhz07geZG7FLscQ5Fw
 iBgfD37Xc3DZmBj6suxyzK0PC8jfqyiBL37g2042BqMyXO1U1khUTmhJEA9bh1dkCLwhyRTS6MITT
 WScFkmxGudZmf/ox+q+UtXx2tPvbS4/HaCPeNRnYX7/g8HS3IYyx5oqay0hxSYjPmZt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+RXz5Qq4ebwXpNNHfmbIeV4K5ZxRTqWSDaY/7EN9tj0=; b=fQg5tbAm/3JKW5r0Qk2Kkh28Re
 eIf3Yjyy9wgQSLjxhKV6N6LjXFaXmRln52zYcaqxqyk4g9qVCtkRSMrtMntk58f2vWrh+2wdSuV3h
 AxXN7CT/wKKdIPtgM8BUG2vfuwR4GEMgEfanOIWAdIlWjHaEabrIpXrhmTQ1o+0SQlgE=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcM-00BS4R-BL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440032; x=1604976032;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=pRKa9RYPbmYIjqNqnNPy9xId0wvUi5EB+wPZWDfjvWA=;
 b=WhZe5Ofoi1wYcntBzuBMGLu4UuchU/Rs8zE35sILWlICG5AOmvWl150R
 njbaL6vhV8/OivIw/Q0iIoJiRokRh8DU5m239djQ1dzq1crPDd+VJakuV
 S3F75kNpUtbFLRS08pHeSV7CjmopJNTc7ZjVuGCu5L/zJZ6Fts0lT3+56
 2qp9TDI8nHWkJjMyMxMbcFN43C1Unohe+Oe2m2XF9c7NWU99sOMhSLS+A
 D6neV4kGrj0KnuTB82D3tvUfBQlahbVBtny0vul/TdmQv2jCERiUxeKOH
 EyIVegoh5yTjb5dJJPZoOLq7aytRPi5Ainy6SnStQ6tJKcommMaVD4REc A==;
IronPort-SDR: rym70zfFJVT3jMWVCtGVLHisB9FL7f582xrz/MU4a7TevIm6CsU85HTqeJNAQre3dtO/c/oeEu
 NVwdhqu3+Or0aqcOIdRqqYgdjEERSr5n9WsRaCu6CKNsfSbSeMQQPWX/FFCAVtTnpkzXV+isJH
 aJ1F+fv+1jPlhmGI8jIuS53HSUofBVEBTyTSI0tc/EBG3pvRz4wuKKXD2I1xsxBAA/D6jmLRRl
 feq75EG6F8OARKOXlJwMy+d3QnEc/HeKJTcJkE1h+Ny49MtOqupGHYui0qX4G0rD5dT5g8RDTk
 Oqc=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223870997"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:10 +0800
IronPort-SDR: w/49AzRqsC3BHrImP9I9WI8MqRJw1hRhJxcatwF4cfbGDBBZQffVSFFhBJvb+5z+unFUYScq77
 cWhpxQ0df5l3xy6RkzGzTxVDDGZ8sy5jHHQEYxNLWVuXdyI5llA8ShsBX5I+m3b/YXuO/wRn+T
 R47387j/LkAmoTKcDq4+yyTA3p5cxYZsHmlge+qewUIgPah482c8o4Tx9McjIZbeDDvdjXnHwY
 iIOHmlUuPI2Co4wcnWkwgWC1W2iekLpP3BqK4+XXFukQPrJvpBn5UQYpbuN0IOudtheMFLYPj3
 8R0UbjFxO5BJv99L9FPXlEEE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:40 -0800
IronPort-SDR: 7KNGaRYyEF8x+/ZjhGLu+4u7TY3OdEre8o8K8/TSWKs251Hma92sBpZPSA97z7BpbhbhrdKCih
 20juh7bT6ZoQyJrVgJHjWUPUUiQtcwoWZTZ5S4umULlxJ66POPAasvaVIFu28RLa8V7fo4US+n
 i3LfYjAeNMB3hSVfcBGoSOkKyvNlOCxOBxEBguMsrNWpPHVw8tD6fqnn5xtN11LUgxpGeSHVoc
 H70zVCimk3duIOd4rIT2UQ3ODoLxwdogWfGpLa3Y4iWYeM+bD4sfoVMS+mr5D5N4UCAcDW9sOF
 VNQ=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:35 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:23 +0900
Message-Id: <20191111023930.638129-3-damien.lemoal@wdc.com>
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
X-Headers-End: 1iTzcM-00BS4R-BL
Subject: [f2fs-dev] [PATCH v2 2/9] block: cleanup the !zoned case in
 blk_revalidate_disk_zones
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

blk_revalidate_disk_zones is never called for non-zoned devices.  Just
return early and warn instead of trying to handle this case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 block/blk-zoned.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index dae787f67019..523a28d7a15c 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -520,6 +520,9 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	sector_t sector = 0;
 	int ret = 0;
 
+	if (WARN_ON_ONCE(!blk_queue_is_zoned(q)))
+		return -EIO;
+
 	/*
 	 * BIO based queues do not use a scheduler so only q->nr_zones
 	 * needs to be updated so that the sysfs exposed value is correct.
@@ -535,10 +538,8 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	 */
 	noio_flag = memalloc_noio_save();
 
-	if (!blk_queue_is_zoned(q) || !nr_zones) {
-		nr_zones = 0;
+	if (!nr_zones)
 		goto update;
-	}
 
 	/* Allocate bitmaps */
 	ret = -ENOMEM;
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
