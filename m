Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44119E6CBB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 08:11:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOzB5-0004er-3i; Mon, 28 Oct 2019 07:10:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOzB3-0004eS-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aUqbsfBTNgfkrF3Ld1Mp1qEmGvpdPEiAcwDQ57ln9EY=; b=QHhnYcqVMOnykhs2uQJ8vbLFBE
 vMONhvLKVMGJcNO3kDNuSEcHO7kyaKjLByKOGudakurwRjijZIX9qyTe30Tug7tqTYPgbsZx/aIgq
 crLMFzk7prtudR89v15P0GBHwWQu3QK5yoWNgn7VZkOOtUn78N5Zvki3v7X3Hio/Om9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aUqbsfBTNgfkrF3Ld1Mp1qEmGvpdPEiAcwDQ57ln9EY=; b=aEImdeBCRT5aKB5IQdBcC8S6iK
 21dzXRnH3cDqxphXiGoaHfarocS515t3WjvDoCyvAT8yjGNb3qbKqMDhTP+fEfqu5Btn6lvPzjRtb
 Jh7X1O033Q4fho9V22HLhXTiajD/hiV33Js4QXuLbcsROgbWYDZKz1fSajA8kxFN/eSg=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOzB2-0064pg-Fi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572246657; x=1603782657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bA9z+FLqSks9kwACUo5FVEfERKLw4WciQq5bT4tmHL0=;
 b=jgOPSI7XytBlC3P72BrWiGfjSoRMFDeMNga2Ly3scl7aG21bNrcxusRd
 FU/Z4yVbO/VpIQ5Uw5kSflP0nb1r9dhToJO9O321s4fmEyJhtteqaWNzY
 OGw/VABtRSuLDqpHdwoCAX+nlygn870t3dcu6DJiWADVUzmsYBm+KPo4Q
 +625m1Ho3TU/sLt8Orb6gLyJwAEU5EtpylLsrtjPv3X/V2wEN6IU5DZma
 z7YMjIPnky2RdMPldLAjgvtkZrn9RY1amepZPf4ZWy8ncQfA6TBUc5ZVF
 W+pxk8081l89AxlkgALQSjBIcngEsXgTGo3mFpU9CNjEq+7nZj7qH431f g==;
IronPort-SDR: uwo5HnUWA0Q7wOCZ+TJPcsyfPoXDfiu3RcMC+dAoMGxe1cA6eZL+WBWUkwMk+3Irlf3RnNKC8I
 9tjRaD0yMjfS6JmCfyQocKqvfzBOYIlBANAA8DjvhKhXpoh4KYJkDjY8qVCO5z4hTMYPtAeNq3
 0zKbRhlp5eKqNMs7jKH+8ZosLTOh30rixnGYxanPsRp56e1pjwhNkVBvMt2d7iVGIh4meXKdFV
 i49PcSA5Wbm02yR9pHB8AF0uGU3TQ4I85sTjABZLJ2amkLI5a09qqPWnmFvcW6H3+Vc3FisVIh
 b3U=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="123045800"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:18 +0800
IronPort-SDR: zFSpi/+EX+sdU5f0XZGCH4/gC5LanM+qw+4JGZaomb3K+0R7rSbvcvCFb/iIzRHDnr82NfCc53
 5fwiK1LOuuh0MiOkmmc98SDC5GBMfmaWVS10z03J1ySJYl8NBOYQDfI2q2KU+qmDpn4TtCOGN6
 xMFznv2NG/1fAAP/iyRN3/1/AlgJ1i2CaxOyk0gdU2x+fRvN8n/jgoNszE8e8VzYDySTLtGnHk
 1KeAZ/chjBN8syohGtSl+NlSF+WEPocLI79cftWuggv+4NDwaCFHFRAHg2kmfI6NJOtJ5E3FcW
 Ozpy1tW/djAd7iTsFkwJrlYN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:39 -0700
IronPort-SDR: QHDOnNldb8v6clOFN6LZiQo4ZtP0bgadiKAuIY037Iqgjj8iZ+t5G15l+jhtba3qEdh4McHNlg
 E9eVZGyS5ics3V6DTFsUFpBOoO7V75QbKUy//728PTrR53fcrPjr6qegqmvkXmLRR9VaizNCe6
 xMc2GWMRfSlHQ52BayHWrqdfHJYGUep6zpvmd+BhP5FHcGsoO75r1uITH3Yli8o7S5gNWBdom2
 JtH6zIg+y1/W9gsmy4rgAof3NxBxifex2a0lEnVbrlyzGnL0ogqmESFAPiHSl/swib/mIA0ibL
 cr0=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:17 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:07 +0900
Message-Id: <20191028065512.27876-4-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
References: <20191028065512.27876-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iOzB2-0064pg-Fi
Subject: [f2fs-dev] [PATCH v6 3/8] libf2fs_zoned: Introduce
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

When f2fs-tools are built without blkzoned.h kernel header, the helper
function f2fs_reset_zone() prints an error message as other helper
functions in lib/libf2fs_zoned print. To make the message consistent
through the all helper functions, modify message strings in
f2fs_check_zones() and f2fs_reset_zones().

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 include/f2fs_fs.h   |  1 +
 lib/libf2fs_zoned.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

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
index 5328c56..8b88fe9 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -388,6 +388,28 @@ out:
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
+	if (ret != 0) {
+		ret = -errno;
+		ERR_MSG("ioctl BLKRESETZONE failed: errno=%d\n", errno);
+	}
+
+	return ret;
+}
+
 int f2fs_reset_zones(int j)
 {
 	struct device_info *dev = c.devices + j;
@@ -487,13 +509,19 @@ int f2fs_get_zone_blocks(int i)
 
 int f2fs_check_zones(int i)
 {
-	ERR_MSG("%d: Zoned block devices are not supported\n", i);
+	ERR_MSG("%d: Unsupported zoned block device\n", i);
+	return -1;
+}
+
+int f2fs_reset_zone(int i, void *blkzone)
+{
+	ERR_MSG("%d: Unsupported zoned block device\n", i);
 	return -1;
 }
 
 int f2fs_reset_zones(int i)
 {
-	ERR_MSG("%d: Zoned block devices are not supported\n", i);
+	ERR_MSG("%d: Unsupported zoned block device\n", i);
 	return -1;
 }
 
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
