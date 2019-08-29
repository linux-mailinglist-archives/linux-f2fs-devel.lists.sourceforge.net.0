Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9EBA11D2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Aug 2019 08:35:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3E25-0005nC-LD; Thu, 29 Aug 2019 06:35:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=137b9bc1e=shinichiro.kawasaki@wdc.com>)
 id 1i3E23-0005mu-If
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 06:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PJ/bZlG/K/AmPMSxKXJIjVdc0yZJNeL19Drhwi2FSqY=; b=IWYi6ZxAef7/LuoyF6ZuaY/XD0
 mrS3xt6IX+q6VPBlgGtMvMxlAFzJgBRUeS6+V/rcnJI/Fn8cbHt3sCGoFAncsGyUFuJ8lTKJIrMCo
 WynAp+nzPrY+0eG2TMLlP5Lh+mVkO2O3a0Z69Oxvr1nZIBzDhXb3lnzBirvlD6i2mvC8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PJ/bZlG/K/AmPMSxKXJIjVdc0yZJNeL19Drhwi2FSqY=; b=ewHaIOS58ifwCwFnpQ1qFSc3OQ
 90B0/1vwLRR285Q0J+FW3olfnDwMpPbTlnv28129+OJ+QycuuLDr1jkn3s3QHSd1FdTCF7HQ6KHnH
 oyAozf6kLF+0I4FB/FXAUkky942YeQhDU9L3+sqE5Uj+VqfkmKA+6eyjYZ48wX3Gntag=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3E22-007Wnc-Bb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Aug 2019 06:35:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567060542; x=1598596542;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZENtsUKFCJy/EVvjDP6M1U6aMUIve6ujlfdHu1yotw=;
 b=fUnzNvf2kjRQMieq1rUIbHXCbmu4vVE+31kjTdiCRYeQrXS7QXf5NsVW
 uNUeA4XHC3EbwhTeDS1hu15mLhZr0nrpGpn3I0dk4IksmTQHQooYBr2fS
 ITKmUCfD2NMd7qwqX9pzYQEo2/m5KGjg/Zc9DqCkj7w4UYSDnq6L/wvU7
 VivbhxCXcvcAx0gbJs1bbBwdP0XGh9dGGD2xjmhwR79Hbun/60aT6ZCzn
 WEKtQgfRdAT3uHyNG/fXujdOpmxS0A7WMaNXYXizzrRGI+D2MG99pEkDu
 H3NbNhaauXnnDY/pvRvPuIN2mB3DwQOeVcIDEMAVKpfYiIqS1ZDp0AaOn A==;
IronPort-SDR: KZaEhJjG54lPwMsuG9jDuGZ+qd44GgRvSH73NSZM0HlxUWH/zGy6UUxNZ/oC1vBhAeRSBbPOcG
 oAKKbmqyLwBY205wt9iDESjJMbsjUFGvSTOPW89EfyDYxBzedqs7e044HuLoWNw+tfZWy2MXC+
 u6hFcl55yLobjUqxbKgv/omMqUm5udVd4cvCvfMJ6XtFHAS0Gr5LnJOQP0nLTQc1TkUsc/XobH
 JR+0F2YXhiwoIBII9L48A3B7OjLKZHt6n+S772yRXswA+OJvglYRuAIICAwB+kzJ5agCJxLQ95
 hm8=
X-IronPort-AV: E=Sophos;i="5.64,442,1559491200"; d="scan'208";a="118511103"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 29 Aug 2019 14:35:35 +0800
IronPort-SDR: pQb3FkKTw9e4TnLaYPq3x8moO0qs5SVHQGEyfcwX8HyL3ORAIMub4P5n9eGkKombKRoWH+seww
 9Wd/Wc3udE68nSGSqVMLH20uJ5PT8T6n7vGwuZQZzq7bu37Fm9DGrzslA8njz101ma+qEZV8U8
 8kgkOef9YBrJKJFbI40eza3dKKaQGbXLs6yYxbSp/ycNppagcTtsJhoZXid065vXDHUhmd01vJ
 m174+3DbzTpIcy31WMvnN8IvLJeV8FAHwO03hgElciTChETSO8hw2fO8nrE/jOQ/L29W5vBxFG
 Ghw9aGlxakSR+AtV4qy9KrKK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 23:32:42 -0700
IronPort-SDR: ARTmC6Ob33SZTm3AZEofKoOoNgcMbLXH25FQJYKjHwMmi0EwX1vcWIR67nBYiaAVL+1XDWpw3d
 wxImOJOLU8pXjr3eC3DQaATiA3ub2V9qzQMgdC8WLG2zS3LwnikMDYqiBTr5d0Gbk+uzO8tnC7
 Zcdco9+QPZEr898XsfrEIKaoOKaVAK9Jkkf6lU5JTKrNNw0v14iT82bLl0LRrWyNsr1jeo371B
 ZhVjqgHxNBbUTl8sDcP6/uQtzw49QZL8SEU9on9ZboM4CTbZ8E/w8y3Tes1uuYG7iUW13u+no5
 Sck=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 28 Aug 2019 23:35:33 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 29 Aug 2019 15:35:30 +0900
Message-Id: <20190829063531.658-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
References: <20190829063531.658-1-shinichiro.kawasaki@wdc.com>
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
X-Headers-End: 1i3E22-007Wnc-Bb
Subject: [f2fs-dev] [PATCH v3 1/2] libf2fs_zoned: Introduce
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
index 0d9a036..7b02bca 100644
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
@@ -1279,6 +1282,8 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
 extern int f2fs_get_zoned_model(int);
 extern int f2fs_get_zone_blocks(int);
+typedef int (report_zones_cb_t)(int i, struct blk_zone *blkz, void *opaque);
+extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
 extern int f2fs_reset_zones(int);
 
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index af00b44..127fc6e 100644
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
 
+int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
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
