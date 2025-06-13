Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C9AD8087
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 03:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B/7Jo3KVbkavSloZ5ZJFtO1qku6YPn7B+YgfqFBAEMk=; b=mVv8be3FvFUwd0fs1NTBjJTHdr
	Y2BXJNV+o7SAeCS5wYuVedHJ5TLk+HHT5HlVDcESIm9k7kOsSWEdFankv5gpm7aOeGw8vg7totpvo
	yxSV2ftSTJwrSJjaXvnC6hjh9tOIsUKYe41vYNsQb2WJgl7ZgqiQpjZGbOzYXzqy3mk0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPta0-0008Kt-PH;
	Fri, 13 Jun 2025 01:51:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1uPtZz-0008Kn-7Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 01:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1GfT9Wp+WBs+6sOyC0kgJlj14msoIH5z7H0OgQ7+WqQ=; b=gNwPR4LwgQ0MlMFVwAhDiZfCuH
 M9fbFnqH6q0AVcen2klIDkuDUY71AHm50XXPKZkmmXrjPkDAxQUc7tS5XqB5gZcs1eTMHrKYSBvBD
 jU+yQeJo/G3CgBkFurhEWc9CLMSINr0TQRLclse2f+yxJFD2DNn4B+BooOb16OBnmIfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1GfT9Wp+WBs+6sOyC0kgJlj14msoIH5z7H0OgQ7+WqQ=; b=E
 ZkGNOte1Ad/TpIUC33nTVygQ838LYyd+cTnTZBVYH/31AyVFLJOA4wgUp77UEYdxdmwvB1uPZ+jSg
 3NG6WVfAT8EihYFEfI89u6apiOLDxXaylRqoMrKcG/kQd2DkVRw2DofIzK1Wl0Iuay/CyrVEICf+Q
 8RY+MTI1OQMDWinw=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPtZy-0003uv-4D for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 01:51:39 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 55D1p0qG026367;
 Fri, 13 Jun 2025 09:51:00 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bJMjK1876z2NtGrn;
 Fri, 13 Jun 2025 09:47:49 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Fri, 13 Jun 2025 09:50:57 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 13 Jun 2025 09:50:44 +0800
Message-ID: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 55D1p0qG026367
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No logic changes, just cleanup and prepare for fixing the
 UAF issue in f2fs_free_dic. Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
 Signed-off-by: Baocong Liu <baocong.liu@unisoc.com> --- fs/f2fs/compress.c
 | 40 ++++++++++++++++++++ 1 file changed, 20 insertions [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uPtZy-0003uv-4D
Subject: [f2fs-dev] [PATCH 1/2] f2fs: compress: change the first parameter
 of page_array_{alloc, free} to sbi
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 baocong.liu@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No logic changes, just cleanup and prepare for fixing the UAF issue
in f2fs_free_dic.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
---
 fs/f2fs/compress.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b3c1df9..832a484 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -23,20 +23,18 @@
 static struct kmem_cache *cic_entry_slab;
 static struct kmem_cache *dic_entry_slab;
 
-static void *page_array_alloc(struct inode *inode, int nr)
+static void *page_array_alloc(struct f2fs_sb_info *sbi, int nr)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	unsigned int size = sizeof(struct page *) * nr;
 
 	if (likely(size <= sbi->page_array_slab_size))
 		return f2fs_kmem_cache_alloc(sbi->page_array_slab,
-					GFP_F2FS_ZERO, false, F2FS_I_SB(inode));
+					GFP_F2FS_ZERO, false, sbi);
 	return f2fs_kzalloc(sbi, size, GFP_NOFS);
 }
 
-static void page_array_free(struct inode *inode, void *pages, int nr)
+static void page_array_free(struct f2fs_sb_info *sbi, void *pages, int nr)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	unsigned int size = sizeof(struct page *) * nr;
 
 	if (!pages)
@@ -149,13 +147,13 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
 	if (cc->rpages)
 		return 0;
 
