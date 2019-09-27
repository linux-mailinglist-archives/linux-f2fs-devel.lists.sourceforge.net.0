Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AAAC02FD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2019 12:08:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iDnB6-0008PR-PE; Fri, 27 Sep 2019 10:08:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iDnB5-0008OK-JY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 10:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4hi/Inrmjpqldcghw4CeguFd0ge5V0cR3ruEy8EakNE=; b=BkUSq6JuM625Rnotof1dlHbyje
 fV2IlPJzu+coU9gMliRX7oMOLQAqDVukxi+7rLL4IHUHwWsNTQBAu1D9DcWjYbxEkkw8naZHTPkPe
 FiPopHB+k6jR4jy9lTDvECrKM2pYHo88OLkHfxmkvbBctx7RFezk9j/BdGUqjaWSeqH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4hi/Inrmjpqldcghw4CeguFd0ge5V0cR3ruEy8EakNE=; b=k
 vxSevuBfLoZJR2CVAOWSRCqe3iaQ86ZEYoBRgSsne6QxhEp15rxnTNjcmiDrI0eh50OAmOt4o7AOP
 CjMBb9scZH1c8lpPMaJ1QUcYt++DELgv59ApJ87WIOEpT7apZnXTsdRwjGWqbsdvtLwYhGszgZUml
 qfKsOWceZCIH2apI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iDnB2-008Bwj-Pq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 Sep 2019 10:08:42 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D413EAB0951E7E945C2F;
 Fri, 27 Sep 2019 18:08:32 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 27 Sep 2019 18:08:22 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <guaneryu@gmail.com>
Date: Fri, 27 Sep 2019 18:08:10 +0800
Message-ID: <20190927100810.9351-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iDnB2-008Bwj-Pq
Subject: [f2fs-dev] [PATCH] generic/group: add missing dedupe tag for
 generic/493
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
Cc: fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We missed to add the tag, fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 tests/generic/group | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/generic/group b/tests/generic/group
index 7cf4f6c4..18b5a545 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -495,7 +495,7 @@
 490 auto quick rw seek
 491 auto quick freeze mount
 492 auto quick
-493 auto quick swap
+493 auto quick swap dedupe
 494 auto quick swap punch
 495 auto quick swap
 496 auto quick swap
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
