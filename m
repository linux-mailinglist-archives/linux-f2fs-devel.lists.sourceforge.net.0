Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC2083C96A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 18:09:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT3EP-0002IP-28;
	Thu, 25 Jan 2024 17:09:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=747d02328=johannes.thumshirn@wdc.com>)
 id 1rT3EM-0002IH-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fpd79ziWWnEkE4PQSjIRnLcjjQg7HoWMKhlTrkjmDK0=; b=SPexYLQZ63sY27Z9cM6sedePrj
 f0FVn+6aBEmOB0TS6Grbl9FAsMDq2RNLbblVxmQ6+ZxfS+PQHgT3pC3hnp7t8y0Ed1gg96ACt0e3I
 9K2mwjzs6bsCP5ngyNG392UvrooWAVaFnGGPhQJ8qJSJqMXRrhZW5iSDoanYQOGdVnKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fpd79ziWWnEkE4PQSjIRnLcjjQg7HoWMKhlTrkjmDK0=; b=bXv8f2YEdbGhBL9qFWAd3cZxwh
 lot5LMpdmQSAAH8De6MOXXagFDCJZqu2PoIUNJ7ITBQKAcCCmHeP3+sietgQyiExNWwFX9+ZNtNWp
 uFEe5oo7+ISOsfQYTLbMTEgG327QpCnorPadGN00Eo2RzPULnw2MIxHi4CXJsiUEn4SE=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rT3EI-0006th-IJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706202570; x=1737738570;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=eGx4McY1FmrYKhrAp3TTxFkfkbSfbNbdZDzzsYbn3SA=;
 b=R+nHMDnVyWuCuY8lBNLQEB1Gf0PNU92KXP0q47qhGsLMeAeYq0Vs3M91
 hmbFwq7X0d8DU/AtiXGWitTXU5WVVoD4tqLfFnwNbusT+oqSqKF6e/4/O
 GSEkT702u9aTuIgGjH5gFzl86QDOkdLNoNJAHORrqcRU1q7IPwJwfrUNq
 0FsGUlWuLvYDbLYVntdkqqNqHAB7KlMPf6T3/wuzyTVKLplFNfsNqyuEv
 n6TIgPpAAjdvOTnbG3z5Qq9ZeiTZELv7IwBknY/4sG+iq42u2VnQJNhs9
 BKsbF6J4vyAux2HzBsMqa7JTyhYU4F7Gz4O9Cq4vqEd1dF2xyrH4FDrG2 g==;
X-CSE-ConnectionGUID: ZW5sP5YMS5u0Z5rZ3jlwAQ==
X-CSE-MsgGUID: pn/OcF0sRGuBBlF0cQkQ5g==
X-IronPort-AV: E=Sophos;i="6.05,216,1701100800"; 
   d="scan'208";a="7967069"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2024 00:53:36 +0800
IronPort-SDR: CWgrePKn44DXbTDFJ2AfjIuwM1k3SBDd4z07VngjEfLOw/1DHzwnTSkxib4jCzlZ07GNWtJPIj
 B4IILCCh1uyg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jan 2024 08:03:36 -0800
IronPort-SDR: VOx0UIr5lbldPsjxQBhoPSsQoOEZNWGs3Yn004iQ+BbMXVrE9gDtrUz+juD/7EPs5IyZ7d6MAQ
 oXv5yVO5EAbg==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jan 2024 08:53:33 -0800
Date: Thu, 25 Jan 2024 08:53:24 -0800
MIME-Version: 1.0
Message-Id: <20240125-zonefs_nofs-v2-1-2d975c8c1690@wdc.com>
References: <20240125-zonefs_nofs-v2-0-2d975c8c1690@wdc.com>
In-Reply-To: <20240125-zonefs_nofs-v2-0-2d975c8c1690@wdc.com>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, dm-devel@lists.linux.dev, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Chao Yu <chao@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Chaitanya Kulkarni <kch@nvidia.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706201608; l=1041;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=eGx4McY1FmrYKhrAp3TTxFkfkbSfbNbdZDzzsYbn3SA=;
 b=7i7rSG5FOL3Y+GFA5rvmzOGA1LPZcNa6uQEcp9OZuAhx8o+EuzcMQlp/v7AQwfxAOFFlfDgdz
 pJC/jmeDno3BoWXgTUVMLTNlb/W+P6XXYXlpj2p8o3WXeCGKXi91zBB
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Pass GFP_KERNEL instead of GFP_NOFS to the blkdev_zone_mgmt()
 call in zonefs_zone_mgmt(). As as zonefs_zone_mgmt() and
 zonefs_inode_zone_mgmt()
 are never called from a place that can recurse back into the filesystem on
 memory reclaim, it is save to call blkdev_zone_mgmt() with GFP_KERNEL. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT3EI-0006th-IJ
Subject: [f2fs-dev] [PATCH v2 1/5] zonefs: pass GFP_KERNEL to
 blkdev_zone_mgmt() call
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
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pass GFP_KERNEL instead of GFP_NOFS to the blkdev_zone_mgmt() call in
zonefs_zone_mgmt().

As as zonefs_zone_mgmt() and zonefs_inode_zone_mgmt() are never called
from a place that can recurse back into the filesystem on memory reclaim,
it is save to call blkdev_zone_mgmt() with GFP_KERNEL.

Link: https://lore.kernel.org/all/ZZcgXI46AinlcBDP@casper.infradead.org/
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/zonefs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index 93971742613a..63fbac018c04 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -113,7 +113,7 @@ static int zonefs_zone_mgmt(struct super_block *sb,
 
 	trace_zonefs_zone_mgmt(sb, z, op);
 	ret = blkdev_zone_mgmt(sb->s_bdev, op, z->z_sector,
-			       z->z_size >> SECTOR_SHIFT, GFP_NOFS);
+			       z->z_size >> SECTOR_SHIFT, GFP_KERNEL);
 	if (ret) {
 		zonefs_err(sb,
 			   "Zone management operation %s at %llu failed %d\n",

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
