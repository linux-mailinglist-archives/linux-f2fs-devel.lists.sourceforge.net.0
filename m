Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B41E91EEB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 10:30:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzd3v-0007W0-44; Mon, 19 Aug 2019 08:30:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=127c8b87f=shinichiro.kawasaki@wdc.com>)
 id 1hzd3t-0007Vs-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Htf+n1qzaJTfrJfw0K/Iy6HgzkAF30rUgK0T5qs0RY=; b=Dexwz6omHdJdqFJoQ9j2JUatmZ
 +HuzoA3r9rKCupjATI6Z7B7ThRFRSzhqRLM5frcoWVMRDmsAM9EqhCwbJ3GynEeg84JidCEUH15wm
 N0bFbkoeyyBX0sx9qdpWLspwVoS8pjfRHJ8R8ABNvIo9a9GNcHIwaAYq4Yjys+rPu1Bw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Htf+n1qzaJTfrJfw0K/Iy6HgzkAF30rUgK0T5qs0RY=; b=ZqIf0Zk2/FURRYk/fcgL6SFNss
 SmJ86hty/PZXASFYVlFx+DIfmAHfQ9gxu+Njiabjb+pfERv3s56fhNihawGufAVEjnRBcMtDd7bdt
 xBwDJtLUDF6HCk6tegmxqnFyu2fQjiz2KvYX3mGSi5Itv+S8tVys1j5b1/rPeu4fRewA=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzd3s-008W8j-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566203462; x=1597739462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rnsuX6XcZ1jpnoXXzQlo6xByHz+p8Bds6MJur3bH0J8=;
 b=e+WyJcvVFZQprXGin/y+0Z4Miq/HPzgyXel6QeO/L67hLt0jGGfsX9aZ
 qlEMaiMCW95mAa7IvDhOalb6f4KsGfPDtf4u1S6fwFNthJ0ZkSf8eqnjd
 Jmadf/09D9fOJNmM/OrOMuSSQzi+UuwrxK3DooYmoIJoxGfokAADThCYw
 8/Mwq9kUsACm2vHyD0D8JxQ3rPMna5Kr96+ihvwSK6JNK6RjaXfWF4+d2
 R1QbmK+YpWjSZUus+49UhJEZlXRjWNByXqaiBShOq5QvFqeg7JO39KoTv
 o9XGWdikRBPXHdvbiV9W1LVwuLiCBFVZfhEdAPNO4ABpP9iVm6c3Levym w==;
IronPort-SDR: /y2nDNIVd+QCX4E2pU6LY4Qa7wQSpDKzU/Dldrky6fpo1wtwII6pBTY4dXSVvobNnGGeTQJUh4
 fCYswzcgmzZNwLAxl446e8aaLjDDbeyt4SHKTrMcEiQvpwv0gzlvWXnBJ6YO8x4MSbDR2m38co
 AM8xGJWVcDOsxXPcm/4JIQgEjUg8hlNwitXAAwBiQcaQhMD+vnIcWvFSOtXjVt5SqA+LK964+G
 pH41tMW1hAz0yK4nsnFiS64tXjMC6y0azVVYdvGLDY25h7lksXs/yF3NiZPXNNGG1AA0IbctoV
 15c=
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="216517046"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Aug 2019 16:30:52 +0800
IronPort-SDR: gjn9EPKoQ/WfJxMaRnTMPqRB4Mdc60967fnl/PexRo//AKA64Ec9sQiMtdFQe/MAxeR8VaCfrQ
 tHsLUHUmzogeJHv58AlRenSvVXQ2mx6T7eceNqGfrXa7NXp9qY5mvbCWpkW/0Cm7Mob2I23Hn5
 dohByk3hjO1nSuhJ1ECoPFjaWkwcMDTDDvmUCHHa1NA3WwTzoB8Eh4gMFRMmwVzTh9mzyonqjI
 RjYDTRU0dRuHuTXYHPAAEyVn+rL54iwEqKxcsPlx7F0+Un8duIRq8+PJ98jUkYzUOM7E1M48ES
 3VTCRrm7oeL1K+RHvsHK/LBZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 01:28:03 -0700
IronPort-SDR: 6zaTN5LL5a3XYscH6QmVHTGhOAQALrB1ycoB2j2AQrUo+YgySKUtGF7PdnrmwqphDWqjF+AfEV
 pU0R2+g/vHeo+3ALKgv7/Jb66Dy+FG8/81A609HkHoV9X0wX8xI1NH9rKe3uC485+49FM4h2dD
 zEwc36V5nlvM4jltTmpGk+tvv8MGszaR5hJdftM02RWufkbyhq7GjqiGJJGUMYiPXblggyEH7g
 Pl3+6w0h9/8kBl1zwTFUKkRCqd7JLpvtxz6r5NhKP8fDJl7RAZ6qH6YGxTMckwvSPwRrGJ/3of
 vUc=
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Aug 2019 01:30:37 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 19 Aug 2019 17:30:32 +0900
Message-Id: <20190819083034.18218-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190819083034.18218-1-shinichiro.kawasaki@wdc.com>
References: <20190819083034.18218-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1hzd3s-008W8j-Kx
Subject: [f2fs-dev] [PATCH 2/4] libf2fs_zoned: Introduce f2fs_reset_zone()
 function
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

To allow fsck to reset a zone with inconsistent write pointer, introduce
a helper function f2fs_reset_zone().

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 include/f2fs_fs.h   |  1 +
 lib/libf2fs_zoned.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 7d2cdda..ca6e7c2 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1299,6 +1299,7 @@ extern int f2fs_get_zone_blocks(int);
 typedef int (report_zones_cb_t)(int i, struct blk_zone *blkz, void *opaque);
 extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
+int f2fs_reset_zone(struct device_info *dev, struct blk_zone *blkz);
 extern int f2fs_reset_zones(int);
 
 #define SIZE_ALIGN(val, size)	((val) + (size) - 1) / (size)
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index fc4974f..f56fa62 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -359,6 +359,24 @@ out:
 	return ret;
 }
 
+int f2fs_reset_zone(struct device_info *dev, struct blk_zone *blkz)
+{
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
@@ -456,6 +474,12 @@ int f2fs_check_zones(int i)
 	return -1;
 }
 
+int f2fs_reset_zone(struct device_info *dev, struct blk_zone *blkz)
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
