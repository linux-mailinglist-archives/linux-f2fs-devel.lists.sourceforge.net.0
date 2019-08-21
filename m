Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFB297142
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 06:48:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0IXf-0000dE-EW; Wed, 21 Aug 2019 04:48:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1294c0c7a=shinichiro.kawasaki@wdc.com>)
 id 1i0IXd-0000d7-SQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dUcuOCiq5ktY7RHbZwPXTBiFrhREfBM9s/GCXECf/B4=; b=iYjhzRz4JMMMi8MsNW7XEk/VQN
 vnbvFY8Ugf3V66L8Q4fTBvYMCRdC2zRJCtaSCpsDKysAbu5omAQkfcVOdQUxGURsEDdi1NcsNlR2/
 h+0ajI9mUe1NU0CYemCmrj+tr7Qcr8LW6LFs/G/g3vxB7S8PyjzVfVp4h7NF58I9OgjE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dUcuOCiq5ktY7RHbZwPXTBiFrhREfBM9s/GCXECf/B4=; b=KVftQG+HArY4O9n3SrBuxvGksl
 wjrnk0LHxzjZhFtT6WsLyHKY5NsYb052Vk7Dmwudc+eajKFG6bZdXvXCbxkJIjEC0e0cYC/r5jExN
 /ysPL9ihg7HKURgXyea8swzffB/ErTnX+kIj3ExP6CSUw91BF6K8SJY6dgu7s/F0Yo+k=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0IXc-00AeS0-MZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566362892; x=1597898892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9QleMFEOiGEWe/Mk4CUsftVyhZbAEjNaSX3lXZ3BiL8=;
 b=ptxqG7Fz4lzkxOLGsKcmGFDHsfzq6BpGu93lQkJ+UGAcGJ8/wPNmANbC
 5c+WHcRB7kb8Wgh3RKzPKsmv34/SJdQGVm9GwtVvMeEyUqe2SfMDaD6Wg
 WeoDLHOXIODnkmZMP9JKmoPCQLItu0ZIxCdSFwQd++EHu98lPSICe0sIg
 DMjrdFIJwDLVajIBtesCfZDBwcfMUo5bMCky9W0dPCQvJGzymLIh/fLwF
 Bm+8HOErTCyzpsO5+NuA4XqZlajV7Hi/164BrJ6dxfcl5Rp/EpyhKXCz3
 tDQM7CNDfF6oe9DjG5nXqGjIbv/r1JhpqjxS+HAAdSaEldhxV2IufPHUV g==;
IronPort-SDR: /PYXELA7OtrrVPmvSSzvpPNoaQu6g7G9NNdX5bguur0OV0p17eXyV52uQuMVDUnz2pjay1QURs
 5jYjq5cbgjEZuVQw8pRndaDm77O7zMz0kZbHJ+hdDi8PsZ2qvf/HQG34HBN/EqfdTW+1F3VmcU
 wCvSL/uUg9HoBC6gnYgfnbMkJHLudQ/KPFWHWopZ3FG/TgWga58aw88vhfJbUsPVVN2R+rM7uF
 mnhTD4JP/CJ38c7EctQMXJnlh/KoBeYNVdf9/R4uCREkZslEIzt/p9L/FMpdJ7UsyKDAGxtpNM
 dRU=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="222876205"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 12:48:06 +0800
IronPort-SDR: NrSxs9Aw+WdHj3s13XsCSWFAW2wGllXZU1sXq8mwFeFts4BAuyJBF8AzBTi54AVNcnGAdhHt3d
 6OUcIHq8JtzVA6VS8Tu1CyzStpWmvrEN2vJFSc9Mg5apn1w79xhowYdE5lhGqHr06nyGJXLFtc
 7w606ednqHD1jB/2OEmrutkFXuCMWIaF2h2XYX8qFKL4a47tB+qcTKteJU1OuUthtBTeZ9MEcY
 JWxtnMvIYYrnDhmxSkIYJoO9uvNdBAv9BAfXaHI5yjeTCd3gZOjtajRy8Vj4shbFT3MMjjjwpH
 S5Z0OnnLJRsR0i2ybPhchr3n
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 21:45:27 -0700
IronPort-SDR: nB1mEKXrjg7fyebRyWJhNP75zZHqKT8WqZStXKGW3MwxZ2FPU96v3aGB+fUwojJ6zDxqTQu5OV
 m28v7QHcaTAPtBKgbXL2C5q7caMKhpu9FaqI6dV/jiO9iFVQZbgLVdm5S+IDUxxTuq+qijLHHK
 FM8gw5Sc+t0bpxJ8GfMJ/uMUjxfqsmnoLPc+XlnTRxu74ngf8iRpMgGNOgEUjDzKrgnbznp7My
 RkAiDLQwK3SdzzGxfqeAUYajXCyeVJEjE+wZKL/3W0koJE/T91cv7S/L0sX4xt1GrGHq19r2eN
 0hU=
WDCIronportException: Internal
Received: from shinexp.dhcp.fujisawa.hgst.com ([10.149.53.85])
 by uls-op-cesaip02.wdc.com with ESMTP; 20 Aug 2019 21:48:05 -0700
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Aug 2019 13:48:00 +0900
Message-Id: <20190821044802.29702-3-shinichiro.kawasaki@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0IXc-00AeS0-MZ
Subject: [f2fs-dev] [PATCH v2 2/4] libf2fs_zoned: Introduce
 f2fs_reset_zone() function
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
index abadd1b..34679d8 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1282,6 +1282,7 @@ extern int f2fs_get_zone_blocks(int);
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
