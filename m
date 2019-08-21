Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E63697144
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 06:48:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0IXh-0000K6-Sw; Wed, 21 Aug 2019 04:48:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1294c0c7a=shinichiro.kawasaki@wdc.com>)
 id 1i0IXg-0000Ju-85
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FYpRR7Jg9kyfb6iJsflJwRYi5nMJ+3Re/f+YRd7OC7E=; b=SSktccvJfrmeJg35Dwntmf3RWX
 m+9zBSwfFQL/uJDsXOL59cMA4eSXCqyAN6qxAYX0WR19gsRoMYUz/H/w3SqPildEk5q9Co40CyM7R
 Bd7TyH6besAmDSurfag0c+1yOR42k9NRIEIQZwlFFJULHuIDlHvetzt4QsIvSvx5Bz7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FYpRR7Jg9kyfb6iJsflJwRYi5nMJ+3Re/f+YRd7OC7E=; b=KVAxOePlw3PNNEnhANlFQj0pB7
 7I0xHb4UcI6rl905XmW/vgSs6y9blzFK8OYMGK4JQtnM86leS3wXPFgMh9yMO5Eo8DiLzO4sugJr7
 JWqpi7tpmZEK37WEovjpCs8AHqFAHgm+UN1OvA4G/cgjAwcyV3bXBzG99dBjf1qjg8fQ=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0IXf-00AeS0-2p
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566362895; x=1597898895;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/SwGx/Kiq8YyWPkq0AE2vKQQ0k8vIQvs+P87UcX3NTc=;
 b=Ul4tGfv6ZWLNH1Cl9HUrX5OUbQo9NlxY+i9tcQOwwaAJFp5g7QHja62G
 Zllc04y9KrYYwSRIyuOQd/kyLURHLogoJ/+PauYAQ68tF/mZLfyKUJETt
 +/nbAUytjxhWFfKddgNd7oCrAQS9lI08Yoke9n8dVsrCx4hSIoV1nwjGn
 ECLF/fMUr8KEJL/E8db/2DmCTs//jcQQOjA/EWd069jJwPsjrEDsKyCaq
 UPdm+tkJye3fEFYSUGiOxjiiFf0dcJejdxNAxttbFSGyyKia5JSJUB3bn
 e5szIoEWid115xX5K9UBiy41EJ36U009gj3ZIDYzHjRftlfyxNP/QPe86 Q==;
IronPort-SDR: inUhUoaOHck0qZG+FJ/GPgI4FlehFjYxQTnYi4VmxJdcxyUeRkZsHu5EK+FFFBYYx3xQ11S7sT
 XtofqeurwvxfX+/IkhsOcVCE44wfQuDFJTccpJf3JJlNNy1r6ev1it48i6KlHoCtxPtH1qwOx2
 LqRwjsaJojV0Ck19jrSKJF3j+an5s+P8L2DG16VIwIT5CijCVe5nN+p4/9Q4LxhS/P7WtYOn5j
 mcX9GKiIG4RJhWJN6P9akCTMMm/bs2EjMrRftHy4frt2nuu0H7sx+KDsoBn+NTk2HNjtyhPsks
 XM8=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="222876208"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 12:48:08 +0800
IronPort-SDR: Rw6uXMwh5h3XS8VEljTiLgJMneoWWUGw2Vg2HBaNZf2NnkXmvM7SzB5FFT4V5BHkhSi+/8ezYj
 +VSAzCI2JB6Bfc3bBdnghrBzg+GbXQuf4uQAmsb3sqMXI87Kt8D4vgOY5WsIrb9Xui+5Bvdq2q
 RVlTNsszENlmpIIe9aLfc5KDehI/zWsziBc+Bu6bmhn7jNW3YwcMSiw60/r5RVKKZda8F1U6Sd
 sDb74ZVCy3C5pMXn3a+AnR2HzIUwvKoRBygnEY9ijW6YEEd+vphsOI59KFxHOC4ghATWwJt+bE
 /KDHn+RdJMLIdBig2muO4Jjs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 21:45:29 -0700
IronPort-SDR: q8kiSZNpK6q3NqU9fBM+MjKoHjpkyFEnOj7yORkgSWTDPEquiCw+kX/zufgQPzcAO2oo3nOXiX
 wX79khF6VrUxJaQaelKajZTODNCa/rqCBSpn6iInIw9QvSX8F8UiJmghjjMrkcyaMu6+KINMvm
 sAfod2KeCrlJQkU0raXpZJshPErfYXVr71F/3TcJKDzgbLv6swL98/3gvTXQYzWUYTDCMPIond
 dsuqm7sD2sZ6zuIJstJkMuhg6ML/wEaeGwAvVp7x6XHcWut3yvUJv3ViLT2HslinvqH0S84ap/
 gCE=
WDCIronportException: Internal
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 Aug 2019 21:48:07 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Aug 2019 13:48:02 +0900
Message-Id: <20190821044802.29702-5-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1i0IXf-00AeS0-2p
Subject: [f2fs-dev] [PATCH v2 4/4] fsck.f2fs: Check write pointer
 consistency with valid blocks count
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When sudden f2fs shutdown happens on zoned block devices, write
pointers can be inconsistent with valid blocks counts in meta data.
The failure scenario is as follows:

- Just before a sudden shutdown, a new segment in a new zone is selected
  for a current segment. Write commands were executed to the segment.
  and the zone has a write pointer not at zone start.
- Before the write commands complete, shutdown happens. Meta data is
  not updated and still keeps zero valid blocks count for the zone.
- After next mount of the file system, the zone is selected for the next
  write target because it has zero valid blocks count. However, it has
  the write pointer not at zone start. Then "Unaligned write command"
  error happens.

To avoid this potential error path, reset write pointers if the zone
does not have a current segment, the write pointer is not at the zone
start and the zone has no valid blocks.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 fsck/fsck.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 21a06ac..cc9bbc0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2595,6 +2595,7 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
 	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
 	void *zero_blk;
+	block_t	zone_valid_blocks = 0;
 
 	if (blk_zone_conv(blkz))
 		return 0;
@@ -2615,8 +2616,35 @@ static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
 			break;
 	}
 
-	if (cs_index >= NR_CURSEG_TYPE)
+	if (cs_index >= NR_CURSEG_TYPE) {
+		for (b = zone_block; b < zone_block + c.zone_blocks &&
+			     IS_VALID_BLK_ADDR(sbi, b); b += c.blks_per_seg) {
+			se = get_seg_entry(sbi, GET_SEGNO(sbi, b));
+			zone_valid_blocks += se->valid_blocks;
+		}
+		if (wp_block == zone_block || zone_valid_blocks)
+			return 0;
+
+		/*
+		 * The write pointer is not at zone start but there is no valid
+		 * block in the zone. Segments in the zone can be selected for
+		 * next write. Need to reset the write pointer to avoid
+		 * unaligned write command error.
+		 */
+		if (c.fix_on) {
+			FIX_MSG("Reset write pointer at segment 0x%x",
+				zone_segno);
+			ret = f2fs_reset_zone(dev, blkz);
+			if (ret)
+				return ret;
+			fsck->chk.wp_fixed_zones++;
+		} else {
+			MSG(0, "Inconsistent write pointer at segment 0x%x\n",
+			    zone_segno);
+			fsck->chk.wp_inconsistent_zones++;
+		}
 		return 0;
+	}
 
 	/* check write pointer consistency with the curseg in the zone */
 	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
