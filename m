Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 412F48FABD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 08:17:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyVY8-0003El-14; Fri, 16 Aug 2019 06:17:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hyVY7-0003Ee-99
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eczpq87h1dbH9ucpTbxTgjEDXUt8VXUBhSnQHrUSpl8=; b=iEklEo25Wax9g9vCxrlrZv5kj9
 +NL48Y3G3SdtblzGlMeeVqw2kuuDzLY8PVa25CT82fcvdNPeZoGarssx89QofwhpHqkwAvLIMBmqc
 SQ/9YF7e645wpbm1dXrwQdnnLYahI4k87GlgKA9mGOOb7xllzQ1zg8iIl9fsIBKLn1MA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eczpq87h1dbH9ucpTbxTgjEDXUt8VXUBhSnQHrUSpl8=; b=UUP+lttsDIMvBTjUyveb9OI71q
 CLvdLhJn9UlFmAXRc7X4Ny8rPd3o7b62RU23EX9x6FXMg4oWQx/T87jSaURo4nIapMMyYEmLCjQ/y
 ocetUDSD0fQPOmJwPPAvOq4H2pas/gncJHC0NUhO8Ez+AgA8nk/vus27rV3Wj1Ko+nnw=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyVXw-005YIU-5i
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:17:19 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G63W16053157
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 16 Aug 2019 02:17:02 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udnsjafdr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 16 Aug 2019 02:17:02 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Fri, 16 Aug 2019 07:17:01 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 07:16:56 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G6Gt0030671126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 06:16:55 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8495112063;
 Fri, 16 Aug 2019 06:16:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8013112061;
 Fri, 16 Aug 2019 06:16:52 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.23])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 16 Aug 2019 06:16:52 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Fri, 16 Aug 2019 11:48:01 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190816061804.14840-1-chandan@linux.ibm.com>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19081606-0072-0000-0000-000004532E3B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011597; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01247516; UDB=6.00658410; IPR=6.01029025; 
 MB=3.00028195; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-16 06:16:59
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081606-0073-0000-0000-00004CC4470F
Message-Id: <20190816061804.14840-6-chandan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160066
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyVXw-005YIU-5i
Subject: [f2fs-dev] [PATCH V4 5/8] f2fs: Use read_callbacks for decrypting
 file data
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
 chandanrmail@gmail.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

F2FS has a copy of "post read processing" code using which encrypted
file data is decrypted. This commit replaces it to make use of the
generic read_callbacks facility.

Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
---
 fs/f2fs/data.c  | 109 ++++--------------------------------------------
 fs/f2fs/f2fs.h  |   2 -
 fs/f2fs/super.c |   9 +---
 3 files changed, 11 insertions(+), 109 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 757f050c650a..3cf1eca2ece9 100644
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
@@ -69,19 +65,6 @@ static enum count_type __read_io_type(struct page *page)
 	return F2FS_RD_DATA;
 }
 
-/* postprocessing steps for read bios */
-enum bio_post_read_step {
-	STEP_INITIAL = 0,
-	STEP_DECRYPT,
-};
-
-struct bio_post_read_ctx {
-	struct bio *bio;
-	struct work_struct work;
-	unsigned int cur_step;
-	unsigned int enabled_steps;
-};
-
 static void __read_end_io(struct bio *bio)
 {
 	struct page *page;
@@ -93,7 +76,7 @@ static void __read_end_io(struct bio *bio)
 		page = bv->bv_page;
 
 		/* PG_error was set if any post_read step failed */
-		if (bio->bi_status || PageError(page)) {
+		if (bio->bi_status || read_callbacks_failed(page)) {
 			ClearPageUptodate(page);
 			/* will re-read again later */
 			ClearPageError(page);
@@ -103,42 +86,8 @@ static void __read_end_io(struct bio *bio)
 		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
 		unlock_page(page);
 	}
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
-
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
-	}
-}
-
-static bool f2fs_bio_post_read_required(struct bio *bio)
-{
-	return bio->bi_private && !bio->bi_status;
+	bio_put(bio);
 }
 
 static void f2fs_read_end_io(struct bio *bio)
@@ -149,15 +98,7 @@ static void f2fs_read_end_io(struct bio *bio)
 		bio->bi_status = BLK_STS_IOERR;
 	}
 
-	if (f2fs_bio_post_read_required(bio)) {
-		struct bio_post_read_ctx *ctx = bio->bi_private;
-
-		ctx->cur_step = STEP_INITIAL;
-		bio_post_read_processing(ctx);
-		return;
-	}
-
-	__read_end_io(bio);
+	read_callbacks_endio_bio(bio, __read_end_io);
 }
 
 static void f2fs_write_end_io(struct bio *bio)
@@ -556,8 +497,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct bio *bio;
-	struct bio_post_read_ctx *ctx;
-	unsigned int post_read_steps = 0;
+	int err;
 
 	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC))
 		return ERR_PTR(-EFAULT);
@@ -569,17 +509,10 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
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
+	err = read_callbacks_setup_bio(inode, bio);
+	if (err) {
+		bio_put(bio);
+		return ERR_PTR(err);
 	}
 
 	return bio;
@@ -2860,27 +2793,3 @@ void f2fs_clear_page_cache_dirty_tag(struct page *page)
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
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 87f75ebd2fd6..cea79321b794 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3125,8 +3125,6 @@ void f2fs_destroy_checkpoint_caches(void);
 /*
  * data.c
  */
-int f2fs_init_post_read_processing(void);
-void f2fs_destroy_post_read_processing(void);
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct page *page,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 11b3a039a188..d7bbb4f1fdb3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3597,15 +3597,11 @@ static int __init init_f2fs_fs(void)
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
@@ -3626,7 +3622,6 @@ static int __init init_f2fs_fs(void)
 
 static void __exit exit_f2fs_fs(void)
 {
-	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
 	unregister_shrinker(&f2fs_shrinker_info);
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
