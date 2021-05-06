Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 704DD375132
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 May 2021 11:01:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1leZsv-00073J-Qk; Thu, 06 May 2021 09:01:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1leZsu-00073B-DX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 09:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fW0XzApVgWTos0MVwqy7VfXOZvqXssb+f2DOYOzMJAc=; b=L6A0L+72B8wpQWhCdbntmFavkx
 ZF91cwbmQoACyw6z5/KNUqDvzI8zz1Ps7eJdfHQkVDD4iaVPqj3m1LrNTnfCg3BlxvSuM5W9oD0BN
 kMO1qxX6csl83TP6/BGhPaWresCfSbelOwzNOAWKJE351NlbUigQpkVpGozohCTUWVd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fW0XzApVgWTos0MVwqy7VfXOZvqXssb+f2DOYOzMJAc=; b=T
 UgKVBWMZnHY/h1uJjyEi3HlFCLPDN/CEyeGZqYFM3dUQljaXanGa5i2gDVdwP1gwP6OUHDmYuYnwr
 f0ncg61TaL8qjvoXvc8nhJUCbJ05qQRy4zQiT2NH1WFzTKhvNKfpc8aEThLj+z8wQcTlBc3wYnpK2
 0mfeXTET7cNe17vg=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1leZsn-004P7o-NM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 May 2021 09:01:28 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FbSDB6l8vzkWwZ;
 Thu,  6 May 2021 16:58:34 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Thu, 6 May 2021 17:01:00 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 6 May 2021 17:00:43 +0800
Message-ID: <20210506090043.39875-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1leZsn-004P7o-NM
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix to free compress page
 correctly
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

In error path of f2fs_write_compressed_pages(), it needs to call
f2fs_compress_free_page() to release temporary page.

Fixes: 5e6bbde95982 ("f2fs: introduce mempool for {,de}compress intermediate page allocation")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d911dff24253..e15ada12d1e8 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1382,7 +1382,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	for (i = 0; i < cc->nr_cpages; i++) {
 		if (!cc->cpages[i])
 			continue;
-		f2fs_put_page(cc->cpages[i], 1);
+		f2fs_compress_free_page(cc->cpages[i]);
+		cc->cpages[i] = NULL;
 	}
 out_put_cic:
 	kmem_cache_free(cic_entry_slab, cic);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
