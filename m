Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E675E6CBA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 08:10:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOzB3-0008Vm-8H; Mon, 28 Oct 2019 07:10:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOzB1-0008VE-9z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KCTLv+HKdeYslTsraEvrhk9+x7cDyFZTSgLZVlJsGnU=; b=I6YoA2+qrpAe+9CEQjRqi9VjYr
 lR9upS7U8GbLOQEI7Rs1GMZIWg5JEs/1NOP3I8J+3py9ESmFzpe6a988FC6Kc4Z3I3Gd2W1yTpjW6
 5cuNBUX+2zCRA1MNoxd5LgWDId6D6hMFXgAEh/KcJWDYaGDOpwf2oiy5vMZN2/5B2kWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCTLv+HKdeYslTsraEvrhk9+x7cDyFZTSgLZVlJsGnU=; b=LRPqygvPpfZjOYlfLfeYhFNJ4a
 uP+3IXip46ajbcDzVbr6EZXa95rOpk5zgKIOxV/UIZgna4xuXebN8eGQvT9afLA0/loT35/2COovs
 GnpqNI8P4miv8omhJ5qlLPnQiv+rK2lYicjRuE4cH5mIsYdNEJ8w6WCF+NUv6DCp34QY=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOzB0-0064pg-3y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572246655; x=1603782655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwOiG/YkYVcjqLibRhdqu0KgsgpO+IWp8751HNYm+RY=;
 b=U31t/5B3mNENGSmut+9UdmxZeNOj06a4uqdhwEcRPd47LGYxhbx0fP95
 vwRvet1+buakrhxrNU+BEv+P9T5zLPiuU+Yv/NpUvRdh6hmYlQyfSSDyd
 QtqWlkYM39mWNhzImlB8hGxgjA4PMkIb3ZjJTlT7umes8s1PSIaRnCqmG
 TbdoO5iZtc1QvqaPotUPIgNzv79VeEsxMHlYA72kjcN3MIUJ1dJWxs8Js
 ST9cDuN6cIf88o5UgB4bL/VcjcHw8ImJv6tabyl3KU2i/phgQPMtFxotJ
 gZ5Fg93XFV1Y9vxYNGPvT6IdTu2q0KVLXyXAZqw7UjF8UvDwoMcfCMtcj w==;
IronPort-SDR: L5LMBGRS4lZYuUOkcaNF0l+MIPVHF6r4oTKB24MleKWeJTamIoi3P/dw/YnxnO0nCc4KRYA7v6
 oe3Aub8qTYyHs8dIMoflRA8kipYkv+6pPAQQm0TQZZ9pUiqLstFnA+JRegJGe3eyynK+29CBMC
 yazlK9vI5V4dZiYkDDQmlmgCOlSqi4W/tZC5JSAScAh1gu7cQ+lRd09q2yUW51qBx1doOKIriq
 DZvH3g+QYPaQIcc6+BCpQU+2eL4K13yTYPlCasPt/vV8biYA+1nMSFs120Koe0u4qDukEvTiW6
 F50=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="123045797"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:16 +0800
IronPort-SDR: FwP1+u6fXBG70peLoY4DELDKvrZae9GBbvlYuMWzJK+G0Np6qEbjYQtPi6Gd+Cbzq+mGJmbmzl
 CjTryEtvw7sHff1bhL5GAk9T+kCn1gIkpEkZLU7D8o428TU8XTcDEWzH0NXDL/sUX8JIIGyHFE
 4O/P0GI3PqFRodLw7mFeNHPp2PPDnQX36CK07PVU42Gcvib0JSwV5Fa35Rhm71I4sSpMkBBlo2
 y2uD1ceAM+eLDS9muMKhX0t6SI9PikxPUi57Jx1OoZNsTMKCfki16EANP3rKi25uh7K1Pr9i/9
 CY05SywI1HMrnSbsURYaJ4kr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:37 -0700
IronPort-SDR: EfuVYM9MGKq3aFoYpoHmDqSv/vs9KY7Ay61EO3bIYNWLjAXNLNChlwsrrAzARhCFSabOcbrla+
 UZ5B3BxuxCmAEOaKZTwqm43BbeUVE++pyLCMomDilXCDYVWimXRI+rM/53/BlY+JhqRBsKM2u6
 Ew4Flt1ig/lmjTVof+d2QIQIv7w4lmlkMGBasCmX3x52XVXLjgUIP1CHmRvqIC6ibZ/SX06dCP
 0vyzhEOQTj+obuszH4WDXkwMFFkrqerK/+hSoHTzDHudysBrzHZo2GlBy/iW72nm0p9gdeHtcz
 QjA=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:15 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:05 +0900
Message-Id: <20191028065512.27876-2-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iOzB0-0064pg-3y
Subject: [f2fs-dev] [PATCH v6 1/8] libf2fs_zoned: Introduce
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
index af00b44..8ad4171 100644
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
+	ERR_MSG("%d: Unsupported zoned block device\n", i);
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
