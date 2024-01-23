Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C6B838B3E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 10:59:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSDZK-00010x-F7;
	Tue, 23 Jan 2024 09:59:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=745eb970d=johannes.thumshirn@wdc.com>)
 id 1rSDZJ-00010r-C4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7IyULlbq2i/AZhH32Afb7WsVyfQNBfYwO7GDrodkVh0=; b=fiOABKwo/EmK7XTFRkITsbR0+P
 4Kh4v57ar5Hx1t6WbFs3kb/A9NjeRmmd4sNStwA1C+7a3+SH1wfvF1hEcm6L/aqQAN0rlxE1F0q1I
 6ChSOrALlCtHbUYRJHiy+XcTZqoIk6gzC6FS7PJ7YvqRunxuwJHe4INH89jMcenndjHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7IyULlbq2i/AZhH32Afb7WsVyfQNBfYwO7GDrodkVh0=; b=JTCRcOULxg6XWSiiTIsVB0B58h
 kjlrBg1GCepwYUkAA5Plun9hZBqj475sBzz449cAVVNHDrLFjWUB0x0agNkMntaA3xDrjJbw8N0Ep
 kPEIyZp/9QIiX9HE1oxodM5/OhcKqdTbjlUe+OmrJC84Up5P9XqHMk1RnmhF8JShFVD4=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSDZI-0000SS-Kf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706003985; x=1737539985;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=aNukikOqhJIFNWqZ0ODBJWyAugGq+LPMMd8TTS5AKQ4=;
 b=Ru15lQUSt8nxDjoynYfMcuYmqyQO38mF/xXdxTP/33bSMuFQd6W+5xy/
 wMERyLqPgEQUAj90IO1JBFfliKLliHhkMQOZ+D+vdNeJ12DMMRREVfC8R
 sc37RuOtFKs5vC8TcdtfB0Fd36/HATRdz4OvwcciVh4+1HBIrehDgh9JM
 CSuiNJ5zR8ljcxsa91lmHDCxJ2UC5MA8s8bQxpZ+/3rEbk5i6sV+qek6n
 7cgquR3ND2ZH492FyW9nQYjWJDanZOsA/qt4SOMMW0qKKVsar3DOCF4b1
 +x+Cn5IhVMZ822TzMx1f1p5yfNyXS4UFeWEImGMVUoxFG8J9v4XDJeG64 w==;
X-CSE-ConnectionGUID: ube1Cp7WS8id/CYJO1lneA==
X-CSE-MsgGUID: 4JhcnuohT6WfkiUiNa38NA==
X-IronPort-AV: E=Sophos;i="6.05,214,1701100800"; 
   d="scan'208";a="7462065"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2024 17:43:59 +0800
IronPort-SDR: 5YCDkOFdt0K3N3F36eCHXpRY8S7nAjsGzFzHoZwel2+jROQXpWl6WUENz/dW6I9PByRfgwN5hX
 WVMQHl49FC/g==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 00:48:20 -0800
IronPort-SDR: dAsmsPa7PoEjEqCMQJaraanxOd8c/fk8dACLylRy5NqXD//OMj6y9vGDZHd8BuQxOm/a02BIsW
 R+tMuSbewV1Q==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Jan 2024 01:43:54 -0800
Date: Tue, 23 Jan 2024 01:43:43 -0800
MIME-Version: 1.0
Message-Id: <20240123-zonefs_nofs-v1-2-cc0b0308ef25@wdc.com>
References: <20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com>
In-Reply-To: <20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Mike Snitzer <snitzer@kernel.org>, 
 dm-devel@lists.linux.dev, Chris Mason <clm@fb.com>, 
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706003027; l=991;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=aNukikOqhJIFNWqZ0ODBJWyAugGq+LPMMd8TTS5AKQ4=;
 b=ikAnavOye/kaxQOEWNUwKqvdUxWGtXZzJ7FWZYYfiyPrwIlpkg/V/fzRFKDthgXe8Ohpt6KhU
 /FHlNMKNb/eDriIYAew0yBQo7R6HpuBpWUzFGRY/CanTb/8FmZgdOJV
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The call to blkdev_zone_mgmt() in dm-zoned is only used to
 perform a ZONE_RESET operation when freeing a zone. This is not done in the
 IO path, so we can use GFP_KERNEL here, as it will never recurse back into
 the driver on reclaim. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rSDZI-0000SS-Kf
Subject: [f2fs-dev] [PATCH 2/5] dm: dm-zoned: pass GFP_KERNEL to
 blkdev_zone_mgmt
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
From: Johannes Thumshirn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The call to blkdev_zone_mgmt() in dm-zoned is only used to perform a
ZONE_RESET operation when freeing a zone.

This is not done in the IO path, so we can use GFP_KERNEL here, as it will
never recurse back into the driver on reclaim.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index fdfe30f7b697..a39734f0cb7d 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1658,7 +1658,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 
 		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
 				       dmz_start_sect(zmd, zone),
-				       zmd->zone_nr_sectors, GFP_NOIO);
+				       zmd->zone_nr_sectors, GFP_KERNEL);
 		if (ret) {
 			dmz_dev_err(dev, "Reset zone %u failed %d",
 				    zone->id, ret);

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
