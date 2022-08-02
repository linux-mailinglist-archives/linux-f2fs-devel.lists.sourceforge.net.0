Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B05DB588279
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Aug 2022 21:25:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oIxVf-00075b-4z; Tue, 02 Aug 2022 19:24:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1oIxVd-00075V-D9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 19:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ol8XEd9Xgiw9DVEUvhaR/g/lu3bxJFLfa/z6boQnMLU=; b=PWuWaoKKeFhczlcv9EMjNroPhx
 XTddExS0JP9wXSYWpN+UUfm0T6MhDUGJZM2c1wkyMRhECrj5cxLXmKCN864iAUyeNrC4He10oEtYo
 SUkQmS3ieVPLh73IRelpJQKOgT0YEKsQffRcay15V7STkhHpsdxmR/nFWr/25LImBVPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ol8XEd9Xgiw9DVEUvhaR/g/lu3bxJFLfa/z6boQnMLU=; b=N
 p9Y2faLEqIGF6jidjn8HVR1g8nDEtGRuIiSjCwx4PLyGX6sJzExdtQOAnrdOxVpW31texG/PlP/fr
 k6EI/A69FZrrx8NUQhyW6xRnVOYgwgeRaWuN3kjKVMHyogTT01ZNuU2yBhoIBhaq78Dw7aDaBI92J
 fKcHCbTFSpj9Wg/U=;
Received: from mail-pj1-f52.google.com ([209.85.216.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oIxVa-00054Q-9d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 19:24:52 +0000
Received: by mail-pj1-f52.google.com with SMTP id b4so4324088pji.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 02 Aug 2022 12:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ol8XEd9Xgiw9DVEUvhaR/g/lu3bxJFLfa/z6boQnMLU=;
 b=cqPtNnNDcAoYmgHDC5h5SntisVB4yGcCX0CJgaUaQUtmqrEW9sOV5jSrFKBe2nfJ+5
 8o6qxm3D57yBCZ0hdOP9mu2Fy9kQGIDg/cQvc7lD6bsvjpR0hM1kZAxtBgCAQ6EFkkXD
 2ZqYidoqggBhQTUFGMpvMRDYRYIbe3hg0YEJHkarLABF8+3KDyUStwq0jvre8Y+IvDie
 tgUVv+tsDOQw/b8CLRWCjORdC3sVLSPlLHWFuw+HKNtSS3MuVLLyNVQRrM+94mtoSpQE
 ViJZwdREqFsEaCZ/3DD3uGx3h97+ByWikELW9Zpht12M4ib9XweeXje4C7MVKNXDzhpw
 JO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ol8XEd9Xgiw9DVEUvhaR/g/lu3bxJFLfa/z6boQnMLU=;
 b=5buar/EYW9260/WWpEZ2a/g+RrTtu7GMeQHlLq6bPVoDwLXpLY2Ns+AHPh7NipM8TV
 MXqZdmBEdfN+59w3s2RBMkksJaOtbB8pNSUyuEfLY32u0cPAFkEbiO4WrHwcIndXuy5N
 XmIzl7VeTmDFY3V9QUpLFq17JVUn/gRAj2jz45xGe/sFp99xXtR8TQrH6t/Q1KIlkvRD
 sgtnDVa+ukVGJ7g1sJ6MekOag8AhiMZJZp6z8BZNOg/FpqI0dHCJGdfGn44zXI6NTnNH
 5bURHTiJjzYA5SfXsmKkCKRhAx2wT7tk0CNnfTLieACnq9xCYacPY0v4aOaahE/EdUrr
 U+mw==
X-Gm-Message-State: ACgBeo3chOfRyEqgpVBkKlp/E6Xb9cLBHeADZkLu+cnIoiqWi9qa3MHA
 eKTJ2bmPEKCVylKRJkywa7k=
X-Google-Smtp-Source: AA6agR6bh0oqpC1pHYhEvCqhnkSopmnoD141qo8VDTXVB7x6CT8e/KAaCKHarQCcPXEQPq0kLyAC4A==
X-Received: by 2002:a17:902:c941:b0:16e:fe88:99e5 with SMTP id
 i1-20020a170902c94100b0016efe8899e5mr6919567pla.38.1659468283615; 
 Tue, 02 Aug 2022 12:24:43 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:8ce3:f1f2:7d1a:ece4])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a170902e88d00b0016efe8821a3sm67307plg.89.2022.08.02.12.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 12:24:43 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  2 Aug 2022 12:24:37 -0700
