Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC42EA34D3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Aug 2019 12:19:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i3e0c-0006Yu-LM; Fri, 30 Aug 2019 10:19:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=138d41eff=shinichiro.kawasaki@wdc.com>)
 id 1i3e0b-0006YS-3G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 10:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QksPOzd6+B95cL1oZxLD6fTp/PGREQh87R15uv0wR8Y=; b=jxgULcgUnKu5/8Ot9pSVAflDVq
 PmHzN7rcoh8hqcCDfrPRJ/HanFj0CZ5EsvYqdskWUybpMI1PqPAVtzDIdtLUuf9rdfikk598oZRmC
 QYNZClWn10BoQJEvMeDeec/DkK97dUFUtVVeoCB2rr4aK5orTZH1B3sc/C06Y22fuCDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QksPOzd6+B95cL1oZxLD6fTp/PGREQh87R15uv0wR8Y=; b=Dsj9fYHBmuoARvPKZUqBoEI1NB
 xG/CbbNyoWGGTv5d1t4SItGgwKsaZY6s/dRlMMwYnjXowXOkCCqlGKHCks+1U9ali2p1B+EdHshZv
 XNEwubFc/UxKX5FN/X/yue58BPEK0TG0uns6hMHvDwkY0NMh9pSUorqKVxVsaMQUEpCQ=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i3e0Y-003oEo-Oa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Aug 2019 10:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1567160435; x=1598696435;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rHIA92SPeOazRUr1A+x2c0/7H0GL0ZuSYtc5g74sgmg=;
 b=cXGWKYH7vtCWeE8lDVYLdUsMiaX6u6yiyZVceCdCC46tZDNFjSXLLE4i
 DLWWpOWjJb7uIjEBK5kBZhTzSKyxL5qqS+WPPiPFCSRaW1cFIljt/6dDf
 9J3/gn8OaB0XyruC3gRZCv7anvdvctMcyuFpsADXGxvVXsTdNnab9MBlo
 H/8YC2PjHiB3NYHKVwYHq6iM11Y/yPfoiHIogbYqBGNv0W4b6UQG7CPtz
 7tcy91aY/eAf4cvXxOWMZJ06z2JbK1PBy1LIEP58It+CL9Kjm0xm2oIWr
 DZ3PK6gMnfPz0twIbR2pr1+UBHbSSS0a6FJYKksxosHipc5H2d6Xz9DTR Q==;
IronPort-SDR: fwUm+REiuOtf5ZzrDnLEM40BaKgYuZcm7IBvsAJjSg4Hxig/odoIo5oJnfOF1cKsq/6342eRHk
 JvyIvj7YJWrgj3NSTqfKldXQQdESzV3fRNlb0YP2Hk0J5b+zLkQe2Dcq8ofv9Z3sxLl/5cdM28
 OJeRetxGEhdpt5IWgrdyaW3LQttv+g6HEZcGht3i9WX0H0iN7d2s4++YIhH8Qszd6OnWFuXbtk
 58hubICgPZkILhUMdOdtObT8U7VeaK+OqkedNSC0XY6JvhTFWT7uPK+tw+3QPDANK8Rs0ZvoM9
 SWM=
X-IronPort-AV: E=Sophos;i="5.64,447,1559491200"; d="scan'208";a="217553613"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2019 18:20:26 +0800
IronPort-SDR: /Ehot6JBmRNvsbB1FICIeMVi4WKpfdTqnN1wtTrTrbWHcmrfiD/OUew0Q4KFbbCKw1OLxSvj5S
 Ei/EVLV/G4Va3eaGsfnVx7sWn+RH3/MH763dtKjycMJjUZqZs6NxD4QGFvMkoORpPGF0Nps/FF
 gw7drBAmFSQUULOgtPufOT55OZbewp582FNIXE0Vtv17G1PU+nxFmBBl81UU1g9rWD9fBRdRsr
 rFq7AecSlYFF3bvjKHeWvVyWnP9Jl3KdcwdaZXKqlAHFu4bupoO+H3XcGjAsb356Hp0Tvawz2e
 MVYfNousGtIJqfJkZDc2OKPm
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 03:16:55 -0700
IronPort-SDR: zWFvAI4XoLVMiE3fh6rF1geYFLIhIZyJzA3bb/lkeE/3wUQuClZkxAO7ve0lOwOgUZjlSvv8X4
 MqL4X7vqQxToEMP/z6D9mZYYZy5N+dzu0+pAfyqJzoAbhwRzJEfopzfRvX7eouXUnV1Ta6zmXM
 +zAhN7fz+fWsNeyKIymTzY0T7oRDzh3MsEtj6lIuPpAOx83CFM7iCGOpe/pkOjkhqqTk37xwqg
 U2O8Miy/hJimj/OIsOMuUwjWLB99XMiDhn5NW8BvOrYGUkg/WqRTR4QpUjIGRtqy//kGUb1MoT
 gSg=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 30 Aug 2019 03:19:48 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Aug 2019 19:19:35 +0900
Message-Id: <20190830101936.32265-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
References: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i3e0Y-003oEo-Oa
Subject: [f2fs-dev] [PATCH v4 1/2] libf2fs_zoned: Introduce
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
Reviewed-by: Chao Yu <yuchao0@huawei.com>
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
