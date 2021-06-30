Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C63B8158
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jun 2021 13:32:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lyYRo-0002Qe-UG; Wed, 30 Jun 2021 11:32:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunke32@huawei.com>) id 1lyYRk-0002PL-UR
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Jun 2021 11:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GEsrNndWydnW+YzcvrSQxL9cFyTsbb6V3it6lFZc5q4=; b=MIyQcaHA3qegT/xgMYmODBO3aG
 i9TvRm5aPLZngtuoLPyfTzXVxCR9okG+iiaI5WvDH58jL6ShyXZSQgHwCG3TrkWzRpm1PjFb2EaaO
 rWaIuiDUTJbR8f0towq6YKvvHymTtvSXXDOtYIrBp7ZCWB/9OHh9F+u80JmfiL8ApI+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GEsrNndWydnW+YzcvrSQxL9cFyTsbb6V3it6lFZc5q4=; b=GNspQRip3UNdXcCT44zw+DGgGj
 GQUnS5JP8RPNx3EmHkrFaBNjQjUZ8GtitnihktRV04j5UUCQvYE2g9lStwe/2dMcPCsVvdeJfLLLm
 DQl5fZ7DkRF6+0SWh1wd839xmU41R3JYCzIQWMAU96BzPjnwMqfJ7q4jRdU1NO7oDgRs=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lyYRh-0006MN-A2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Jun 2021 11:32:00 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GFJy10dbrzZpC2;
 Wed, 30 Jun 2021 19:28:41 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 30 Jun 2021 19:31:47 +0800
Received: from huawei.com (10.175.101.6) by dggema759-chm.china.huawei.com
 (10.1.198.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 30
 Jun 2021 19:31:46 +0800
From: Sun Ke <sunke32@huawei.com>
To: <fstests@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <guan@eryu.me>, <chao@kernel.org>
Date: Wed, 30 Jun 2021 19:37:34 +0800
Message-ID: <20210630113736.551843-2-sunke32@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210630113736.551843-1-sunke32@huawei.com>
References: <20210630113736.551843-1-sunke32@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lyYRh-0006MN-A2
Subject: [f2fs-dev] [PATCH v3 1/3] generic/042: make a bigger img for f2fs
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
Cc: sunke32@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs-utils 1.9.0 needs at least 38 MB space for f2fs image. However,
f2fs-utils 1.14.0 needs at least 52 MB. Not sure if it will change again.
So, just set it to 128M.

Suggested-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 tests/generic/042 | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/generic/042 b/tests/generic/042
index 88cc2098221e..9419606fc82f 100755
--- a/tests/generic/042
+++ b/tests/generic/042
@@ -29,9 +29,11 @@ _crashtest()
 	file=$mnt/file
 	size=25M
 
-	# 25M is too small for f2fs.
+	# f2fs-utils 1.9.0 needs at least 38 MB space for f2fs image. However,
+	# f2fs-utils 1.14.0 needs at least 52 MB. Not sure if it will change
+	# again. So just set it 128M.
 	if [ $FSTYP == "f2fs" ]; then
-		size=38M
+		size=128M
 	fi
 
 	# Create an fs on a small, initialized image. The pattern is written to
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
