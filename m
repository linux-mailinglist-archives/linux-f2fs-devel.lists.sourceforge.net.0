Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E34B822C2FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 12:22:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyuq0-0001tJ-VR; Fri, 24 Jul 2020 10:22:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jyupy-0001sy-LE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 10:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZwEjuFqW/LxUAYxn2gewDfxPbJZgpiqCjOxxDpBy3h0=; b=LTGkTGFwbzNHwqxokqbF1DNFFV
 /qI0syk1HDo/0A/eh99D/A27uLxveYWjS3Fh58y4Kaeu13GVQmt7o9+w75PAGyQ7LuVx+bMiU1KUG
 Wfw3AQ0dUXHmAZre+dnuOSyOk/NG+mxfsiBaEgY7rxHsSAqLSndxiRR5U9oc1aCm9VlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZwEjuFqW/LxUAYxn2gewDfxPbJZgpiqCjOxxDpBy3h0=; b=NlpYccSTJ3lWo7wB8MspUX/dDK
 ngqSKcv39G5gIZzAD7/7N7T6AdLSqXX8Xi+tUAKNUaYlHKyc3GYtbN+ZbiW9gRVrZGGAGw0AI8evj
 i2IykntdHx1LVVAhHHVthHJnTYlBMDtTjBWBmQnHOKws2JKg0uk3hlZXiz3zZs482VOo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyupx-001HJy-0T
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 10:21:58 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1ADC89BEDA3108C50F5C;
 Fri, 24 Jul 2020 18:21:48 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 24 Jul 2020 18:21:42 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 24 Jul 2020 18:21:37 +0800
Message-ID: <20200724102137.78696-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200724102137.78696-1-yuchao0@huawei.com>
References: <20200724102137.78696-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyupx-001HJy-0T
Subject: [f2fs-dev] [PATCH 2/2] f2fs: compress: delay temp page allocation
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

Currently, we allocate temp pages which is used to pad hole in
cluster during read IO submission, it may take long time before
releasing them in f2fs_decompress_pages(), since they are only
used as temp output buffer in decompression context, so let's
just do the allocation in that context to reduce time of memory
pool resource occupation.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index a20c9f3272af..337a272d7112 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -670,6 +670,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	const struct f2fs_compress_ops *cops =
 			f2fs_cops[fi->i_compress_algorithm];
 	int ret;
+	int i;
 
 	dec_page_count(sbi, F2FS_RD_DATA);
 
@@ -688,6 +689,22 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		goto out_free_dic;
 	}
 
+	dic->tpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
+					dic->cluster_size, GFP_NOFS);
+	if (!dic->tpages)
+		goto out_free_dic;
+
+	for (i = 0; i < dic->cluster_size; i++) {
+		if (dic->rpages[i]) {
+			dic->tpages[i] = dic->rpages[i];
+			continue;
+		}
+
+		dic->tpages[i] = f2fs_compress_alloc_page();
+		if (!dic->tpages[i])
+			goto out_free_dic;
+	}
+
 	if (cops->init_decompress_ctx) {
 		ret = cops->init_decompress_ctx(dic);
 		if (ret)
@@ -1449,22 +1466,6 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 		dic->cpages[i] = page;
 	}
 
-	dic->tpages = f2fs_kzalloc(sbi, sizeof(struct page *) *
-					dic->cluster_size, GFP_NOFS);
-	if (!dic->tpages)
-		goto out_free;
-
-	for (i = 0; i < dic->cluster_size; i++) {
-		if (cc->rpages[i]) {
-			dic->tpages[i] = cc->rpages[i];
-			continue;
-		}
-
-		dic->tpages[i] = f2fs_compress_alloc_page();
-		if (!dic->tpages[i])
-			goto out_free;
-	}
-
 	return dic;
 
 out_free:
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
