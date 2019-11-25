Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72290109300
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 18:42:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZINL-0007X0-21; Mon, 25 Nov 2019 17:42:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iZINI-0007WX-UI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 17:42:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TazsQeiWnZCmE0Zm/NVgjmAYk3En9kegxtzqbyZUyFw=; b=EfGbwOPONJ2x351EIg/h6nP3zW
 XLj8ll7whfe9KARL7ZuBPTktVMJo1fRjLPWmdb5uTK5n1h1dIOkRyX14rlibdP24wTBsiyuQtnEU4
 +bq/1QvdlNqJmXdPPvR/Nk294zEjbsjBwfXyQYdCHdhJPZCspSsVSJoEn4exfwrglyr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TazsQeiWnZCmE0Zm/NVgjmAYk3En9kegxtzqbyZUyFw=; b=jBWukGxsGSK00xIHp1g7MjaKj3
 bi8wpIuUe8LeG8o3aimc+St/5aJuaC3DARgItGbY8qw24uY6Qsu7mLmbnQIPISn/p33uM/C6q+kAI
 UHWoPChfncbh4Mld+PDoO3EcVL8VvNTqCIIoIA/Ne3gqfxvfgY09pLT26itk/SWZDxeI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZING-0056vL-S2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 17:42:12 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21A472084D;
 Mon, 25 Nov 2019 17:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574703725;
 bh=Ub1YYEljM48cxBFkouSd+URkSimILx44iw1Cs5G2mC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PHDdU03jdctzo+ZSzV9RS2WkdqVCDvtvCFapPhr4NTvm3kw7IcROOvWX/Joj48Z/5
 pyKtikyCjAkpQ+eMeRsJt8j2t9trZOapaGZgimPfru06YqSOrETM1IBm/AG1RznfrZ
 bfVoVgychJ5QyQTFccJ2OTjRPNRZPQQTWhMCt4T4=
Date: Mon, 25 Nov 2019 09:42:04 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191125174204.GB71634@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
 <20191030025512.GA4791@sol.localdomain>
 <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
 <20191030170246.GB693@sol.localdomain>
 <899f99e9-fdc7-a84b-14ec-623fa3a5e164@huawei.com>
 <20191118161146.GB41670@jaegeuk-macbookpro.roam.corp.google.com>
 <20191118205822.GA57882@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118205822.GA57882@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZING-0056vL-S2
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix having my additional fixes:

---
 fs/f2fs/compress.c | 114 ++++++++++++++++++--------------
 fs/f2fs/data.c     | 158 ++++++++++++++++++++++++++++++---------------
 fs/f2fs/f2fs.h     |  29 +++++++--
 fs/f2fs/file.c     |  25 +++----
 fs/f2fs/inode.c    |   7 +-
 fs/f2fs/namei.c    |   7 +-
 6 files changed, 208 insertions(+), 132 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e9f633c30942..7ebd2bc018bd 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -8,6 +8,7 @@
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/writeback.h>
+#include <linux/backing-dev.h>
 #include <linux/lzo.h>
 #include <linux/lz4.h>
 
@@ -86,15 +87,13 @@ int f2fs_init_compress_ctx(struct compress_ctx *cc)
 
 	cc->rpages = f2fs_kzalloc(sbi, sizeof(struct page *) <<
 					cc->log_cluster_size, GFP_NOFS);
-	if (!cc->rpages)
-		return -ENOMEM;
-	return 0;
+	return cc->rpages ? 0 : -ENOMEM;
 }
 
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
 {
-	f2fs_reset_compress_ctx(cc);
 	kfree(cc->rpages);
+	f2fs_reset_compress_ctx(cc);
 }
 
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
@@ -378,7 +377,7 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 
 	dec_page_count(sbi, F2FS_RD_DATA);
 
-	if (bio->bi_status)
+	if (bio->bi_status || PageError(page))
 		dic->failed = true;
 
 	if (refcount_dec_not_one(&dic->ref))
@@ -420,10 +419,14 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
 out_vunmap_rbuf:
 	vunmap(dic->rbuf);
 out_free_dic:
