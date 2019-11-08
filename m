Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E778F3DC0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 02:57:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iStWi-0006Ae-Ad; Fri, 08 Nov 2019 01:57:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208d19533=damien.lemoal@wdc.com>)
 id 1iStWg-0006AB-LW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DHA6avSzHHP4PvI86+yNyQrV5Tq5McHUDYPuiyO0LT8=; b=D2ynW6ZiHGd4MIL9O/m9PKmcgb
 q8UVB/yIqgBxadp4jmiIxXkjUo53L+y/cNxtKiONM7V29Kenywa8dei3cvSeQAoqS3Dgt03bVWyXN
 zbD0UeGqmjyxp2Az3neZRGJT1nf98kDOO1tsrSBx4woFl0lhdX+gUyYhbv4IsraDEKIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DHA6avSzHHP4PvI86+yNyQrV5Tq5McHUDYPuiyO0LT8=; b=C/t/UfI5d4OQ46jMQaQRXr+DsW
 OuRTE0OHQ8gpLky6Xn+B82/SHhDZsTLoeT8HRVbD0tNvI8DIcU2X48Dk8yHjNYNGQLHwAR8VfJvDw
 4WCIr7Un4c+BuYYzNwSIkEXZSIVVBdHiTWiACY4Ueysey2Gi8CFK6Mib0dL6tvaqYnWo=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iStWf-004Ptp-Fg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573178287; x=1604714287;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eU3UPObloIUO/IHs6JVYQB0lk+QRMMWcTIgAimNInc8=;
 b=DcCeTXRikZtp/MJza5ldyoH9jkvBFo2KgvHnzcCIChOEHtMUrcxYDmcz
 0JzXpU/68JMw/Bd2DMYPm9qw5+Q4Posyn9uQe9YAGdmAU+EAqZ8WV109B
 GwvlDlNDUCmbVnC5nAhYS5KFu/U/98ks8BnMTQatXxkYA7YQcVDEhfoUx
 RpLCQW8QpcwVUBWvYgP7sexr7w0DDooPYv3jT7bbtsM9S9Me/7ssxIqwF
 HCNbyMCWICBlt/vLK9fiaJkgpCtTIsYye3A0xZpB14S8xiwGhuD6SmV/H
 DaQBeiChbmWOQcebayRuw1IBX6cMOSqKruYKPkmyM2USz9YLofLMfGGXg A==;
IronPort-SDR: OiOxF1R0Obwgr1QS51DlbFNklKR+0qC00KNSQdPFcVjI29anmwooQ3Uv4989H455bs+d3AU36+
 YOwv8YYcs2EQx5633+Tt4aNbKzwWOFZo+zedBHp/hXCwht+IkMzhhI0wriZTqBesFGkglyFXhb
 HdWDsEjN9DMNuRVslDfCbCYrnF0uBM8rDfsy4ynTOUPiwY1CWYmTNuVrjLVlnK2dEazHAsB933
 u7c9Yrg6FB66ChMJrQPyC3AM6ckzul62AaFSlW9afjW+HhiDrrpDM7o5gdl6tlpK7CyR7kbStY
 V5M=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636915"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:54 +0800
IronPort-SDR: YhxfispFe7IhvLK5hMH7FKDKTlbF74q8KzmwjzhRv3IEMXJuhUWNPGGpvAyeavJChR0ePgbsUG
 UXdMecu483n1wmNlat3W4CIxhBefbKoP204wYugj4xWxA/UeLLT4mh/SggmjT1sN11jAgaaWA8
 GZTh+e7O8nVujPvFeVTv+cmEef03niKEtH6sJF/Il0/EJJUtTTUE0LPCS97RKvbwqiBdfoNB4h
 9iOazPOgaaykETneDYqwiwCS0Ea/iGuFbTVAlAwh1Y0seVR0F36s4Bw6l60/saCxwY+EaP3F6i
 Rd2ZwtZf1L8nh9IwlL2NxM/g
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 17:52:26 -0800
IronPort-SDR: eEzgyNms9DdIGk7sRIpN96F8FHGQ06z8avuZlFaN3KKigJBu+LO6ibEz+bD6UKDLObxbCGWKrq
 qXxDKKIVequs0bz2Mmbc2gCKQ8RIIFt3dNjcaHsmUhYC81ER/dlQzPyeEwS6AAJbdoFl3NuE3+
 GP1SLuVOOCyvTrPg6u8HiBFq4tLtmeEaOZdfiEtANGNEn2h8kSQL4eVWOKDVK9X3VfpodIFDIH
 2j9psiwRP02r26em63ZNUVJUGD9fDwUWMsLeCvbu+LVXK/Wg8I1PhoyH5skaS419+eKEEEO0ZC
 hJU=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:15 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:57:00 +0900
Message-Id: <20191108015702.233102-8-damien.lemoal@wdc.com>
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
X-Headers-End: 1iStWf-004Ptp-Fg
Subject: [f2fs-dev] [PATCH 7/9] null_blk: Add zone_nr_conv to features
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

For a null_blk device with zoned mode enabled, the number of
conventional zones can be configured through configfs with the
zone_nr_conv parameter. Add this missing parameter in the features
string.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/block/null_blk_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 2687eb36441c..27fb34d7da31 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -467,7 +467,7 @@ nullb_group_drop_item(struct config_group *group, struct config_item *item)
 
 static ssize_t memb_group_features_show(struct config_item *item, char *page)
 {
-	return snprintf(page, PAGE_SIZE, "memory_backed,discard,bandwidth,cache,badblocks,zoned,zone_size\n");
+	return snprintf(page, PAGE_SIZE, "memory_backed,discard,bandwidth,cache,badblocks,zoned,zone_size,zone_nr_conv\n");
 }
 
 CONFIGFS_ATTR_RO(memb_group_, features);
-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
