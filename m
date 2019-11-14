Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0033FBEAC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70D-0005CV-AJ; Thu, 14 Nov 2019 04:45:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70B-0005CN-JH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ycIciqOcRr7T+vHpSVVMx8a9WgVXUakRlivtwfr9EP0=; b=V6E813ju72KouKZEc/8h0Pa4GR
 RYhKfCiqjIJjYfBok8Ctdg5xh4EophH5dnI8gA4sVJ0ZxlJe5OX7guFx2WmIC0/hhYmv9TYcXQ71k
 /QrG9YsZ+FkyLTYFN/1CD872Xb+hw5x/W0PtU6jviOt1BSUVPHOQfsxs10zttfPG2tjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ycIciqOcRr7T+vHpSVVMx8a9WgVXUakRlivtwfr9EP0=; b=O
 Bv0glEJhyG3AttGEqVRjIAfERSoekai05BCUzeFMPGzoc/xiXZX1ZGZwQRAYqs28YyCjEF2/hld1R
 uXevWQsHRxoaxdZfUpE2DHsGYkT6MvxHcs3qzre1qoAhN3Wy7kj/q/bIJc3/l0tDGwe7xRgvRDjax
 /U2KPTJzGClB4jQY=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV709-002ZCm-HO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706702; x=1605242702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OvWxdeM0TQYTAd58Ta9Y9v2l3tw4s7cISg19nKtEBCw=;
 b=BdX3SbhUbN9PWAheH2O4REYt2uHhzuLrKrFp1sG1d1i491szOCPokDqf
 ty9Axw236FcUadsZArkYOl/XXOMNuB5OLpjQw1J1mCmt5ZPU3wOptgi2p
 hig3VuzXwAb+/E1O+RMTSyWLC2MUrhLo1Cot4yMo9xYeeCW6oxnPwfKzI
 JJtkQkTtTrTwUgbCxMYx726fYwEmYKjIyPCSUyC/faFUV5WLbyDihpgFa
 cVkDxB899+0xWzXDdRI6zuB6nW2VuOQsf4MRQyyKcxITk48QYsdCIyx2w
 6mYfFY66QYynR3M0qXZ79FsW1trTctHma9bA6E0t3yAhTgcri8Fi7a4Eo A==;
IronPort-SDR: 2fnw4zVrpVK2tAUFXGs7nV1RSjGT15mHdHvlUvjinIjL10w8wy5Qqk9G4Wf5gDv9A+j0YHgpCV
 Lz7LhEEZK+y0lT+Ar2jF7ZWoZcEIvUKHfYkLavMFaFIrhDRSK/2n20njPNL8XiUbvyQyMs5sTH
 mQQbz+YCVDdjjCC0kZdZ+E6oeAIgSv0yRQzBVIA/aC0T3pCf7RHfrIipnRQE8CcTMvI0alNu37
 C+i3RPxRa0j1gZY/Tz1N+nGh09wnXmpa2Yt0mKwUt7Ht5yt7AgLf+q1fY5gS675COeBOaCMc8p
 y6g=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411440"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:44:56 +0800
IronPort-SDR: gQbpDjtZHKD5uamR+CNK8DSHYKzWZIXIekWNaGyf5iWI8vheM8g/nIerhJ5oSf/1+RhJ3gWMX1
 gruUdn2g46jqXNcNW/IFldLOj/4QjJozZjbkgjSXh70sQnoHqW7b1zRhNoi/q9lP0zwXHt56s4
 F3xip4WiCKj3oWgVRgD7H6s5N/jjT0wZoYuto4APCETX9B+lvjnMGY2qa7Mnfv7lyPn+SVcf1q
 8jBSJvCTshHKX3+4+YJM/iYiSjAguD49A6T5VZNhpw2k3CIIB9qysPlYEFgkjTa4ZdclrA2TNQ
 0wFNqJ4LKNeaViN45UeiBO/X
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:39:55 -0800
IronPort-SDR: zO6PCWhckkt3ZMI9f8k4Gxi7DXhGbRpl1cHGgIPMpZq1K9UdnDyBR9hKq+z7FNDHNrP9/yqXBc
 QDPYbboGeLnAhQWY6D67/yXLED8u2UXLueFXf0NV9ds7fqFAkbfDuNnlY8ZT2XfwqeFrWCp3Gd
 o0zP2t6uxsmqj/4OYFgvbp9hoFvY8cKD/69AgbwBR1zMuHUIuXGsHcNZuNJEWZxO4nrx1sdb1A
 xhVGve/wJGGn5yVWq1GXJXZdTrpn4w31XqOZL753a/fE04gfhf88FHPQndoC/l8fZHv2ebnmVP
 CR4=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:44:56 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:46 +0900
