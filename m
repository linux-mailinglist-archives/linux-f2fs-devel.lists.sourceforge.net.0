Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 750E591EEA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Aug 2019 10:30:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzd3u-0003dn-3b; Mon, 19 Aug 2019 08:30:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=127c8b87f=shinichiro.kawasaki@wdc.com>)
 id 1hzd3s-0003bb-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7ECjX/mgqFmDMNTDPdcaeEuHUYtBjdPtLyYP5Ae6Wq8=; b=MfFeMFBPsMqJO2jcRNtjEijyPE
 nuS8i90jXFM9qsWj30v5svaozcCNpwUkmGtQJ3LP/gz/vc0mHbM72SSlLbvt9X62IgR8YBdletjpk
 pKeJlGna1NfaAy+nFCB9I27K5HTElop6SdZ3SwZDWBIZOiuIJKzTav3UyC4/A0sBdx1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7ECjX/mgqFmDMNTDPdcaeEuHUYtBjdPtLyYP5Ae6Wq8=; b=MnChWRO8YzqnlI5WwpGhcF/nma
 0Ax3razM7lEGVhiTFajErSBCGl/ONkA7MTmguo/nI1WcL0t4p/uz3EJ5moeC8iX+3ifkXY7MwjOvZ
 DhcXc5I0f5vUn480Q4gYLAtrcwAgWc+ON68kaIdzv60npZzUrH6h6QtyjMCUoGwL5DxU=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzd3r-008W8j-Cx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Aug 2019 08:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566203460; x=1597739460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O2Sgi9/8v41jTKqF7IrtXcFLJRpUZJU/b8F/V2kj6bg=;
 b=IBlNdTCuicOswcUzvTza50Cck/xef3zx62YHlfjrrFYag5B+gZl4dVfo
 oUXoqOOLUaYzU41VomaYVg1iLgh1dPEEMjfg+A6ovZ5zMpTy3B9a4r3+F
 lIJt753gW2vfxG1trH4Q1EdLjvUlO3aKgD4pt0H1G1sMnmpXe76Z53z6/
 K+L4gDY+s6sd3mucpvfULXje70X6e5ruopgo+16I2775nja3QNQmksVCl
 o56lGlESD6trrhcYrtjeP/t/RriQtYFtRWCfP8adpVooTJrUkef2EEUCd
 +8sfn4ABb71zF58luPZWcjowoTk1MA7VpCeHe/MIlZ8su7qlPmTvh42QZ g==;
IronPort-SDR: mRvrHc8nEkcwHmEpa266GFrhpUFcYriKQ1BJIa/yUAqcKaAxPg0HWdpz8bpW04dmI/8NHv+9y2
 s+BmCLTncr1UOciqmx2ZO4q+8iD+ndjVsPne8r+X2S2HubCbkzTZQ1IPVoPDDHZY7v0g603Zcf
 iV7OeE7Fw6R0k0P9ySAoVDLMc0rVohFUIieAEhnBq5s3mcNH/3fNsthYCfYAGSiDYMZjcOCvII
 dxu4mTQ8kkM55g0FYfFOJxleCiYuf4+8Wu3QC62JGGhcDyMB21XKwzMZe0sY7t91GV7kuTZdBk
 kZc=
X-IronPort-AV: E=Sophos;i="5.64,403,1559491200"; d="scan'208";a="216517045"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Aug 2019 16:30:51 +0800
IronPort-SDR: c+oMToh/EFiu549Ej8o+/Yukqtks0TCpVXqGbgpIZ1+5BLH8r/q8Q+XtdUsvv2RPQv6em5LRnJ
 +4cVPNG8Wo+EfEs4gpJN26y8CyAUS/T1AVMTuYUUQdWMd6U5yTSpI7onb0CPI+OlPhQnIXc8KU
 2CgsGglNnBWsj0uKYL/aXimdNfob3xDE7cVJ6WU8oQKUnfD5OMMKLE08AsPV7RlI60rTu+DtZ8
 GtJd3kK9Vsca/66dI9x1cspLdT8jVtGRuee03PrUrGjaGHKyB6pHi1sZGy52vIMY9mibS9nmB5
 WUB65LCbsm7s3NbB2nb7+KNA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 01:28:02 -0700
IronPort-SDR: xfVHM9l7VBkISFwoKJ+9AcW8Be/hB1vyhilSiLci1VIVlwxKgF1Y4JMbf90+YRoOzxwDPCGGkc
 fp+HE7sL4u5Q/n3lf+efHQkEjfwMZzKP2YpvOY3WY6rnldC6YAl3c0Fq1J5E6pZ1/l27goVCmg
 AxSMqpXlqzY/Tdsdw1aJZZEDn33AOP1oSWGiEwRSwQTnU8V35DXgCnlLu3xCYED60d5SHJe1dj
 lq5N1+HlO9gpa1ms8eGCNqcgOtUz7l8JQSH9cQGA781gJkmbZPKlQ3isfgWxQawp8mO8vC/Y/H
 vWU=
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Aug 2019 01:30:36 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 19 Aug 2019 17:30:31 +0900
Message-Id: <20190819083034.18218-2-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1hzd3r-008W8j-Cx
Subject: [f2fs-dev] [PATCH 1/4] libf2fs_zoned: Introduce f2fs_report_zones()
 helper function
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
index 84f3f3e..7d2cdda 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1296,6 +1296,8 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
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
