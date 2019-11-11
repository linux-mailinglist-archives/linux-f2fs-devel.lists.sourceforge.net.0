Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C402F6CE9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2019 03:39:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTzcK-0007nD-QU; Mon, 11 Nov 2019 02:39:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2117e6735=damien.lemoal@wdc.com>)
 id 1iTzcJ-0007mt-P4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8TdZKlrL1kxybyzEuzZuuxu7DuaYg8y11dY0ugmNgHE=; b=DyIt7a0zk/KgSWPvfyYwhuy9YW
 0j64ZLz9ryHd+YAiPk/0OyLXjqlV7fZCeb1pZV4grRFDANEXRIT00nuuiLJm/cDbhJtcTw/QRkf28
 +hpkYMqdjwbOjQctk6rQNt+a9zXi1aDELUvHHOenAD/dvdbcIzlyTiBloLO/i52ExO5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8TdZKlrL1kxybyzEuzZuuxu7DuaYg8y11dY0ugmNgHE=; b=P
 N33cd8ZYDcO1pdxRYZ0LGjZLQIz2LMgoMaIO2q9CrInkEqlYywgEf6GXSPqEtHmOng0BMHT6+YLOX
 Hq7ijCOSf/NH9Rmtczt1hlacimyQiIfzpQ8M0Im2YBEVDELLZaw4DlDeQzpi9BM5gT9tQ6cpC37Iv
 pjsqPHY38tafbucI=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTzcG-00EDq9-Fg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Nov 2019 02:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573440023; x=1604976023;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=loxvxJRUWOUdYNBZtzySvWSAolTb0SaIEeeVmfNePq8=;
 b=mWsXm1jEZRFbOrJhGdFZB5DFprFSj8XP2nuXc+DRgsL0aVJ2Zny9w4D9
 WPX/06akLtzuplNA81fVFAW1mIYKK0fvQx+ecFijCBf51E2KaI0LjO+Un
 0BZ24tY4tuBaWSWN8aGezk98TOJSexvzoSvW1hRHEwieyIV98olc++kET
 R32F5n0gEQCuolwobo5kOWBX1Fcge9wPHnyoV4hIcV8m+Vhc3UAq7ziuM
 R26yejWXcLIzu3mNvEPXXDhdtzx8w2naECmjTLbbcg3WbqrTn1KJSfrfm
 o5lXTI7h7KUGMJ5FUG9bZS7De8EP13zw41Fdy/yJxtuOjqS1aNyo2Tx6T w==;
IronPort-SDR: 3UYY6vuXCBT+HSz3/isGe9CSq5SETU8Hx5QKACWtxy/Adr5mkcHjFilL7VE1hT6oZRmH3xGdEU
 mjqpQC/3Cd5UEZoVOFa/RgDMru0lEZB4l8Qext5EzAVGl4BgPpR8k16wNc7OhgcouZxE+SQtQG
 Nf9Gdl1gbtuSNqPCea9UJhqEeTnGXweU5B3CTJe3DYE5G9knRQknY1gwD0AQqzeRcYi6dqdmh5
 69vE+xKLtGzGKToCTBIWeSG8HUFwlKCHO3fbUf01hxnLP+JB7DtEK10xgWFTkaY4SgdShCMNlt
 fD8=
X-IronPort-AV: E=Sophos;i="5.68,291,1569254400"; d="scan'208";a="223870987"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Nov 2019 10:40:05 +0800
IronPort-SDR: ljKLWYpoAol/WMaJ8c5knbis+1+tWaaNDYhz24bnFPzdI4+FpnTaAEgmGTM5yEC6R1guteC2l+
 +UrfaCU6LiagKVYr3mZUwgSpD8sL4B1Dg8NLgEo6006vogTgilqYZGbmxa/eLjjYAfPKRHWGJb
 mv1cg8WjuUBzT5tQNE31mHmEQ0RPVPwZzvzd7qFaj0CdX2glA4qs7mM+vPfFwbkWpKWlurz/3K
 yJh/a+z38yuofHGLOtdjoVsF6K+79UHo1xtEojTy4ummm3aro24Dac0K9kfYrhWIDqQ8D2NPu1
 KRGcyHyEpilZW26PcuwqfukU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2019 18:34:37 -0800
