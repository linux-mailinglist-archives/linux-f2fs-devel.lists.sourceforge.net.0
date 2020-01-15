Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34113B745
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 02:55:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irXuB-0004kx-CL; Wed, 15 Jan 2020 01:55:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhangxiaoxu5@huawei.com>) id 1irXu9-0004kZ-M8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 01:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pINNsJLgeANaTDYfI9ocWwH/UPhecvpG3ynSd4b74ug=; b=Z6NEtVn/VAo6mHVK9k21tGnx/w
 l1Gx8Z27M8iZwh9wKZMj6xycsTSGgwuDziZFWuxQnXU6z+Z2dNzT3rHwqVfSg9vkRX0TqRpqTmgCe
 Yo0ADfk6OZZr0pXUp7e70VgJ6ek8u1EI/MfGqNytqRBMxauAG7E7W+4bQcFnkVsbRQb4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pINNsJLgeANaTDYfI9ocWwH/UPhecvpG3ynSd4b74ug=; b=S
 9niiuAnBqxIGhYasjr60grMaClYRx3UZFkjdRq4SQHVm5j+qVQ6E0yuPFksTxya9kspnB6OcjPLgi
 54j1dhyQs4usEHlPPl5WaRCGgDUYCrA2MpysWEP+SzVwB34YlTwEVo5bqSZwDJNqzA+u1kn4UzWi0
 JfOV7f1XcE3Vyh18=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irXu7-003mtc-MW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 01:55:33 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B17A099DC1C796F2F1AC;
 Wed, 15 Jan 2020 09:55:22 +0800 (CST)
Received: from localhost.localdomain (10.175.124.28) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Wed, 15 Jan 2020 09:55:13 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <zhangxiaoxu5@huawei.com>
Date: Wed, 15 Jan 2020 09:54:24 +0800
Message-ID: <20200115015424.41496-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1irXu7-003mtc-MW
Subject: [f2fs-dev] [PATCH] f2fs: Make f2fs_verify_pages static
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix sparse warning:

fs/f2fs/data.c:187:6: warning:
  symbol 'f2fs_verify_pages' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2576d7dd047d..b27b72107911 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -184,7 +184,7 @@ static void f2fs_decompress_work(struct bio_post_read_ctx *ctx)
 }
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
+static void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
 {
 	f2fs_decompress_end_io(rpages, cluster_size, false, true);
 }
-- 
2.17.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
