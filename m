Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 538EC1771A8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Mar 2020 09:57:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j93Ms-0001kM-9V; Tue, 03 Mar 2020 08:57:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j93Mo-0001k3-E8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 08:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSnVrOJI331dbhFA0V+hmjAh4DBu+4X453zGeVC1PZI=; b=FoyIjMauURyy2dscNw8kodhLvw
 ArEDOTWU25SkG/yFctCEJE3Lad/pNqMl1zHhOpHZ6VfWSK9p78wMA+A2rcSjcJrE90CptH19aVML9
 fyMyTdfVNzTJ11bUtAnAJZw5ockqQAn9gxMZSI3+DQTBlUGyQy+XmkD3nOaFHSL+hg0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OSnVrOJI331dbhFA0V+hmjAh4DBu+4X453zGeVC1PZI=; b=C
 4KQ1OkK1HJMKpqWFb555vBqnbR4OGJljt3IYq+mdhEIrTMxi7av0a7jmmkmGbLx0gNDF/WFd5Uey6
 x6SQWuJVac13bJIXgTgBl+iXUdjHdhdwJUNvKXj9IhQuklghNtvE0EncpSykdOIcYib7oaX6YXJCL
 XXWMY4JtbIEAfWEs=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j93Mk-005V75-7G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 08:57:30 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BDEFBDE0C075254D2FC2;
 Tue,  3 Mar 2020 16:57:15 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Tue, 3 Mar 2020 16:57:09 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 3 Mar 2020 16:57:06 +0800
Message-ID: <20200303085707.45104-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j93Mk-005V75-7G
Subject: [f2fs-dev] [PATCH 1/2] f2fs: compress: fix to call missing
 destroy_compress_ctx()
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

Otherwise, it will cause memory leak.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index bd3ea01db448..b373102ed4af 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -398,6 +398,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		cc->cpages[i] = NULL;
 	}
 
+	cops->destroy_compress_ctx(cc);
+
 	cc->nr_cpages = nr_cpages;
 
 	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