-	f2fs_set_cluster_uptodate(dic->rpages, dic->cluster_size, ret, verity);
+	if (!verity)
+		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
+								ret, false);
+
 	trace_f2fs_decompress_pages_end(dic->inode, dic->cluster_idx,
-								dic->clen, ret);
-	f2fs_free_dic(dic);
+							dic->clen, ret);
+	if (!verity)
+		f2fs_free_dic(dic);
 }
 
 static bool is_page_in_cluster(struct compress_ctx *cc, pgoff_t index)
@@ -470,22 +473,18 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
 		/* beyond EOF */
 		if (page->index >= nr_pages)
 			return false;
-		if (page->index != start_idx_of_cluster(cc) + i)
-			return false;
 	}
 	return true;
 }
 
-int is_compressed_cluster(struct compress_ctx *cc, pgoff_t index)
+static int is_compressed_cluster(struct compress_ctx *cc)
 {
 	struct dnode_of_data dn;
-	unsigned int start_idx = cluster_idx(cc, index) <<
-					cc->log_cluster_size;
 	int ret;
-	int i;
 
 	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
-	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
+	ret = f2fs_get_dnode_of_data(&dn, start_idx_of_cluster(cc),
+							LOOKUP_NODE);
 	if (ret) {
 		if (ret == -ENOENT)
 			ret = 0;
@@ -493,6 +492,8 @@ int is_compressed_cluster(struct compress_ctx *cc, pgoff_t index)
 	}
 
 	if (dn.data_blkaddr == COMPRESS_ADDR) {
+		int i;
+
 		ret = CLUSTER_IS_FULL;
 		for (i = 1; i < cc->cluster_size; i++) {
 			block_t blkaddr;
@@ -516,9 +517,10 @@ int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 		.inode = inode,
 		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
 		.cluster_size = F2FS_I(inode)->i_cluster_size,
+		.cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size,
 	};
 
-	return is_compressed_cluster(&cc, index);
+	return is_compressed_cluster(&cc);
 }
 
 static bool cluster_may_compress(struct compress_ctx *cc)
@@ -536,6 +538,7 @@ static bool cluster_may_compress(struct compress_ctx *cc)
 
 void f2fs_reset_compress_ctx(struct compress_ctx *cc)
 {
+	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
 	cc->cluster_idx = NULL_CLUSTER;
@@ -565,19 +568,18 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		bool prealloc)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
-	struct bio *bio = NULL;
 	struct address_space *mapping = cc->inode->i_mapping;
 	struct page *page;
 	struct dnode_of_data dn;
 	sector_t last_block_in_bio;
 	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
-	unsigned int start_idx = cluster_idx(cc, index) << cc->log_cluster_size;
+	unsigned int start_idx = start_idx_of_cluster(cc);
 	int i, idx;
 	int ret;
 
 	ret = f2fs_init_compress_ctx(cc);
 	if (ret)
-		goto out;
+		return ret;
 retry:
 	/* keep page reference to avoid page reclaim */
 	for (i = 0; i < cc->cluster_size; i++) {
@@ -588,26 +590,25 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 			goto unlock_pages;
 		}
 
-		if (PageUptodate(page)) {
+		if (PageUptodate(page))
 			unlock_page(page);
-			continue;
-		}
-
-		f2fs_compress_ctx_add_page(cc, page);
+		else
+			f2fs_compress_ctx_add_page(cc, page);
 	}
 
 	if (!f2fs_cluster_is_empty(cc)) {
+		struct bio *bio = NULL;
+
 		ret = f2fs_read_multi_pages(cc, &bio, cc->cluster_size,
 						&last_block_in_bio, false);
 		if (ret)
-			goto out;
-
+			return ret;
 		if (bio)
 			f2fs_submit_bio(sbi, bio, DATA);
 
 		ret = f2fs_init_compress_ctx(cc);
 		if (ret)
-			goto out;
+			return ret;
 	}
 
 	for (i = 0; i < cc->cluster_size; i++) {
@@ -620,10 +621,12 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		f2fs_put_page(page, 0);
 
 		if (!PageUptodate(page)) {
-			for (idx = i; idx >= 0; idx--) {
-				f2fs_put_page(cc->rpages[idx], 0);
-				f2fs_put_page(cc->rpages[idx], 1);
+			for (idx = 0; idx < cc->cluster_size; idx++) {
+				f2fs_put_page(cc->rpages[idx],
+						(idx <= i) ? 1 : 0);
+				cc->rpages[idx] = NULL;
 			}
+			cc->nr_rpages = 0;
 			goto retry;
 		}
 	}
@@ -658,11 +661,10 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 release_pages:
 	for (idx = 0; idx < i; idx++) {
 		page = find_lock_page(mapping, start_idx + idx);
-		f2fs_put_page(page, 0);
 		f2fs_put_page(page, 1);
+		f2fs_put_page(page, 0);
 	}
 	f2fs_destroy_compress_ctx(cc);
-out:
 	return ret;
 }
 
