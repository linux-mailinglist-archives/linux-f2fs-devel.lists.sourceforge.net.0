Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C27475CC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Jun 2019 18:08:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hcXhl-00046l-Pj; Sun, 16 Jun 2019 16:08:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hcXhk-00046d-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 16:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0r2lGtwI6CByKZIaZAo+lGxVSHn/zPWfj7tKT66rnK8=; b=Gy3eYf2H3CsaCq4HEp/TeZ0l6G
 i+D3gZTMGfwkPzF8fxINKlpanc5J2BxZ5GXjezrmkS3EFyF+7W2ReClpIDYjoC3CQG+8xzMGzGqOW
 BlNfo8o8v/IOykW6JF/4l6doLeRdEbwYgA6Q9fGH6RH7hT8ib3yO4egdHvJsZqp15EwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0r2lGtwI6CByKZIaZAo+lGxVSHn/zPWfj7tKT66rnK8=; b=X9Nc0Zt+cGnqt/8Giu+0KoJdMN
 /WHGxB7TTYEXU+MAPbGNbCkb2viR/yfkN4JCKYMnlRYEQguu0z+1Yu68JexScTMAQKyfKU1lSeCwB
 zrxFFTrHFPIpb3Dg6PglI6cIoYssXpPErqR1IBvQ9QQGmJm/mtm3AVCX9uo5ZGPrYgJk=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hcXhg-00GiJK-3e
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 16:08:26 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5GG6SOC070603; Sun, 16 Jun 2019 12:08:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t5dsqf3kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 12:08:05 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5GG6mrl071801;
 Sun, 16 Jun 2019 12:08:04 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t5dsqf3kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 12:08:04 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5GG045U026306;
 Sun, 16 Jun 2019 16:08:03 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 2t4ra5sb6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 16 Jun 2019 16:08:03 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5GG82sj34603368
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 16 Jun 2019 16:08:02 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 865AD6E050;
 Sun, 16 Jun 2019 16:08:02 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A7796E04E;
 Sun, 16 Jun 2019 16:07:58 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.1.181])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 16 Jun 2019 16:07:58 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Sun, 16 Jun 2019 21:38:08 +0530
Message-Id: <20190616160813.24464-3-chandan@linux.ibm.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616160813.24464-1-chandan@linux.ibm.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906160155
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hcXhg-00GiJK-3e
Subject: [f2fs-dev] [PATCH V3 2/7] Integrate read callbacks into Ext4 and
 F2FS
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
Cc: hch@infradead.org, tytso@mit.edu, ebiggers@kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This commit gets Ext4 and F2FS to make use of read callbacks API to
perform decryption of file data read from the disk.
---
 fs/crypto/bio.c             |  30 +--------
 fs/crypto/crypto.c          |   1 +
 fs/crypto/fscrypt_private.h |   3 +
 fs/ext4/readpage.c          |  29 +++------
 fs/f2fs/data.c              | 124 +++++++-----------------------------
 fs/f2fs/super.c             |   9 +--
 fs/read_callbacks.c         |   1 -
 include/linux/fscrypt.h     |  18 ------
 8 files changed, 40 insertions(+), 175 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index f677ff93d464..4076d704e2e4 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -27,7 +27,7 @@
 #include <linux/read_callbacks.h>
 #include "fscrypt_private.h"
 
-static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
+static void fscrypt_decrypt_bio(struct bio *bio)
 {
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
@@ -38,37 +38,9 @@ static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
 							   bv->bv_offset);
 		if (ret)
 			SetPageError(page);
-		else if (done)
-			SetPageUptodate(page);
-		if (done)
-			unlock_page(page);
 	}
 }
 
