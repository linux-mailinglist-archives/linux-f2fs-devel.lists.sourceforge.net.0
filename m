Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 734843AA47B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 21:42:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltbQc-00030Q-2v; Wed, 16 Jun 2021 19:42:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=794aa3ce7=aravind.ramesh@wdc.com>)
 id 1ltbQa-00030F-Dd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 19:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1fGQJ0KgZEHFgL6eIC/SqH8TwxhLrFN0KHsZ1ZNFBZ8=; b=Li7b5yHAvtg+0opWncxl0dedNW
 eq5ukn6Eumyg6aoGiM02HvYzZTaNgRKtWW98JLjICitjrLXoJyKk0s32pWhiejG5sEtqMuIcK7Ryl
 CHwcw0+lbu5+3JAEEnyIJFmkoHl2ko9yVzCSs1iH8WeSzbfsjZPaRxU7DEXIz5T7hAGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1fGQJ0KgZEHFgL6eIC/SqH8TwxhLrFN0KHsZ1ZNFBZ8=; b=P
 kMXCkIfSXWPaM5s7WKBmE2luuWrVuHTz/Z4jyaThBbHJNUgf+rq4YezeYYGXKt87qekdIjSMcp0BG
 UYD9WfAEmiLX9Xzj+CWGiBfsoRYLPwQLVflmBZDYiHLpHVah6f3FQxRwDLXalKuCeF/z+2CtaGOA1
 wkSlwY6cSh1scqOU=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltbQT-00Clpa-AW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 19:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623872533; x=1655408533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XVrFcSYM4E4XitEKOikj04bcvH2clAUMY842dIJ7PMM=;
 b=NQWMSwC/wGo6SZaFzsFD8GYHf5qTdsTfPhwT5D4KiLXfeoe0UVI6QaMa
 zANrR+eD031cgqpiqftfxbl1coOpXhcoNrSw3ostm3X9LeQcWZDBq3Ffu
 76Q4mmk5KcQMfdO7iBoDJW1ii8ok7M7lwFW1GyjqUlexrdPr/9la27xEm
 AvCz+4snuT8PQVss7nHBQxv4DujnQeDcFcjqZuZ0RSgVB9vmAPKXKbKuT
 91TtzaDUff72/wwrL6H2EkfnzSse1nbTYaHGTsa+Uzm1z6PlcMJKQDqpO
 QKq5/55dg30mEKpOTJFH8w4KFHsxt8vUwSgDmV2e/5N5KLHOFhS6D8skI A==;
IronPort-SDR: upLs3rSYLe12NyXs0T+F12iYDLXVRtS1f2iue9n1u35YVQHZspD1P8WLhWoXRG6MhWLM5Fnsqt
 rrcMGkXO6M7GKmoaD1iGmkUyNVRNuXmwkS1ACHHxhbRhvp3KVsWmMYaC/09RuIF1sDfKJyA4a4
 JqbCHyZ7JZBZPzdcW7+5uayKmIdj6rie+1SQZoeWr/+WaGjtg1StmXn1YIP1WW1ZbYQzcm82S2
 i8/J9hDB/fYn+tAzG1Cac+bBUTioMrjN8u9/NoFI3mvV+/MYik8Y8ozytIVlMRGTMrL6gas/MB
 dso=
X-IronPort-AV: E=Sophos;i="5.83,278,1616428800"; d="scan'208";a="283592043"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 17 Jun 2021 03:26:23 +0800
IronPort-SDR: hGLmi7AOeqcFTKlQjZ95WPgVA3d9hUwJD6imShWzbeCc+xZcHEICIrVMryNzi3lBXxqRFGSpbp
 zDrGo46x9gpgSanoBFMpgrp0AJ4U4K0x9yAs+CHM6Pd6lRc1eaBjnIEU5BHTrcU09twy9B6D8n
 TxXXYQ0S+WIKtCxxqKNeZjS/RaQnk1XEDCUCZkEfUxvDZVDMisr8LIrcJqctv/7fWf+B5maIuY
 TIzmd1gpHrL7ZMVaeTpiaVD+d4DLG4B3W8c2sXOXdRe0Ttb9pM4SgmGHY+xe3moijjhryWWTbK
 in+Nkii1x0EhVtUYpMohTTyq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 12:03:51 -0700
IronPort-SDR: 1PbULjReOUec3GkNBk30LKnl+e/o0zv+AFJcJhJXLHgSzbMQu5ss82vHdcFsubfRiPfK09JNOf
 JqYCcE8v1k8kl+tE/GyHvNb768V56ltcGOOJCg7l80sBezc6JdXCsgAGlXkqvkVDOy4LpEYRlC
 Q2nwCh/9cKbdDKthLxPUb2uFEYrXDK437Ie4V4a+78lAEIASkzr0YrSGwIvp/kkWyNpiXj4B9c
 r68lWxpS3cpRXfqht4SPcKmqsG+o7YHzgOc4RKSb7IKon3G6ovULFWKUafoAB31O3HQThSkJUH
 l64=
WDCIronportException: Internal
Received: from dellx5.wdc.com (HELO dellx1.cphwdc) ([10.200.210.113])
 by uls-op-cesaip01.wdc.com with ESMTP; 16 Jun 2021 12:26:23 -0700
From: Aravind Ramesh <aravind.ramesh@wdc.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 16 Jun 2021 19:25:58 +0000
Message-Id: <20210616192558.1655258-1-aravind.ramesh@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltbQT-00Clpa-AW
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix metadata region overlap with
 zoned block device zones
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For a volume using a zoned block device without conventional zones
(e.g. a NVMe ZNS drive), a regular block device must be used to store
metadata so that in-place metadata writes can be executed. The zoned
block device cannot contain any metadata blocks requiring in-place
update (e.g. bitmap blocks). When formatting a volume that contains
host managed zoned block devices, make sure that the conventional device
used to store metadata is large enough to avoid write errors.

Signed-off-by: Aravind Ramesh <aravind.ramesh@wdc.com>
---
 mkfs/f2fs_format.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 3565bd3..2132852 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -440,6 +440,21 @@ static int f2fs_prepare_super_block(void)
 					main_blkzone);
 			return -1;
 		}
+		/*
+		 * Check if conventional device has enough space
+		 * to accommodate all metadata, zoned device should
+		 * not overlap to metadata area.
+		 */
+		for (i = 1; i < c.ndevs; i++) {
+			if (c.devices[i].zoned_model == F2FS_ZONED_HM &&
+				c.devices[i].start_blkaddr < get_sb(main_blkaddr)) {
+				MSG(0, "\tError: Conventional device %s is too small,"
+					" (%"PRIu64" MiB needed).\n", c.devices[0].path,
+					(get_sb(main_blkaddr) -
+					c.devices[i].start_blkaddr) >> 8);
+				return -1;
+			}
+		}
 	}
 
 	total_zones = get_sb(segment_count) / (c.segs_per_zone) -
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
