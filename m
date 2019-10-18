Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D2DBDEE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLME5-0006fA-H6; Fri, 18 Oct 2019 06:59:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLME4-0006f3-Gp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q3iWZukBBMjALo54YQIBo5QbBvALZPXjmHpMzEecqAQ=; b=l1JSLx67yVoo9A8ZsHz2Hv46/g
 anyUgET67ukEGij8re7h/vOwh1MIi0ZyIFw9xc8FnYsFd/wP4rQdxYUy2JDAJlaRQT86Nbk6+rv+0
 VNzjRKKgxhdNb9mCdfbRdg22aeQEKCeJ/CMldW7IeiKnu4D60EWPdUkGbdyborcCdABg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q3iWZukBBMjALo54YQIBo5QbBvALZPXjmHpMzEecqAQ=; b=YSoVPbl6YK7D9am7lqZBCh+B75
 mtYGDQt6VI8paVbOIQF+B80M18KUy8u5nkGun19MrBvzgrjlevtEDftupfPjPteGvlKSCu6BdB8sK
 TTPztPIkosNvSKfUcUIk+GpRxP2uHHvtr/N4w325oSWsdxO1JgUOY/SOpRd3ZuzxhEQk=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME3-006J4B-50
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571381999; x=1602917999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wnBo2zJTmRz144OkfoVTTA4jXm26x1unwGR2allVUQQ=;
 b=rot93VdrxGlRrvHEy6abtkBRkDHXWjFxTFzrBKv6E12LHKo/PjreL20i
 dKFJY17p0y9+rOGKA4zNm6fdXCaF1hq0T4t2ZkGKTXwHStupGe9eJPm13
 9rTsH7SkeP6WMfCFCLXQ3a9ywS3B6PDziIhtJyIrli5QJ9Yyg69I1ysAb
 5prBR94SToaCQ0fm0bNqSFC0NiOCCww8kCg4hOdLSJwJs6/iCcStmXYSH
 mWL9/T8ic0R9NlmNACbGLRp+W5t0OHPX7jhsP6QEUPFpnK8MgiX/PypCB
 RuYdltXJo2d75oW3NadOEfMVMwINz/oEEA6UTzBAWsfT4dLTb4vwbpLO8 w==;
IronPort-SDR: TjosjkuH3efZ8H/ruyaDs7Ty1ASeMQEzbde+HtnIlNYVQbn6r7KA6tCvFn307Z1YcTbkDD8h3S
 UafnoNTBBhRSBkkn0MvPuJYQhuHjEsEpvFoqvQfg8SRqhHX1OGi8pqunoTsksY4O2ainQ2ulw/
 lED8vUdxQDY43J6diN1Qs44YqFImELcubsncTIh43CMme9eGjkWHGezvw1+ek3VUBgmGOtysGd
 AypYN+qDAk+TrTOayyfJQdj1xPsvLCCveEFqYhbzkb4AdW2bsEHaOjebnGiERyNqynDuel4GC7
 IpE=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884336"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:04 +0800
IronPort-SDR: gqGByL3Gfb69GA4vvPp5ULSzdI97EvkNoX7DicxJFJLzMs7crvvGutWrx+ErimLJjuk2Jp5rjG
 Dq3ahA8gtLuPCr9eBDhFcRzLAEMcFKdcEV/eR+miJOBJth+7/vopD+qPYrfQMx7DbA0ilIbL6+
 fMRpwv+Gm9C7rnyR+SseB42J8DTkDJIOwSyreypIzqVMjSnUKa1J2pVbDfIWr6cCsNeEtFq65h
 nichoEwRcfv8320ZoGKbxQbDzsTbJGBMSWeaDczhogD5tFQKtsvdgGTbjSToDif2+OfEq8xXPS
 /ElMBs/I+v1XmUr0mW1fysQO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:27 -0700
IronPort-SDR: tqfJwHYU/U43cuQVVSsJxvGGduGN4ZaRbaIvuG4FECdGFnH48lrZeQmja+xGtp5b3oPlgliz+G
 b3Sr6SU+LnObMEdu68docJAqC3M4cPPpIT7q4/Khd/4DER5R4VTMSfwoTYcyAu1OsoiB2ZO9me
 8cIGlU8Rej5yF+LdRk270w8/FmEMF3sjiFZNtpqS7GMOZtvMNr1n2yQw+2f0zi9ftNQt5C/Fq4
 3l10a83nEecLpMMGYrAgfKXbGYNOQWbElIJ1b8oHmOUP22tOEf0eGehpgBHCXbW6otqb6apboh
 yy0=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:42 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:33 +0900