-void fscrypt_decrypt_bio(struct bio *bio)
-{
-	__fscrypt_decrypt_bio(bio, false);
-}
-EXPORT_SYMBOL(fscrypt_decrypt_bio);
-
-static void completion_pages(struct work_struct *work)
-{
-	struct fscrypt_ctx *ctx = container_of(work, struct fscrypt_ctx, work);
-	struct bio *bio = ctx->bio;
-
-	__fscrypt_decrypt_bio(bio, true);
-	fscrypt_release_ctx(ctx);
-	bio_put(bio);
-}
-
-void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx, struct bio *bio)
-{
-	INIT_WORK(&ctx->work, completion_pages);
-	ctx->bio = bio;
-	fscrypt_enqueue_decrypt_work(&ctx->work);
-}
-EXPORT_SYMBOL(fscrypt_enqueue_decrypt_bio);
-
 void fscrypt_decrypt_work(struct work_struct *work)
 {
 	struct read_callbacks_ctx *ctx =
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 45c3d0427fb2..e0aa20cfcaa7 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -54,6 +54,7 @@ struct kmem_cache *fscrypt_info_cachep;
 
 void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
+	INIT_WORK(work, fscrypt_decrypt_work);
 	queue_work(fscrypt_read_workqueue, work);
 }
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_work);
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 8978eec9d766..0bd65921efbf 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -113,6 +113,9 @@ static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
 	return false;
 }
 
+/* bio.c */
+void fscrypt_decrypt_work(struct work_struct *work);
+
 /* crypto.c */
 extern struct kmem_cache *fscrypt_info_cachep;
 extern int fscrypt_initialize(unsigned int cop_flags);
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index c916017db334..652796b95545 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -44,6 +44,7 @@
 #include <linux/backing-dev.h>
 #include <linux/pagevec.h>
 #include <linux/cleancache.h>
+#include <linux/read_callbacks.h>
 
 #include "ext4.h"
 
@@ -73,14 +74,9 @@ static void mpage_end_io(struct bio *bio)
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
 
-	if (ext4_bio_encrypted(bio)) {
-		if (bio->bi_status) {
-			fscrypt_release_ctx(bio->bi_private);
-		} else {
-			fscrypt_enqueue_decrypt_bio(bio->bi_private, bio);
-			return;
-		}
-	}
+	if (read_callbacks_end_bio(bio))
+		return;
+
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		struct page *page = bv->bv_page;
 
@@ -241,24 +237,19 @@ int ext4_mpage_readpages(struct address_space *mapping,
 			bio = NULL;
 		}
 		if (bio == NULL) {
-			struct fscrypt_ctx *ctx = NULL;
-
-			if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
-				ctx = fscrypt_get_ctx(GFP_NOFS);
-				if (IS_ERR(ctx))
-					goto set_error_page;
-			}
 			bio = bio_alloc(GFP_KERNEL,
 				min_t(int, nr_pages, BIO_MAX_PAGES));
-			if (!bio) {
-				if (ctx)
-					fscrypt_release_ctx(ctx);
+			if (!bio)
+				goto set_error_page;
+
+			if (read_callbacks_setup(inode, bio, NULL)) {
+				bio_put(bio);
 				goto set_error_page;
 			}
+
 			bio_set_dev(bio, bdev);
 			bio->bi_iter.bi_sector = blocks[0] << (blkbits - 9);
 			bio->bi_end_io = mpage_end_io;
-			bio->bi_private = ctx;
 			bio_set_op_attrs(bio, REQ_OP_READ,
 						is_readahead ? REQ_RAHEAD : 0);
 		}
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a546ac8685ea..23b34399d809 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -18,6 +18,7 @@
 #include <linux/uio.h>
 #include <linux/cleancache.h>
 #include <linux/sched/signal.h>
+#include <linux/read_callbacks.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -25,11 +26,6 @@
 #include "trace.h"
 #include <trace/events/f2fs.h>
 
