Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E53DBDEF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:59:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLME6-00007R-T7; Fri, 18 Oct 2019 06:59:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLME5-00007D-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZtrsJypCXtQxNYZ8DtR7dH815C2vFh37S5BEbRSxfG8=; b=ggC68KzGS33F01iWOcO2kMXsy5
 4LHzh0tzlJW2IetJ5hAMAffo7cHFl+8Os1ScAvezx5DnGx3rTmqnXJCz+Z3xfn4G0gbsuKdDi0Dnv
 CVTHyeHX6EEBm/n77a77ljAeOrEoiAG8mtYwC+d9+LvIZEflsJvZjsy3PjTcy+x67xBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZtrsJypCXtQxNYZ8DtR7dH815C2vFh37S5BEbRSxfG8=; b=I1pQuyGmWo/zzmf+drbJJoFC+Q
 MSG9ok7aGMxGB6nX4nNic7053tLZbeRavu9ih/84Tg777k1pslDijSbA4XnJJs+QirCN1YNjEnEhs
 +Tttbt190BaQKyjrzbKFmY+9/OxT5Meal9ecHNkIb4EjSbQhYa5aFs+R/dVpuosAmmaA=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLME4-006J4B-GT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571382001; x=1602918001;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YXQExmS6nWT3uOzm5e3SyPibY7vS9MDdJ/N3FPvpxrE=;
 b=fVPN3GbZRiK3mUE+5qYFfnbf6oP34yUL4O3mSz+dzVZagD7yYTfy5zpT
 kHga5YRh/vWjROrrXqIpNtXiJOKJlQ8VmNZdBXCg5r3J/cBVL2SR+pmV7
 kVuAlUl60roj/faR8elSp0A+YafImA90pDNFKsitc9Kl23G9ZAasH3uRU
 xd1XLR6nvmpVqqinEb3ptWYavbbM2IfYEqj8362PljD7MaI3h78kne47o
 FkwcNhr1naLao85dTaAfevB8mCe3Qy29oQKunaz4EOqnZ1zj7I22alQfo
 7at5ovP79GiqdnirkcJA3F3R73vopu2Gc9HzHFPwghoU658srCVfDQT6b A==;
IronPort-SDR: aRg3KGkmuoLDsl4a3Zrv/ZtTvVgDhg/OPdkkl+jQgWPWKow/myXnD20nC2VHtie9AAgFvebwa7
 xZ2F2hmLBGzGFB6a3tCNQWOh8uUJ74ELHoIfn7ONoNKqdTZ++XaX5kEkzqfvFLiAa0q+NyV/zd
 X/e6GyxYdbrtu1P4BXluzq89U00F528KNG7det/YVUXNFIQJmV6D1u8hlrgkGzSB2To2ZcPweo
 1cbndGy3afmqmL5N40hdIdlkwPJ057+465vKs9M0Mi6L6LU86v7fHAJvsWe5jGBt984aAMTfYQ
 PWw=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="221884338"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:38:05 +0800
IronPort-SDR: Jbf8wgwJzWpHRGOgfIY6E8P8O82G2yoFjjLeXLgQ0OU5IbU1hev+lLKcOXdgoh90gjGzFlX1oD
 z76HX/wW5Amn1ZTRLlkX8N/gCu0NoOhGfjzdvE7eFlT0AudAyRlTpNqKzflKtACl6E6ykQ17vi
 uy13fp9rQRt6HDmyC1BINoEdREL+wOEkvQFkoZKm/7HOWc4cAe1AZXWF66YekEaQ/MWbS+tepu
 Szzt/Ra1Mb8I53k6V1qqujD7Rbeo3BupFLK8WzlEmq2w0tlYV2LWZi5nQxOetpbAAzF6x2bbKM
 BaF5qGkL0OJPXt7zezjO4ywy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 23:33:28 -0700
IronPort-SDR: F+rIl5FDuSUohs3L0wsfUcazejk+H07Yl+jMkyBW58EgFl6vn0zBoM5J9kjcweL/x067TSZM1v
 LDb3JlD83IuSKrvbb+7D6fpZYRku6Mj23VNLLsL8WPtYKUMzrUxWiNOTNycWj6ESiRI0MKvYHP
 iB4yXTQbMQbMc1lDCvfjdHsARRCJrxwrGX3NDj8ioWBUEIEyA8ukyqItQ2K+csL3phzxQfTlxN
 5N4Y9zA/zbQWa+eDrcxOiryl03O1SEAzKvvcmq/YryPszGLyMOvvokNB3AxKBhHvDWEXGTenLs
 tVM=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Oct 2019 23:37:44 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Oct 2019 15:37:34 +0900
Message-Id: <20191018063740.2746-3-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iLME4-006J4B-GT
Subject: [f2fs-dev] [PATCH v5 2/8] libf2fs_zoned: Introduce
 f2fs_report_zone() helper function
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
f2fs_report_zone() helper function which calls REPORT ZONE command to
get write pointer status of a single zone. The function is added to
lib/libf2fs_zoned which gathers zoned block device related functions.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 include/f2fs_fs.h   |  1 +
 lib/libf2fs_zoned.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index a437379..1f7ef05 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1299,6 +1299,7 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
 extern int f2fs_get_zoned_model(int);
 extern int f2fs_get_zone_blocks(int);
+extern int f2fs_report_zone(int, u_int64_t, void *);
 typedef int (report_zones_cb_t)(int i, void *, void *);
 extern int f2fs_report_zones(int, report_zones_cb_t *, void *);
 extern int f2fs_check_zones(int);
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 669d47e..10d6d0b 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -191,6 +191,33 @@ int f2fs_get_zone_blocks(int i)
 	return 0;
 }
 
+int f2fs_report_zone(int i, u_int64_t sector, void *blkzone)
+{
+	struct blk_zone *blkz = (struct blk_zone *)blkzone;
+	struct blk_zone_report *rep;
+	int ret = -1;
+
+	rep = malloc(sizeof(struct blk_zone_report) + sizeof(struct blk_zone));
+	if (!rep) {
+		ERR_MSG("No memory for report zones\n");
+		return -ENOMEM;
+	}
+
+	rep->sector = sector;
+	rep->nr_zones = 1;
+	ret = ioctl(c.devices[i].fd, BLKREPORTZONE, rep);
+	if (ret != 0) {
+		ret = -errno;
+		ERR_MSG("ioctl BLKREPORTZONE failed: errno=%d\n", errno);
+		goto out;
+	}
+
+	*blkz = *(struct blk_zone *)(rep + 1);
+out:
+	free(rep);
+	return ret;
+}
+
 #define F2FS_REPORT_ZONES_BUFSZ	524288
 
 int f2fs_report_zones(int j, report_zones_cb_t *report_zones_cb, void *opaque)
@@ -425,6 +452,12 @@ out:
 
 #else
 
+int f2fs_report_zone(int i, u_int64_t sector, void *blkzone)
+{
+	ERR_MSG("%d: Zoned block devices are not supported\n", i);
+	return -1;
+}
+
 int f2fs_report_zones(int i, report_zones_cb_t *report_zones_cb, void *opaque)
 {
 	ERR_MSG("%d: Zoned block devices are not supported\n", i);
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
