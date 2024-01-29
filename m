Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 899E483FFA7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 09:08:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUMgo-0000Yo-Au;
	Mon, 29 Jan 2024 08:08:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=751dad7dd=johannes.thumshirn@wdc.com>)
 id 1rUMgl-0000Xt-Nq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 08:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W5lyY5EIDF7m6oNwdabQA4ZFGwvQpF8BT40CY2RPFY0=; b=CjcwyKqoo+my62DnV2+gLqCGax
 Yyk2TpJtWdp2x/4bHlLAQG6VodUzXIB9bydV1iDi36+0q2B+IvhdDZ2o6WFHa31B3aE2CETZLFndW
 AnpS8SMcdAv6B0LOLzRJ8Etrxez2keye9Ky61MHPNtxtqLsPn5uMgcLLq9ggwMKEAxbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W5lyY5EIDF7m6oNwdabQA4ZFGwvQpF8BT40CY2RPFY0=; b=l
 IeENAwc6s2jVtx/qd1i28oeVL2qMCRgJJDnrVMPwq3ARcP5qASda5JQu5I4tI3aD/1HhFrFeD2ZoA
 omKcnUBv41s4pqNADbvJOCKSvhhoF6EED26VdfgrnJbo56Zdke8Ry3T5pSi5PsaYEpExGJQhpaUAg
 lHAaZiyeeD0wTgAo=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUMgh-00039w-HX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 08:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1706515696; x=1738051696;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=rp5FcjO4/GYjbF5Qyk/GxKqz5Dm+QfeA7jbL0YYHdsM=;
 b=oYHqXz1aZLzZhxDk/lzWsJn97ymQ848rSsDxIURcq7P3NfumY1+6voq9
 h1tGaWjtZnQIAhgnP7cW+Wq+Qmy4Yovi9fmumTK57nmmtjAlLhNdL66uz
 neJlhK/pScdaC9WgdlEQPz5I33zaEAewBV5A+GxCe3VdHjKS4duwWPPWd
 UY1MIakrzmb5/U8x/xjSbWJwxCe/Q9jRe5sJD7v/cRvN30HZ3o7vhyP0E
 HlJufgcmkj2M1BT5BFxgItLVzfjgae2ZSxxUUfSFPdDDmsnhyajBFjQO4
 JhMmai8Trt/kdWCqIJEQIxAr9a/QCebFr6c56i6m2Y+G/1DOgFeHRRsXH w==;
X-CSE-ConnectionGUID: v9edCvsfQ8SqXgVq46sUtw==
X-CSE-MsgGUID: 6fYGN4WtRxenVGfpZ4fwHg==
X-IronPort-AV: E=Sophos;i="6.05,226,1701100800"; 
   d="scan'208";a="7664655"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Jan 2024 15:52:27 +0800
IronPort-SDR: 2i58JSHWTHlyptvjtOV8D2GNkqXsijXDSyWzqOogZ9Ufsik+7lwvMbSUzKLgSgAELFdpsEbgNR
 8TLRxgCBzrCw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jan 2024 22:56:42 -0800
IronPort-SDR: a+xFj1elJxUfjnGbMLQtq4lQiX7ERjA+Y4ZquDyvRef/cnam2FbEjwxso8q5jVbsGBbnmT7XDU
 gx4d10id9lHQ==
WDCIronportException: Internal
Received: from unknown (HELO redsun91.ssa.fujisawa.hgst.com) ([10.149.66.6])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 Jan 2024 23:52:24 -0800
Date: Sun, 28 Jan 2024 23:52:15 -0800
Message-Id: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADBZt2UC/1XMywrCMBCF4VeRWRuZTC+2rnwPEbHJxGZhIonES
 +m7mxZBuzwH/m+AyMFyhN1qgMDJRutdHsV6Bao/uwsLq/MGQipRShRv79jEk/MmCq0lE3XEWNa
 Qi1tgY5+zdjjm3dt49+E140lO79ehYuEkKVAohR0W2LChav/QaqP8FSYl0X9ZLUvKJel2W6lGy
 brFXzmO4wfFfYJg3gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706514743; l=1894;
 i=johannes.thumshirn@wdc.com; s=20230613; h=from:subject:message-id;
 bh=rp5FcjO4/GYjbF5Qyk/GxKqz5Dm+QfeA7jbL0YYHdsM=;
 b=2ejVcWAH227cyBcLTAnmQV/viZ0C5PHZhudgyn72fAlTiBCd6IOpK+wyllf64WvtEBVU5sViJ
 8eBBKuHqePeBlFpK16YJ9MZy0ZO2EaU/AF6A2deSt4WZJ/fyuLoWemF
X-Developer-Key: i=johannes.thumshirn@wdc.com; a=ed25519;
 pk=TGmHKs78FdPi+QhrViEvjKIGwReUGCfa+3LEnGoR2KM=
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 medium trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUMgh-00039w-HX
Subject: [f2fs-dev] [PATCH v3 0/5] block: remove gfp_mask for
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
Changes in v3:
- Fix build error after rebase in dm-zoned-metadata.c
- Link to v2: https://lore.kernel.org/r/20240125-zonefs_nofs-v2-0-2d975c8c1690@wdc.com

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
