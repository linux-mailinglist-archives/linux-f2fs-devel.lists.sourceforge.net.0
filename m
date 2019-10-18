Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47DDBDED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLME4-0008U4-Mv; Fri, 18 Oct 2019 06:59:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLME3-0008Tw-5D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+V0vO/9aUa5DxB/ZDgHNxbjUwPI7D7/ThZsFIltXKtE=; b=Y1aZGqTnglzNW/veZRMK7yr8qB
 nBj5txn8o9PRw/cFqcHgzlvDVDImiDXwWmsrde0DPT/4cspFAzu6KmtWTlLN1boqwxOuIc9FcMaeS
 Sx38ltZULJxqJt1EjfBRj6IKs8PbMk3RK2DQjdZ9uSN7CbWxnNT6EsjCV57k7hNBNJvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+V0vO/9aUa5DxB/ZDgHNxbjUwPI7D7/ThZsFIltXKtE=; b=P
 f4QUP9qzQ4UV8XJRizP0PODErIx4Ao4a6/HkizTAdxRD8XjQx4TcU6l9ivMjeO4XJBrByPerjYSM0
 qJCXiFgCjmedmE0IQg2Ga2I71km29sMX12Cx7ViHbo9i4W42aEk6GH+keCiVYK3LfYdKRLfeGzAWU
 9DxSDriSt1wFSIeM=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME1-006J4B-C8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571381996; x=1602917996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xn+U8vMAhnKOpJkUwa5IZJ+IP40xv6grBqYH4rjxvZc=;
 b=IInnlnyhH/s1KDl2gPUAucB9gABRceYhAPlz1a+FdJcypSvXBXSrWrO8
 YXxlLr3bs+uvrcF9wnLRzhqHMuw+gh1JGPIREQmLCB9GHYx344XOznZMG
 u9bJfZGDDpY1pOmrA+B/4rMGaB1o9Wg0pg1jgwQrR996po3P+eVRxtR8G
 dXOqUlPkXWLSKnMMn8r9oczz5vbb55LduKhfdYZzraS4qE1e1PHNvDk9v
 aBtOSIzWFzfAbKBqgB3ejR4KfV1rY1zGlTEwaDuFCrgk+cQtJYj6XJpX2
 WlPDTtAms1vZnMaJTj+trgSLPPoXPRJAMF8U5VC3pcD81tPJFws2sixwE A==;
IronPort-SDR: RetTpyoqJVEAW2rZByne6QQtar7NQZZ3tLG4OCvdb/tWe/a7YU0dPZbECbqgZARSBdJsiNBa4G
 WXxat8/Ma0LjXvAQE2h+zS1v4rWYQcgUl5pnB3YBP9CWuDX8JWS/AVlgrj/4p5D3dTm2a15WXt
 qbHmRIK+b3dhyBR+/+zM3qbbm4L4z++Wyn6UGG/DXXMMr1Ieug2A8EXeNWE7fUZ7cPhMzw9jtf
 EjWO6Ow9TUW2780ewqBOpKuMB+PtG+2PRZTRM19ZphZm6tSeN8Y5ynAlC4e0Awp8GOMMUgDmEQ
 QDA=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884335"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:02 +0800
IronPort-SDR: ktnnjwcI1o2fNepZGtwwMfHSCYFSO/x/VbaW4tdsvdiHBMRhbGjE8+uw+8HVUEEz0PJlItSuHn
 D1jzM1ykd5DT8iOac4KNgfJeG1MWmA5KX8hzwt73i6DzCNnRdI+H6RuttNInNMeZEREtHdnboe
 PYuSyjGUnx2hzFbujfsV+oGM3CUf/s7kGWQWEFOPwH/Vr44JSWoxlTJHHz1vDo/bk6vdOz986v
 JvOnzfxf560uoPkfP6xiJDx0bwdUIWYk5qlP06IbbACEBXk3B+0KxCYAFcjufw3AdgVqboIlS/
 u6GgYEZVz8DUCGFk4q2mUqri
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:26 -0700
IronPort-SDR: K7My6FDNQvPmzzkoiCebRjJDG2gpPKkN6dhurYRoqaa+SuV0wechEU59ieMHSS4Vj/ea4buBp7
 EtcW/SiEqPglvFmkfpm7DZt/9t4vtIhwD5+v32YLIXRkhsm0zhzN4PD4OkwqOoQGd4ucU6mVWY
 32Ug8dVlcBhXv68Jdkye3qi6eFP7+YbAKotX2Ex3EGdu0UGVy+UV2AP45aJ4/An/2IvtdpbrUB
 b3rhGkkzB+F54ZhGU+iCLwre11Zg+OJZi4BBndu01rUZTKDRbdyjo0ZHgRvkTM3kFyHCHX2UlH
 0UI=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:41 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:32 +0900
Message-Id: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iLME1-006J4B-C8
Subject: [f2fs-dev] [PATCH v5 0/8] fsck: Check write pointers of zoned block
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
 fsck/f2fs.h         |   5 +
 fsck/fsck.c         | 270 ++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h         |  11 +-
 fsck/main.c         |   2 +
 fsck/mount.c        | 137 +++++++++++++++-------
 fsck/segment.c      |   4 +-
 include/f2fs_fs.h   |   7 ++
 lib/libf2fs_zoned.c | 118 +++++++++++++++++++
 9 files changed, 512 insertions(+), 44 deletions(-)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