-	cc->rpages = page_array_alloc(cc->inode, cc->cluster_size);
+	cc->rpages = page_array_alloc(F2FS_I_SB(cc->inode), cc->cluster_size);
 	return cc->rpages ? 0 : -ENOMEM;
 }
 
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
 {
-	page_array_free(cc->inode, cc->rpages, cc->cluster_size);
+	page_array_free(F2FS_I_SB(cc->inode), cc->rpages, cc->cluster_size);
 	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
@@ -622,6 +620,7 @@ static void *f2fs_vmap(struct page **pages, unsigned int count)
 
 static int f2fs_compress_pages(struct compress_ctx *cc)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
 	struct f2fs_inode_info *fi = F2FS_I(cc->inode);
 	const struct f2fs_compress_ops *cops =
 				f2fs_cops[fi->i_compress_algorithm];
@@ -642,7 +641,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	cc->nr_cpages = DIV_ROUND_UP(max_len, PAGE_SIZE);
 	cc->valid_nr_cpages = cc->nr_cpages;
 
-	cc->cpages = page_array_alloc(cc->inode, cc->nr_cpages);
+	cc->cpages = page_array_alloc(sbi, cc->nr_cpages);
 	if (!cc->cpages) {
 		ret = -ENOMEM;
 		goto destroy_compress_ctx;
@@ -716,7 +715,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 		if (cc->cpages[i])
 			f2fs_compress_free_page(cc->cpages[i]);
 	}
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	page_array_free(sbi, cc->cpages, cc->nr_cpages);
 	cc->cpages = NULL;
 destroy_compress_ctx:
 	if (cops->destroy_compress_ctx)
@@ -1340,7 +1339,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	cic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	cic->inode = inode;
 	atomic_set(&cic->pending_pages, cc->valid_nr_cpages);
-	cic->rpages = page_array_alloc(cc->inode, cc->cluster_size);
+	cic->rpages = page_array_alloc(sbi, cc->cluster_size);
 	if (!cic->rpages)
 		goto out_put_cic;
 
@@ -1442,13 +1441,13 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	spin_unlock(&fi->i_size_lock);
 
 	f2fs_put_rpages(cc);
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	page_array_free(sbi, cc->cpages, cc->nr_cpages);
 	cc->cpages = NULL;
 	f2fs_destroy_compress_ctx(cc, false);
 	return 0;
 
 out_destroy_crypt:
-	page_array_free(cc->inode, cic->rpages, cc->cluster_size);
+	page_array_free(sbi, cic->rpages, cc->cluster_size);
 
 	for (--i; i >= 0; i--) {
 		if (!cc->cpages[i])
@@ -1469,7 +1468,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		f2fs_compress_free_page(cc->cpages[i]);
 		cc->cpages[i] = NULL;
 	}
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	page_array_free(sbi, cc->cpages, cc->nr_cpages);
 	cc->cpages = NULL;
 	return -EAGAIN;
 }
@@ -1499,7 +1498,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 		end_page_writeback(cic->rpages[i]);
 	}
 
-	page_array_free(cic->inode, cic->rpages, cic->nr_rpages);
+	page_array_free(sbi, cic->rpages, cic->nr_rpages);
 	kmem_cache_free(cic_entry_slab, cic);
 }
 
@@ -1640,7 +1639,7 @@ static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
 	if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
 		return 0;
 
-	dic->tpages = page_array_alloc(dic->inode, dic->cluster_size);
+	dic->tpages = page_array_alloc(F2FS_I_SB(dic->inode), dic->cluster_size);
 	if (!dic->tpages)
 		return -ENOMEM;
 
@@ -1700,7 +1699,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	if (!dic)
 		return ERR_PTR(-ENOMEM);
 
-	dic->rpages = page_array_alloc(cc->inode, cc->cluster_size);
+	dic->rpages = page_array_alloc(sbi, cc->cluster_size);
 	if (!dic->rpages) {
 		kmem_cache_free(dic_entry_slab, dic);
 		return ERR_PTR(-ENOMEM);
@@ -1721,7 +1720,7 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 		dic->rpages[i] = cc->rpages[i];
 	dic->nr_rpages = cc->cluster_size;
 
-	dic->cpages = page_array_alloc(dic->inode, dic->nr_cpages);
+	dic->cpages = page_array_alloc(sbi, dic->nr_cpages);
 	if (!dic->cpages) {
 		ret = -ENOMEM;
 		goto out_free;
@@ -1751,6 +1750,7 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 		bool bypass_destroy_callback)
 {
 	int i;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
 
 	f2fs_release_decomp_mem(dic, bypass_destroy_callback, true);
 
@@ -1762,7 +1762,7 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 				continue;
 			f2fs_compress_free_page(dic->tpages[i]);
 		}
-		page_array_free(dic->inode, dic->tpages, dic->cluster_size);
+		page_array_free(sbi, dic->tpages, dic->cluster_size);
 	}
 
 	if (dic->cpages) {
@@ -1771,10 +1771,10 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 				continue;
 			f2fs_compress_free_page(dic->cpages[i]);
 		}
-		page_array_free(dic->inode, dic->cpages, dic->nr_cpages);
+		page_array_free(sbi, dic->cpages, dic->nr_cpages);
 	}
 
-	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
+	page_array_free(sbi, dic->rpages, dic->nr_rpages);
 	kmem_cache_free(dic_entry_slab, dic);
 }
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
