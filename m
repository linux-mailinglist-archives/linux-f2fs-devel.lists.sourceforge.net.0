Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4981310C4A2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2019 09:00:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iaEis-0005Sr-1X; Thu, 28 Nov 2019 08:00:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2285f8a38=shinichiro.kawasaki@wdc.com>)
 id 1iaEig-0005SF-4c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0qGxORlAE1o19G0CPu7inj3LmY82XzceExZ8M+vyrYk=; b=eyoMXk9vjZ5lMtMFMjnWiqJDIZ
 fEbqmmKLBPEFFLTxGyx7KqB8LteQHuk3jw29yKL2yavXM16cICRzPxP2yWhUjxgQC+7jHmuQSCU1g
 CNcHc/2ZOcEAreBncnuwKcmkrLYMxJC+e19ckfaUPTx88xueq5doma5/mRwKQOXihyj8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0qGxORlAE1o19G0CPu7inj3LmY82XzceExZ8M+vyrYk=; b=GZG34XmwMUTzujjZ/XD+HfpJ/3
 /UqtEYLMspP7DiabnrOfmOwoXFT4HlHi8BbccE9gg6SPgbVxp3tMRhui6n/6Do4qMix+tDdNXzjhA
 afzqh2q8PH3c9RwFalHfgHgw7rTMOFu3sF4/hqcmrtTP+hhbzRyf6EqX60Odq4w9p5PE=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iaEid-00Fq7V-0v
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Nov 2019 08:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574928063; x=1606464063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ShoovgzA0HAJlXJap2fWnvwaPOkx3IqpKZVMueSwvK8=;
 b=VJF6m5f1keltTUwSOlCMIOWUIAR/a9Qjtq+uAR5Zo0GaBBv6MoN81qlD
 yZFARCXKshipaiZgCEwuzgbKR+4C0i3vpz+rJ4yl5e7Z5FniGU33Vt/R7
 aW3O5tkzQ8ralU7BGWAVK91wLvmUIEorfopncA607k1y2DNV2AlBdvCuz
 oVlVMZK8REm9Pa7dM3NO54OD5jsgIhNt3dDiYsSIUnYgROC7mh4njB52r
 lbtbCdfecijaAm6YCnDHaes2RRA/wRzn9hGYy2Qm6Irm/Bv4mfZ/CXjjH
 8lgs5t1XOIC4mnPUYs5up3qfsj6ghazAtGQLzSYOwn0rM74DPeyIHFktX A==;
IronPort-SDR: DNPNM3ihBBFr7sh1+IR1X2MwCGbeXxlIrT1T12S23R3Kn4prXmapEuadOyPlWJ8uhp+7MW4y1N
 8Or/ibmmoUJ2ZwoFymAKyRF9XNSVA95/Zkzh1GYB2deWYSdFdtkRzvaPHRsrgOOQ2ZGZ86PX0T
 7UFCzEL2lhnSU1Rpcg36KF7VGDvy6y0uSLSGJakfkTITD5DiCykPIRLsS4ulJ6E/I4PwHq1x/F
 OwRyMvK0wBT91sCzi3Eck1ht+847MuUIlqq+U/JJnVtASgjOHwAZk3Qvf20l9DDs3df+JCm/EJ
 ERQ=
X-IronPort-AV: E=Sophos;i="5.69,252,1571673600"; d="scan'208";a="225597355"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2019 16:00:41 +0800
IronPort-SDR: mzj9RCAnbrdAtTaRl8wXhsyTcyX6LRgy0OqEeWrCldGevTcl9Bb6XdXTwme7oTRUxuz4iycx8v
 3DvwHjkq8rliMKrCkyjeV9Wn4tmsvxhc5bFf/dyeh3Dz1bi1DcNtXoycdEDUnWsvxskFvmjaKQ
 3pgJ5btloG246pkNsvHqE5b1MtS3vrWrO33N6WdRhPohVpS4Iee7+NpqUzyAunjxc1QHVt8YJb
 qYDTPRQzTfb2xez9AZjLL73taOvY3PCl0TwTOPk4W0KWNh48Uan06keglBGaTdypEG0ag4QHj/
 /ZIlD5NKwfG78bB/abcPfkg5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 23:54:28 -0800
IronPort-SDR: 7oEtm1ae/6Nj8w48PVpJPjOJ3tCMTrEjs9OX3GAeZwcoVp1idiCUptsPzLvLRYrgrAPT4RQJRY
 kkJjClgQDHRZMim4tUHnRarvsnMwZrb3Tk3iWFypS+rXFA6s/zzvLZDjrSmqHvY6tA7rvh+pKA
 C6evpo+A93yUbP6nTukrX2imNDBIOcJpwgkUJ+ILiM9VJrh5HXHU7mVXxtwCe8AgbpOTwsQx7D
 XeSAQcGkrdtTQmaoIRswZbKot2pMKb/VsOG5dSIpO10xd6KltJUrVyiWGUKukphrBeYPefh085
 wco=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Nov 2019 23:59:52 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Nov 2019 16:59:24 +0900
Message-Id: <20191128075930.467833-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
References: <20191128075930.467833-1-shinichiro.kawasaki@wdc.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iaEid-00Fq7V-0v
Subject: [f2fs-dev] [PATCH v8 2/8] libf2fs_zoned: Introduce
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
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h   |  1 +
 lib/libf2fs_zoned.c | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index fe18dff..d6ea688 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1319,6 +1319,7 @@ blk_zone_cond_str(struct blk_zone *blkz)
 
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
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
