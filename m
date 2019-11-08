Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF2F3DC3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 02:57:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iStWj-0000nJ-9E; Fri, 08 Nov 2019 01:57:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208d19533=damien.lemoal@wdc.com>)
 id 1iStWh-0000mZ-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=frkpvfZPxaVrY3g3VOF1jNxGdnsKUc1CWr+DH/6x80Y=; b=IkeaBLqFzY8KCmOwq8i+wRDbtr
 boPZZr8qNk8+NRoInPgjSAUMPjZwoPDlCT/61AEXGhvdRFpuCAh8nFHLz7lR3xnzA+xddsjy9tW6a
 OGa5Oeltb+Bbd5DTPUhp6PmnITZgLun44HzdEo/wYmeJN3GuKJKYrMWbzgwq2bv32kKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=frkpvfZPxaVrY3g3VOF1jNxGdnsKUc1CWr+DH/6x80Y=; b=ifLQoPNObK0rhCj3OvVXD8f9+Y
 8ybCvW5JcYD53uLI9wSKdQw7TAufv0fxfYraNXkpqmEs1o3DZzN+ll3uOXjOD1ZpcQ666QC5GvNez
 boWJGCFsFiTg0qZIZPJVJ+68xBtkPZDTABGWfHlQ9/nTvbfyN1Au2Y1oguM4CxX6iPdk=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iStWf-005k3N-LF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573178287; x=1604714287;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EnSuzKY/axQCAajAVOcJoJw9dBgmXf5swcshYxE1YWA=;
 b=ERoFGd5IUZOaIxkYWmICYuHaO4zR+TfTVyzSAFcLenyKoSQQAZ4/PDrs
 8gP4x2d8atahlhcKxfh0w/eBGc06ExnNBejB2xOReOii9lij/q8RimaiP
 BKCjMFqADNEvo49Spu1BEtRnBZy91/XFA5KFwB/0cwCrXbV/9staEMY30
 LQCgtoAiHoRj7KgiQuKeuMr0aybLZ/qaoMyewEk9dX9AfYU3Omg94l6uH
 WqzpbQfbH7c/HotkNy5U0bkrlYWtA2+narvGc/5sjAZs3qUCEIQzQp6ZL
 X7p9QMeUodZYFuFtJbuuq+DJjLTIimuNck+0rS8ZI+lMTIBuPHr7qqEL0 Q==;
IronPort-SDR: kd4tVJtk8GO/ILZRFAIPQNwIIxnDfjd0E/lZ1Vx1Wb2+6g2iE38Eysbw8eZ61p6YPPdb478IcT
 Ti9VAXBqR4hpG6ZZ9Z000BUQU+9PgXZDPbJ+YGeCfvR7cwo2YF+7ghiM7SBT8Aw838ypJX3m2F
 achE5AJkENHzWCstnUqu2OcbeS6X2CzR5SzvXoZMvNj29LnI3PRYGY45H8BfzxYgELnRo6cMj/
 LFZAGVWUXi7aicM5xgYuWFDOsk39ZwnlnCihEBu/nUekmgZwm9CSXwr2NbjCxxKPZzUaEtEqeX
 9bs=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636918"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:57 +0800
IronPort-SDR: zRBPWkwsiQD7j8HWOe7Rm0OejVToKSYt1kTTu07T/yspyJBvikjjOQ92y70g0swhuoldNYto5i
 osLjmwoRVqWGFwHEX5UV5jgCL+Yg+xMIfaQsDOgeRjUx2U7hhD+0nro4DcZLxrFnYhqOfHN/fF
 0vGx/asv3JErVinwoD4RXXJCFUrKJy+XbhkrsPxajF52NJbt5wQ/cQjkxHfo7aUcOaSYHfo+pO
 nk1DiAsYc/kzN+XPYI3zNC1CCFPgReAGoo+XRJNIxH2FxrN8e5RdW+qvd/swQa8FrbalnPAzbx
 Gxbu/TdNbm7n/mpNq1JjFG8l
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 17:52:28 -0800
IronPort-SDR: dHLRd3tvtQ98q8DR8MwYs6kFl+6+MwCORXw5XY8UeHeZmmbwW8EmKaU/5UBlQ7GIWI2DFt5/h3
 pguu0LBgUW+IOJRG5oHEnqORPsQgS+3ttITalhT8LiVC71i3QBCZmPqzGx0gQ0zdTJT1IMPP7f
 dNvMATD9OHPjcUhT/m49BQjwPkpDKz1gKwrGkyL6bKrb08LFBK9YIDij069nNj95EI/A9jryfZ
 yTBySx8vV/N6UXprL8jNnLLQKZSRZIWWqWawaUj+itEJuxVNmwPXy4zdUaSOoJrr87VuDOSoWt
 K5s=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:17 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:57:01 +0900
Message-Id: <20191108015702.233102-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iStWf-005k3N-LF
Subject: [f2fs-dev] [PATCH 8/9] scsi: sd_zbc: Cleanup
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
until the allocation succeeds. This ensures forward progress for zone
reports and avoids failures of zones revalidation under memory pressure.

While at it, also replace the hard coded 512 B sector size with the
SECTOR_SIZE macro.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/scsi/sd_zbc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 7c4690f26698..f191af15de1b 100644
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
@@ -138,17 +133,22 @@ static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
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
+		buf = vzalloc(bufsize);
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