-#define NUM_PREALLOC_POST_READ_CTXS	128
-
-static struct kmem_cache *bio_post_read_ctx_cache;
-static mempool_t *bio_post_read_ctx_pool;
-
 static bool __is_cp_guaranteed(struct page *page)
 {
 	struct address_space *mapping = page->mapping;
@@ -69,18 +65,19 @@ static enum count_type __read_io_type(struct page *page)
 	return F2FS_RD_DATA;
 }
 
-/* postprocessing steps for read bios */
-enum bio_post_read_step {
-	STEP_INITIAL = 0,
-	STEP_DECRYPT,
-};
+static void f2fs_end_page_op(struct bio *bio, struct page *page)
+{
+	BUG_ON(!PageLocked(page));
 
-struct bio_post_read_ctx {
-	struct bio *bio;
-	struct work_struct work;
-	unsigned int cur_step;
-	unsigned int enabled_steps;
-};
+	/* PG_error was set if any post_read step failed */
+	if (bio->bi_status || PageError(page)) {
+		ClearPageUptodate(page);
+		/* will re-read again later */
+		ClearPageError(page);
+	}
+
+	dec_page_count(F2FS_P_SB(page), __read_io_type(page));
+}
 
 static void __read_end_io(struct bio *bio)
 {
@@ -91,53 +88,15 @@ static void __read_end_io(struct bio *bio)
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		page = bv->bv_page;
 
-		/* PG_error was set if any post_read step failed */
-		if (bio->bi_status || PageError(page)) {
-			ClearPageUptodate(page);
-			/* will re-read again later */
-			ClearPageError(page);
-		} else {
+		if (!bio->bi_status && !PageError(page))
 			SetPageUptodate(page);
-		}
-		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
-		unlock_page(page);
-	}
-	if (bio->bi_private)
-		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
-	bio_put(bio);
-}
 
-static void bio_post_read_processing(struct bio_post_read_ctx *ctx);
-
-static void decrypt_work(struct work_struct *work)
-{
-	struct bio_post_read_ctx *ctx =
-		container_of(work, struct bio_post_read_ctx, work);
-
-	fscrypt_decrypt_bio(ctx->bio);
-
-	bio_post_read_processing(ctx);
-}
+		f2fs_end_page_op(bio, page);
 
-static void bio_post_read_processing(struct bio_post_read_ctx *ctx)
-{
-	switch (++ctx->cur_step) {
-	case STEP_DECRYPT:
-		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
-			INIT_WORK(&ctx->work, decrypt_work);
-			fscrypt_enqueue_decrypt_work(&ctx->work);
-			return;
-		}
-		ctx->cur_step++;
-		/* fall-through */
-	default:
-		__read_end_io(ctx->bio);
+		unlock_page(page);
 	}
-}
 
-static bool f2fs_bio_post_read_required(struct bio *bio)
-{
-	return bio->bi_private && !bio->bi_status;
+	bio_put(bio);
 }
 
 static void f2fs_read_end_io(struct bio *bio)
@@ -148,13 +107,8 @@ static void f2fs_read_end_io(struct bio *bio)
 		bio->bi_status = BLK_STS_IOERR;
 	}
 
-	if (f2fs_bio_post_read_required(bio)) {
-		struct bio_post_read_ctx *ctx = bio->bi_private;
-
-		ctx->cur_step = STEP_INITIAL;
-		bio_post_read_processing(ctx);
+	if (read_callbacks_end_bio(bio))
 		return;
-	}
 
 	__read_end_io(bio);
 }
@@ -557,8 +511,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
-	struct bio_post_read_ctx *ctx;
-	unsigned int post_read_steps = 0;
+	int ret;
 
 	bio = f2fs_bio_alloc(sbi, min_t(int, nr_pages, BIO_MAX_PAGES), false);
 	if (!bio)
@@ -567,17 +520,10 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	bio->bi_end_io = f2fs_read_end_io;
 	bio_set_op_attrs(bio, REQ_OP_READ, op_flag);
 
