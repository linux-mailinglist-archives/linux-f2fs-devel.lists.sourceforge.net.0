Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A24D10C49E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 08:59:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaEiM-0003DF-9T; Thu, 28 Nov 2019 07:59:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2285f8a38=shinichiro.kawasaki@wdc.com>)
 id 1iaEiK-0003D0-Rg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 07:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/HoEsdVjm10xoSBEmLChAkJtV8GbM9hQWeDmkgSmIqg=; b=BsZawmiSPWgXR8bKbQdqe8bX3g
 XnjrGmMQveZFI3R5UbrknqT4cWmUmOjuePigYSaqqRB781IwZS1gjn3v243kPLjJGDZ5LzwBO5jdo
 hyLttt6tSTXfpvYlhMYIyfkSmXLheopOCCPg9XsfZs7L73Yk05t8WgvvhkJhFD9iBClc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/HoEsdVjm10xoSBEmLChAkJtV8GbM9hQWeDmkgSmIqg=; b=J
 5JbDxO0HHT7GJ6GL6CZrfC+P+nOaKGSMgfNM1utwFGsPqlByttqBBaW7gaAF/BDFOFvc0RAJyF0mj
 l1CLPonXdjIBpWWD/qRU2M1ENq/C4Ix5uNOobSIlgjXPMpHXcAGNUAe3sMXPhqd5Fj6v02Wl+C16v
 SLkqjEr0T2aW9+xU=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaEiJ-00FzBh-49
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 07:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574927986; x=1606463986;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oTALQ/obU+d2bCLhsV/0wU3sOWVBJNdzQlG0UPgxc00=;
 b=eDRgcaqrgSjxKWvG1fsHFT09ZDmoaRspqFr+d8srsxD7FGthlSbUHg+C
 j8zsC8Ak0VFJcHFXVFGNmpNFhKpeQJM50ZYWENjY7gKJyY0A0DjPHjy55
 LjCPIE4J2G+CIasm7V5Dym42NLk+HPMAimFppsQaMeUQwHc5I+blvmslm
 uxgZ45sYo9XMAzRYmfbvd4tZGRkWyuRLSgyMjECtaGJ9GFWVgE9CoT7to
 2Xu2EqTV4TtD6YRqg9BDE1ThpQW7uSCGzHLuY78rN6hPv1zxiIRsQGjdJ
 NustFgCi1OahAaJXwmjHKyzPRLjYE+FJNkyOtbkMbnOu3ADYS0KlP+xE3 A==;
IronPort-SDR: 9LU2uE7mDIUJ8AvzlmGVVR638RzukRvjUjq57myv8+OlbnqSYsgRdD3qOTTLotb3Cul1/a+y8c
 RR/zQyN2p1yRq7jeSAXiXPHaS9xf+S5gdpon+NdCWcdMDqCCJHe8WPL+hNLIxLQDvGk3t9B7ml
 w77tRpLCYF5TU/+T2vz2ahw2ENh+E3elLB/h9sxoTEH7ebxalZ/1Rtg4s6dVHw7HzxIZDLhGNZ
 MVsWIkE6BO5aEKk/GfGdIVKIk4CwzDLpzN89gDfrc2baAlX5D9SjmLIokTRR1cllQNUITQs8ao
 7PA=
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; d="scan'208";a="124178780"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 15:59:40 +0800
IronPort-SDR: Y3jOBbsVlV58pjNnnhImqGpgTNXdhNbKE9zncGLu05knSA3vadZTVqPIRb++Tb4XoiQ40YFoW5
 Ehw2a+FSPyYZFmoRARwYMuOQxzKVxrs4kVKEYTdIRncfaeeneHww+5c+oHWP/SNfDLklw4dseQ
 jwjSYF1xR0qHXG9I1NMbW3I5HM1pqFpQGm2tAq9k0+URVwhu1d5c/F/RuMMyu4ZTAZFMDvZsKz
 nCBd59fKHm2a53nm3LgFxbLQcRtZPZPv3OxCZXtTDeQtuJn3tBTxECpijUL3BR8yKoSv9EDdw0
 vL9tdt2eWw5ljXWOXjNWgr+t
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 23:54:15 -0800
IronPort-SDR: mAIVwfNAPM5b+OTjieRGNUJDN5FmYIHx7aEWUzr8AsR/ph7dqjdhx6hBBIom352Igrdy/uYg/r
 J/BbZ7eUcOV08Y0usgwXOyuX4c9aqdxBDQknKNR5J/tBUI6L/V59bMkQwIX9Zte1gXDzz5A7Om
 WIh27qSY3+Lv2mHHUyJIBN5bXq8WW1Ma34yiC7HKl0BzS8LkqNn2lCxto4R5NnmZp7E+Qg/yqd
 dV/Z718qjIc6vTw/MygEoM7M7WKe0Pr9ZYP2PMJ1ayzRlbDfkO7Uf2UuelJsfWec8qGnnoBQOD
 6e0=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Nov 2019 23:59:39 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Nov 2019 16:59:22 +0900
Message-Id: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaEiJ-00FzBh-49
Subject: [f2fs-dev] [PATCH v8 0/8] fsck: Check write pointers of zoned block
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


The v7 and v8 series were rebased to dev-test branch. The patches from 1st to
6th in these series were taken from the dev-test branch, which reflects updates
and sign off by Jaegeuk (Thanks Jaegeuk!).

Changes from v7:
* 3rd patch: Added reviewed-by tag
* 7th patch: Refined comment about last_vblk_off_in_zone()'s return value

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
 fsck/fsck.c         | 278 ++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h         |  11 +-
 fsck/main.c         |   2 +
 fsck/mount.c        | 139 +++++++++++++++-------
 fsck/segment.c      |   4 +-
 include/f2fs_fs.h   |   7 ++
 lib/libf2fs_zoned.c | 124 +++++++++++++++++++-
 9 files changed, 527 insertions(+), 46 deletions(-)

-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
