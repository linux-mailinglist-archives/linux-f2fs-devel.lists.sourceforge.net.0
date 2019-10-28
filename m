Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B60E6CB8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 08:10:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOzB1-0001LM-Nq; Mon, 28 Oct 2019 07:10:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOzB0-0001LE-42
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ppEsY0YbeSYx+GJKM45xvgahDdyyCsIRdpY91XBZgzk=; b=SG0ZL1Ja2I7O9SzVPg2czN710Y
 svhLO6Hc6yEiT8fP/gThRqlrxQlNA8Dq7/1OhmM/SftBgN2Z4icDShnuXElDAS2CY1rsRS7cVH3hQ
 aw6NOWbZBrRkEhRLULVqM10iYwA+BkCXiOOsIdA5MFuMIGyU1L7PaAYId2tx2Ueh+hfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ppEsY0YbeSYx+GJKM45xvgahDdyyCsIRdpY91XBZgzk=; b=G
 3649pJy2ffZAxBYkTuFY49Bhd78W8SsFByVaBpKlRwbqUY6S63RvewLLXjgkQWVurFY1QR0LHyx4C
 /suEAR/JZuMKVnXg60+d7dpBSNS9lkPJioxXHKiX12xtHcJeL/sMyKLWeq2/YETCaHZaVaEjjFdjf
 gRrccz0uTZau+QAE=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOzAx-0064pg-Kf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572246652; x=1603782652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yD7ZTh9Q22bKMNRO7/P+FmUL0Y7SMBB0EJs9YBy3jfE=;
 b=qN31TmHBvumwb9sM9NKPk/+/o70oE9NNFmLVXFWFEZH9O3d7wzEPLfWp
 FVnOFnEf1AkQe+eiH6Mepu2wnscOMwJBUdnVex0NDfpVEM8qJhpqPE6ec
 vUQ7lsUgB+oVIQMM2181am4miv38dWnacqfEZ8AW6aM1xtSriNL4bXnL6
 BIIfmcVcOZf6mwdNK7hNfTqEpStGbBVPYKjD8XJMw5NSzJ2zuhNpC3gWa
 YDimBtWOpOgweLqna2BXKBBV/6LomZjFjbWO69/KQKsKd31h/poZLEsnU
 +S+5I+8T2coSuIvG0IRANHc7D5qtNOcJJh+O0R7rvCG6jYpE0Y/z2BLYc w==;
IronPort-SDR: yNg38XWyypSVZV4bFmCUwsVHxOTLYCfESV0r1HcykJcVYNTQT6nT5mN3cxaJLlShOamd4Nk0s7
 wbRnbIffqPoOON3T2JsUjzanx2NZusa/K+2S8U4h3665LOjS3JjfnABiPGtfNcwMfW0Y5M0aay
 TBTAvkAS81qzNAcv7OA9o2Fjl3+JerCteu+J2ZdF9b48RVtCR4UTkCQvG1zyqsO1ezock5tmuO
 J15g7ZymsglQ8pDqQQR/3ebzKwWPMCNItEW4uUyU2mhALXg7l+t3D0FBovEVITKYGwoB1N3zBn
 Sc8=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="123045793"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:15 +0800
IronPort-SDR: ZQJrpUQQvSpBNHExIMjgTVv2iKF69efPch3GXsnfENzj8od6ynI8yw0EPbpskTGEToG+BN8/6y
 ODToTPykHb+96qGs5luMNGuskV3wqbtdnFgn7ZojboYUzltYZEv9nmsS9uRLmFl/9bdiSxCuFu
 JEBKo3KjDEB7RZ7MJWojuOUkqPguGH7o8yjwp2hhwO538lawH2rAWoKVERIfKGXg7QerxBNBbK
 +itY4LWWGeuprgmehj/uunztN1tOY7uix24WUSQabuQA4h3qM8r1KyvRCJSG732auWRW2+kY6A
 UxnMF0X1wUL/ay4Y4m1aYBJf
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:36 -0700
IronPort-SDR: +fdu/iHz7V+6vJprgJcLNemiashmYjC/ynp3K7zL2TLogOzn+ZV+ORyTS7z/44M8tqcGYo6ewB
 g3DIq28qq/rEktQIEPilK4kGTLyeV3a2YXwC+jOlnN3kyeVGcj6Bfck5foBqt9715DPigZHVYl
 ytGwbHivb7jQUw48IbvUGXPk6ejtI584jyDlNhHFgUroUkzJhXG0OvsLZO3khsY+UiMzcwAeMn
 jB6fwm6zJuuWaiW2z/Yao4EJA4YmpPdinE3icFbyMj/aEklyQjerbhcOBiqdiNBnnZqevaqV8D
 Bls=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:14 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:04 +0900
Message-Id: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iOzAx-0064pg-Kf
Subject: [f2fs-dev] [PATCH v6 0/8] fsck: Check write pointers of zoned block
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
 fsck/f2fs.h         |   5 +
 fsck/fsck.c         | 273 ++++++++++++++++++++++++++++++++++++++++++++
 fsck/fsck.h         |  11 +-
 fsck/main.c         |   2 +
 fsck/mount.c        | 137 +++++++++++++++-------
 fsck/segment.c      |   4 +-
 include/f2fs_fs.h   |   7 ++
 lib/libf2fs_zoned.c | 124 +++++++++++++++++++-
 9 files changed, 519 insertions(+), 46 deletions(-)

-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