-	if (f2fs_encrypted_file(inode))
-		post_read_steps |= 1 << STEP_DECRYPT;
-	if (post_read_steps) {
-		ctx = mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
-		if (!ctx) {
-			bio_put(bio);
-			return ERR_PTR(-ENOMEM);
-		}
-		ctx->bio = bio;
-		ctx->enabled_steps = post_read_steps;
-		bio->bi_private = ctx;
+	ret = read_callbacks_setup(inode, bio, f2fs_end_page_op);
+	if (ret) {
+		bio_put(bio);
+		return ERR_PTR(ret);
 	}
 
 	return bio;
@@ -2902,27 +2848,3 @@ void f2fs_clear_page_cache_dirty_tag(struct page *page)
 						PAGECACHE_TAG_DIRTY);
 	xa_unlock_irqrestore(&mapping->i_pages, flags);
 }
-
-int __init f2fs_init_post_read_processing(void)
-{
-	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, 0);
-	if (!bio_post_read_ctx_cache)
-		goto fail;
-	bio_post_read_ctx_pool =
-		mempool_create_slab_pool(NUM_PREALLOC_POST_READ_CTXS,
-					 bio_post_read_ctx_cache);
-	if (!bio_post_read_ctx_pool)
-		goto fail_free_cache;
-	return 0;
-
-fail_free_cache:
-	kmem_cache_destroy(bio_post_read_ctx_cache);
-fail:
-	return -ENOMEM;
-}
-
-void __exit f2fs_destroy_post_read_processing(void)
-{
-	mempool_destroy(bio_post_read_ctx_pool);
-	kmem_cache_destroy(bio_post_read_ctx_cache);
-}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6b959bbb336a..e2e6a8c7236c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3627,15 +3627,11 @@ static int __init init_f2fs_fs(void)
 	err = register_filesystem(&f2fs_fs_type);
 	if (err)
 		goto free_shrinker;
+
 	f2fs_create_root_stats();
-	err = f2fs_init_post_read_processing();
-	if (err)
-		goto free_root_stats;
+
 	return 0;
 
-free_root_stats:
-	f2fs_destroy_root_stats();
-	unregister_filesystem(&f2fs_fs_type);
 free_shrinker:
 	unregister_shrinker(&f2fs_shrinker_info);
 free_sysfs:
@@ -3656,7 +3652,6 @@ static int __init init_f2fs_fs(void)
 
 static void __exit exit_f2fs_fs(void)
 {
-	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
 	unregister_shrinker(&f2fs_shrinker_info);
diff --git a/fs/read_callbacks.c b/fs/read_callbacks.c
index a4196e3de05f..4b7fc2a349cd 100644
--- a/fs/read_callbacks.c
+++ b/fs/read_callbacks.c
@@ -76,7 +76,6 @@ void read_callbacks(struct read_callbacks_ctx *ctx)
 	switch (++ctx->cur_step) {
 	case STEP_DECRYPT:
 		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
-			INIT_WORK(&ctx->work, fscrypt_decrypt_work);
 			fscrypt_enqueue_decrypt_work(&ctx->work);
 			return;
 		}
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 159b8ddcd670..4ec0bd7cc0ba 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -232,10 +232,6 @@ static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
 }
 
 /* bio.c */
-extern void fscrypt_decrypt_bio(struct bio *);
-extern void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
-					struct bio *bio);
-extern void fscrypt_decrypt_work(struct work_struct *work);
 extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 				 unsigned int);
 
@@ -431,20 +427,6 @@ static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
 	return !memcmp(de_name, fname->disk_name.name, fname->disk_name.len);
 }
 
-/* bio.c */
-static inline void fscrypt_decrypt_bio(struct bio *bio)
-{
-}
-
-static inline void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
-					       struct bio *bio)
-{
-}
-
-static inline void fscrypt_decrypt_work(struct work_struct *work)
-{
-}
-
 static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 					sector_t pblk, unsigned int len)
 {
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
