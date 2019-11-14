Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 788ADFBEA8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Nov 2019 05:45:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iV70H-0005DA-DD; Thu, 14 Nov 2019 04:45:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=2145628f9=shinichiro.kawasaki@wdc.com>)
 id 1iV70F-0005Ct-BC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lD2ySu9qqy8CAo3m/bKYY/P6LXwsz6LAeqaEm0cmmDc=; b=C65LIebNY4sP3hbSqN7rUzLMWy
 oevExSl+zIEYYCsFSFf8lQxfhATRtT5T97YzXIsZsZC0XzoO0zC1QdF3JX2H4sdsDDogX4k4VtFu8
 jAeWQgdEwZcXR/k6kL3UWf+v20IkBHZh57l19VYzm0HYd9BM5ya6Y4SYraxKOZeBmjgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lD2ySu9qqy8CAo3m/bKYY/P6LXwsz6LAeqaEm0cmmDc=; b=FehIeKyHCG1/R5qv8AT5+x/Lbl
 Obs13qNSDnSX43eH1dElkxBInbqUcxWk2tBGkmiDUp8yRjmtMyfbELoXu94xVQYHNQb4DdSzpbKKQ
 7BnDD0K+ieCeURpk0mIcOTlglfZ8tyrLojSXmOTDk7RDvT0jf0jNCQnHhNBcLKzw+2RY=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iV70D-002ZCm-U0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Nov 2019 04:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573706706; x=1605242706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=djS0FHrikC4mwnvY7yfXHUhWKUrG55ik89mvOoeRC1k=;
 b=ASWnjHkT/uz0Of2bk8ZBy26lNjykOx0E5H7akQt6gNHl2kgFw/cn1JZu
 +Zz/FcG5NRzJuA3Q2mXocRq8wcIhPifkazkd8AJbcX0LX5bx3qDW/GtoD
 FnFoua3apTmdKJ3JwNqED7G5ZZdl7rL/2OFW+5LeyuFAB9JWvkgOmEE9N
 zuGwCZAsz+rEgr/DBfPw/RwaP795q7szGmXr1jYntPeh/w+n/enHI4yZC
 jYMylgcis1UWPVBk7oTsnIwjf8AI8JQPVAxvhLDg/g/QLujdvaoTIg/v0
 X5NR5oYYph7KQF7/CIYSazWQyLKvBcEZ9KZMbcKnxEuZ66qXH/qdFni52 Q==;
IronPort-SDR: d8OjmKpMkXE2FBH1mYnrZvBSCr27oCsoslldYB/aaKnyKPpvQced7gSGP5LVUqAIdI1HsqRUwE
 Q9AyRrB9uRsdOKkcU5HQ4q9Sc4QwGJBIEWATWIITXrmAvmqJn+IGBvMYBQ8MRoM+L5T6+5ujdp
 BjSs2IP2jVOX8hutcSdozjuLbXw05KRyCraXCzpMLY4NLKAZuUkJuGR+m8AZ3VI4JazwwtgwHX
 0I8+wDSoa+Nr+TTw89FxxDbKzkRsb6DY/jroEBs67FojZapuofrYTf1wK6g17Z0Jnx7M+TfRUP
 Fz4=
X-IronPort-AV: E=Sophos;i="5.68,302,1569254400"; d="scan'208";a="127411447"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2019 12:45:01 +0800
IronPort-SDR: RocC3/usi6j2kzdw0SlhcYHYLK7t62CshEiqgC0r6ishIurTDFISw1fFGECuKDOUwp+rW1dVFd
 20pYCr0zWcuPw2J2FbcgABAONuAlrx7RwBFIaCzjur13q4TYfstY9ye4nzZ+9MLovucfa7Elp+
 CBfE5LQdII6FhfcxFmV9m4ojHW43+8rf166nWIvc/2+xbq+/JZXE9KVa/1A5til6JKlcS5oQe+
 21tl1FYV0ZddZw+ZIBww90XmYIwegVg4v1dL//6Uw4JRrOfdtBoovMCG1kJVApwaNcfP00xx6a
 oPDL4O7v9m3btrNcJu8ilbsA
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 20:40:00 -0800
IronPort-SDR: kPXLfyZyEn1M/idrOXz8x2sp7caGKf+TvLgM6xqsknx+BsUKfts67ZWY+2uc0EM6vEvcTrqnfv
 G/yxoiydbmuukIzqr1ecsFi+II0AYSMH9/30RfuA5XqkKh2V4tcWWNLJ6zaW/wzzxoEMsi9PzI
 0koWHlggIuJjioakul6b8OZ82DbdWYVgFgjMzp11tcsHAN4xYL/YNg4rEcWIr6EZIU6XdkHDtr
 W+WUtRae8XZlMwZgOM2NFVftxW5GxTHNMc0Cs40pPav8l9EpysfG4ZsnJSQuLisYHigKWP4Kar
 QM4=
WDCIronportException: Internal
Received: from shindev.dhcp.fujisawa.hgst.com (HELO shindev.fujisawa.hgst.com)
 ([10.149.53.87])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2019 20:45:01 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 14 Nov 2019 13:44:49 +0900
Message-Id: <20191114044454.200461-4-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iV70D-002ZCm-U0
Subject: [f2fs-dev] [PATCH v7 3/8] libf2fs_zoned: Introduce
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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h   |  1 +
 lib/libf2fs_zoned.c | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index d6ea688..9c26314 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1323,6 +1323,7 @@ extern int f2fs_report_zone(int, u_int64_t, void *);
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
2.23.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
