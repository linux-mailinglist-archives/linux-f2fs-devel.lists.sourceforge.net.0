Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7F0F3DBB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 02:57:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iStWb-00069N-P7; Fri, 08 Nov 2019 01:57:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=208d19533=damien.lemoal@wdc.com>)
 id 1iStWa-00069F-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5U+DSHTOtXcHduArhDWoWMGBZt7hJQFmjC22uG7z02o=; b=ZtL0jzHQSAhnF5V8cmCbVRc/oN
 9RnNLV50E9so4IwFyplfG21w9akykMajrYkA9CPE/9azrV6vVFS8dq2o/QoXLDJ8HkpNdPKSVCsvX
 hexszuKwkPn8dlfn4CU8zayhymk4t8CJghLhukrqpqalbzD2Y0PSkekUejCfd+a7Mr8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5U+DSHTOtXcHduArhDWoWMGBZt7hJQFmjC22uG7z02o=; b=K
 4uwpCy2Z354pf0XsHxNVyCfbuvIR8TsBsSgAhtm+ZAYrvAWCS6osEizwh6jbtF//rSVYhySlBGDlj
 vmm3x15unqVi1jGONZG3a216gCACl6XUTJJ5MXZSW4JtwtnM++tgf+ZYVCccaoj2LMOi6bf3BCin7
 SF8DnGctadCprr+g=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iStWX-005k3N-1O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 01:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573178274; x=1604714274;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vM/KrJ+HIa8siNY2n9F5icqhovX3v2IUN4Yn9XIWjuU=;
 b=Kdj9EVebAoSgv6iYOns3bY1IXc2Pk+hbNTV4aC7xkET681yiD7bjrg7p
 N5y785/0vIQSE9bdLJdnxctAIJs+sEmayueyttkgfzZhjEm06PcBidQoS
 4RdimeXk/xTwZau5sEHAXL6wUt+s3P2pnHLERgTUfomv3ifWkCyAHZ/Wh
 igVgzhRIXXv1oYUsDALS1eWWfspUQQp7TfTptiauTfqd/IZiixs4s2mod
 A9u92BdtmXY6yhg1djgl5i/XBpZhQv7Q/hXXvOvGuhvcNyCkLhUMn2xXQ
 k/UO4y40f5wMndRGxI/a+tCFoJ2iCpSkRh9wnmSubjg6JO6QPnSeszTJi g==;
IronPort-SDR: Z/Lu4bc0lk+05V1IaE3OyhBNZC77lcol8n34l3Fk382jjKqDsShYWZ1ata7FRYM6HtPnImPAJk
 10JunTKVXPP/Abc9K8lc4qFQQgJrxJpqtghKNByF3LFh/aCvDoww34pNIoT+yAgd4s5+GcuJr5
 Eaif8eaDrzmmI3lIlKh+zcB9eW3OWtmtxGVzDfaMTxMBUOd8H3dDH6656grrLo66qL1fzOHCCM
 CFc8gEAT1rKVqK7Q7s+4NCzf7hjPyvLRIdQMnbWTd8h46rJbbrEQLBYxVVpQzxhZBF4D4Ag0kp
 c2Q=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636895"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:36 +0800
IronPort-SDR: SI1cbBt5OYhk63OpV/Njzcfl5z1VR1XmTnbiwIVz+6m65AshaaYmW8TVXmKICjGTb6p2xeT+ll
 owoQdPNTQBPmte9KGAGFsaAiTgM7odVAikkGXWfWRqkpUjd/aeDQIjB25XYDtD6PC4sYzFBQFO
 G4ttmIx932Zp0V+xP5YgO3D+K8fG5KDJUt2Um1mlkZQh2jl81Ipm31WJAl8zVit6ERpUv3ge7+
 UyP+In9pBPhispE3hG4/4lJPkJxl+Lvk6tFU2CKZLYrMss5qIj4u8d9y0o40kcPsNyP2vYwa8R
 80bgio3UA8WY3OxqrpnpvV0v
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 17:52:14 -0800
IronPort-SDR: n1JB/r/HWWN2B17V0qOnL+HfFwacsPp5S7iKAhVZGZsNZezmTrmkpdg7au+KUF22Zv4gjzyhb7
 NHHxOniZM35NXgyv3T+t/RUTLj9+ZkQSbX7SIgY7GZHWE8zXAyV+VCl3tx8wJpZ3D0qpEbNLAK
 7lTAk0GlfNVg6qBZeCDlW+7HFz5ZLDgOHAwhAZhqjj2Nv6zn+b7OuaTwd/ou9i+FLBk4tB18CH
 gz93U1hqWBN1NMh1oiqBwxd5rlbxaIZgAFJxbbCE5WrcvT0uWh4c9ostOi3q4RjsklKO86XJSy
 ZTE=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:03 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, dm-devel@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:53 +0900
Message-Id: <20191108015702.233102-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iStWX-005k3N-1O
Subject: [f2fs-dev] [PATCH 0/9] Zoned block device enhancements and zone
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
 drivers/scsi/sd_zbc.c          | 235 ++++++++--------------
 fs/f2fs/super.c                |  51 ++---
 include/linux/blkdev.h         |  15 +-
 include/linux/device-mapper.h  |  24 ++-
 15 files changed, 427 insertions(+), 702 deletions(-)

-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
