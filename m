Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A3AD8088
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 03:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70/5xzOpNwJn5hTghmZh9B/DPtp5ZOQ4/kDWU22146o=; b=GA3o3aIJ4MCFRZoJQU61Yy8A7f
	4GSI5y+YhU6jtuMZjlTuMBIeJMJHdkiOgBLVlW7OOa8R2Q/AK7izyM0gL16LXPznGcYN2Zbs6ijHU
	IZsrpFVkknRy43fhMD7wFil6elmM3vyb2AkVBf60L9Rg/sbR2Jj2xbbOuRGI7mU6C7B4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPta5-0007MD-Hj;
	Fri, 13 Jun 2025 01:51:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1uPta3-0007Lq-A4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 01:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=utNFJl+RtZvozIDZapBkn3ZEuQXEXM7lXoAmf03v/vg=; b=jzAuu8i2LZ5lGQWJ+FuCCivYQ/
 Ypbm1UEIfhklpe9FBkllm8KQq+UeBeVDRYaagaBVgMxZ4pPTQaQU0Jd91tvvRaquOnLJIHofoypdq
 enPQnI4hKoAog2yo+bMjf2e8Kj4vh5UA1lw42+rgazNnJkuZnmXfPmotkrUQQCxJzYE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=utNFJl+RtZvozIDZapBkn3ZEuQXEXM7lXoAmf03v/vg=; b=JwXfMU0SdqKKC0QTyKd0MftrMl
 LvAi09CpLv9KNOwaBblHHYGmPjZwIrXGT6cVSAO58niM1wXIKR1Og+NMGn7kfp9Ycj3O9u+VDUu1o
 II8v8bAvuxP2bjzpG0SnaxxZZugIp4zLONZZODD7DaCtemJYgWy8jQh/SGBDDz/VfTf4=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPta2-0003wA-AO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 01:51:43 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 55D1p2IR026532;
 Fri, 13 Jun 2025 09:51:02 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bJMjM6Tffz2NtGrn;
 Fri, 13 Jun 2025 09:47:51 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Fri, 13 Jun 2025 09:51:00 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 13 Jun 2025 09:50:45 +0800
Message-ID: <1749779445-29125-2-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
References: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 55D1p2IR026532
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The decompress_io_ctx may be released asynchronously after
 I/O completion. If this file is deleted immediately after read, and the kworker
 of processing post_read_wq has not been executed yet due to h [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uPta2-0003wA-AO
Subject: [f2fs-dev] [PATCH 2/2] f2fs: compress: fix UAF of f2fs_inode_info
 in f2fs_free_dic
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

The decompress_io_ctx may be released asynchronously after
I/O completion. If this file is deleted immediately after read,
and the kworker of processing post_read_wq has not been executed yet
due to high workloads, It is possible that the inode(f2fs_inode_info)
is evicted and freed before it is used f2fs_free_dic.

    The UAF case as below:
    Thread A                                      Thread B
    - f2fs_decompress_end_io
     - f2fs_put_dic
      - queue_work
        add free_dic work to post_read_wq
                                                   - do_unlink
                                                    - iput
                                                     - evict
                                                      - call_rcu
    This file is deleted after read.

    Thread C                                 kworker to process post_read_wq
    - rcu_do_batch
     - f2fs_free_inode
      - kmem_cache_free
     inode is freed by rcu
                                             - process_scheduled_works
                                              - f2fs_late_free_dic
                                               - f2fs_free_dic
                                                - f2fs_release_decomp_mem
                                      read (dic->inode)->i_compress_algorithm

This patch store compress_algorithm and sbi in dic to avoid inode UAF.

In addition, the previous solution is deprecated in [1] may cause system hang.
[1] https://lore.kernel.org/all/c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org

Cc: Daeho Jeong <daehojeong@google.com>
Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
---
 fs/f2fs/compress.c | 40 ++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h     |  2 ++
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 832a484..8cbb803 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -214,13 +214,13 @@ static int lzo_decompress_pages(struct decompress_io_ctx *dic)
 	ret = lzo1x_decompress_safe(dic->cbuf->cdata, dic->clen,
 						dic->rbuf, &dic->rlen);
 	if (ret != LZO_E_OK) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lzo decompress failed, ret:%d", ret);
 		return -EIO;
 	}
 
 	if (dic->rlen != PAGE_SIZE << dic->log_cluster_size) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lzo invalid rlen:%zu, expected:%lu",
 				dic->rlen, PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
@@ -294,13 +294,13 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	ret = LZ4_decompress_safe(dic->cbuf->cdata, dic->rbuf,
 						dic->clen, dic->rlen);
 	if (ret < 0) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lz4 decompress failed, ret:%d", ret);
 		return -EIO;
 	}
 
 	if (ret != PAGE_SIZE << dic->log_cluster_size) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lz4 invalid ret:%d, expected:%lu",
 				ret, PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
