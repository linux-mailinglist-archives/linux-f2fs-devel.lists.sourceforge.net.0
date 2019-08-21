Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C1397141
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 06:48:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0IXe-0007IB-TW; Wed, 21 Aug 2019 04:48:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1294c0c7a=shinichiro.kawasaki@wdc.com>)
 id 1i0IXc-0007Ht-N8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hL4V92m9dQstZBYaYJnI/14SP0GraES2fL6kHV+yRyw=; b=ShTqtMApkFbo6hnx7IJeGVfi02
 Waa/LokTjdrQafEBKmH3jqZm0GoW57+tHBKVu3tCb88dMfF7373dVKy6sSqllRReNyd7O6bm98AG6
 s8vcDXioN4TuxrFS1VZXL59SFSEdxhvMN9cLJbnCdmH9fOGijm6C69oCvBPqJZcketBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hL4V92m9dQstZBYaYJnI/14SP0GraES2fL6kHV+yRyw=; b=OmxqbY12VLWo8nJInVkqoezqg4
 oJSdcmSl3K5HFjH0iS4HOkuj06agLmL5v0oZthebLgWhH4tW/QygWYFX1EXJYHXnOYuvgV2Nl8CNJ
 7M/+O3eSUgU94CCL8FuHKtgMkZrX5O955FC2ZQmcFM4hOZVtr6zvamUbO3IfEgADHYBU=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0IXb-00AeS0-Hu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566362891; x=1597898891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ekG+1wtAuW0b/QyiA2VcjqWyHJxvwxisWKkv5e4SCpU=;
 b=VOw2EPGbZrylv9gIBEhNav+8ogREcCrh8rLmSMhFfhKELBJkvm7WcOIP
 4OjDRLE+MZqUhHhIoTQKIF0B9agGxgQQ1D1xTs+8qv8u53BGmHF5eQMSb
 96u1e++4cDBXOkr7BzWdlcEukW3JzTjJ/578Z3CtBCfdcNydwcA2TRCn9
 aFl5rFFyEIVFkzIWY6V/tNAL4UvyP7jP/HgVinkpwb47KjW6YnGJjCoDi
 Qzjqb6GhpC/hPfYHxWb8/5qTsMl3cJG++TUVWNeHz/boOG9ZOwXi9mM9q
 E2Yyr4EoS65wNtWd6zNphDaexvgMTfUu350Rjp5Ic5mii60LMQicFfOo0 A==;
IronPort-SDR: my2OpI5eGzyqvY0r7enXSN939c2LvyaeZ42m4W6djBZFz4E3MiOkRi5xEIOSyb+tUsEeWI8Mih
 hy/nfMUczEi9bl1ivnVssYyxgJRN161fqaw8CWd+/OTPaxwQsVtWNV6hKmgbMeZgG64kX5M95F
 p7t+HeAftVOxLHmMq/h/I0KTsEycxVXqkCd+vVGY/qKfUG/S4pVGLqltIOuGWR7dOh/0nSdXNQ
 +SWKBE2sIh4NUNscAPYgPot5lw6f1zRSBxeSxtuhR/Y3j3aLITB4w/af/1dR/DbDcLeX6nH1lR
 l2w=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="222876201"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 12:48:04 +0800
IronPort-SDR: OkJ1ILfJ5yYSuEceeywzaon5mf0/iXBYk10CSazLncSgAyxlEgwx5ee8DnxcmFHG3n24iJhBxC
 5taJ1ZQHfMoZmo2rUB1CoSfnKyfx6dDSGpK/YqUZBzj5M5VTxZRys8b9rp+t4jc/0p9VXXjuYV
 WUQKv8gyWy4T9bnAcY9Oz/cPBV/Dckome8fNMa6UgxW0OcQeYb2QlWYBFTLNUi2lJgWqzwRXdo
 LNBAkIcA/GGnKzTOH+lGkKHGNOGowNa1THXThqCqQxKza86hmnfff5xDhExalFzIDFCTj6l/+q
 7hD+zOD93O5+DYxiSjwC3a1s
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 21:45:26 -0700
IronPort-SDR: DBwZf6j0+VkUpkGCyVqLzUZXtUaTrUxc1B9naKBPUptSIpJ9s048PrbeyDyd1mbbN6dmSPZUxe
 FUTrFTBXaKvHg+jz6hP+2BsJByezev4terVplJ3Vt0hx+0oO2gdLy+eS33rpnJyzKIt8VcTm8F
 PGPnre6Bvu5Mj2cHZuB2WdHZOunVYtixJGV1PENcuZvIFlaA4w+oIViymMW6Cef1+ua1GT9FrG
 Aa4euA3fvP2slgcnICJivT0knvz7v6ezZ4uVp9EH+PqGH5VE0dtEvFdkSAPNSqnA6PAn0Yd2cF
 2Fk=
WDCIronportException: Internal
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 Aug 2019 21:48:03 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Aug 2019 13:47:59 +0900
Message-Id: <20190821044802.29702-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1i0IXb-00AeS0-Hu
Subject: [f2fs-dev] [PATCH v2 1/4] libf2fs_zoned: Introduce
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

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 include/f2fs_fs.h   |  2 ++
 lib/libf2fs_zoned.c | 57 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 0d9a036..abadd1b 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1279,6 +1279,8 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
 extern int f2fs_get_zoned_model(int);
 extern int f2fs_get_zone_blocks(int);
+typedef int (report_zones_cb_t)(int i, struct blk_zone *blkz, void *opaque);
+extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
 extern int f2fs_reset_zones(int);
 
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index af00b44..fc4974f 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -193,6 +193,57 @@ int f2fs_get_zone_blocks(int i)
 
 #define F2FS_REPORT_ZONES_BUFSZ	524288
 
+int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
+{
+	struct device_info *dev = c.devices + j;
+	struct blk_zone_report *rep;
+	struct blk_zone *blkz;
+	unsigned int i, n = 0;
+	u_int64_t total_sectors = (dev->total_sectors * c.sector_size) >> 9;
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
+			ERR_MSG("ioctl BLKREPORTZONE failed\n");
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
+		for (i = 0; i < rep->nr_zones && sector < total_sectors; i++) {
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
@@ -372,6 +423,12 @@ out:
 
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