@@ -671,12 +673,13 @@ int f2fs_prepare_compress_overwrite(struct inode *inode,
 {
 	struct compress_ctx cc = {
 		.inode = inode,
+		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
 		.cluster_size = F2FS_I(inode)->i_cluster_size,
-		.cluster_idx = NULL_CLUSTER,
+		.cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size,
 		.rpages = NULL,
 		.nr_rpages = 0,
 	};
-	int ret = is_compressed_cluster(&cc, index);
+	int ret = is_compressed_cluster(&cc);
 
 	if (ret <= 0)
 		return ret;
@@ -687,7 +690,7 @@ int f2fs_prepare_compress_overwrite(struct inode *inode,
 }
 
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
-					pgoff_t index, bool written)
+					pgoff_t index, unsigned copied)
 
 {
 	struct compress_ctx cc = {
@@ -698,7 +701,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 	bool first_index = (index == cc.rpages[0]->index);
 	int i;
 
-	if (written)
+	if (copied)
 		set_cluster_dirty(&cc);
 
 	for (i = 0; i < cc.cluster_size; i++)
@@ -707,7 +710,6 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 	f2fs_destroy_compress_ctx(&cc);
 
 	return first_index;
-
 }
 
 static int f2fs_write_compressed_pages(struct compress_ctx *cc,
@@ -857,6 +859,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			fi->last_disk_size = psize;
 		up_write(&fi->i_sem);
 	}
+	f2fs_reset_compress_ctx(cc);
 	return 0;
 
 out_destroy_crypt:
@@ -904,7 +907,8 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 static int f2fs_write_raw_pages(struct compress_ctx *cc,
 					int *submitted,
 					struct writeback_control *wbc,
-					enum iostat_type io_type)
+					enum iostat_type io_type,
+					bool compressed)
 {
 	int i, _submitted;
 	int ret, err = 0;
@@ -912,12 +916,24 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 	for (i = 0; i < cc->cluster_size; i++) {
 		if (!cc->rpages[i])
 			continue;
+retry_write:
 		BUG_ON(!PageLocked(cc->rpages[i]));
+
 		ret = f2fs_write_single_data_page(cc->rpages[i], &_submitted,
-						NULL, NULL, wbc, io_type);
+						NULL, NULL, wbc, io_type,
+						compressed);
 		if (ret) {
-			if (ret == AOP_WRITEPAGE_ACTIVATE)
+			if (ret == AOP_WRITEPAGE_ACTIVATE) {
 				unlock_page(cc->rpages[i]);
+				ret = 0;
+			} else if (ret == -EAGAIN) {
+				ret = 0;
+				cond_resched();
+				congestion_wait(BLK_RW_ASYNC, HZ/50);
+				lock_page(cc->rpages[i]);
+				clear_page_dirty_for_io(cc->rpages[i]);
+				goto retry_write;
+			}
 			err = ret;
 			goto out_fail;
 		}
@@ -928,6 +944,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 
 out_fail:
 	/* TODO: revoke partially updated block addresses */
+	BUG_ON(compressed);
+
 	for (++i; i < cc->cluster_size; i++) {
 		if (!cc->rpages[i])
 			continue;
@@ -948,7 +966,6 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 	int err = -EAGAIN;
 
 	*submitted = 0;
-
 	if (cluster_may_compress(cc)) {
 		err = f2fs_compress_pages(cc);
 		if (err) {
@@ -964,18 +981,19 @@ int f2fs_write_multi_pages(struct compress_ctx *cc,
 		bool compressed = false;
 
 		f2fs_bug_on(F2FS_I_SB(cc->inode), *submitted);
-		if (is_compressed_cluster(cc, start_idx_of_cluster(cc)))
+
+		if (is_compressed_cluster(cc))
 			compressed = true;
 
-		err = f2fs_write_raw_pages(cc, submitted, wbc, io_type);
+		err = f2fs_write_raw_pages(cc, submitted, wbc,
+						io_type, compressed);
 		if (compressed) {
 			stat_sub_compr_blocks(cc->inode, *submitted);
 			F2FS_I(cc->inode)->i_compressed_blocks -= *submitted;
 			f2fs_mark_inode_dirty_sync(cc->inode, true);
 		}
+		f2fs_destroy_compress_ctx(cc);
 	}
-
-	f2fs_reset_compress_ctx(cc);
 	return err;
 }
 
@@ -988,8 +1006,9 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 
 	dic = f2fs_kzalloc(sbi, sizeof(struct decompress_io_ctx), GFP_NOFS);
 	if (!dic)
-		goto out;
+		return ERR_PTR(-ENOMEM);
 
+	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
 	refcount_set(&dic->ref, 1);
 	dic->cluster_idx = cc->cluster_idx;
@@ -1042,7 +1061,6 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 
 out_free:
 	f2fs_free_dic(dic);
-out:
 	return ERR_PTR(-ENOMEM);
 }
 
@@ -1073,7 +1091,7 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 	kfree(dic);
 }
 
-void f2fs_set_cluster_uptodate(struct page **rpages,
+void f2fs_decompress_end_io(struct page **rpages,
 			unsigned int cluster_size, bool err, bool verity)
 {
 	int i;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c10cbd7d1c06..fcdd6d493f83 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -98,7 +98,7 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
 		page = bv->bv_page;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		if (compr && PagePrivate(page)) {
+		if (compr && f2fs_is_compressed_page(page)) {
 			f2fs_decompress_pages(bio, page, verity);
 			continue;
 		}
@@ -115,9 +115,14 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
 		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
 		unlock_page(page);
 	}
-	if (bio->bi_private)
-		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
-	bio_put(bio);
+}
+
+static void f2fs_release_read_bio(struct bio *bio);
+static void __f2fs_read_end_io(struct bio *bio, bool compr, bool verity)
+{
+	if (!compr)
+		__read_end_io(bio, false, verity);
+	f2fs_release_read_bio(bio);
 }
 
 static void f2fs_decompress_bio(struct bio *bio, bool verity)
@@ -127,19 +132,45 @@ static void f2fs_decompress_bio(struct bio *bio, bool verity)
 
 static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
 
-static void decrypt_work(struct bio_post_read_ctx *ctx)
+static void f2fs_decrypt_work(struct bio_post_read_ctx *ctx)
 {
 	fscrypt_decrypt_bio(ctx->bio);
 }
 
-static void decompress_work(struct bio_post_read_ctx *ctx, bool verity)
+static void f2fs_decompress_work(struct bio_post_read_ctx *ctx)
 {
-	f2fs_decompress_bio(ctx->bio, verity);
+	f2fs_decompress_bio(ctx->bio, ctx->enabled_steps & (1 << STEP_VERITY));
 }
 
-static void verity_work(struct bio_post_read_ctx *ctx)
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+static void f2fs_verify_bio(struct bio *bio)
 {
+	struct page *page = bio_first_page_all(bio);
+	struct decompress_io_ctx *dic =
+			(struct decompress_io_ctx *)page_private(page);
+
+	f2fs_decompress_end_io(dic->rpages, dic->cluster_size, false, true);
+	f2fs_free_dic(dic);
+}
+#endif
+
+static void f2fs_verity_work(struct work_struct *work)
+{
+	struct bio_post_read_ctx *ctx =
+		container_of(work, struct bio_post_read_ctx, work);
+
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+	/* previous step is decompression */
+	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
+
+		f2fs_verify_bio(ctx->bio);
+		f2fs_release_read_bio(ctx->bio);
+		return;
+	}
+#endif
+
 	fsverity_verify_bio(ctx->bio);
+	__f2fs_read_end_io(ctx->bio, false, false);
 }
 
 static void f2fs_post_read_work(struct work_struct *work)
@@ -148,18 +179,19 @@ static void f2fs_post_read_work(struct work_struct *work)
 		container_of(work, struct bio_post_read_ctx, work);
 
 	if (ctx->enabled_steps & (1 << STEP_DECRYPT))
-		decrypt_work(ctx);
+		f2fs_decrypt_work(ctx);
 
-	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
-		decompress_work(ctx,
-			ctx->enabled_steps & (1 << STEP_VERITY));
+	if (ctx->enabled_steps & (1 << STEP_DECOMPRESS))
+		f2fs_decompress_work(ctx);
+
+	if (ctx->enabled_steps & (1 << STEP_VERITY)) {
+		INIT_WORK(&ctx->work, f2fs_verity_work);
+		fsverity_enqueue_verify_work(&ctx->work);
 		return;
 	}
 
-	if (ctx->enabled_steps & (1 << STEP_VERITY))
-		verity_work(ctx);
-
-	__read_end_io(ctx->bio, false, false);
+	__f2fs_read_end_io(ctx->bio,
+		ctx->enabled_steps & (1 << STEP_DECOMPRESS), false);
 }
 
 static void f2fs_enqueue_post_read_work(struct f2fs_sb_info *sbi,
@@ -176,12 +208,20 @@ static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
 	 * we shouldn't recurse to the same workqueue.
 	 */
 
-	if (ctx->enabled_steps) {
+	if (ctx->enabled_steps & (1 << STEP_DECRYPT) ||
+		ctx->enabled_steps & (1 << STEP_DECOMPRESS)) {
 		INIT_WORK(&ctx->work, f2fs_post_read_work);
 		f2fs_enqueue_post_read_work(ctx->sbi, &ctx->work);
 		return;
 	}
-	__read_end_io(ctx->bio, false, false);
+
+	if (ctx->enabled_steps & (1 << STEP_VERITY)) {
+		INIT_WORK(&ctx->work, f2fs_verity_work);
+		fsverity_enqueue_verify_work(&ctx->work);
+		return;
+	}
+
+	__f2fs_read_end_io(ctx->bio, false, false);
 }
 
 static bool f2fs_bio_post_read_required(struct bio *bio)
@@ -205,7 +245,7 @@ static void f2fs_read_end_io(struct bio *bio)
 		return;
 	}
 
