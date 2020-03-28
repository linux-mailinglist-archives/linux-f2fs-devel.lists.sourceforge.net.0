Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7511964CE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Mar 2020 10:34:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jI7qp-0002Co-Fn; Sat, 28 Mar 2020 09:33:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jI7qk-0002CX-7A
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 09:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=14sXR6QfZx1Z2fdmMzel6ckTdP03unzS6uGy2sTVPIs=; b=Wn6Pvtf91cAtSOrZQ0WyetE49s
 97Kn8SeMSE+Nt+oCUOL6vjxvqd1tjqy5W0UAb4CYRgv2drOdSFUqJucGFIv+oRlyccWm6qYu39Prc
 U7YFsogKFAUCgCVMhqSAS5Dsxlls/N70GKACWnyYRNMF5vj9ggKLoih501f1zDaVQfvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=14sXR6QfZx1Z2fdmMzel6ckTdP03unzS6uGy2sTVPIs=; b=Z
 Pcynf7IBjEL0VNKXZaRh9SuM2nhfCjR34TvkblNQqKCDt4os0aAbLPYXKXwl9jJmsLRS8R7fAZi3i
 cQB0c1nkvR6QjpPhKrYnqzDAgeltk5I37qwBv5NErfJCTSpfd8BFNEB6394SADJZ5tZYfiiEHqItk
 yOujO80fD9qnJ/lA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jI7qg-00C2Xr-3t
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 09:33:54 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 87C9AAC658DD25D9171B;
 Sat, 28 Mar 2020 17:33:39 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Sat, 28 Mar 2020 17:33:30 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 28 Mar 2020 17:33:23 +0800
Message-ID: <20200328093323.130902-1-yuchao0@huawei.com>
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
X-Headers-End: 1jI7qg-00C2Xr-3t
Subject: [f2fs-dev] [PATCH] f2fs: clean up {cic,dic}.ref handling
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

{cic,dic}.ref should be initialized to number of compressed pages,
let's initialize it directly rather than doing w/
f2fs_set_compressed_page().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9cc279ea3bfb..c0e7ba245c74 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -55,7 +55,7 @@ bool f2fs_is_compressed_page(struct page *page)
 }
 
 static void f2fs_set_compressed_page(struct page *page,
-		struct inode *inode, pgoff_t index, void *data, refcount_t *r)
+		struct inode *inode, pgoff_t index, void *data)
 {
 	SetPagePrivate(page);
 	set_page_private(page, (unsigned long)data);
@@ -63,8 +63,6 @@ static void f2fs_set_compressed_page(struct page *page,
 	/* i_crypto_info and iv index */
 	page->index = index;
 	page->mapping = inode->i_mapping;
-	if (r)
-		refcount_inc(r);
 }
 
 static void f2fs_put_compressed_page(struct page *page)
@@ -662,7 +660,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		cops->destroy_decompress_ctx(dic);
 out_free_dic:
 	if (verity)
-		refcount_add(dic->nr_cpages - 1, &dic->ref);
+		refcount_set(&dic->ref, dic->nr_cpages);
 	if (!verity)
 		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
 								ret, false);
@@ -1067,7 +1065,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	cic->inode = inode;
-	refcount_set(&cic->ref, 1);
+	refcount_set(&cic->ref, cc->nr_cpages);
 	cic->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
 			cc->log_cluster_size, GFP_NOFS);
 	if (!cic->rpages)
@@ -1077,8 +1075,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	for (i = 0; i < cc->nr_cpages; i++) {
 		f2fs_set_compressed_page(cc->cpages[i], inode,
-					cc->rpages[i + 1]->index,
-					cic, i ? &cic->ref : NULL);
+					cc->rpages[i + 1]->index, cic);
 		fio.compressed_page = cc->cpages[i];
 		if (fio.encrypted) {
 			fio.page = cc->rpages[i + 1];
@@ -1328,7 +1325,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 
 	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
-	refcount_set(&dic->ref, 1);
+	refcount_set(&dic->ref, cc->nr_cpages);
 	dic->cluster_idx = cc->cluster_idx;
 	dic->cluster_size = cc->cluster_size;
 	dic->log_cluster_size = cc->log_cluster_size;
@@ -1352,8 +1349,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 			goto out_free;
 
 		f2fs_set_compressed_page(page, cc->inode,
-					start_idx + i + 1,
-					dic, i ? &dic->ref : NULL);
+					start_idx + i + 1, dic);
 		dic->cpages[i] = page;
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
