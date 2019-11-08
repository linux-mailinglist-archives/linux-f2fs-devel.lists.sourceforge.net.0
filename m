Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E48F1F3DC2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 02:57:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iStWi-0006mZ-Kg; Fri, 08 Nov 2019 01:57:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208d19533=damien.lemoal@wdc.com>)
 id 1iStWf-0006lx-Ln
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iixLjc7GNylL4a1L9kLfr6xcm1+2GYTiF/4o/vRarIM=; b=jZMwUpLcJkJ3S5Jllg18D9hEyQ
 Przq5Gn8uK8ctvuIgGJ0DalvbxdgAWMdxcyILNapus55rky4m7AcVbIA2itBeU/qO7Reaj23+h20l
 JFFtl1309U5z2GqKDVBSAjcoasLpacM8vIIQ632LzfkwrebO+0InaRZV8rh0CIPcxij0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iixLjc7GNylL4a1L9kLfr6xcm1+2GYTiF/4o/vRarIM=; b=kI2ivxsGdlw/1p3KVoVoc/0dir
 eMfgoJsNthpVn89/Nrx+u/7YbDGgoDGpQhuqY7pAxNdSmtrpV0u+C+u0znw578GO89gjoZB08gDzW
 cAMYsZtlxg5pcDZTuHC8vjn2OnbYOQqfy+Snhd37+320VjAbfyVUDwYAAdmcyLHry6jQ=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iStWd-005k3N-Te
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573178285; x=1604714285;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=AMZ3oDljW0ETvg0Z4TqXZPyAsm4/Qkok9Q6cJKELkD8=;
 b=XFikAp9hcQF/HhgPi5suxwfIdj5t+DyGjfCBjpNzXwgTW282LXcoqpfJ
 JT5cZTNROWsLmm5lL0RMJqbKGgdTRqItoA0SJrxrcEJAEDJGOchvGHW9K
 Y4RMw5S+saqIzD3Um6+uH5x/hlHkKbWYp9w6thbjNT8LALwWGkzkq9c2P
 PN/IZ4HKP3E4znLPAqMsJqtU232Z5G0IZRWO2FMIPVhTStEANnVpTx1Gb
 Ll+HLnwUcls5xZz5TmbVq1gZf7kFRGlSI418Na2gwGrIBUDkQc68Bc43e
 cmrq48CsQiGmwopRCcUSSshmQS32Fi5MQIDVXtyhKRfwTVpnLPaeqUKkk w==;
IronPort-SDR: cCqPm6FtwyffhskFwo2kl1a/K96kk7wv04JVjbLShDRnpHOn7w233CShQT5qTTk+7kVmjcq09h
 9M8AHZo+mNRiBHBqEppBIquH4A79bzd/uM4blAspJXeCOUprY3K1stkXS7tLwW+E7RvvgHMW64
 AvhBOVd0IopcNjPzNzxIl3x45JiCc2Ni/2eR3vT/uRWDzAkdUIY+whiCvAUiYn+4DUW9mueHRq
 Mx2rDxCl8zR0ePGHL6JuTBMwBi7sbYDUFEpMGTEwybfpu6Fg+gIj6ZImGsryBs/8MC6aIhrzjV
 tSk=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636908"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:49 +0800
IronPort-SDR: 90h0186PFzAbmn22okO7L/UNwavlWcNjoxD9eJoYvAPJRhilcLXk9rghraJ0xi1JgmssVtKYAm
 2r5jpNJDIPYoorpiR7g3BzqQMnJ7QPYitsZ98ibkFiQ5EmsHyb2Qqt2femznZp7mSRvbsd+gVv
 Xc9HMM7nJKxFhT24ep/VNpOqeccYlTPVB2/rsIKGPR9UL6PSG0gEy2lgZyx4PrPZ47Zj6xiEvN
 td5xHASRQ1h9sZd9d4OYcV3rZuzRWKl5zjJhFaS8NtP2Vcd8r6Xo5tQHAEI7/lwHuk6vyBqImR
 uRH4cRuLiJiuyQiHF8AyPkDR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 17:52:22 -0800
IronPort-SDR: /Xjyz0Kh14ySCVzU34mSIqRZ1vmBqP7OykM734wRo0hJHoWbQl2cEq/vf0qS824wFLvW00p5vf
 PZLEgpFmBNiK5oMRHvYMoeyHmyyiWyjp0VrTjomF+AqgIPuJfUrcw1kmRXge5eooanwHAKO4IY
 T9In0tczmRSv5+EmJCYTmPgB0DbOrbL6kGLpmjJuXIVs1VgtPkWuiB+mrft01tqF5b3E6Zj4bV
 c52ECmRgUnXqJoIC0jok0oWJsRjy4xW4cW5BFz4d9xdZv5RfLXxwPoMO3fbGNvRISnnAqDp/oT
 E1Y=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:11 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:58 +0900
Message-Id: <20191108015702.233102-6-damien.lemoal@wdc.com>
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
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iStWd-005k3N-Te
Subject: [f2fs-dev] [PATCH 5/9] null_blk: clean up the block device
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