-	__read_end_io(bio, false, false);
+	__f2fs_read_end_io(bio, false, false);
 }
 
 static void f2fs_write_end_io(struct bio *bio)
@@ -624,7 +664,8 @@ static int add_ipu_page(struct f2fs_sb_info *sbi, struct bio **bio,
 
 			found = true;
 
-			if (bio_add_page(*bio, page, PAGE_SIZE, 0) == PAGE_SIZE) {
+			if (bio_add_page(*bio, page, PAGE_SIZE, 0) ==
+							PAGE_SIZE) {
 				ret = 0;
 				break;
 			}
@@ -858,6 +899,13 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	return bio;
 }
 
+static void f2fs_release_read_bio(struct bio *bio)
+{
+	if (bio->bi_private)
+		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
+	bio_put(bio);
+}
+
 /* This can handle encryption stuffs */
 static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 							block_t blkaddr)
@@ -1963,7 +2011,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (ret)
 		goto out;
 
-	f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
+	if (dn.data_blkaddr != COMPRESS_ADDR)
+		goto out;
 
 	for (i = 1; i < cc->cluster_size; i++) {
 		block_t blkaddr;
@@ -2017,7 +2066,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				dic->failed = true;
 				if (refcount_sub_and_test(dic->nr_cpages - i,
 							&dic->ref))
-					f2fs_set_cluster_uptodate(dic->rpages,
+					f2fs_decompress_end_io(dic->rpages,
 							cc->cluster_size, true,
 							false);
 				f2fs_free_dic(dic);
@@ -2047,8 +2096,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 out_put_dnode:
 	f2fs_put_dnode(&dn);
 out:
-	f2fs_set_cluster_uptodate(cc->rpages, cc->cluster_size, true, false);
-	f2fs_reset_compress_ctx(cc);
+	f2fs_decompress_end_io(cc->rpages, cc->cluster_size, true, false);
+	f2fs_destroy_compress_ctx(cc);
 	*bio_ret = bio;
 	return ret;
 }
@@ -2443,7 +2492,8 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 				struct bio **bio,
 				sector_t *last_block,
 				struct writeback_control *wbc,
-				enum iostat_type io_type)
+				enum iostat_type io_type,
+				bool compressed)
 {
 	struct inode *inode = page->mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -2488,8 +2538,9 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
 
-	if (f2fs_compressed_file(inode) ||
-		page->index < end_index || f2fs_verity_in_progress(inode))
+	if (page->index < end_index ||
+			f2fs_verity_in_progress(inode) ||
+			compressed)
 		goto write;
 
 	/*
@@ -2610,7 +2661,7 @@ static int f2fs_write_data_page(struct page *page,
 #endif
 
 	return f2fs_write_single_data_page(page, NULL, NULL, NULL,
-						wbc, FS_DATA_IO);
+						wbc, FS_DATA_IO, false);
 }
 
 /*
@@ -2696,17 +2747,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 
 		for (i = 0; i < nr_pages; i++) {
 			struct page *page = pvec.pages[i];
-			bool need_readd = false;
-
+			bool need_readd;
 readd:
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 			need_readd = false;
 
 			if (f2fs_compressed_file(inode)) {
-				void *fsdata = NULL;
-				struct page *pagep;
-				int ret2;
-
 				ret = f2fs_init_compress_ctx(&cc);
 				if (ret) {
 					done = 1;
@@ -2715,7 +2761,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 
 				if (!f2fs_cluster_can_merge_page(&cc,
 								page->index)) {
-
 					ret = f2fs_write_multi_pages(&cc,
 						&submitted, wbc, io_type);
 					if (!ret)
@@ -2724,6 +2769,10 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				}
 
 				if (f2fs_cluster_is_empty(&cc)) {
+					void *fsdata = NULL;
+					struct page *pagep;
+					int ret2;
+
 					ret2 = f2fs_prepare_compress_overwrite(
 							inode, &pagep,
 							page->index, &fsdata);
@@ -2733,24 +2782,27 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 						break;
 					} else if (ret2 &&
 						!f2fs_compress_write_end(inode,
-							fsdata, page->index,
-							true)) {
+								fsdata, page->index,
+								1)) {
 						retry = 1;
 						break;
 					}
+				} else {
+					goto lock_page;
 				}
 			}
 #endif
-
 			/* give a priority to WB_SYNC threads */
 			if (atomic_read(&sbi->wb_sync_req[DATA]) &&
 					wbc->sync_mode == WB_SYNC_NONE) {
 				done = 1;
 				break;
 			}
-
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+lock_page:
+#endif
 			done_index = page->index;
-
+retry_write:
 			lock_page(page);
 
 			if (unlikely(page->mapping != mapping)) {
@@ -2782,7 +2834,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			}
 #endif
 			ret = f2fs_write_single_data_page(page, &submitted,
-					&bio, &last_block, wbc, io_type);
+					&bio, &last_block, wbc, io_type, false);
 			if (ret == AOP_WRITEPAGE_ACTIVATE)
 				unlock_page(page);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -2801,6 +2853,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto next;
 				} else if (ret == -EAGAIN) {
 					ret = 0;
+					if (wbc->sync_mode == WB_SYNC_ALL) {
+						cond_resched();
+						congestion_wait(BLK_RW_ASYNC,
+								HZ/50);
+						goto retry_write;
+					}
 					goto next;
 				}
 				done_index = page->index + 1;
