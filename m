Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A1F83C969
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jan 2024 18:09:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rT3EJ-00061U-Mc;
	Thu, 25 Jan 2024 17:09:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=747d02328=johannes.thumshirn@wdc.com>)
 id 1rT3EI-00061J-NX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+rMsCS9rqQgIJ5vRczmQ2xycPhDowhIsBQh1+x8t6+4=; b=lwsAiwqTfi2HyxbpSHTLn3BL6p
 T4+L943EgpeXElb9065rqfaHRUwy0grOsFIKZYXQjlTeX6CrKH++v3P5Ry1E6Qk1uDBSqM7fvDoxb
 RuGp3Ol4LAGppxpXQmi7I+rDzlmgansG6zpDATuIt3mIjragfaS/leXSo9qQNFjIgwN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+rMsCS9rqQgIJ5vRczmQ2xycPhDowhIsBQh1+x8t6+4=; b=m
 CWhkLOX96VKFoA9E7qdmyTCL/rgtKDsib3IT/qKx2ybsJ034tzxwOlgSeICt3M94/GynHdN56JVTw
 LreMPA4HZXf49wPFcY/PwGnUaUJIRKqYCa8PULG/Pjg+grugMzzn+tXU+mvePpl6aSQFk5/XBMCjF
 HnW1eMB6eVpBLoqY=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rT3EF-0006th-0y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jan 2024 17:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706202567; x=1737738567;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=0N4F/gjOaEHcA1EmZZhcmvU+dQFlqf6CupFhM16+QGk=;
 b=P1PRG+BJ3ovXDmuIX3YLIsEcod3+h8ARelenGVM+xSm7fXXBIjBDsjDF
 CQ6ZX4o0pAhn48OLw6IuWTfq/ELNqC9Rr53rUqNEu8OOVPxn83ByNCN0O
 v/Mj5k15a+H/kv+nRI1m+enZdLP0Qv4NGY1E6GtvasNOpdbkn56UZPahR
 8+egfvU/dOdyVvWBDhig/ddj+UJUIWkwRUmUynmm4tIxjWcy+CiVVTCGM
 6ZecsplgMmaoHmtF9/sBkTXpnfnSRTvTv2LgdfxDkZFL0FXeiHRTSLiUj
 euCX94dK95IV5xhN+KTJL2h+RoHVJohzbbeb9AVIrSJgsUMQlYO8G4Xdt w==;
X-CSE-ConnectionGUID: omm4V8G0TLW1/WsL7VtFYg==
X-CSE-MsgGUID: NGBp5FfPTLe/uEk1IlaCVQ==
X-IronPort-AV: E=Sophos;i="6.05,216,1701100800"; 
   d="scan'208";a="7967058"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2024 00:53:32 +0800
IronPort-SDR: +gil8+lIqDjbiwnEwl2M261Z6PD664y5uPzOEwelkpKdKIoBqYHhaduJzKjHy7uEcF1DDzk6b8
 eFgNXQ64AXBA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Jan 2024 08:03:32 -0800
IronPort-SDR: OE+tRkmMpFkhDRa1z/PeEZo8HAAoGZY5dfaVEn8/s2a64gELw2HyRSw+9hYcenKw2PYuCiSi5y
 qsHOshAr8N7g==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jan 2024 08:53:29 -0800
Date: Thu, 25 Jan 2024 08:53:23 -0800
Message-Id: <20240125-zonefs_nofs-v2-0-2d975c8c1690@wdc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAOSsmUC/1XMywrCMBCF4VcpszYymVYRV76HFLHJxM7CRDISL
 6XvbixuXP4HzjeBchZW2DcTZC6ikmINWjXgxnO8sBFfGwipQ2vRvFPkoKeYghrvLRMNxNhtoT5
 umYM8F+3Y1x5F7ym/FrzY7/pzqP1zijVonMMBW9xxoM3h4d3apSv08zx/AOnqE66kAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706201608; l=1733;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=0N4F/gjOaEHcA1EmZZhcmvU+dQFlqf6CupFhM16+QGk=;
 b=UDiRHl7vyONFeE/+Uc9h4ZkfV2sLDGr/bQXidpKeyTTKnEZ1boUAGnz1/g8SHkp2NIP1u8WfY
 k+ntypLEWF8Dk7T6KptUtV/AFpEKDBwUlfE02SJfrjkjKtMj15vuipc
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fueled by the LSFMM discussion on removing GFP_NOFS initiated
 by Willy, I've looked into the sole GFP_NOFS allocation in zonefs. As it
 turned out, it is only done for zone management commands and can [...] 
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
X-Headers-End: 1rT3EF-0006th-0y
Subject: [f2fs-dev] [PATCH v2 0/5] block: remove gfp_mask for
 blkdev_zone_mgmt()
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

Fueled by the LSFMM discussion on removing GFP_NOFS initiated by Willy,
I've looked into the sole GFP_NOFS allocation in zonefs. As it turned out,
it is only done for zone management commands and can be removed.

After digging into more callers of blkdev_zone_mgmt() I came to the
conclusion that the gfp_mask parameter can be removed alltogether.

So this series switches all callers of blkdev_zone_mgmt() to either use
GFP_KERNEL where possible or grab a memalloc_no{fs,io} context.

The final patch in this series is getting rid of the gfp_mask parameter.

Link: https://lore.kernel.org/all/ZZcgXI46AinlcBDP@casper.infradead.org/

---
Changes in v2:
- guard blkdev_zone_mgmt in dm-zoned-metadata.c with memalloc_noio context
- Link to v1: https://lore.kernel.org/r/20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com

---
Johannes Thumshirn (5):
      zonefs: pass GFP_KERNEL to blkdev_zone_mgmt() call
      dm: dm-zoned: guard blkdev_zone_mgmt with noio scope
      btrfs: zoned: call blkdev_zone_mgmt in nofs scope
      f2fs: guard blkdev_zone_mgmt with nofs scope
      block: remove gfp_flags from blkdev_zone_mgmt

 block/blk-zoned.c              | 19 ++++++++-----------
 drivers/md/dm-zoned-metadata.c |  5 ++++-
 drivers/nvme/target/zns.c      |  5 ++---
 fs/btrfs/zoned.c               | 35 +++++++++++++++++++++++++----------
 fs/f2fs/segment.c              | 15 ++++++++++++---
 fs/zonefs/super.c              |  2 +-
 include/linux/blkdev.h         |  2 +-
 7 files changed, 53 insertions(+), 30 deletions(-)
---
base-commit: 615d300648869c774bd1fe54b4627bb0c20faed4
change-id: 20240110-zonefs_nofs-dd1e22b2e046

Best regards,
-- 
Johannes Thumshirn <johannes.thumshirn@wdc.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
