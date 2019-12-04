Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF811212C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 02:54:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icJrm-0000Bb-W3; Wed, 04 Dec 2019 01:54:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1icJrl-0000BU-7r
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 01:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z2XEzifkF9YGye8czpTT/B4f2P71x2jzc7+pWSIvPxE=; b=i7C8nCBD5rmHGYKJEBzJy1Hty/
 s6rDh3J4TDjBi3maS8RHXl+IAelpFpyOsJljmPjaRo9bebkeaqEgV/AlJ4ZnY/F7pGLZE+LBXOfX0
 JWN2q7sd0N3O1fiOq8ix8DQKK6tej1JkEkYkCDwUiWKPAILsTZVO/yLhQUEQrJoVQ3ZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z2XEzifkF9YGye8czpTT/B4f2P71x2jzc7+pWSIvPxE=; b=Z
 M6W8Fj1MYngdu4KRBRkLmEh8t2GgKAjcYs5ShL2cWuT9BQ8j/1iJTCLYUVv0Fbk21E5STXsyNFrOW
 3CRp2+TVVvxDUk0f25M3OHw+ejjr5AiU9SsfpLf1q8pU9mejnSaBuSkuNqmsQhZUd2EBcXwrXwfar
 mStxzYANkkcOtUP8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1icJrj-003Lnd-84
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 01:54:09 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 03EB8429D63B65EB084F;
 Wed,  4 Dec 2019 09:53:59 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Dec 2019 09:53:50 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 4 Dec 2019 09:52:58 +0800
Message-ID: <20191204015258.104738-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1icJrj-003Lnd-84
Subject: [f2fs-dev] [PATCH] f2fs: introduce private bioset
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

In low memory scenario, we can allocate multiple bios without
submitting any of them.

- f2fs_write_checkpoint()
 - block_operations()
  - f2fs_sync_node_pages()
   step 1) flush cold nodes, allocate new bio from mempool
   - bio_alloc()
    - mempool_alloc()
   step 2) flush hot nodes, allocate a bio from mempool
   - bio_alloc()
    - mempool_alloc()
   step 3) flush warm nodes, be stuck in below call path
   - bio_alloc()
    - mempool_alloc()
     - loop to wait mempool element release, as we only
       reserved memory for two bio allocation, however above
       allocated two bios may never be submitted.

So we need avoid using default bioset, in this patch we introduce a
private bioset, in where we enlarg mempool element count to total
number of log header, so that we can make sure we have enough
backuped memory pool in scenario of allocating/holding multiple
bios.

Signed-off-by: Gao Xiang <gaoxiang25@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c  | 43 ++++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h  | 23 +++--------------------
 fs/f2fs/super.c |  7 ++++++-
 3 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a034cd0ce021..22fc45c36613 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -31,6 +31,47 @@
 static struct kmem_cache *bio_post_read_ctx_cache;
 static struct kmem_cache *bio_entry_slab;
 static mempool_t *bio_post_read_ctx_pool;
+static struct bio_set f2fs_bioset;
+
+#define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
+
+int __init f2fs_init_bioset(void)
+{
+	if (bioset_init(&f2fs_bioset, F2FS_BIO_POOL_SIZE,
+					0, BIOSET_NEED_BVECS))
+		return -ENOMEM;
+	return 0;
+}
+
+void f2fs_destroy_bioset(void)
+{
+	bioset_exit(&f2fs_bioset);
+}
+
+static inline struct bio *__f2fs_bio_alloc(gfp_t gfp_mask,
+						unsigned int nr_iovecs)
+{
+	return bio_alloc_bioset(gfp_mask, nr_iovecs, &f2fs_bioset);
+}
+
+struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail)
+{
+	struct bio *bio;
+
+	if (no_fail) {
+		/* No failure on bio allocation */
+		bio = __f2fs_bio_alloc(GFP_NOIO, npages);
+		if (!bio)
+			bio = __f2fs_bio_alloc(GFP_NOIO | __GFP_NOFAIL, npages);
+		return bio;
+	}
+	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
+		f2fs_show_injection_info(sbi, FAULT_ALLOC_BIO);
+		return NULL;
+	}
+
+	return __f2fs_bio_alloc(GFP_KERNEL, npages);
+}
 
 static bool __is_cp_guaranteed(struct page *page)
 {
@@ -3328,7 +3369,7 @@ int __init f2fs_init_bio_entry_cache(void)
 	return 0;
 }
 
-void __exit f2fs_destroy_bio_entry_cache(void)
+void f2fs_destroy_bio_entry_cache(void)
 {
 	kmem_cache_destroy(bio_entry_slab);
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a888a063c7f..a1bf53ddcfc8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2222,26 +2222,6 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
 	return entry;
 }
 
-static inline struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi,
-						int npages, bool no_fail)
-{
-	struct bio *bio;
-
-	if (no_fail) {
-		/* No failure on bio allocation */
-		bio = bio_alloc(GFP_NOIO, npages);
-		if (!bio)
-			bio = bio_alloc(GFP_NOIO | __GFP_NOFAIL, npages);
-		return bio;
-	}
-	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
-		f2fs_show_injection_info(sbi, FAULT_ALLOC_BIO);
-		return NULL;
-	}
-
-	return bio_alloc(GFP_KERNEL, npages);
-}
-
 static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 {
 	if (sbi->gc_mode == GC_URGENT)
@@ -3205,6 +3185,9 @@ void f2fs_destroy_checkpoint_caches(void);
 /*
  * data.c
  */
+int __init f2fs_init_bioset(void);
+void f2fs_destroy_bioset(void);
+struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool no_fail);
 int f2fs_init_post_read_processing(void);
 void f2fs_destroy_post_read_processing(void);
 int f2fs_init_bio_entry_cache(void);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 75a3b7220ecb..715c91b11946 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3767,8 +3767,12 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_bio_entry_cache();
 	if (err)
 		goto free_post_read;
+	err = f2fs_init_bioset();
+	if (err)
+		goto free_bio_enrty_cache;
 	return 0;
-
+free_bio_enrty_cache:
+	f2fs_destroy_bio_entry_cache();
 free_post_read:
 	f2fs_destroy_post_read_processing();
 free_root_stats:
@@ -3794,6 +3798,7 @@ static int __init init_f2fs_fs(void)
 
 static void __exit exit_f2fs_fs(void)
 {
+	f2fs_destroy_bioset();
 	f2fs_destroy_bio_entry_cache();
 	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