@@ -2817,21 +2875,21 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-
 		pagevec_release(&pvec);
 		cond_resched();
 	}
-
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	/* flush remained pages in compress cluster */
 	if (f2fs_compressed_file(inode) && !f2fs_cluster_is_empty(&cc)) {
 		ret = f2fs_write_multi_pages(&cc, &submitted, wbc, io_type);
 		nwritten += submitted;
 		wbc->nr_to_write -= submitted;
-		/* TODO: error handling */
+		if (ret) {
+			done = 1;
+			retry = 0;
+		}
 	}
 #endif
-
 	if ((!cycled && !done) || retry) {
 		cycled = 1;
 		index = 0;
@@ -3606,14 +3664,8 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (ret)
 		return ret;
 
-	if (f2fs_compressed_file(inode)) {
-		if (F2FS_I(inode)->i_compressed_blocks)
-			return -EINVAL;
-
-		F2FS_I(inode)->i_flags &= ~FS_COMPR_FL;
-		clear_inode_flag(inode, FI_COMPRESSED_FILE);
-		stat_dec_compr_inode(inode);
-	}
+	if (f2fs_disable_compressed_file(inode))
+		return -EINVAL;
 
 	ret = check_swap_activate(file, sis->max);
 	if (ret)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 11c42042367b..ee7309ca671a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1253,6 +1253,7 @@ struct compress_io_ctx {
 
 /* decompress io context for read IO path */
 struct decompress_io_ctx {
+	u32 magic;			/* magic number to indicate page is compressed */
 	struct inode *inode;		/* inode the context belong to */
 	unsigned int cluster_idx;	/* cluster index number */
 	unsigned int cluster_size;	/* page count in cluster */
@@ -2737,6 +2738,8 @@ static inline void set_compress_context(struct inode *inode)
 			F2FS_OPTION(sbi).compress_log_size;
 	F2FS_I(inode)->i_cluster_size =
 			1 << F2FS_I(inode)->i_log_cluster_size;
+	F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
+	set_inode_flag(inode, FI_COMPRESSED_FILE);
 }
 
 static inline unsigned int addrs_per_inode(struct inode *inode)
@@ -3390,7 +3393,8 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio);
 int f2fs_write_single_data_page(struct page *page, int *submitted,
 				struct bio **bio, sector_t *last_block,
 				struct writeback_control *wbc,
-				enum iostat_type io_type);
+				enum iostat_type io_type,
+				bool compressed);
 void f2fs_invalidate_page(struct page *page, unsigned int offset,
 			unsigned int length);
 int f2fs_release_page(struct page *page, gfp_t wait);
