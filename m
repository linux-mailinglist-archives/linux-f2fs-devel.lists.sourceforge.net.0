Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8E083FFA9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 09:08:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUMgv-0007AX-Gx;
	Mon, 29 Jan 2024 08:08:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=751dad7dd=johannes.thumshirn@wdc.com>)
 id 1rUMgr-0007AK-7F for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 08:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fpd79ziWWnEkE4PQSjIRnLcjjQg7HoWMKhlTrkjmDK0=; b=ANeSfQewCEP7OnOpo8XSDNOAo1
 zM+voMZUof/uUpov2lNY47AbhiMCCG/bEqvuigTsVPXYd+3nUBM57xY+b/m5VWlFLvoAlZ4necLB2
 XmrMhQhl3u1xA7X9OAP8XgUgbfO/SqAQZCfRlQGRr0MOz3Z2XtSrJ6T1+1a6Gd+IGhO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fpd79ziWWnEkE4PQSjIRnLcjjQg7HoWMKhlTrkjmDK0=; b=Fy1lZ/GKJIlu6drBOLKhO5qYxO
 hzeis833NAWUGgYMUbHzepEgQzbX3owkI2DIJCJiUyOJTd2wJk+ZmT2Lq1f/FFR/99mIvn5WH0mg7
 0FfXMANvyxxYjnrxbdh30ApvM8zslRF6yCGwdmRduTXqzTa4MzT9NrPO1nNm/sCYFWig=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUMgm-00039w-2T for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 08:08:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706515700; x=1738051700;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=eGx4McY1FmrYKhrAp3TTxFkfkbSfbNbdZDzzsYbn3SA=;
 b=kvh8hx2kGHdjvOTb/ELW5b1vwMP5PZWf0EXFRQHBGPM8px+9erh4qM8Q
 A94Zkvh0LlOa6QE/xPNh+5Wv6Z542T+cRp16cMMxUXDP4Eian8j5MdT09
 HxPBpoUkJBxI/WD8QOWr4deMyJfpWde0v5lfslqKgIbeYugKZWaROSul8
 R2+iu3u9o3hrYcqMyWmmGjadS5Og2DgPCus8Ok9W3nGK1hHqZdoVHLugQ
 Gb/PE987uh4rzHr9EngiZrsSadIWZUefZQ/ritRU1KfxxbV6pTzMTCIXb
 kcu7L/oi4ih3i4BSIYnMqKD/6MODfnVitXJ8emsg1mVhG6cfQPfG2+yLS A==;
X-CSE-ConnectionGUID: Y4kuCdgUQLyMSJr6CULtgQ==
X-CSE-MsgGUID: 5wL6kUQ7STy5pOkHljcP5A==
X-IronPort-AV: E=Sophos;i="6.05,226,1701100800"; 
   d="scan'208";a="7664661"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jan 2024 15:52:31 +0800
IronPort-SDR: 80h6UCptKbAUfiFSwQyfZGs18MKEv/rmo8m23+qJ8kODmfzwhCAV8rIL18ZWbg18A6ceMgd+81
 KbL4cVM2h2lg==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jan 2024 22:56:46 -0800
IronPort-SDR: TgaA8LrWz4JmksfFMd9XbYuIoWjMlrDoGLua+Pb607OI4wE3Fe9/wAPKrNdtSrWLoefyzcMDAc
 YY+ofLHHgnnA==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 Jan 2024 23:52:27 -0800
Date: Sun, 28 Jan 2024 23:52:16 -0800
MIME-Version: 1.0
Message-Id: <20240128-zonefs_nofs-v3-1-ae3b7c8def61@wdc.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
In-Reply-To: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706514743; l=1041;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=eGx4McY1FmrYKhrAp3TTxFkfkbSfbNbdZDzzsYbn3SA=;
 b=t4wcaJhs6oV11H9tXDjzJ4heS84olNEuvuiMDoCT7kiC4VWqi/UCfvHK0WP330iTVs0p8G2QQ
 0WRameby5F7DGgOvyyko8FG4gi9vkmFaf+HGZUlvOWp9nymIgGBuC/o
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
 medium trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUMgm-00039w-2T
Subject: [f2fs-dev] [PATCH v3 1/5] zonefs: pass GFP_KERNEL to
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
