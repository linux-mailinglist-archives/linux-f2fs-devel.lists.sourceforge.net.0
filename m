Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BF3312703
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 20:05:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8pMf-0004pM-Ae; Sun, 07 Feb 2021 19:04:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=665305f4c=chaitanya.kulkarni@wdc.com>)
 id 1l8pMe-0004pE-BW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UbkH58hdVXR2BgjNBrLxJQutjcJUYyZSDhNVdXpDtDA=; b=gxqBknmu76+SErzq8ktRK4vXQs
 10j97Ci4aMWCsq1iltk1WInAALN5D0d9ERATm4f9YsglRfBlP2zeQv2rzA4gz1jeWmEE42MEL+67t
 JQRCgtnkL7o/9IQbgOedsWvdffKdGZeZHqynZZaEbIwRBNs33Ho4aVMnzXLK8FeOH7Mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UbkH58hdVXR2BgjNBrLxJQutjcJUYyZSDhNVdXpDtDA=; b=l65pzWjf3/eNoI3v/hxhNdaejh
 vldIcP4WF7qrlpAQZcnssJRMJc7Yh+ioSpZNeUDLE+urTrJ60b7VQDowas532ll4MizF4cRnGw0+D
 Mp6LTdTEdJh6h7yjteZAxOGsm53EezbndRqvkeWEoc67zIqXqP09OrW+GsCu7QN9ez5I=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8pMS-00DxYS-DH
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612724684; x=1644260684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F38JIOmH/bO60aVqbPLRnyXb9cZeXf1sDr0Po0447lk=;
 b=BsScReBrkObUJ/lG4zC8qbxU3WUeqvAE0+56vXucQKBbbQoNKTsA7Amr
 GhnCwBx+jgJkTRtvNVqHy1fpqtQex7Jiuzy/W0FmFa0QSe6YNZt008YY0
 AyldpwhFn0q8Y1P+9BioydAYsQWWxB92Gvo8qjAQ28KVBYHoBOqua3VR3
 fQLvRnhjWlkXU4mCRL9HWBMuS0lHdmX3xzOQhGCSKaUTLc0BoVPJ7hwjb
 riXVOhxbeLlu4AyuZLc5aePvs9UmePq8bZh6e4xjaaQr918w2+AkcsZEW
 Sw3TkMYyH+AR5Ow96eh2M/kgV8HAkCf84fQMV0wmZdscxggEHsNfafz0v Q==;
IronPort-SDR: bD83EpB6Z0u9Gq6uDmqcTvb5D0eRX3NnRBLQMFmqfZQfL7uleQzaSFs8D5pnE27HeUR5/mXIR0
 U1CcwHWS8p8L2KR4mx8HprjpaHidbJvzKipgpGGqQYgtuF5ZYFtScabmtDcfAuc+7xiULuv/yl
 eknswHhTST6zGqzz5nqupj4PscZjXRiyQr5Go4bVXSEyg+qQzGbToklldAZpSL/kaCMBumf+Dq
 yNgaOnZtJsuoo8offFhobVmCi8yWKUYLoxx1ATi5b14vJh8MZV+wj58wswMQM4KKkUKhkyHqQn
 8u0=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="159383111"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 03:04:38 +0800
IronPort-SDR: AaF5Wputb9kgeBL/BwCmX+uqHGS4Ngqt13wodKK0ZgULo9BUDEMzIAzwJ9ZXpjc8nZ09ekwdq3
 VX39a6X3RVDzbzmhcny8MB/eL8HMvBUOp2PJRmuQa6FXI/Eg2Q1mwbGhamGSdv6johGFFyBeF/
 bMoRdfJCqlcndocWNvnXORpfKYaY9NMbNKiGkoizmcICV8+tAHolwUWK8mRFpwy22Ztu4rXTb4
 EVdi9oidxfYaQayOZxExieRdc9iWkIh0jZJJgnqDCTrm1tOj+0lqIOzkahsA4lX3VlWOihC8i3
 dzcSlM3zmAdyUDtO5vJ4E8Et
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 10:48:32 -0800
IronPort-SDR: 95X1JNQjuKEYeODWhVDVzpmJeAmRC+qi6PkDW1g7K+Lf+5rq7gnfFOS12ox+MhnE326Q1n/6S6
 6EeT5PpazKBHTW6Af6ZI24rlL7mUtxPXZeOi2iq1msSf5Oh+xFVcV9PJ0eGtZs3Muxtfy8HpMz
 skaukzAmdnakYARnvPHY6ukLuiyfq8Uxxg4k+mgcLA4JpOAvz3OVHl6QDgN26CLYAB9XLT86O0
 gjQoItL/O4VqWgBcHrgBs24UkssGH8iK8vn2r6od9A8XyvTcgMv+IOEk3E7gkqHk1Kum4mDhh7
 05Q=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 11:04:39 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sun,  7 Feb 2021 11:04:18 -0800
Message-Id: <20210207190425.38107-2-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l8pMS-00DxYS-DH
Subject: [f2fs-dev] [RFC PATCH 1/8] brd: use memcpy_from_page() in
 copy_from_brd()
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
Cc: axboe@kernel.dk, hch@infradead.org, damien.lemoal@wdc.com, tytso@mit.edu,
 bvanassche@acm.org, chaitanya.kulkarni@wdc.com, dave.hansen@intel.com,
 johannes.thumshirn@wdc.com, ebiggers@kernel.org, clm@fb.com,
 adilger.kernel@dilger.ca, dongli.zhang@oracle.com, dsterba@suse.com,
 jaegeuk@kernel.org, ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 drivers/block/brd.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index cb5c872ac9b2..d41b7d489e9f 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -226,11 +226,9 @@ static void copy_from_brd(void *dst, struct brd_device *brd,
 
 	copy = min_t(size_t, n, PAGE_SIZE - offset);
 	page = brd_lookup_page(brd, sector);
-	if (page) {
-		src = kmap_atomic(page);
-		memcpy(dst, src + offset, copy);
-		kunmap_atomic(src);
-	} else
+	if (page)
+		memcpy_from_page(dst, page, offset, copy);
+	else
 		memset(dst, 0, copy);
 
 	if (copy < n) {
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