@@ -3631,8 +3635,8 @@ void f2fs_destroy_root_stats(void);
 #define stat_dec_inline_dir(inode)			do { } while (0)
 #define stat_inc_compr_inode(inode)			do { } while (0)
 #define stat_dec_compr_inode(inode)			do { } while (0)
-#define stat_add_compr_blocks(inode)			do { } while (0)
-#define stat_sub_compr_blocks(inode)			do { } while (0)
+#define stat_add_compr_blocks(inode, blocks)		do { } while (0)
+#define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_inc_atomic_write(inode)			do { } while (0)
 #define stat_dec_atomic_write(inode)			do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
@@ -3786,7 +3790,7 @@ void f2fs_reset_compress_ctx(struct compress_ctx *cc);
 int f2fs_prepare_compress_overwrite(struct inode *inode,
 			struct page **pagep, pgoff_t index, void **fsdata);
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
-					pgoff_t index, bool written);
+					pgoff_t index, unsigned copied);
 void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
 void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
@@ -3803,7 +3807,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 				bool is_readahead);
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc);
 void f2fs_free_dic(struct decompress_io_ctx *dic);
-void f2fs_set_cluster_uptodate(struct page **rpages,
+void f2fs_decompress_end_io(struct page **rpages,
 			unsigned int cluster_size, bool err, bool verity);
 int f2fs_init_compress_ctx(struct compress_ctx *cc);
 void f2fs_destroy_compress_ctx(struct compress_ctx *cc);
@@ -3824,6 +3828,21 @@ static inline struct page *f2fs_compress_control_page(struct page *page)
 }
 #endif
 