Message-Id: <20220802192437.1895492-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Now decompression is being handled in
 workqueue and it makes read I/O latency non-deterministic,
 because of the non-deterministic
 scheduling nature of workqueues. So, I made it handled in softirq cont [...]
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oIxVa-00054Q-9d
Subject: [f2fs-dev] [PATCH v2] f2fs: handle decompress only post processing
 in softirq
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Now decompression is being handled in workqueue and it makes read I/O
latency non-deterministic, because of the non-deterministic scheduling
nature of workqueues. So, I made it handled in softirq context only if
possible, not in low memory devices, since this modification will
maintain decompresion related memory a little longer.
---
v1: fixed build errors reported by kernel test robot <lkp@intel.com>
v2: enhanced readability and removed a redundant code

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c | 203 ++++++++++++++++++++++++++++++---------------
 fs/f2fs/data.c     |  52 ++++++++----
 fs/f2fs/f2fs.h     |  17 ++--
 3 files changed, 179 insertions(+), 93 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index fa237e5c7173..086e6f74ce32 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -729,14 +729,19 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	return ret;
 }
 
-void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
+static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
+		bool pre_alloc);
+static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
+		bool bypass_destroy_callback, bool pre_alloc);
+
+void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
 	struct f2fs_inode_info *fi = F2FS_I(dic->inode);
 	const struct f2fs_compress_ops *cops =
 			f2fs_cops[fi->i_compress_algorithm];
+	bool bypass_callback = false;
 	int ret;
-	int i;
 
 	trace_f2fs_decompress_pages_start(dic->inode, dic->cluster_idx,
 				dic->cluster_size, fi->i_compress_algorithm);
@@ -746,41 +751,10 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
 		goto out_end_io;
 	}
 
-	dic->tpages = page_array_alloc(dic->inode, dic->cluster_size);
-	if (!dic->tpages) {
-		ret = -ENOMEM;
-		goto out_end_io;
-	}
-
-	for (i = 0; i < dic->cluster_size; i++) {
-		if (dic->rpages[i]) {
-			dic->tpages[i] = dic->rpages[i];
-			continue;
-		}
-
-		dic->tpages[i] = f2fs_compress_alloc_page();
-		if (!dic->tpages[i]) {
-			ret = -ENOMEM;
-			goto out_end_io;
-		}
-	}
-
-	if (cops->init_decompress_ctx) {
-		ret = cops->init_decompress_ctx(dic);
-		if (ret)
-			goto out_end_io;
-	}
-
-	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
-	if (!dic->rbuf) {
-		ret = -ENOMEM;
-		goto out_destroy_decompress_ctx;
-	}
-
-	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
-	if (!dic->cbuf) {
-		ret = -ENOMEM;
-		goto out_vunmap_rbuf;
+	ret = f2fs_prepare_decomp_mem(dic, false);
+	if (ret) {
+		bypass_callback = true;
+		goto out_release;
 	}
 
 	dic->clen = le32_to_cpu(dic->cbuf->clen);
@@ -788,7 +762,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
 
 	if (dic->clen > PAGE_SIZE * dic->nr_cpages - COMPRESS_HEADER_SIZE) {
 		ret = -EFSCORRUPTED;
-		goto out_vunmap_cbuf;
+		goto out_release;
 	}
 
 	ret = cops->decompress_pages(dic);
@@ -809,17 +783,13 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
 		}
 	}
 
-out_vunmap_cbuf:
-	vm_unmap_ram(dic->cbuf, dic->nr_cpages);
-out_vunmap_rbuf:
-	vm_unmap_ram(dic->rbuf, dic->cluster_size);
-out_destroy_decompress_ctx:
-	if (cops->destroy_decompress_ctx)
-		cops->destroy_decompress_ctx(dic);
+out_release:
+	f2fs_release_decomp_mem(dic, bypass_callback, false);
+
 out_end_io:
 	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
 							dic->clen, ret);
-	f2fs_decompress_end_io(dic, ret);
+	f2fs_decompress_end_io(dic, ret, in_task);
 }
 
 /*
@@ -829,7 +799,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic)
  * (or in the case of a failure, cleans up without actually decompressing).
  */
 void f2fs_end_read_compressed_page(struct page *page, bool failed,
-						block_t blkaddr)
+		block_t blkaddr, bool in_task)
 {
 	struct decompress_io_ctx *dic =
 			(struct decompress_io_ctx *)page_private(page);
@@ -839,12 +809,12 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 
 	if (failed)
 		WRITE_ONCE(dic->failed, true);
-	else if (blkaddr)
+	else if (blkaddr && in_task)
 		f2fs_cache_compressed_page(sbi, page,
 					dic->inode->i_ino, blkaddr);
 
 	if (atomic_dec_and_test(&dic->remaining_pages))
-		f2fs_decompress_cluster(dic);
+		f2fs_decompress_cluster(dic, in_task);
 }
 
 static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
