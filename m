Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C688DBDF0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLME8-0008Ug-67; Fri, 18 Oct 2019 06:59:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLME6-0008UP-N1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rToCPTwDtFDYgxx+hLb1gho2Yk7+DpcKr44n1GWny48=; b=ACBmq91bg71w/UPt0oAGcvcpCh
 KnxFZfHi36wCq8s5CDGExPvwebl/MUm2eu6ljx+7hb8O9EfopzzjZRyuTizIERwntCHXbI0tyhA7H
 1YRFSlZz3XSjrNW+ZCVzWlqHg/q4wU3kl2fYtVhgH9eJDI1BajxYdXRdU5FRn/tZG74M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rToCPTwDtFDYgxx+hLb1gho2Yk7+DpcKr44n1GWny48=; b=SE27kuBM2ojwUmHRr7/JQ6tOco
 w38Uxw3BG7KnYyoJibIW7fiaych24xzEXyNcpN32f45cTaVRQQYSjnWhIwcK61zuzxiPLTtx17kR4
 O0C9YBCzm7VX+vHVfq406n1DeDV2uHpRQGKjgtqXqbUx/Z5sbRecX81RwSZCab/7Ec6I=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME5-006J4B-JG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571382002; x=1602918002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gtfyFaKgr5YjsTdrTYjlkHytKIvk+J2+YNQLFZwIWCI=;
 b=ZPm7YS8K2pssH0sPF2sjLhicFKe+4/6ya7rs9XDU1ceRdRLb8VoxBU8t
 QaqQ+2cvsADtec5afH8didpChAVZpkDj3LFpLXRrW6mg/xZa3vQ/J+jjM
 D5011W3I4NQmPKsMI//78g1Sr+NSZXQSIv0fyTxAyNgaOVuPuUCefcaRz
 Cfd54lfQ34aHrgvlAvdXrlHwJJ2w7vHrxisPa42Q1VuhrpcOUJMgRLKRk
 1UUDJJWCZyjdQ5/eVZz0qM8H+aklXaVH4Wnfwo2p8iVQ+O1rocThVHJvW
 ob/kcuMPoHGrcsu8TLV+e5aCrPBeclr3BNBTtgmhN3mfrmJ5hN8S3+Aad g==;
IronPort-SDR: yUlyInCr04xfIsPJlNtKRPS2fF9yexp9qfFmpR/IZiKQu+59ADON5JfbvoOLICK/IZy/lMxMCf
 F4sNefj2xokicE+ltOMriYNdwmczFurLuFyJJtrc4A7+wfKjBlJwIcyKPjX3s0hyu8tW5i2y/X
 PZLzEMhXWedXXHgZvbPh9cZiY1U5KwJ0JTrquo7xBlIBJvTLwkVGJmCaTnuI9erHmeQIXM2+4U
 BJTYnSeQ04fUyRD0KoRQsQdC6iTyAQtVnFkinGdY/GtYaSuWmJwn/yZw4rTfncPSnp6JKiUbVw
 Kac=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884343"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:07 +0800
IronPort-SDR: VjFVFKkXMKR3eSf9YOMuWjQbEhiC2uXfnya6qlVaLKxdPz013Hs/ch31gibTt7LiUfVkxtD/b0
 +X64r4jRbZUK2wOS5K+cPJB5+reG3UORqNJZq0gwUhanRVWK19tfh5pd5URK0xRGHYdyVVWUk6
 uUrNRQq+xtBu78zdSWdb2YKERCXvjc4e9/z/giFqNGl6H4lR+pxrRCcPD0LKy077+tPFBNmz6o
 pdao42Ta8nz/c4PdLmBotIk+WIpkOUWKBOyZYCUgQA4CZ3jO/oNqDmB196yXkI3BEMi7DQHE0K
 nhIEeXj2T67d7ZZFvU/VYCpY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:29 -0700
IronPort-SDR: WIHHWZ8XO5/EatjishADM67BXa7BpwJ1YCJqkPNz6bAEuJAdQmiuwpJSZ3hcR/xGl8GXuSKdgg
 uLkMnHdAZXfPaZklmWdyZXbrQ/cvZx6LnXbXwSPNqOkXclxZW74Xakl+jMdYnxVPLzRs2k5Pp5
 x//gPhj1KKTrQ3QGyBJG8FB7nhhstPuZbXGxyH/AsbYCzQAUrhtWueP7N3YQpImwTTLwSKpS5R
 LHk1pqmy35gj7LQwBi0aPORwXkdBln57STpV9uxUL9T/SOkW1Tg4KY7s8wL2HUMx6zrwypSZLO
 PBM=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:45 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:35 +0900
Message-Id: <20191018063740.2746-4-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iLME5-006J4B-JG
Subject: [f2fs-dev] [PATCH v5 3/8] libf2fs_zoned: Introduce
 f2fs_reset_zone() helper function
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

To prepare for write pointer consistency fix by fsck, add
f2fs_reset_zone() helper function which calls RESET ZONE command. The
function is added to lib/libf2fs_zoned which gathers zoned block device
related functions.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 include/f2fs_fs.h   |  1 +
 lib/libf2fs_zoned.c | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 1f7ef05..a36927b 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1303,6 +1303,7 @@ extern int f2fs_report_zone(int, u_int64_t, void *);
 typedef int (report_zones_cb_t)(int i, void *, void *);
 extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
+int f2fs_reset_zone(int, void *);
 extern int f2fs_reset_zones(int);
 
 #define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 10d6d0b..1335038 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -388,6 +388,26 @@ out:
 	return ret;
 }
 
+int f2fs_reset_zone(int i, void *blkzone)
+{
+	struct blk_zone *blkz = (struct blk_zone *)blkzone;
+	struct device_info *dev = c.devices + i;
+	struct blk_zone_range range;
+	int ret;
+
+	if (!blk_zone_seq(blkz) || blk_zone_empty(blkz))
+		return 0;
+
+	/* Non empty sequential zone: reset */
+	range.sector = blk_zone_sector(blkz);
+	range.nr_sectors = blk_zone_length(blkz);
+	ret = ioctl(dev->fd, BLKRESETZONE, &range);
+	if (ret != 0)
+		ERR_MSG("ioctl BLKRESETZONE failed\n");
+
+	return ret;
+}
+
 int f2fs_reset_zones(int j)
 {
 	struct device_info *dev = c.devices + j;
@@ -491,6 +511,12 @@ int f2fs_check_zones(int i)
 	return -1;
 }
 
+int f2fs_reset_zone(int i, void *blkzone)
+{
+	ERR_MSG("%d: Zoned block devices are not supported\n", i);
+	return -1;
+}
+
 int f2fs_reset_zones(int i)
 {
 	ERR_MSG("%d: Zoned block devices are not supported\n", i);
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