+static inline u64 f2fs_disable_compressed_file(struct inode *inode)
+{
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+
+	if (!f2fs_compressed_file(inode))
+		return 0;
+	if (fi->i_compressed_blocks)
+		return fi->i_compressed_blocks;
+
+	fi->i_flags &= ~F2FS_COMPR_FL;
+	clear_inode_flag(inode, FI_COMPRESSED_FILE);
+	stat_dec_compr_inode(inode);
+	return 0;
+}
+
 #define F2FS_FEATURE_FUNCS(name, flagname) \
 static inline int f2fs_sb_has_##name(struct f2fs_sb_info *sbi) \
 { \
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a688a4cb212b..4163fc3db1a3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -523,6 +523,9 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (err)
 		return err;
 
+	if (!f2fs_is_compress_backend_ready(inode))
+		return -EOPNOTSUPP;
+
 	err = fsverity_file_open(inode, filp);
 	if (err)
 		return err;
@@ -1821,7 +1824,6 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 				return -EINVAL;
 
 			set_compress_context(inode);
-			set_inode_flag(inode, FI_COMPRESSED_FILE);
 			stat_inc_compr_inode(inode);
 		}
 	}
@@ -2016,11 +2018,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	inode_lock(inode);
 
-	if (f2fs_compressed_file(inode) && !fi->i_compressed_blocks) {
-		fi->i_flags &= ~F2FS_COMPR_FL;
-		clear_inode_flag(inode, FI_COMPRESSED_FILE);
-		stat_dec_compr_inode(inode);
-	}
+	f2fs_disable_compressed_file(inode);
 
 	if (f2fs_is_atomic_file(inode)) {
 		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
@@ -3224,20 +3222,15 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	if (f2fs_compressed_file(inode)) {
-		if (F2FS_I(inode)->i_compressed_blocks) {
-			ret = -EOPNOTSUPP;
-			goto out;
-		}
-		F2FS_I(inode)->i_flags &= ~F2FS_COMPR_FL;
-		clear_inode_flag(inode, FI_COMPRESSED_FILE);
-		stat_dec_compr_inode(inode);
-	}
-
 	ret = f2fs_convert_inline_inode(inode);
 	if (ret)
 		goto out;
 
+	if (f2fs_disable_compressed_file(inode)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	set_inode_flag(inode, FI_PIN_FILE);
 	ret = F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN];
 done:
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7a85060adad5..3fa728f40c2a 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -421,7 +421,8 @@ static int do_read_inode(struct inode *inode)
 		fi->i_crtime.tv_nsec = le32_to_cpu(ri->i_crtime_nsec);
 	}
 