@@ -1552,16 +1522,85 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	return err;
 }
 
-static void f2fs_free_dic(struct decompress_io_ctx *dic);
+static inline bool allow_memalloc_for_decomp(struct f2fs_sb_info *sbi,
+		bool pre_alloc)
+{
+	return pre_alloc ^ f2fs_low_mem_mode(sbi);
+}
+
+static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
+		bool pre_alloc)
+{
+	const struct f2fs_compress_ops *cops =
+		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
+	int i;
+
+	if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+		return 0;
+
+	dic->tpages = page_array_alloc(dic->inode, dic->cluster_size);
+	if (!dic->tpages)
+		return -ENOMEM;
+
+	for (i = 0; i < dic->cluster_size; i++) {
+		if (dic->rpages[i]) {
+			dic->tpages[i] = dic->rpages[i];
+			continue;
+		}
+
+		dic->tpages[i] = f2fs_compress_alloc_page();
+		if (!dic->tpages[i])
+			return -ENOMEM;
+	}
+
+	dic->rbuf = f2fs_vmap(dic->tpages, dic->cluster_size);
+	if (!dic->rbuf)
+		return -ENOMEM;
+
+	dic->cbuf = f2fs_vmap(dic->cpages, dic->nr_cpages);
+	if (!dic->cbuf)
+		return -ENOMEM;
+
+	if (cops->init_decompress_ctx) {
+		int ret = cops->init_decompress_ctx(dic);
+
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
+		bool bypass_destroy_callback, bool pre_alloc)
+{
+	const struct f2fs_compress_ops *cops =
+		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
+
+	if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+		return;
+
+	if (!bypass_destroy_callback && cops->destroy_decompress_ctx)
+		cops->destroy_decompress_ctx(dic);
+
+	if (dic->cbuf)
+		vm_unmap_ram(dic->cbuf, dic->nr_cpages);
+
+	if (dic->rbuf)
+		vm_unmap_ram(dic->rbuf, dic->cluster_size);
+}
+
+static void f2fs_free_dic(struct decompress_io_ctx *dic,
+		bool bypass_destroy_callback);
 
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 {
 	struct decompress_io_ctx *dic;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
-	int i;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
+	int i, ret;
 
-	dic = f2fs_kmem_cache_alloc(dic_entry_slab, GFP_F2FS_ZERO,
-					false, F2FS_I_SB(cc->inode));
+	dic = f2fs_kmem_cache_alloc(dic_entry_slab, GFP_F2FS_ZERO, false, sbi);
 	if (!dic)
 		return ERR_PTR(-ENOMEM);
 
@@ -1587,32 +1626,43 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	dic->nr_rpages = cc->cluster_size;
 
 	dic->cpages = page_array_alloc(dic->inode, dic->nr_cpages);
-	if (!dic->cpages)
+	if (!dic->cpages) {
+		ret = -ENOMEM;
 		goto out_free;
+	}
 
 	for (i = 0; i < dic->nr_cpages; i++) {
 		struct page *page;
 
 		page = f2fs_compress_alloc_page();
-		if (!page)
+		if (!page) {
+			ret = -ENOMEM;
 			goto out_free;
+		}
 
 		f2fs_set_compressed_page(page, cc->inode,
 					start_idx + i + 1, dic);
 		dic->cpages[i] = page;
 	}
 
+	ret = f2fs_prepare_decomp_mem(dic, true);
+	if (ret)
+		goto out_free;
+
 	return dic;
 
 out_free:
-	f2fs_free_dic(dic);
-	return ERR_PTR(-ENOMEM);
+	f2fs_free_dic(dic, true);
+	return ERR_PTR(ret);
 }
 
-static void f2fs_free_dic(struct decompress_io_ctx *dic)
+static void f2fs_free_dic(struct decompress_io_ctx *dic,
+		bool bypass_destroy_callback)
 {
 	int i;
 
+	f2fs_release_decomp_mem(dic, bypass_destroy_callback, true);
+
 	if (dic->tpages) {
 		for (i = 0; i < dic->cluster_size; i++) {
 			if (dic->rpages[i])
@@ -1637,17 +1687,33 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic)
 	kmem_cache_free(dic_entry_slab, dic);
 }
 
-static void f2fs_put_dic(struct decompress_io_ctx *dic)
+static void f2fs_late_free_dic(struct work_struct *work)
+{
+	struct decompress_io_ctx *dic =
+		container_of(work, struct decompress_io_ctx, free_work);
+
+	f2fs_free_dic(dic, false);
+}
+
+static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
 {
-	if (refcount_dec_and_test(&dic->refcnt))
-		f2fs_free_dic(dic);
+	if (refcount_dec_and_test(&dic->refcnt)) {
+		if (in_task) {
+			f2fs_free_dic(dic, false);
+		} else {
+			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
+			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
+					&dic->free_work);
+		}
+	}
 }
 
 /*
  * Update and unlock the cluster's pagecache pages, and release the reference to
  * the decompress_io_ctx that was being held for I/O completion.
  */
-static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
+static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
+				bool in_task)
 {
 	int i;
 
@@ -1668,7 +1734,7 @@ static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
 		unlock_page(rpage);
 	}
 
