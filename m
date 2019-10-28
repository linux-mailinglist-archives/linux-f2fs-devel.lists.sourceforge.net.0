Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439EE6CB9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2019 08:10:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOzB3-0001Lp-V5; Mon, 28 Oct 2019 07:10:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1975423da=shinichiro.kawasaki@wdc.com>)
 id 1iOzB2-0001La-Hc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qe6wdqa0aoSTsyDNk+RYp7ERjCOYvBjWD/XynqjREIw=; b=LQHccXbRGXFnVw6XDWscXQR2QH
 B5G6+5+3jSUL4SxmX8RRT15sHRR6AW/6rL/t22K2d6LVb8EnO+e543kiI9hoYEjTJzhTLEvMb8xtv
 r1zAZMIHJnimu9XvgcBfV2YY1WHR3b1z5sbgGVwB1ZxEQdd6U+oyWKQSKrCQ8ggQ5LBk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qe6wdqa0aoSTsyDNk+RYp7ERjCOYvBjWD/XynqjREIw=; b=nEJAw2IBwxNjItDu7KefdPUBZb
 4NTe8sTHmwvpnQLzHizc88H0WO4jRVjA8LS78EAaY+Ud7HHuAYlZ5PT/XoaREF7mYbaloOqRX9HFt
 3gLprkTczsOGvzSZNJswPPEVfWyXQGnvVcVMGOjmx44r0FeCGPcF4/I1peafUjU8uSyc=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOzB1-0064pg-98
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Oct 2019 07:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1572246656; x=1603782656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=McCIJ+cHsYGVvFC1zhXUxkg4Cfo01FqsuKjx4INvx6M=;
 b=WXLeorNmLoQq18k1LCR5DkkKU6+qJyzA8ufkLNNYSFgqJuC8jWpwWfV0
 cDbYuDOHVrLIgJHWwRkbuEU7q+Dp6gxD4/O1Fvd5tAdkdbvOFafVw89/8
 TKcNFA5UHPPAqiOVPBpWa5lQFVjNouEFRq/o/JYf2paS/nC+0xKVWvUI+
 Yc3u+5XxdEP3Zxzm2OYk6kF3QgQXsrHsXQhvzyxkQ1/tgR0+tzgfsRikU
 Ds5t4xHncLRA3H6/pGgMhNMJ7Btm/nADM3xGK8bZ7HTer7MnAgcBJJM/V
 s4HgrZIkOVGn642KKP5J4+xuqRpWxlDoXx/4HNbJ0ulvggIBG4VN6NV5+ A==;
IronPort-SDR: +nuN/pzzMdi3HrlEjuT5Rlg/FBlyRgZTmjudHL9NKxB40Z58g9Q6BB8r2PqjsI0VejoDDIrgrb
 1ggZGPX+NpzYZpSMVJQnvfo2Mq5cVcwRQPcySb7wcV77WUpZ5YtU466r7BcRGeMrFjfYPXUn+O
 7AjuEAOYt1CSCPrL6sEOkeqcE0Dr4lYpDQ2wZczyzbWCWQh+IL0QB+FcOO0uyfzwuzI+bkimoy
 KEOa7NqbgCicJ5HZFdxo94UvMw3z33EUu6OsFuC9cJpa5pC4kEIn0oA6mT8LgWCorQRqug7aIP
 uk8=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="123045799"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 14:55:17 +0800
IronPort-SDR: o6KvFvJOjn80+sFOqIoxuiHzqBxLCS6ty5mLp8gsVNRFiEwU2/hSc32MZRy3AJ4n2O3jzM4d61
 RqfJy6MA3u2jvymc7qrR1BfSbxglQpe3aPpMUQGEXfi94eur0rXHOtxZHGhRu42/pwxnZT3ZzH
 xHpBGOZFEWCdKBK32q8ERxGWH7ePPmV7C5KLt4tBbZ1l3GnZa88vrsAiqH3UXdRXKUgncqpOMg
 EqHeVdqXflNCJaxAZgPP0ZFw/K7sOLIGMsp2MT6spC0aJ1/w1tivgQD1YRu+OJlWQ9V1ZHFucg
 HOjA1Hve/XGdCcFqgoDwbmYg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2019 23:50:38 -0700
IronPort-SDR: XZzUPbON8olfB9wJerobSvTLMB6skTRa0GScY0UbW3wmGiXaESlTdKcCZHOcGVuXufpcANJNzl
 skSLyFwLg73PfRXC80aKpBq284LO00168EG42tziu/2PDRJ9GrtBAUK+BVejc3rzSCVWgJi3yD
 kCHsfKHwlgUiJ4OwekMaTaLYOPAhzeDARVw6u7WSI7iGEEuMgrRIqeDRPU1tgRlURY/cL8LPGH
 qhgRU9fUHdHJrVRKMmPDcLZ2vcHDB7F3L18gsFqyf8+0qbjtEUIbPrhDnv4rIuuDS9y8TloXl0
 YkQ=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.52.166])
 by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 23:55:16 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 28 Oct 2019 15:55:06 +0900
Message-Id: <20191028065512.27876-3-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iOzB1-0064pg-98
Subject: [f2fs-dev] [PATCH v6 2/8] libf2fs_zoned: Introduce
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
index 8ad4171..5328c56 100644
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
+	ERR_MSG("%d: Unsupported zoned block device\n", i);
+	return -1;
+}
+
 int f2fs_report_zones(int i, report_zones_cb_t *report_zones_cb, void *opaque)
 {
 	ERR_MSG("%d: Unsupported zoned block device\n", i);
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