-	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi)) {
+	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
+					(fi->i_flags & F2FS_COMPR_FL)) {
 		if (F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
 					i_log_cluster_size)) {
 			fi->i_compressed_blocks =
@@ -429,10 +430,8 @@ static int do_read_inode(struct inode *inode)
 			fi->i_compress_algorithm = ri->i_compress_algorithm;
 			fi->i_log_cluster_size = ri->i_log_cluster_size;
 			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
-		}
-
-		if ((fi->i_flags & F2FS_COMPR_FL) && f2fs_may_compress(inode))
 			set_inode_flag(inode, FI_COMPRESSED_FILE);
+		}
 	}
 
 	F2FS_I(inode)->i_disk_time[0] = inode->i_atime;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 00c56a3e944b..ac6b1f946e03 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -122,11 +122,8 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 	if (f2fs_sb_has_compression(sbi)) {
 		/* Inherit the compression flag in directory */
 		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
-					f2fs_may_compress(inode)) {
+					f2fs_may_compress(inode))
 			set_compress_context(inode);
-			F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
-			set_inode_flag(inode, FI_COMPRESSED_FILE);
-		}
 	}
 
 	f2fs_set_inode_flags(inode);
@@ -309,9 +306,7 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 		if (!is_extension_exist(name, ext[i]))
 			continue;
 
-		F2FS_I(inode)->i_flags |= F2FS_COMPR_FL;
 		set_compress_context(inode);
-		set_inode_flag(inode, FI_COMPRESSED_FILE);
 		return;
 	}
 }
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