Message-Id: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
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
X-Headers-End: 1iV709-002ZCm-HO
Subject: [f2fs-dev] [PATCH v7 0/8] fsck: Check write pointers of zoned block
 devices
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On sudden f2fs shutdown, zoned block device status and f2fs meta data can be
inconsistent. When f2fs shutdown happens during write operations, write pointers
on the device go forward but the f2fs meta data does not reflect the write
pointer progress. This inconsistency will eventually cause "Unaligned write
command" error when restarting write operation after the next mount.

This error is observed with xfstests test case generic/388, which enforces
sudden shutdown during write operation and checks the file system recovery.

This patch series adds a feature to fsck.f2fs to check and fix the
inconsistency. Per discussion on the list, implement two checks. The first check
is for open zones that current segments point to. Check write pointer
consistency with current segment positions recorded in CP, and if they are
inconsistent, assign a new zone to the current segment. The second check is for
non-open zones that current segments do not point to. Check write pointer
consistency with valid block maps recorded in SIT.

Reflect fsync data blocks in these checks. If fsync data exists and current
segments point to zones with fsync data, keep the fsync data and the current
segments untouched so that kernel can recover the fsync data. Another patch
series for kernel is being posted to check and fix write pointer consistency
after fsync data recovery.

Have fsck check and fix the consistency twice. The first fix is at the beginning
of fsck so that write by fsck for fix do not fail with unaligned write command
error. The second fix is at the end of the fsck to reflect SIT valid block maps
updates by fsck.

The first three patches add three helper functions to call report zone and reset
zone commands to zoned block devices. Next three patches modify existing fsck
functions to meet zoned block devices' requirements. The last two patches add
the two checks for write pointer consistency.

Thank goes to Chao Yu for the detailed discussion on the list.


For v7, rebased to dev-test branch. The patches from 1st to 6th in this series
are taken from the dev-test branch, which reflects Jaegeuk's updates and Signed-
off-by tags (Thanks Jaegeuk!). It will be appreciated to check 7th and 8th
patches.

Changes from v6:
* 1st-6th patches: Taken from dev-test branch, Jaegeuk's updates and sign off
* 7th patch: Reversed bitmap search order and improved last valid block check
* 8th patch: Improved code comment

Changes from v5:
* 1st-3rd patch: Reflected review comments on helper functions
* 8th patch: Ensure zones are in main segments and removed errno print

Changes from v4:
* Renewed the series based on design discussion on the list

Changes from v3:
* Set curseg position at a new zone start when its write pointer is at zone end

Changes from v2:
* Reflected review comments by Chao Yu
* Dropped 4th patch and 2nd patch (2nd patch was required for the 4th patch)

Changes from v1:
* Fixed build failure on dev branch

Shin'ichiro Kawasaki (8):
  libf2fs_zoned: Introduce f2fs_report_zones() helper function
  libf2fs_zoned: Introduce f2fs_report_zone() helper function
  libf2fs_zoned: Introduce f2fs_reset_zone() helper function
  fsck: Find free zones instead of blocks to assign to current segments
  fsck: Introduce move_one_curseg_info() function
  fsck: Check fsync data always for zoned block devices
  fsck: Check write pointer consistency of open zones
  fsck: Check write pointer consistency of non-open zones

 fsck/defrag.c       |   2 +-
 fsck/f2fs.h         |   6 +
 fsck/fsck.c         | 271 ++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h         |  11 +-
 fsck/main.c         |   2 +
 fsck/mount.c        | 139 ++++++++++++++++-------
 fsck/segment.c      |   4 +-
 include/f2fs_fs.h   |   7 ++
 lib/libf2fs_zoned.c | 124 +++++++++++++++++++-
 9 files changed, 520 insertions(+), 46 deletions(-)

-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
