Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB609E58D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2019 12:18:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2YYK-0004WS-13; Tue, 27 Aug 2019 10:18:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2YYH-0004W9-QX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 10:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FrB0JVHxKn1KV0DVZWAI8kg/GHpTliKyBpRJaUqvbIU=; b=Xt//giyHeOHfZzQzf12Ppw9YQc
 kZ7mgsWJZS1FHW8zifw/Wz+/b0HOSO/gttKdneGvuY3ojeJkuOqye6/n+bClWds+YNV1ys55Le/IR
 npy24QGIhIyPvwmHbb3LaTMm3dzZ1ArK8TrqJ1ylFEo+tSi6Wc0dTc0sc5XRUqyvsjMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FrB0JVHxKn1KV0DVZWAI8kg/GHpTliKyBpRJaUqvbIU=; b=i
 kfIM36+NZWRRdwg4MqtF691wOFOZAa9rAQ3A+CA927k1pVLPwqmHSRxJvYOwuLpTOlbOhrLDZfjyh
 1QG4dePrDJPLk2IO4pBJf145ElRCiPn6rccVD4jctnvfivSvkgGWNueKhz9FxW+gduNrhAxA4ZtHL
 DB+xl+BkruBiewjY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2YYF-00H20a-VO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Aug 2019 10:18:13 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2E49CF1152E440C0EF29;
 Tue, 27 Aug 2019 18:18:04 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Tue, 27 Aug 2019 18:17:57 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 27 Aug 2019 18:17:55 +0800
Message-ID: <20190827101755.27911-1-yuchao0@huawei.com>
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
X-Headers-End: 1i2YYF-00H20a-VO
Subject: [f2fs-dev] [PATCH] f2fs: add missing documents of
 reserve_root/resuid/resgid
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add missing documents.

Fixes: 7e65be49ed94f ("f2fs: add reserved blocks for root user")
Fixes: 7c2e59632b846 ("f2fs: add resgid and resuid to reserve root blocks")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 Documentation/filesystems/f2fs.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index 5fa38ab373ca..7e1991328473 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -157,6 +157,11 @@ noinline_data          Disable the inline data feature, inline data feature is
                        enabled by default.
 data_flush             Enable data flushing before checkpoint in order to
                        persist data of regular and symlink.
+reserve_root=%d        Support configuring reserved space which is used for
+                       allocation from a privileged user with specified uid or
+                       gid, unit: 4KB, the default limit is 0.2% of user blocks.
+resuid=%d              The user ID which may use the reserved blocks.
+resgid=%d              The group ID which may use the reserved blocks.
 fault_injection=%d     Enable fault injection in all supported types with
                        specified injection rate.
 fault_type=%d          Support configuring fault injection type, should be
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
