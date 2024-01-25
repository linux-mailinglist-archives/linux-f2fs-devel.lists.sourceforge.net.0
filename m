Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F0083C968
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 18:09:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT3EP-0002Ig-Je;
	Thu, 25 Jan 2024 17:09:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=747d02328=johannes.thumshirn@wdc.com>)
 id 1rT3EO-0002IN-Up for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fru1l8dAq84Xfh5gnq+lN/Z+UvKQa5FRHDYekqiQyQc=; b=at4p9iwMEvSXzl2M5mraN8gP9l
 AigzkafEJKZEbRI7C4cWHDPbQrLIy2PUxt032XvfJMoowlnKmldWcJL54j18DCVQSIG3oAIifyoQK
 3lcZJT3tHfrHCokvtQmNYRUcmHfeFXSVJPckbrfNnu05aT0bgBguIXcQKCAX97U8ROks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fru1l8dAq84Xfh5gnq+lN/Z+UvKQa5FRHDYekqiQyQc=; b=eMU9gUZVcrLgQo98kc4CUgnNA4
 ApSCzLO1bm5axSl8LbeCWgJzPyOV/vDjTf7Lfe4PbTH+EzESMmpp1FeTJwjyx/DX7sfqwx7gJ+Qaf
 sIVXstEN9DFmEJjtwvIdSOVKFv2FSwcJNS07zoAPDhC3D1KfnuTbcI20acISasnicQns=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rT3EO-0006th-KW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706202577; x=1737738577;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jxy1iW5YBQpx2L/2XzM+MqzG0Ug1dnhtomAoOd2ZnbI=;
 b=LgQWzpQRuFDjiqVLcooFdfBAn4HZGVNzukm5SaVIsT70w9+ojBq5AP9S
 AMrzzmUPvfIh5US2gWynSHDgOrvczT3ERw+GNCz9sJOwQwpty6i0pdsbW
 fRWb0WlCDzfZSnW0BPYUTwIpa36JCVlfbEAzfbYFunSsqNyU456I7prTg
 DAR0HeE4uKem1j7McjwWJyvpRk6xazTxIUShiGweQg0Yuv536qYb++Ai8
 0HdCDe6xnLIaA4xN5USUpxqegfUWGcgphE63QOe+cOhaX8g/6R6Bmgmuf
 0rh3RL9/sNgXCeMiYyRwuLW2vQyJlszZYDXUu/tfz3D0OvjlAA/xhmGk2 w==;
X-CSE-ConnectionGUID: dxgBAPzcThKs3Jyqopj9hg==
X-CSE-MsgGUID: G/xJqNseTlGRrQUEBBAA2Q==
X-IronPort-AV: E=Sophos;i="6.05,216,1701100800"; 
   d="scan'208";a="7967101"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2024 00:53:48 +0800
IronPort-SDR: 4GzkS1uonOFJTMqFqjCHBXOb9N2BneS0smOPHpAbIHRLnrCHvoBIs6J8UyfToxJfrF6TRcGBXF
 4UiL1OAIOQUQ==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jan 2024 08:03:48 -0800
IronPort-SDR: vvINqP4GdCHHBUjrb+eTmiCcQWnfbMc+2pMGcRzFL6dLXp7d61N849rxXvVPTSMHLUafyk3OEY
 WA9UeNNLFunA==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jan 2024 08:53:45 -0800
Date: Thu, 25 Jan 2024 08:53:27 -0800
MIME-Version: 1.0
Message-Id: <20240125-zonefs_nofs-v2-4-2d975c8c1690@wdc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706201608; l=1916;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=jxy1iW5YBQpx2L/2XzM+MqzG0Ug1dnhtomAoOd2ZnbI=;
 b=6us0f0y8sZaGXrk0YEnbz9rCMC7kxZhDixZl391EGOrX5/lIDzriXPbrRnxwUUYl4Zr6sOeSq
 7toptEmDVs6Bj71yz4Kq8CNaR0lPsnmNTeTOXYxfHWc5XpmvrxgA/Op
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Guard the calls to blkdev_zone_mgmt() with a memalloc_nofs
 scope. This helps us getting rid of the GFP_NOFS argument to
 blkdev_zone_mgmt(); 
 Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com> ---
 fs/f2fs/segment.c
 | 15 ++++++++++++--- 1 file changed, 12 insertions(+), 3 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rT3EO-0006th-KW
Subject: [f2fs-dev] [PATCH v2 4/5] f2fs: guard blkdev_zone_mgmt with nofs
 scope
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

Guard the calls to blkdev_zone_mgmt() with a memalloc_nofs scope.
This helps us getting rid of the GFP_NOFS argument to blkdev_zone_mgmt();

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/f2fs/segment.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4c8836ded90f..0094fe491364 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1971,9 +1971,15 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
 		}
 
 		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING))) {
+			unsigned int nofs_flags;
+			int ret;
+
 			trace_f2fs_issue_reset_zone(bdev, blkstart);
-			return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-						sector, nr_sects, GFP_NOFS);
+			nofs_flags = memalloc_nofs_save();
+			ret = blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
+						sector, nr_sects, GFP_KERNEL);
+			memalloc_nofs_restore(nofs_flags);
+			return ret;
 		}
 
 		__queue_zone_reset_cmd(sbi, bdev, blkstart, lblkstart, blklen);
@@ -4865,6 +4871,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	block_t zone_block, valid_block_cnt;
 	unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
 	int ret;
+	unsigned int nofs_flags;
 
 	if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
 		return 0;
@@ -4912,8 +4919,10 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 		    "pointer: valid block[0x%x,0x%x] cond[0x%x]",
 		    zone_segno, valid_block_cnt, zone->cond);
 
+	nofs_flags = memalloc_nofs_save();
 	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
-				zone->start, zone->len, GFP_NOFS);
+				zone->start, zone->len, GFP_KERNEL);
+	memalloc_nofs_restore(nofs_flags);
 	if (ret == -EOPNOTSUPP) {
 		ret = blkdev_issue_zeroout(fdev->bdev, zone->wp,
 					zone->len - (zone->wp - zone->start),

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
