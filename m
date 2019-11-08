Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6507EF3DBE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 02:57:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iStWf-0000m3-2S; Fri, 08 Nov 2019 01:57:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208d19533=damien.lemoal@wdc.com>)
 id 1iStWd-0000lq-Tf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BVnq9mThOjO+8PirBgW6lm/Zv3sxoND6XRniAO5dJvQ=; b=AZogDDmtVw1OZ77D+6oEWA7KtR
 ACBvHsq0DwTusr1yh643vrINtm/6cHpfGRcAUkWnHtq9XhycAc3iiTlLxOw+9lyXYqEDbx4PEcL7o
 5r+VzqBjg8k1cGsLoRrrYbASuUjCAcaxmx6TZ/iwqv1xUuZDXchK5occ965uD+zVTOe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BVnq9mThOjO+8PirBgW6lm/Zv3sxoND6XRniAO5dJvQ=; b=CM/wcqZqrbYt9it9eelJhfKLUR
 gHYrKKXp9b1J+7wL9ZLt1blt7MDJ6m+IChMcz717wYKJPILDP+TfMQnpVIXgN2y5HMOTgvFi3qn4V
 tGG+hi50v19avA+q0sZeb/2IJWGLsINUq6q0qDEk8UVlTSmsu5Iz82r2cFjlH0CAsks0=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iStWb-005k3N-SI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573178282; x=1604714282;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/ZBF2Qm6RnCQBQjayUKqcmSbHczeQ3S6vZtk/vBsgZQ=;
 b=XQB4+UaRQ/4lxjldNnA0PilCkvX/xV3uHexnobkJqGC55a3XHr/hvxBO
 XXtaKXgjyQQUW55dofvbiUPNIbM0Z9ZLgIWk4Ao611hwIsbUdVXiNE3Kd
 My+dQ87x8P95/T9XezqD6YcIBAhRXkJ/eXH/SUC+zJO5Z5RE5DZSHq4tQ
 OHv6EUO/XBqh4S7IwmwEXdYr6JbXYwX4mkwVX3gbzKuV9Dm+BBCeylr3u
 OvhT8U94QQanVxzmxZ7MgGJehDnhSDkk74zAJ1ZjZutPpXWdh9Zggim/9
 MhcCCJGmvV5pnq+jspl8S477I2WWj7PVpeBxHYNM/jjO4O5bydEleo6NN g==;
IronPort-SDR: 8qfBQG1M88aqcuVVOvO4O3G8gZTGY0A1P10HOfkktIdR245Z9QodkQ/Scjza6eJBZrV6bGVYVw
 cMVP+iDIT/HnTK+S1Qz5SSPM5EFSbk3TVEfu+Vlnc/RTppD6u0XYFQXlli+R8PmgylxsHou9UZ
 yDyOy5w1N7iO7aA7S8oxmPmeoKvHJYO0DTjb6hJWDfEKrkbW3k2tcTFbCoBVl4bDHflV0vIesf
 8Joesw9CV3QakaTZOl6wfo3mPYZeDmdvHrTewigKIvr+QmRhPJVA7RyDPXf0AfbQ6qXtluH0Dk
 6xo=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636900"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:41 +0800
IronPort-SDR: W1irva7+glzwbbBQIrLptPd8COfdt7/N9vuTNpu7/0eaHxcrEbIpfN1prZwvJZyCxoX7d73kB7
 Mi8n1KMZwiDvPJ063Xll9NzH/+yJfWkrj1wsBDFE13UVYPz+zXw0DR6qbTNG/FsR6qJY0m9/r/
 h/eFZEBxvlvTQecscC8oCIUt8NNh/JO2eoEllbPi2/KvL/PPs1oBTOYbyZnNdHTASD7djlU6tQ
 V4yLG3weU9vsrkhZ9BPVmH0u6kFc78fvVWfoqIm8tnn4iYZoR/xOB77M6SCa304lDeKi/OCoMh
 LsoAIBtedgfUG58eUspjVrdI
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 17:52:17 -0800
IronPort-SDR: kr5/VwrcP8yZzj4vxGSaX58AWt4Y0XIBpscbpf4VnoVn+egmpoigIllEUBkXIYCD1cImYlODiZ
 g8C+Nd45aBRiX4cf6noKEGG+nI/z+ZDf6qo00fCPiXYYYNMxW2h+NYmssFipj9pIJZyNYItBPD
 /VE6yjmXGBUfpKzK1Cz65/5NNfQ9qhr3maxb1To4K13ZZspuK434rmXVRT5gEmH6xtndFTEFwg
 gmzxaShxISia7XM7WKrb5fQYFupSU+1Rks3wXAQxRlTjH5TnbPpW+DOVLaalFLDWU92lRGFfxU
 vzQ=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:06 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:55 +0900
Message-Id: <20191108015702.233102-3-damien.lemoal@wdc.com>
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
X-Headers-End: 1iStWb-005k3N-SI
Subject: [f2fs-dev] [PATCH 2/9] block: cleanup the !zoned case in
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