-	f2fs_put_dic(dic);
+	f2fs_put_dic(dic, in_task);
 }
 
 static void f2fs_verify_cluster(struct work_struct *work)
@@ -1685,14 +1751,15 @@ static void f2fs_verify_cluster(struct work_struct *work)
 			SetPageError(rpage);
 	}
 
-	__f2fs_decompress_end_io(dic, false);
+	__f2fs_decompress_end_io(dic, false, true);
 }
 
 /*
  * This is called when a compressed cluster has been decompressed
  * (or failed to be read and/or decompressed).
  */
-void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
+void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
+				bool in_task)
 {
 	if (!failed && dic->need_verity) {
 		/*
@@ -1704,7 +1771,7 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
 		INIT_WORK(&dic->verity_work, f2fs_verify_cluster);
 		fsverity_enqueue_verify_work(&dic->verity_work);
 	} else {
-		__f2fs_decompress_end_io(dic, failed);
+		__f2fs_decompress_end_io(dic, failed, in_task);
 	}
 }
 
@@ -1713,12 +1780,12 @@ void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
  *
  * This is called when the page is no longer needed and can be freed.
  */
-void f2fs_put_page_dic(struct page *page)
+void f2fs_put_page_dic(struct page *page, bool in_task)
 {
 	struct decompress_io_ctx *dic =
 			(struct decompress_io_ctx *)page_private(page);
 
-	f2fs_put_dic(dic);
+	f2fs_put_dic(dic, in_task);
 }
 
 /*
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b3dbe77f902b..f48eec8f93e2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -119,7 +119,7 @@ struct bio_post_read_ctx {
 	block_t fs_blkaddr;
 };
 
-static void f2fs_finish_read_bio(struct bio *bio)
+static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 {
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
@@ -133,8 +133,9 @@ static void f2fs_finish_read_bio(struct bio *bio)
 
 		if (f2fs_is_compressed_page(page)) {
 			if (bio->bi_status)
-				f2fs_end_read_compressed_page(page, true, 0);
-			f2fs_put_page_dic(page);
+				f2fs_end_read_compressed_page(page, true, 0,
+							in_task);
+			f2fs_put_page_dic(page, in_task);
 			continue;
 		}
 
@@ -191,7 +192,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 		fsverity_verify_bio(bio);
 	}
 
-	f2fs_finish_read_bio(bio);
+	f2fs_finish_read_bio(bio, true);
 }
 
 /*
@@ -203,7 +204,7 @@ static void f2fs_verify_bio(struct work_struct *work)
  * can involve reading verity metadata pages from the file, and these verity
  * metadata pages may be encrypted and/or compressed.
  */
-static void f2fs_verify_and_finish_bio(struct bio *bio)
+static void f2fs_verify_and_finish_bio(struct bio *bio, bool in_task)
 {
 	struct bio_post_read_ctx *ctx = bio->bi_private;
 
@@ -211,7 +212,7 @@ static void f2fs_verify_and_finish_bio(struct bio *bio)
 		INIT_WORK(&ctx->work, f2fs_verify_bio);
 		fsverity_enqueue_verify_work(&ctx->work);
 	} else {
-		f2fs_finish_read_bio(bio);
+		f2fs_finish_read_bio(bio, in_task);
 	}
 }
 
@@ -224,7 +225,8 @@ static void f2fs_verify_and_finish_bio(struct bio *bio)
  * that the bio includes at least one compressed page.  The actual decompression
  * is done on a per-cluster basis, not a per-bio basis.
  */
-static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx)
+static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
+		bool in_task)
 {
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
@@ -237,7 +239,7 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx)
 		/* PG_error was set if decryption failed. */
 		if (f2fs_is_compressed_page(page))
 			f2fs_end_read_compressed_page(page, PageError(page),
-						blkaddr);
+						blkaddr, in_task);
 		else
 			all_compressed = false;
 
