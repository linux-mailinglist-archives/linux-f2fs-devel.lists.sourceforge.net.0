Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E078E27BFF0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Sep 2020 10:47:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNBId-0002tY-OH; Tue, 29 Sep 2020 08:47:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kNBIc-0002tR-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Sep 2020 08:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=288NrupgNYfuUpRtVWJUZJWe/GtxDB01o+rP4ceaUHI=; b=MFVZhPr/lBDAIiSyigoOPIuE2F
 0V/19hWqwhj1blNSzKOY9tn4ld/cdghYuVp1c3QNPPT3HcfO6zIoGj1tOfa1HyBGoALAdCsMZrI91
 UOAHUXABjqMk9NUhQegBlwo8Ek7zSBsZe+ilQ9xfy/H9H0U2YVsyj0gIR9Ab+JhY0qT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=288NrupgNYfuUpRtVWJUZJWe/GtxDB01o+rP4ceaUHI=; b=Xv1P0ct1zN2XO6WqQ02NrqPAAh
 Ody2DbSmnU642dHnpWgfpitBM79Pjo9q+XqY5A4mRLOx0ezA3K04/REYeU/E7aQ2F5qO3BJcnL+dz
 H4gnLk+gHlJkOMFz/146PHGnmi3kLBn2NQv3OFrh9Xgb4KQLyvOUm8kAaG4m8WzrAlwU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kNBIY-009qN8-04
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Sep 2020 08:47:50 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D73A2067D;
 Tue, 29 Sep 2020 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601369260;
 bh=DNYM/4w8rJN2/YfFtQoOXzGNmyAl1oeWtzYZe8JQWzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M3H8CT+JH+ZxnodLXx7dJj5v9l9WivGVF+iHmXvz0QXeY9CcpOhEhM41pDJ5ZLuKv
 8yX0ngD+VGVy4jPKOoS/VMB/hBU167xZ09XM5aTw1GVqvIG+YLcJI6eKbYfGUpfHS5
 jZb8+R09OkmJDDP5t1qtrMxVprlvln7MgBWn+Q4s=
Date: Tue, 29 Sep 2020 01:47:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200929084739.GB1567825@google.com>
References: <20200914090514.50102-1-yuchao0@huawei.com>
 <20200929082306.GA1567825@google.com>
 <6e7639db-9120-d406-0a46-ec841845bb28@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e7639db-9120-d406-0a46-ec841845bb28@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kNBIY-009qN8-04
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: compress: introduce page array
 slab cache
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

On 09/29, Chao Yu wrote:
> On 2020/9/29 16:23, Jaegeuk Kim wrote:
> > I found a bug related to the number of page pointer allocation related to
> > nr_cpages.
> 
> Jaegeuk,
> 
> If I didn't miss anything, you mean that nr_cpages could be larger
> than nr_rpages, right? the problematic case here is lzo/lzo-rle:
> 
> cc->clen = lzo1x_worst_compress(PAGE_SIZE << cc->log_cluster_size);
> 
> As we can't limited clen as we did for lz4/zstd:
> 
> cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;

Yes, I've seen some memory corruption in lzo test. Here is another patch to fix
mem leak.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c | 67 ++++++++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index f086ac43ca825..ba2d4897744d8 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -20,22 +20,20 @@
 static struct kmem_cache *cic_entry_slab;
 static struct kmem_cache *dic_entry_slab;
 
-static void *page_array_alloc(struct inode *inode)
+static void *page_array_alloc(struct inode *inode, int nr)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	unsigned int size = sizeof(struct page *) <<
-				F2FS_I(inode)->i_log_cluster_size;
+	unsigned int size = sizeof(struct page *) * nr;
 
 	if (likely(size == sbi->page_array_slab_size))
 		return kmem_cache_zalloc(sbi->page_array_slab, GFP_NOFS);
 	return f2fs_kzalloc(sbi, size, GFP_NOFS);
 }
 
-static void page_array_free(struct inode *inode, void *pages)
+static void page_array_free(struct inode *inode, void *pages, int nr)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	unsigned int size = sizeof(struct page *) <<
-				F2FS_I(inode)->i_log_cluster_size;
+	unsigned int size = sizeof(struct page *) * nr;
 
 	if (!pages)
 		return;
@@ -162,13 +160,13 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
 	if (cc->rpages)
 		return 0;
 
-	cc->rpages = page_array_alloc(cc->inode);
+	cc->rpages = page_array_alloc(cc->inode, cc->cluster_size);
 	return cc->rpages ? 0 : -ENOMEM;
 }
 
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	page_array_free(cc->inode, cc->rpages);
+	page_array_free(cc->inode, cc->rpages, cc->cluster_size);
 	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
@@ -602,7 +600,8 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	struct f2fs_inode_info *fi = F2FS_I(cc->inode);
 	const struct f2fs_compress_ops *cops =
 				f2fs_cops[fi->i_compress_algorithm];