IronPort-SDR: k0Wrpwz0IBDAyiy3NeJtqBPlFVnypJfiA3/fr3hFumDAX2NkTsMTCRzzSVFVZQ4q0CiUw00AMU
 RHMBekM1qrTAUQL7H3mKmH3JKyCryCqMSA6Utx02YsNM20Bfxk8sVzMwoR6zZQYurgfm0Iakom
 oC8oFbWIxWEPFIg54zaEp6V0l/7qB6nZitli9Dr6m1/h/Dx2qEU+3pi6GUbic6PD5tuESCoAMA
 v57xogsjSi9utAySnLkgjlBUw3SZcI81ivDj8s2dTxkU5dPNWEKr9r+/yudSBcwv0b/pCna2DG
 rPo=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Nov 2019 18:39:32 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Mon, 11 Nov 2019 11:39:21 +0900
Message-Id: <20191111023930.638129-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTzcG-00EDq9-Fg
Subject: [f2fs-dev] [PATCH v2 0/9] Zoned block device enhancements and zone
 report rework
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

This series of patches introduces changes to zoned block device handling
code with the intent to simplify the code while optimizing run-time
operation, particularly in the area of zone reporting.

The first patch lifts the device zone check code out of the sd driver
and reimplements these zone checks generically as part of
blk_revalidate_disk_zones(). This avoids zoned block device drivers to
have to implement these checks. The second patch simplifies this
function code for the !zoned case.

The third patch is a small cleanup of zone report processing in
preparation for the fourth patch which removes support for partitions
on zoned block devices. As mentioned in that patch commit message, none
of the known partitioning tools support zoned devices and there are no
known use case in the field of SMR disks being used with partitions.
Dropping partition supports allows to significantly simplify the code
for zone report as zone sector values remapping becomes unnecessary.

Patch 5 to 6 are small cleanups and fixes of the null_blk driver zoned
mode.

The prep patch 7 optimizes zone report buffer allocation for the SCSI
sd driver. Finally, patch 8 introduces a new interface for report zones
handling using a callback function executed per zone reported by the
device. This allows avoiding the need to allocate large arrays of
blk_zone structures for the execution of zone reports. This can
significantly reduce memory usage and pressure on the memory management
system while significantly simplify the code all over.

Overall, this series not only reduces significantly the code size, it
also improves run-time memory usage for zone report execution.

This series applies cleanly on the for-next block tree on top of the
zone management operation series. It may however create a conflict with
Christoph's reqork of disk size revalidation. Please consider this
series for inclusion in the 5.5 kernel.

As always, comments are welcome.

Changes from V1:
* Use __GFP_NORETRY in patch 8 as suggested by Bart.
* Added reviewed-by tags.

Christoph Hellwig (4):
  block: cleanup the !zoned case in blk_revalidate_disk_zones
  null_blk: clean up the block device operations
  null_blk: clean up report zones
  block: rework zone reporting

Damien Le Moal (5):
  block: Enhance blk_revalidate_disk_zones()
  block: Simplify report zones execution
  block: Remove partition support for zoned block devices
  null_blk: Add zone_nr_conv to features
  scsi: sd_zbc: Cleanup sd_zbc_alloc_report_buffer()

 block/blk-core.c               |   6 +-
 block/blk-zoned.c              | 356 ++++++++++++++-------------------
 block/partition-generic.c      |  74 +------
 drivers/block/null_blk.h       |  11 +-
 drivers/block/null_blk_main.c  |  21 +-
 drivers/block/null_blk_zoned.c |  33 ++-
 drivers/md/dm-flakey.c         |  18 +-
 drivers/md/dm-linear.c         |  20 +-
 drivers/md/dm-zoned-metadata.c | 131 +++++-------
 drivers/md/dm.c                | 130 +++++-------
 drivers/scsi/sd.h              |   4 +-
 drivers/scsi/sd_zbc.c          | 237 ++++++++--------------
 fs/f2fs/super.c                |  51 ++---
 include/linux/blkdev.h         |  15 +-
 include/linux/device-mapper.h  |  24 ++-
 15 files changed, 429 insertions(+), 702 deletions(-)

-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
