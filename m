Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF632404DF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Aug 2020 12:40:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k55Di-0002bR-7V; Mon, 10 Aug 2020 10:39:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k55Dg-0002bH-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 10:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eZLeQfpBEF+EaEtXqn9AUZydWB64MFYL7gNrh9x8+K4=; b=iHgfkl8TF6l/Xm6pT1pwBdk27A
 f7x5shpP0C347zE+SNhXEkXuJsY4ttSXsSXzwa0K1BWa5jVzxRfvUJrz/BXeT33gQCcFsjc3YBT1T
 hQP3j8C+1FZaVspAo0sjROcqU4Fvm+695oUBXFM4g9qfEW2p7xO0Bmq3bDho9n0rkB7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eZLeQfpBEF+EaEtXqn9AUZydWB64MFYL7gNrh9x8+K4=; b=L
 9nVY2YNHAnC0WgykQ87W4h0cxPqqEYxzWRRvOunkkOR/zVzg4Nvg+wiqSLwUuao/FHqXwG7mOBXVa
 PlnDC0j1ZuO0dAitz8MdaL19ilwxrNNvtzX/1+mIpfLyzNV7F6h8G3Cc5rwae2pA2RcOMlQxJnuJk
 h8resyP/yzpIvwAA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k55Dc-00FPXf-P0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 10:39:56 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A9F50F1C55EE3D0DF714;
 Mon, 10 Aug 2020 18:39:43 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 10 Aug 2020 18:39:33 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 10 Aug 2020 18:39:30 +0800
Message-ID: <20200810103930.37836-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k55Dc-00FPXf-P0
Subject: [f2fs-dev] [PATCH] f2fs: compress: use more readable atomic_t type
 for {cic, dic}.ref
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

refcount_t type variable should never be less than one, so it's a
little bit hard to understand when we use it to indicate pending
compressed page count, let's change to use atomic_t for better
readability.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 10 +++++-----
 fs/f2fs/data.c     |  6 +++---
 fs/f2fs/f2fs.h     |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 3bb112e91cf6..38eb6707f883 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -677,7 +677,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 	if (bio->bi_status || PageError(page))
 		dic->failed = true;
 
-	if (refcount_dec_not_one(&dic->ref))
+	if (atomic_dec_return(&dic->pending_pages))
 		return;
 
 	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
@@ -746,7 +746,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		cops->destroy_decompress_ctx(dic);
 out_free_dic:
 	if (verity)
-		refcount_set(&dic->ref, dic->nr_cpages);
+		atomic_set(&dic->pending_pages, dic->nr_cpages);
 	if (!verity)
 		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
 								ret, false);
@@ -1161,7 +1161,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 
 	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	cic->inode = inode;
-	refcount_set(&cic->ref, cc->nr_cpages);
+	atomic_set(&cic->pending_pages, cc->nr_cpages);
 	cic->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
 			cc->log_cluster_size, GFP_NOFS);
 	if (!cic->rpages)
@@ -1296,7 +1296,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 
 	dec_page_count(sbi, F2FS_WB_DATA);
 
-	if (refcount_dec_not_one(&cic->ref))
+	if (atomic_dec_return(&cic->pending_pages))
 		return;
 
 	for (i = 0; i < cic->nr_rpages; i++) {
@@ -1438,7 +1438,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 
 	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
-	refcount_set(&dic->ref, cc->nr_cpages);
+	atomic_set(&dic->pending_pages, cc->nr_cpages);
 	dic->cluster_idx = cc->cluster_idx;
 	dic->cluster_size = cc->cluster_size;
 	dic->log_cluster_size = cc->log_cluster_size;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1b676be67b9..024e1695ae66 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -201,7 +201,7 @@ static void f2fs_verify_bio(struct bio *bio)
 		dic = (struct decompress_io_ctx *)page_private(page);
 
 		if (dic) {
-			if (refcount_dec_not_one(&dic->ref))
+			if (atomic_dec_return(&dic->pending_pages))
 				continue;
 			f2fs_verify_pages(dic->rpages,
 						dic->cluster_size);
@@ -2222,8 +2222,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			if (IS_ERR(bio)) {
 				ret = PTR_ERR(bio);
 				dic->failed = true;
-				if (refcount_sub_and_test(dic->nr_cpages - i,
-							&dic->ref)) {
+				if (!atomic_sub_return(dic->nr_cpages - i,
+							&dic->pending_pages)) {
 					f2fs_decompress_end_io(dic->rpages,
 							cc->cluster_size, true,
 							false);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 16322ea5b463..61da996ea4cc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1366,7 +1366,7 @@ struct compress_io_ctx {
 	struct inode *inode;		/* inode the context belong to */
 	struct page **rpages;		/* pages store raw data in cluster */
 	unsigned int nr_rpages;		/* total page number in rpages */
-	refcount_t ref;			/* referrence count of raw page */
+	atomic_t pending_pages;		/* in-flight compressed page count */
 };
 
 /* decompress io context for read IO path */
@@ -1385,7 +1385,7 @@ struct decompress_io_ctx {
 	struct compress_data *cbuf;	/* virtual mapped address on cpages */
 	size_t rlen;			/* valid data length in rbuf */
 	size_t clen;			/* valid data length in cbuf */
-	refcount_t ref;			/* referrence count of compressed page */
+	atomic_t pending_pages;		/* in-flight compressed page count */
 	bool failed;			/* indicate IO error during decompression */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
