Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0755B3E5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 07:25:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhonz-0000kG-S7; Mon, 01 Jul 2019 05:24:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=078492c59=damien.lemoal@wdc.com>)
 id 1hhony-0000jo-E1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 05:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WaT4y715sO3oTcR31btfpAytCLroZcaPVeev8exvBA=; b=Di0bIPCm4jJhRT+1xw4dyl4/mR
 uoDSxxRiWBc2UZ4wWWJ9rFmZCv5m8o3ynEo2kA4xD61jnqj+FOxih+aszttZmz/8dWRu9RMIjxJ/g
 uro2Ux2hBf4YYmCpls6DbXMRaVemOOrDjMus2iEtWGY5a7T7amHnByKbDCyy1NVezu+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7WaT4y715sO3oTcR31btfpAytCLroZcaPVeev8exvBA=; b=Q
 QLph4FEs5ks1DEBygfO3M+O2tJ6F9pp+4sMi8vCkwfzfneqDo8LSKZph+VGcvLjAn2AiG/EaB3z29
 WDT5Ufum3CUYSOGMDrDfWPZsoeSk56aM9ULviHOXtIH1kvddmooBAfl1JAPbDMd0tRbTPpLsZpvPI
 hgznqq2ZJtXQHfNM=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hhooA-0037dv-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 05:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1561958695; x=1593494695;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qEEVG/GleY2IhHFbty0HJ0pJ2y5UIrI3mATRE7IF8Kc=;
 b=cubeXtOkvZI9Z5293TeRohSflozt8dkTZjZ9NeU5FrYOCgSGAmyFrWMr
 wk2VZuXkWrviviwymVgNznrP4WR9XzmdRvdrSUBpB2p4quFxR8vxYKMpW
 5ovoP97HnfdIsB0mnxawaYSEa/lvn4Jxsen17Q671Qd3Dj/btRyPZja/b
 UMbmAYTZFX5CF15ukRGvOdyWEN9t6uaPZ2jvoiGZvxuzehQhHpc8cwQLM
 JNcj4Y7loc1dEsSCB5ll6ULkTxsT1W7YhOm6iLk2F4gUreBNZr702F5me
 YtvNBljW14fVVC1dHu828zhTbE9T73M0hNB1JrjvNXmV5oUV20uzB4wOd g==;
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="111921710"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2019 13:09:20 +0800
IronPort-SDR: p3rFoGSWN+4sc48z3oKVV7zLse/YVI7pT/EA9EEIFvkbX9yJsm9v4X5yX91NikIr2vbWrVqMx2
 swjMlJGnEXoDztUdhjAb/bd2Eu6iaRf1AWwclk/67r0jAzeFjIOO6GpNvIshl7CI3IHWJKT40z
 vAmS3l9MP97Iv9zIVuB0rhOxmLJUEjoPjkqgqb9AnX0xEim+D4Dy6TIeeu8KONzDDNXycvHODp
 obmyB+DxvI8pm7Jw/b2HwAgFH+T8YbFu2PF+J/OV8c0sIphIx/YUkydQG4VeIAjwM1lIQ5OO+/
 RLO38uVGkyDHWtrOjdQgxuQn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 30 Jun 2019 22:08:21 -0700
IronPort-SDR: 5Q1/wtgNC7LQxTyrkYhLPNIik4AI54eskNVOntHzv7mffxKlteo9NrYKdCUn8bKYhw4isvZJ5g
 SPdVCloutID4n2c79mxSiUfb8JH8Z2Rket2Ka84Uno0LYrzN3jOtW/sXX6u8cp6ZTjGVry6aiJ
 Gc/2K7ZuhS/EQ4B35E28wEXte+jOZls35SdbunSPMbrjyus3Emt6VMM9Dakm7MbdAcItebyKxU
 qCXawUZNo+M7LvMfE8Mz4LdqTlekC2voQqegup+Sjma7hhN3izjmqYYrdmvhMeP/iTKRhZj74/
 KSU=
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 Jun 2019 22:09:19 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  1 Jul 2019 14:09:14 +0900
Message-Id: <20190701050918.27511-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hhooA-0037dv-Jx
Subject: [f2fs-dev] [PATCH V6 0/4] Fix zone revalidation memory allocation
 failures
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
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series addresses a reccuring problem with zone revalidation
failures observed during extensive testing with memory constrained
system and device hot-plugging.

The problem source is failure to allocate large memory areas with
alloc_pages() or kmalloc() in blk_revalidate_disk_zones() to store the
disk array of zones (struct blk_zone) or in sd_zbc_report_zones() for
the report zones command reply buffer.

The solution proposed here is to:
1) limit the number of zones to be reported with a single report zones
command execution, and
2) Use vmalloc to allocate large-ish arrays and buffers in place of
alloc_pages() or kmalloc().

With these changes, tests do not show any zone revalidation failures
while not impacting the time taken for a disk zone inspection during
device scan and revalidation.

Changes from v5:
* Remove the gfp_t argument from blkdev_report_zones() function and
  device report zones method, relying instead on
  memalloc_noio_save/restore() where GFP_NOIO was used.

Changes from v4:
* bio_copy_kern does not use the vmalloc buffer for IO so does not
  need flush/invalidate_kernel_vmap_range() of the buffer.

Changes from v3:
* Reworked use of flush_kernel_vmap_range() and
  invalidate_kernel_vmap_range() to contain the calls within bio.c,
  transparently to the user of bio_map_kern().
* Add similar support to bio_copy_kern().

Changes from v2:
* Move invalidate_kernel_vmap_range() of vmalloc-ed buffer to sd_zbc.c
  in patch 2, after completion of scsi_execute_req().
* In patch 2, add flush_kernel_vmap_range() before scsi_execute_req().

Changes from V1:
* Added call to invalidate_kernel_vmap_range() for vmalloc-ed buffers
  in patch 1.
* Fixed patch 2 compilation error with Sparc64 (kbuild robot)

Damien Le Moal (4):
  block: Allow mapping of vmalloc-ed buffers
  block: Kill gfp_t argument of blkdev_report_zones()
  sd_zbc: Fix report zones buffer allocation
  block: Limit zone array allocation size

 block/bio.c                    |  28 ++++++++-
 block/blk-zoned.c              |  67 +++++++++++---------
 drivers/block/null_blk.h       |   3 +-
 drivers/block/null_blk_zoned.c |   3 +-
 drivers/md/dm-flakey.c         |   5 +-
 drivers/md/dm-linear.c         |   5 +-
 drivers/md/dm-zoned-metadata.c |  16 +++--
 drivers/md/dm.c                |   6 +-
 drivers/scsi/sd.h              |   3 +-
 drivers/scsi/sd_zbc.c          | 108 +++++++++++++++++++++++----------
 fs/f2fs/super.c                |   4 +-
 include/linux/blkdev.h         |  10 ++-
 include/linux/device-mapper.h  |   3 +-
 13 files changed, 172 insertions(+), 89 deletions(-)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
