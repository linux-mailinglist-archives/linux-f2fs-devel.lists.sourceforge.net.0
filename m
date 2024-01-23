Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B3838B3B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 10:59:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSDZL-0001uk-UG;
	Tue, 23 Jan 2024 09:59:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=745eb970d=johannes.thumshirn@wdc.com>)
 id 1rSDZL-0001ub-94 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fru1l8dAq84Xfh5gnq+lN/Z+UvKQa5FRHDYekqiQyQc=; b=jZbO3ZJi+L+BbkmfCSGhrmzq8p
 4rLxB5KBq8jJ7EEMcJ/pbOJUL3dQG96FaOrStBgZGhnUgDZknoRq5nV9ZBnSJIhjIcYToIXGQSdH1
 DU/qNS/6Uu+Ss+FG0yAOkINEGQHMv/2Nu10OMul/73NIjTeWLvcVvN8FFZfVVSytaX8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fru1l8dAq84Xfh5gnq+lN/Z+UvKQa5FRHDYekqiQyQc=; b=eS3hLO7RvG0AqIPcg9ozoKs34X
 XBElwSx7xzOgJaz8SZ/VWivYWsH1oSJ6latPd5xJJ4IskXmr5voSbFENVslnwrQXcYpv6WpGG2NrJ
 savIwVXIekiT6pQORYUxRsfu38yvr9B9s4WiUAfAq8QSQvhPfOr8Wr+p5LwLVoeslf58=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSDZJ-0000SS-VB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 09:59:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706003986; x=1737539986;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=jxy1iW5YBQpx2L/2XzM+MqzG0Ug1dnhtomAoOd2ZnbI=;
 b=BY7+oo5mfEOUl6ZyseshrIheCARVsQfA7c5/7J69yAZ4Bp/MDx+/0ly8
 PWGN6K3OLr3oVN1zwwpX3ewD7rUxH3sFhl4LhtZec8efwEe/7g2YaNZ/3
 hsPArYR7509vAJ0JQlLN24nUnLqIlaemREy8ZjEwFRGvnALOGtXcQ4ayg
 l88PWA2AK20WnRIiaQCVXna8Ac238fhpi1PZ/jLctgXnoDSWyqnEplXo9
 jz84ugNtDqGIEfBczDhZhoiLZvxPkUzBfVlCkizT8NnmnkaI2LUumuCak
 DQXlDIVHNCglnOTgjzHgSHI04el2A/5igZthLNtUO7Mlb2g5lt12blGgj Q==;
X-CSE-ConnectionGUID: M4rJNpEgSGOzr4U2FIHsjg==
X-CSE-MsgGUID: qmBP81s3SIO6L0XnmBswsw==
X-IronPort-AV: E=Sophos;i="6.05,214,1701100800"; 
   d="scan'208";a="7462074"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2024 17:44:06 +0800
IronPort-SDR: 96qnONrMHzXWefSZRYV/F8L1VdEW417iCHL1twEW1fuIPdYXZAQc7fxVFptp+MKCOuRCjTefgp
 tJr6bzP8+dXw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 00:48:27 -0800
IronPort-SDR: IOh8OwQ887uF8FYicwPpeIj8pGPKsumfi+cLbrdodtKz/molf3mfeRtZvITdJ29oAO3ta0WwLL
 KVxG7oRWNRUw==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 23 Jan 2024 01:44:02 -0800
Date: Tue, 23 Jan 2024 01:43:45 -0800
MIME-Version: 1.0
Message-Id: <20240123-zonefs_nofs-v1-4-cc0b0308ef25@wdc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706003027; l=1916;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=jxy1iW5YBQpx2L/2XzM+MqzG0Ug1dnhtomAoOd2ZnbI=;
 b=3ZNl4h+s8HSPaptSA3bTG7Cc54lypNN6lGHNAsGVtJDwGDQrTa34PvB3BXdfTQsyIQIenyPIa
 XCtHIB+z9g5Bw9M9so4He4f+ztWTV5lnoteYP3kS9WTufWUnEYW9XJS
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
X-Headers-End: 1rSDZJ-0000SS-VB
Subject: [f2fs-dev] [PATCH 4/5] f2fs: guard blkdev_zone_mgmt with nofs scope
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