@@ -262,15 +264,16 @@ static void f2fs_post_read_work(struct work_struct *work)
 		fscrypt_decrypt_bio(ctx->bio);
 
 	if (ctx->enabled_steps & STEP_DECOMPRESS)
-		f2fs_handle_step_decompress(ctx);
+		f2fs_handle_step_decompress(ctx, true);
 
-	f2fs_verify_and_finish_bio(ctx->bio);
+	f2fs_verify_and_finish_bio(ctx->bio, true);
 }
 
 static void f2fs_read_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
 	struct bio_post_read_ctx *ctx;
+	bool intask = in_task();
 
 	iostat_update_and_unbind_ctx(bio, 0);
 	ctx = bio->bi_private;
@@ -281,16 +284,29 @@ static void f2fs_read_end_io(struct bio *bio)
 	}
 
 	if (bio->bi_status) {
-		f2fs_finish_read_bio(bio);
+		f2fs_finish_read_bio(bio, intask);
 		return;
 	}
 
-	if (ctx && (ctx->enabled_steps & (STEP_DECRYPT | STEP_DECOMPRESS))) {
-		INIT_WORK(&ctx->work, f2fs_post_read_work);
-		queue_work(ctx->sbi->post_read_wq, &ctx->work);
-	} else {
-		f2fs_verify_and_finish_bio(bio);
+	if (ctx) {
+		unsigned int enabled_steps = ctx->enabled_steps &
+					(STEP_DECRYPT | STEP_DECOMPRESS);
+
+		/*
+		 * If we have only decompression step between decompression and
+		 * decrypt, we don't need post processing for this.
+		 */
+		if (enabled_steps == STEP_DECOMPRESS &&
+				!f2fs_low_mem_mode(sbi)) {
+			f2fs_handle_step_decompress(ctx, intask);
+		} else if (enabled_steps) {
+			INIT_WORK(&ctx->work, f2fs_post_read_work);
+			queue_work(ctx->sbi->post_read_wq, &ctx->work);
+			return;
+		}
 	}
+
+	f2fs_verify_and_finish_bio(bio, intask);
 }
 
 static void f2fs_write_end_io(struct bio *bio)
@@ -2220,7 +2236,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
 			if (atomic_dec_and_test(&dic->remaining_pages))
-				f2fs_decompress_cluster(dic);
+				f2fs_decompress_cluster(dic, true);
 			continue;
 		}
 
@@ -2238,7 +2254,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 					page->index, for_write);
 			if (IS_ERR(bio)) {
 				ret = PTR_ERR(bio);
-				f2fs_decompress_end_io(dic, ret);
+				f2fs_decompress_end_io(dic, ret, true);
 				f2fs_put_dnode(&dn);
 				*bio_ret = NULL;
 				return ret;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ecd870e5d6da..51b8cb5b29ba 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1589,6 +1589,7 @@ struct decompress_io_ctx {
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
 	struct work_struct verity_work;	/* work to verify the decompressed pages */
+	struct work_struct free_work;	/* work for late free this structure itself */
 };
 
 #define NULL_CLUSTER			((unsigned int)(~0))
@@ -4186,9 +4187,9 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
 int f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
-void f2fs_decompress_cluster(struct decompress_io_ctx *dic);
+void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
 void f2fs_end_read_compressed_page(struct page *page, bool failed,
-							block_t blkaddr);
+				block_t blkaddr, bool in_task);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
 bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
@@ -4207,8 +4208,9 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				unsigned nr_pages, sector_t *last_block_in_bio,
 				bool is_readahead, bool for_write);
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
-void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed);
-void f2fs_put_page_dic(struct page *page);
+void f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed,
+				bool in_task);
+void f2fs_put_page_dic(struct page *page, bool in_task);
 unsigned int f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn);
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse);
@@ -4254,13 +4256,14 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 }
 static inline int f2fs_init_compress_mempool(void) { return 0; }
 static inline void f2fs_destroy_compress_mempool(void) { }
-static inline void f2fs_decompress_cluster(struct decompress_io_ctx *dic) { }
+static inline void f2fs_decompress_cluster(struct decompress_io_ctx *dic,
+				bool in_task) { }
 static inline void f2fs_end_read_compressed_page(struct page *page,
-						bool failed, block_t blkaddr)
+				bool failed, block_t blkaddr, bool in_task)
 {
 	WARN_ON_ONCE(1);
 }
-static inline void f2fs_put_page_dic(struct page *page)
+static inline void f2fs_put_page_dic(struct page *page, bool in_task)
 {
 	WARN_ON_ONCE(1);
 }
-- 
2.37.1.455.g008518b4e5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