Message-Id: <20191018063740.2746-2-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iLME3-006J4B-50
Subject: [f2fs-dev] [PATCH v5 1/8] libf2fs_zoned: Introduce
 f2fs_report_zones() helper function
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

To prepare for write pointer consistency check by fsck, add
f2fs_report_zones() helper function which calls REPORT ZONE command to
get write pointer status. The function is added to lib/libf2fs_zoned
which gathers zoned block device related functions.

To check write pointer consistency with f2fs meta data, fsck needs to
refer both of reported zone information and f2fs super block structure
"f2fs_sb_info". However, libf2fs_zoned does not import f2fs_sb_info. To
keep f2fs_sb_info structure out of libf2fs_zoned, provide a callback
function in fsck to f2fs_report_zones() and call it for each zone.

Add SECTOR_SHIFT definition in include/f2fs_fs.h to avoid a magic number
to convert bytes into 512B sectors.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 include/f2fs_fs.h   |  5 ++++
 lib/libf2fs_zoned.c | 59 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 84f3f3e..a437379 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -279,6 +279,9 @@ static inline uint64_t bswap_64(uint64_t val)
 #endif
 #define PAGE_CACHE_SIZE		4096
 #define BITS_PER_BYTE		8
+#ifndef SECTOR_SHIFT
+#define SECTOR_SHIFT		9
+#endif
 #define F2FS_SUPER_MAGIC	0xF2F52010	/* F2FS Magic Number */
 #define CP_CHKSUM_OFFSET	4092
 #define SB_CHKSUM_OFFSET	3068
@@ -1296,6 +1299,8 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
 extern int f2fs_get_zoned_model(int);
 extern int f2fs_get_zone_blocks(int);
+typedef int (report_zones_cb_t)(int i, void *, void *);
+extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
 extern int f2fs_reset_zones(int);
 
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index af00b44..669d47e 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -193,6 +193,59 @@ int f2fs_get_zone_blocks(int i)
 
 #define F2FS_REPORT_ZONES_BUFSZ	524288
 
+int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
+{
+	struct device_info *dev = c.devices + j;
+	struct blk_zone_report *rep;
+	struct blk_zone *blkz;
+	unsigned int i, n = 0;
+	u_int64_t total_sectors = (dev->total_sectors * c.sector_size)
+		>> SECTOR_SHIFT;
+	u_int64_t sector = 0;
+	int ret = -1;
+
+	rep = malloc(F2FS_REPORT_ZONES_BUFSZ);
+	if (!rep) {
+		ERR_MSG("No memory for report zones\n");
+		return -ENOMEM;
+	}
+
+	while (sector < total_sectors) {
+
+		/* Get zone info */
+		rep->sector = sector;
+		rep->nr_zones = (F2FS_REPORT_ZONES_BUFSZ - sizeof(struct blk_zone_report))
+			/ sizeof(struct blk_zone);
+
+		ret = ioctl(dev->fd, BLKREPORTZONE, rep);
+		if (ret != 0) {
+			ret = -errno;
+			ERR_MSG("ioctl BLKREPORTZONE failed: errno=%d\n",
+				errno);
+			goto out;
+		}
+
+		if (!rep->nr_zones) {
+			ret = -EIO;
+			ERR_MSG("Unexpected ioctl BLKREPORTZONE result\n");
+			goto out;
+		}
+
+		blkz = (struct blk_zone *)(rep + 1);
+		for (i = 0; i < rep->nr_zones; i++) {
+			ret = report_zones_cb(n, blkz, opaque);
+			if (ret)
+				goto out;
+			sector = blk_zone_sector(blkz) + blk_zone_length(blkz);
+			n++;
+			blkz++;
+		}
+	}
+out:
+	free(rep);
+	return ret;
+}
+
 int f2fs_check_zones(int j)
 {
 	struct device_info *dev = c.devices + j;
@@ -372,6 +425,12 @@ out:
 
 #else
 
+int f2fs_report_zones(int i, report_zones_cb_t *report_zones_cb, void *opaque)
+{
+	ERR_MSG("%d: Zoned block devices are not supported\n", i);
+	return -1;
+}
+
 int f2fs_get_zoned_model(int i)
 {
 	struct device_info *dev = c.devices + i;
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