-	unsigned int max_len, nr_cpages;
+	unsigned int max_len, new_nr_cpages;
+	struct page **new_cpages;
 	int i, ret;
 
 	trace_f2fs_compress_pages_start(cc->inode, cc->cluster_idx,
@@ -617,7 +616,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	max_len = COMPRESS_HEADER_SIZE + cc->clen;
 	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
 
-	cc->cpages = page_array_alloc(cc->inode);
+	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
 	if (!cc->cpages) {
 		ret = -ENOMEM;
 		goto destroy_compress_ctx;
@@ -659,16 +658,28 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	for (i = 0; i < COMPRESS_DATA_RESERVED_SIZE; i++)
 		cc->cbuf->reserved[i] = cpu_to_le32(0);
 
-	nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
+	new_nr_cpages = DIV_ROUND_UP(cc->clen + COMPRESS_HEADER_SIZE, PAGE_SIZE);
+
+	/* Now we're going to cut unnecessary tail pages */
+	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
+	if (new_cpages) {
+		ret = -ENOMEM;
+		goto out_vunmap_cbuf;
+	}
 
 	/* zero out any unused part of the last page */
 	memset(&cc->cbuf->cdata[cc->clen], 0,
-	       (nr_cpages * PAGE_SIZE) - (cc->clen + COMPRESS_HEADER_SIZE));
+			(new_nr_cpages * PAGE_SIZE) -
+			(cc->clen + COMPRESS_HEADER_SIZE));
 
 	vm_unmap_ram(cc->cbuf, cc->nr_cpages);
 	vm_unmap_ram(cc->rbuf, cc->cluster_size);
 
-	for (i = nr_cpages; i < cc->nr_cpages; i++) {
+	for (i = 0; i < cc->nr_cpages; i++) {
+		if (i < new_nr_cpages) {
+			new_cpages[i] = cc->cpages[i];
+			continue;
+		}
 		f2fs_compress_free_page(cc->cpages[i]);
 		cc->cpages[i] = NULL;
 	}
@@ -676,7 +687,9 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	if (cops->destroy_compress_ctx)
 		cops->destroy_compress_ctx(cc);
 
-	cc->nr_cpages = nr_cpages;
+	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	cc->cpages = new_cpages;
+	cc->nr_cpages = new_nr_cpages;
 
 	trace_f2fs_compress_pages_end(cc->inode, cc->cluster_idx,
 							cc->clen, ret);
@@ -691,7 +704,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		if (cc->cpages[i])
 			f2fs_compress_free_page(cc->cpages[i]);
 	}
-	page_array_free(cc->inode, cc->cpages);
+	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
 	cc->cpages = NULL;
 destroy_compress_ctx:
 	if (cops->destroy_compress_ctx)
@@ -730,7 +743,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 		goto out_free_dic;
 	}
 
-	dic->tpages = page_array_alloc(dic->inode);
+	dic->tpages = page_array_alloc(dic->inode, dic->cluster_size);
 	if (!dic->tpages) {
 		ret = -ENOMEM;
 		goto out_free_dic;
@@ -1203,7 +1216,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	cic->inode = inode;
 	atomic_set(&cic->pending_pages, cc->nr_cpages);
-	cic->rpages = page_array_alloc(cc->inode);
+	cic->rpages = page_array_alloc(cc->inode, cc->cluster_size);
 	if (!cic->rpages)
 		goto out_put_cic;
 
@@ -1297,11 +1310,13 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	spin_unlock(&fi->i_size_lock);
 
 	f2fs_put_rpages(cc);
+	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	cc->cpages = NULL;
 	f2fs_destroy_compress_ctx(cc);
 	return 0;
 
 out_destroy_crypt:
-	page_array_free(cc->inode, cic->rpages);
+	page_array_free(cc->inode, cic->rpages, cc->cluster_size);
 
 	for (--i; i >= 0; i--)
 		fscrypt_finalize_bounce_page(&cc->cpages[i]);
@@ -1310,6 +1325,8 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			continue;
 		f2fs_put_page(cc->cpages[i], 1);
 	}
+	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	cc->cpages = NULL;
 out_put_cic:
 	kmem_cache_free(cic_entry_slab, cic);
 out_put_dnode:
@@ -1345,7 +1362,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 		end_page_writeback(cic->rpages[i]);
 	}
 
-	page_array_free(cic->inode, cic->rpages);
+	page_array_free(cic->inode, cic->rpages, cic->nr_rpages);
 	kmem_cache_free(cic_entry_slab, cic);
 }
 
@@ -1442,8 +1459,6 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 
 		err = f2fs_write_compressed_pages(cc, submitted,
 							wbc, io_type);
-		page_array_free(cc->inode, cc->cpages);
-		cc->cpages = NULL;
 		if (!err)
 			return 0;
 		f2fs_bug_on(F2FS_I_SB(cc->inode), err != -EAGAIN);
@@ -1468,7 +1483,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	if (!dic)
 		return ERR_PTR(-ENOMEM);
 
-	dic->rpages = page_array_alloc(cc->inode);
+	dic->rpages = page_array_alloc(cc->inode, cc->cluster_size);
 	if (!dic->rpages) {
 		kmem_cache_free(dic_entry_slab, dic);
 		return ERR_PTR(-ENOMEM);
@@ -1487,7 +1502,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 		dic->rpages[i] = cc->rpages[i];
 	dic->nr_rpages = cc->cluster_size;
 
-	dic->cpages = page_array_alloc(dic->inode);
+	dic->cpages = page_array_alloc(dic->inode, dic->nr_cpages);
 	if (!dic->cpages)
 		goto out_free;
 
@@ -1522,7 +1537,7 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 				continue;
 			f2fs_compress_free_page(dic->tpages[i]);
 		}
-		page_array_free(dic->inode, dic->tpages);
+		page_array_free(dic->inode, dic->tpages, dic->cluster_size);
 	}
 
 	if (dic->cpages) {
@@ -1531,10 +1546,10 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 				continue;
 			f2fs_compress_free_page(dic->cpages[i]);
 		}
-		page_array_free(dic->inode, dic->cpages);
+		page_array_free(dic->inode, dic->cpages, dic->nr_cpages);
 	}
 
-	page_array_free(dic->inode, dic->rpages);
+	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
 	kmem_cache_free(dic_entry_slab, dic);
 }
 
-- 
2.28.0.709.gb0816b6eb0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
