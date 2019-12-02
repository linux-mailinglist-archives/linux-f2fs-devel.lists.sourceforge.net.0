Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7710E7D0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2019 10:41:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ibiD4-0005os-GT; Mon, 02 Dec 2019 09:41:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2324aa620=shinichiro.kawasaki@wdc.com>)
 id 1ibiCX-0005mU-SW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 09:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WEAqhNMOiInmMqmvQ+1QhlwqQf11mBpmEtYNmPpmZcY=; b=bVmLiEgZkls0kQlLwHsILyG2tD
 Vg+w4lLTS4c6i2vWn1YxYWB2XcydtLpHtVLuWirQ2XUGtUnb4jFiYXkH2jx34KppbhKujrR9tCRK1
 GpaXwibGNywnXjOedclNrE2Jz99ZkNLl4m5iki21UiEfE1RniwY+8GQiNnvBRGi7kl6M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WEAqhNMOiInmMqmvQ+1QhlwqQf11mBpmEtYNmPpmZcY=; b=j
 2HeQmNHTCZWGVtS5QSWc9nlNjdOCH6ZksOn4iarBCkMMIGd0GQhJriuOjSffsmKv3jVfBl+NpmdxE
 Xp9QkRqWzxNAGxugxQcXqHbf8eemj+mhOWDMi1YvunSPj+kYMy5TEFHIv1gUVxMahxrjhj8XnVpEq
 pnwS+c3WB4z0V5j4=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ibiCV-002exm-QH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Dec 2019 09:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1575279675; x=1606815675;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sSDCxzN3+m/9sp8qLte4lFhw/xWXqgFQIBbyozSo4/c=;
 b=gFhbAw8cBQNLUEF4wFAaUmpe4YoeyGGTyOc/OW/BOhJd3Nmn0cxR7CXv
 tj9aPPZHON+u0W/IjtKthMt34OzqnBgLmzY6B14KVCBJmOdlZZ0I+Jo+p
 +QXpEik6CymbG9j57Iv8mBYEs/VNPEmB0L0LZsT7rhk/4EKi3ePQT9Exv
 3vXkAfF68Fv851qOkW3GS5gtdEf5dh98ieB3khOdduDOFf3dgaJhz28UK
 Rn4wKmeIOzf1RnGUo0f1vEI7lpfLFv/9Qpp8/F92oylxs/TCuEHfuanpV
 h/Jd6mHznUnMXtcQZDBYk4Dx31HXiewwjP6fyqokVRGLWYIhdRDUXwSq0 g==;
IronPort-SDR: M47nOo9FpYUueXNc8i/bz/wVxUW+hgB7tpemhCo6F3MJxbkZnPdM+m16aaha5w6B84gEqrQv92
 lwn8wjlyqJs9BueQ3nx6afhgqsPIx+OB06keYITOKswyUifJ0n+n24+10Mrep0s2vmeiHvwY/C
 cNouu5322MbSiAV6mj25l3y4jKfQ0KrVxlFyURV3Vyifb0aonsBJZV222BtQp71SVEfPITSLeS
 f6FyDRQnWSh37YcJxQEYV9OyOZUtbiSfvZj9IX3n9eYen1CR36BJ9CF0PLe0DWPWx5R01TIZKh
 U4Q=
X-IronPort-AV: E=Sophos;i="5.69,268,1571673600"; d="scan'208";a="225835234"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2019 17:40:59 +0800
IronPort-SDR: 3N5uaWn2NZ2Pw+wL+jSBT9KfL7bFlgb0emQDMlKwzyJMzXVASiQFl7ItCHBPEMOyMzlAmElzYq
 Wo6GF1H1WUR5d+5dQUzYrKnjli9Dsm7BMsiUpJwtaVv8UHIvW/H6jTjgpy8Qr9UBKUQsdwv0Jw
 QkDHzguCQMAzQGvhny73SRwLziuDB7UAbrYd2eXEpiWh29LPMPz8W5/HxRo7YySJQjiqv1RG3x
 b3SDHKK1MbYJ3AvHCjHarBvporiGGnXXaddngGToTHpCWNRNXO0SVaaipTnisbHZQMmRUn2PlG
 7/QKeHITGrEyo7KBsNs7XvkW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 01:35:22 -0800
IronPort-SDR: DszU6HDyU9a0Ra3Ce/eYKeia0yu42pRqxIciRfOoIy89rZa1+3s6+To12CdccEp2o0QtSi7/bf
 ypwjhXpHW+U459R/EElAITh3jNISgWVRqZE5F24T1ur65aFXIFXab/B2/IS/Jqjm6UZdltmscK
 HVA+5wdFUMzu4Gv/v6LDhTJLiecV/1xe6XPwgUF3dQx/1zJ4f1TEB4/1jw95sRB8X6S4qcqtTX
 F588y4pU4RdDfKMb7CrTlExr0kZndXRK0qY1U5N1l937z74Tyx6AJvWkU45q1nCmgQwYmIynKc
 jt8=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Dec 2019 01:40:52 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  2 Dec 2019 18:40:41 +0900
Message-Id: <20191202094043.892258-1-shinichiro.kawasaki@wdc.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ibiCV-002exm-QH
Subject: [f2fs-dev] [PATCH v4 0/2] f2fs: Check write pointers of zoned block
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

This patch series adds a feature to f2fs to check and fix the write pointer
consistency when zoned block devices get mounted. Per discussion on the list,
implement two checks: a check for open zones and a check for non-open zones.
The first patch add the check for open zones that current segments point to.
Check write pointer consistency with current segment positions recorded in CP,
and if they are inconsistent, assign a new zone to the current segment. When
fsync data exists, check and fix the consistency after fsync data recovery.

The second patch adds the check for non-open zones that current segments do not
point to. Compare write pointers with valid block maps in SIT, and if they are
inconsistent, report the failure or fix by resetting the write pointer.

Thank goes to Chao Yu for the detailed discussion on the list.

Changes from v3:
* Rebased to linux master tip and fixed conflicts for blkdev_report_zones()
* Discard zones with write pointers not at zone start but without valid blocks,
  resetting the write pointers instead of fsck run by users
* Improved readability of open-zone's check condition and indent with tab

Changes from v2:
* 1st patch: Fix write pointer in SBI_POR_DOING guard
             Removed __set_inuse() and f2fs_stop_checkpoint()
* 2nd patch: Reversed bitmap search and removed __set_inuse()
             Changed condition for disable_roll_forward/norecovery mount options

Changes from v1:
* 2nd patch: Added check to ensure zones are in main segments

Shin'ichiro Kawasaki (2):
  f2fs: Check write pointer consistency of open zones
  f2fs: Check write pointer consistency of non-open zones

 fs/f2fs/f2fs.h     |   2 +
 fs/f2fs/recovery.c |  20 +++-
 fs/f2fs/segment.c  | 257 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c    |  11 ++
 4 files changed, 288 insertions(+), 2 deletions(-)

-- 
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