@@ -422,13 +422,13 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	workspace_size = zstd_dstream_workspace_bound(max_window_size);
 
-	workspace = f2fs_vmalloc(F2FS_I_SB(dic->inode), workspace_size);
+	workspace = f2fs_vmalloc(dic->sbi, workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
 	stream = zstd_init_dstream(max_window_size, workspace, workspace_size);
 	if (!stream) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"%s zstd_init_dstream failed", __func__);
 		vfree(workspace);
 		return -EIO;
@@ -464,14 +464,14 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 
 	ret = zstd_decompress_stream(stream, &outbuf, &inbuf);
 	if (zstd_is_error(ret)) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"%s zstd_decompress_stream failed, ret: %d",
 				__func__, zstd_get_error_code(ret));
 		return -EIO;
 	}
 
 	if (dic->rlen != outbuf.pos) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"%s ZSTD invalid rlen:%zu, expected:%lu",
 				__func__, dic->rlen,
 				PAGE_SIZE << dic->log_cluster_size);
@@ -733,7 +733,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
 
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+	struct f2fs_sb_info *sbi = dic->sbi;
 	struct f2fs_inode_info *fi = F2FS_I(dic->inode);
 	const struct f2fs_compress_ops *cops =
 			f2fs_cops[fi->i_compress_algorithm];
@@ -806,7 +806,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 {
 	struct decompress_io_ctx *dic =
 			(struct decompress_io_ctx *)page_private(page);
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+	struct f2fs_sb_info *sbi = dic->sbi;
 
 	dec_page_count(sbi, F2FS_RD_DATA);
 
@@ -1632,14 +1632,13 @@ static inline bool allow_memalloc_for_decomp(struct f2fs_sb_info *sbi,
 static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
 		bool pre_alloc)
 {
-	const struct f2fs_compress_ops *cops =
-		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
+	const struct f2fs_compress_ops *cops = f2fs_cops[dic->compress_algorithm];
 	int i;
 
-	if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+	if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
 		return 0;
 
-	dic->tpages = page_array_alloc(F2FS_I_SB(dic->inode), dic->cluster_size);
+	dic->tpages = page_array_alloc(dic->sbi, dic->cluster_size);
 	if (!dic->tpages)
 		return -ENOMEM;
 
@@ -1669,10 +1668,9 @@ static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
 static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
 		bool bypass_destroy_callback, bool pre_alloc)
 {
-	const struct f2fs_compress_ops *cops =
-		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
+	const struct f2fs_compress_ops *cops = f2fs_cops[dic->compress_algorithm];
 
-	if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+	if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
 		return;
 
 	if (!bypass_destroy_callback && cops->destroy_decompress_ctx)
@@ -1707,6 +1705,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 
 	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
+	dic->sbi = sbi;
+	dic->compress_algorithm = F2FS_I(cc->inode)->i_compress_algorithm;
 	atomic_set(&dic->remaining_pages, cc->nr_cpages);
 	dic->cluster_idx = cc->cluster_idx;
 	dic->cluster_size = cc->cluster_size;
@@ -1750,7 +1750,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 		bool bypass_destroy_callback)
 {
 	int i;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+	/* use sbi in dic to avoid UFA of dic->inode*/
+	struct f2fs_sb_info *sbi = dic->sbi;
 
 	f2fs_release_decomp_mem(dic, bypass_destroy_callback, true);
 
@@ -1793,8 +1794,7 @@ static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
 			f2fs_free_dic(dic, false);
 		} else {
 			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
-			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
-					&dic->free_work);
+			queue_work(dic->sbi->post_read_wq, &dic->free_work);
 		}
 	}
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b..da2137e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1536,6 +1536,7 @@ struct compress_io_ctx {
 struct decompress_io_ctx {
 	u32 magic;			/* magic number to indicate page is compressed */
 	struct inode *inode;		/* inode the context belong to */
+	struct f2fs_sb_info *sbi;	/* f2fs_sb_info pointer */
 	pgoff_t cluster_idx;		/* cluster index number */
 	unsigned int cluster_size;	/* page count in cluster */
 	unsigned int log_cluster_size;	/* log of cluster size */
@@ -1576,6 +1577,7 @@ struct decompress_io_ctx {
 
 	bool failed;			/* IO error occurred before decompression? */
 	bool need_verity;		/* need fs-verity verification after decompression? */
+	unsigned char compress_algorithm;	/* backup algorithm type */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
 	struct work_struct verity_work;	/* work to verify the decompressed pages */
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
