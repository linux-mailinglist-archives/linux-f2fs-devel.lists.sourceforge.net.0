Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C88F6CEF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:39:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcU-00087I-C0; Mon, 11 Nov 2019 02:39:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcS-00086t-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YQThqghMuaWVFs6BVRvnfBOaCEIvr3Vo51O73spFYlM=; b=Vsf5f/bA6aN84kX4eQZSRbGMXv
 rwt6vamHGGuMOGKBG5A5kP8qgOvUnjXdvZdP2Ztd1UXGAcCZb+Rh8OAxvHWMqYWZN/bI9mPSWOuim
 jzOAc4SE6dE6lvznAe5GSMlj4aGBvwZGpkijkskR6SWIerOi31M9sB9o/cC/9cJ00SJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YQThqghMuaWVFs6BVRvnfBOaCEIvr3Vo51O73spFYlM=; b=R7V5gHuMEHEkME9DVb9XwNUjLY
 COdJLTfkpvKNRdTNpwoeVjDcxBfV/UxU0k02ClRjATAC+XOH3gEbUfao0vhjur4vEenG9zQOUexAp
 wCu0adcvP4xgbCJpvg29WJeaUBq7mSI3D6zGotZxtIO95d/08G1E6Ks4PwHEtGl8ONyE=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcR-00EDq9-1c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440039; x=1604976039;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bpIGBElxsl0fjSxZjNS/ZKnF4nvJx57BXQeH1ukfHDw=;
 b=dqcOlAaFmlnn6J3uWUVO8MqThjfCf656jjLTRYPy5lISTyLgDiWPGF68
 xpNSv0CPTU2Qd/F5FOulQWWEex9SStfbuvRJdhTSBHZm9FaKJd7CUPgbl
 Pdh7DdDXCBbZQ+HCGdaX6QuR6qfPA45S+mZ4fOYo08ocX+XS+WPEw3bOt
 sxOBuZ2uoyLGkjukYEjhcMIcYNUVIbmzmsSQzSCujkWY3ZA777o2AY0mD
 f+oEIFoBjzdSdJM3wokwTlz6neuq0S/s6IWbupLKAPU7R52eKRZXBXIFK
 SlepHHH8tqepG6d+DVYC4pumKBUeipTzA2WlgxSA5sidc0bQKd5d0vy/s Q==;
IronPort-SDR: xQ/hDmYW5wGV1gn/WWhbZGsQrgXwwbXqGKh5SEQHmU3e7ev96DvntjJBohhcle7t3BdSoTQnqM
 Bxwq4R+YaHbWhO6mNFy8jQ7xFWl2VsA2zl8CFGrpmdMNQ6XjaDA7GWDKNdn7oQUFl7G+Rtj+ox
 qi9nYED7FC+drfsgQnBZUHuejNtlpV4iGa9OfHLVj4h9lt8HAIj8xumFpbpYE9Dl5gSI/pABbl
 1JUlRzKKGxQqCYg+4EAHwSullldO/VYBYJLP6iXLm9qZqVo19Vt8A77CVVV0f1f9c2Gc+AfQ5c
 msA=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223871025"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:25 +0800
IronPort-SDR: p/xgqZqB0++XYRc9SH1j6yiQV8AbGVcBg9ZUpSA0R8+q2BlM6BnD5hh4ykUAC+yVQfRn3QAGpM
 vZF318Lu9efDbVYpbg6YlpfaWHkLXK/nZK+fMZDz3j0+GZr2+Yv1Jqv9LNDFtJnptKh3OUeanB
 psqacNvY2AUqHdccn3omZljqX/jCViAU8kcISnZkuaHO/mHdfORO7Q32DZhzCpV7GEwQW8NzNY
 CF2WFhLjlWRwz3JVg8uIl/lUFi5blD6yDjvSDKjNcSpiSsrhtTHerKR7H9xhaoSMmnfxCGu7vO
 U0esF6Am1SY6pOM5YG0g4Jp9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:51 -0800
IronPort-SDR: d26YsSQ5WsgX0IMpopyKqryqzsAOLpcKOoJ2xbrC9TC0FnQgPCTQe7zeg6q06lZ8pNRHBKuQ7s
 5TE96C5OXVFDXE/+AZmA82Y6G1fOMeS83me1ZR0vzCoSjwg+nWzv33CLcEvQoW9W90j3QZtO0I
 cv/Ps1TEZ+32UGA3y2kyRVxggtfLPM9TBjUv08jRX/PUace73jULqDKhykdlOGtnibsh+1O73H
 Z7msO/3h3ePoSqFMRZQ4iPq5DDX9gukcQL6g+MvEi9FdyRWEvsPxfBbo2AzYLBrHvGsdvH5nHm
 Yac=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:45 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:29 +0900
Message-Id: <20191111023930.638129-9-damien.lemoal@wdc.com>
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
X-Headers-End: 1iTzcR-00EDq9-1c
Subject: [f2fs-dev] [PATCH v2 8/9] scsi: sd_zbc: Cleanup
 sd_zbc_alloc_report_buffer()
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

There is no need to arbitrarily limit the size of a report zone to the
number of zones defined by SD_ZBC_REPORT_MAX_ZONES. Rather, simply
calculate the report buffer size needed for the requested number of
zones without exceeding the device total number of zones. This buffer
size limitation to the hardware maximum transfer size and page mapping
capabilities is kept unchanged. Starting with this initial buffer size,
the allocation is optimized by iterating over decreasing buffer size
until the allocation succeeds (each iteration is allowed to fail fast
using the __GFP_NORETRY flag). This ensures forward progress for zone
reports and avoids failures of zones revalidation under memory pressure.

While at it, also replace the hard coded 512 B sector size with the
SECTOR_SIZE macro.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/scsi/sd_zbc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 7c4690f26698..663608d1003b 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -104,11 +104,6 @@ static int sd_zbc_do_report_zones(struct scsi_disk *sdkp, unsigned char *buf,
 	return 0;
 }
 
-/*
- * Maximum number of zones to get with one report zones command.
- */
-#define SD_ZBC_REPORT_MAX_ZONES		8192U
-
 /**
  * Allocate a buffer for report zones reply.
  * @sdkp: The target disk
@@ -138,17 +133,24 @@ static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
 	 * sure that the allocated buffer can always be mapped by limiting the
 	 * number of pages allocated to the HBA max segments limit.
 	 */
-	nr_zones = min(nr_zones, SD_ZBC_REPORT_MAX_ZONES);
-	bufsize = roundup((nr_zones + 1) * 64, 512);
+	nr_zones = min(nr_zones, sdkp->nr_zones);
+	bufsize = roundup((nr_zones + 1) * 64, SECTOR_SIZE);
 	bufsize = min_t(size_t, bufsize,
 			queue_max_hw_sectors(q) << SECTOR_SHIFT);
 	bufsize = min_t(size_t, bufsize, queue_max_segments(q) << PAGE_SHIFT);
 
-	buf = vzalloc(bufsize);
-	if (buf)
-		*buflen = bufsize;
+	while (bufsize >= SECTOR_SIZE) {
+		buf = __vmalloc(bufsize,
+				GFP_KERNEL | __GFP_ZERO | __GFP_NORETRY,
+				PAGE_KERNEL);
+		if (buf) {
+			*buflen = bufsize;
+			return buf;
+		}
+		bufsize >>= 1;
+	}
 
-	return buf;
+	return NULL;
 }
 
 /**
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
