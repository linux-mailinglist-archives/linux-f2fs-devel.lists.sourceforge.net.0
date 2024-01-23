Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF7838B3D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 10:59:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSDZK-0004tH-BP;
	Tue, 23 Jan 2024 09:59:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=745eb970d=johannes.thumshirn@wdc.com>)
 id 1rSDZI-0004sw-Q5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xwNR4/EZjtvmjPU5B92P0twDrTPGvgcwhXfRvMp8W3M=; b=L6wcO6WVCWBrrEAeJP6BI9jmNW
 H4L9q8hxr7oWxUuhWGZUHjai8OvGuQxuDpq/IdCDiksahgI0S7dfBosPzF2A7Vp+bNCkmRU6AvNI2
 qZHqHdwN9WpzWlFjIb1J1NOlfGEggDGcVgans187WrWPKI/LG01vucEBWBLAN0qo/MsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xwNR4/EZjtvmjPU5B92P0twDrTPGvgcwhXfRvMp8W3M=; b=aLNDNSTOtMLJsZlB+iuNis3bV3
 0l2a0FU0elyWNTIXPrm4DkMfDGOnCy3Ig2CDK8vtyLQvCkMSTMp76cukbJByQAoJHH8MutBus9MTl
 lbfMfJnnDLKjCWWxm+HZAU1r9Op+V1U1mq7wUjOSpfMMKzJTGm3zTWZP2En2fsvLp8Ys=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSDZH-0000SS-W1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706003984; x=1737539984;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=USx+V+gR/5Lk+0GJr2lbq1FeCI2pXKMzpek+ct39bMM=;
 b=X+1t1vJDLsezySht2wYw8R7QzBdNOvZIK120rnzSDIovY/t2peUlpizx
 +vSVJJ+YH0nGL6ibN0FR4qu+q4wJ8VMAWHBQRmKew4SkpJj6gfVG4ycGW
 ECw/unWHcmbOb1te2eYngBgJEIVVJDQw2ivONsmuG1yVwDfA7XjxKWJQd
 qRjRsxRFOdwUyBkcefS/xPNqdu03oSSqfE/GNclVQ/gx5nOSu8VDN+Qp2
 yQwcNs2RJCJOSKnpd+NQk3tF5MPALRuCk80wQZr2Km3xb4AXSYQz4vTz1
 PEYoglaNLbR+/4qeBQlBrw6reG1cdu8WTGoyDLYEbOetW9+5lc5jeqJze g==;
X-CSE-ConnectionGUID: BOkBxo6+RfijPaJ+38di5g==
X-CSE-MsgGUID: diTUpXrVRH+D/od8CmUEqw==
X-IronPort-AV: E=Sophos;i="6.05,214,1701100800"; 
   d="scan'208";a="7462059"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2024 17:43:56 +0800
IronPort-SDR: xvvsWJXd9mKOetnrFiXw3/09pHul/s6QYoJlOEF3Gfv66CTp7o0QuPp26XlFcQX6asGtf5de+4
 YgJpntwVNd7w==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 00:48:17 -0800
IronPort-SDR: P3OOCgnEiOoiT5kro0hhE2puMVinRxHrlbO9eu21ZDBzEa4K+SZFeEYuAtZNHIp7Zz4lNvn0Hv
 sg9b/x3sDNFA==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Jan 2024 01:43:50 -0800
Date: Tue, 23 Jan 2024 01:43:42 -0800
MIME-Version: 1.0
Message-Id: <20240123-zonefs_nofs-v1-1-cc0b0308ef25@wdc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706003027; l=967;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=USx+V+gR/5Lk+0GJr2lbq1FeCI2pXKMzpek+ct39bMM=;
 b=CqyzAxjrtVF3h1COiTD1vUp/FvMExp42Wy7b72mtI/+VK3Cc+nQQgb8KdYlLZ32Qn9DwLPhCQ
 2dpOdt+5tGWBTomHGv+qgGPRnYLx+GcwkDEU2N7SunPs8Zz3A98pXO5
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
X-Headers-End: 1rSDZH-0000SS-W1
Subject: [f2fs-dev] [PATCH 1/5] zonefs: pass GFP_KERNEL to
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Pass GFP_KERNEL instead of GFP_NOFS to the blkdev_zone_mgmt() call in
zonefs_zone_mgmt().

As as zonefs_zone_mgmt() and zonefs_inode_zone_mgmt() are never called
from a place that can recurse back into the filesystem on memory reclaim,
it is save to call blkdev_zone_mgmt() with GFP_KERNEL.

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
