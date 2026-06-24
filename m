Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mc3iG89lO2o1XQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:23 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE676BB5BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Mi2ELidG;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=HJH5Fgt6;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=TaCC9Wk1;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="drFp7/0f";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKGhhXVi95EQokVFZr7nXsUvGbA5n5hDBOo+kFzYFmo=; b=Mi2ELidGOSvdqE3eAtFvpayoFR
	vGcZtrkaMUAp7BWgn/5Omh3wKs9c8PbAoUrPJHEgBT+0X9Wkx57dHgYonmuCwMCrD9IW7xR3wuB7m
	XQ2yeMFY15CvPqNZwWj11zuVeyxRsCz7gg2znRO2J/DFwqiXt/ZQDz4kKa476jvyO88o=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoc-00066W-SW;
	Wed, 24 Jun 2026 05:06:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoY-000667-Q4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FNBrhRvT1L2j4HNG5pR/0zJOfHASrRKcphBr80CPr8U=; b=HJH5Fgt6rNPNrym1TDHRC1pVbp
 42z3YwOIIgCnQTQPHongq1OakpbKvQ5pCKUUBgIQPcB+VbHSz9PnPMN2UcjR7Y7D8uIiQG0JnRlJm
 uMQdnayl1nQaNai8djLlAzQ8YNwV3bX4YqXGSD4B8EbwBLXMIeJ7/TOHyrX9awlmlHBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FNBrhRvT1L2j4HNG5pR/0zJOfHASrRKcphBr80CPr8U=; b=TaCC9Wk1IEakCirkOVEHxwMlPz
 Qck/uslUwm5lEe5BtoiyorZV4O7WTzXJpNiVK4ro8bbrz7UDCiEi+QxbA1AShaZpfCDMPuRSKBAe4
 789JREJshP/lM7RjOOAquIw279nR5E9Zvf6jSH/mzvMwL0b1AGmCyNl9XZ3gBqHrZRCA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoU-0004mk-8z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 112B4601F3;
 Wed, 24 Jun 2026 05:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C98A1F000E9;
 Wed, 24 Jun 2026 05:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277563;
 bh=FNBrhRvT1L2j4HNG5pR/0zJOfHASrRKcphBr80CPr8U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=drFp7/0fY+I//RnSgKo3cKJAMnfjydlqUi+gx9+qYcHeSg+l1b2kUTLXH00vhA1Ws
 dvOMM9TigPK6cID3nmALvSFGsTJVwul9ash65CxugwT3niW8pXqcUBUsQm3P7FvqdQ
 gGf1U+ZbA+bDbTvNUxmUu/tMhoh17gk9htga6wK07sKce/tz9eq8G1ahsOcmslTcWL
 c4mUjwfNpJMgB53RvPThBgz5OB0hHUOBWPdszvprsHF6c6h39pj7cugmPU8EKdR6/8
 KyvYWSkhF8mRJ5Lh2vfropwECRFZ5151AouoL+ZhfnzuGnT3N6v5o0gOYT/eb8XmNj
 9nIBYt884xgWw==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:26 -0700
Message-ID: <20260624050334.124606-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624050334.124606-1-ebiggers@kernel.org>
References: <20260624050334.124606-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since the bio postprocessing code in fs/ext4/readpage.c is
 now used only for fsverity, rename things accordingly. Also don't create
 the caches at all when !CONFIG_FS_VERITY. Signed-off-by: Eric Biggers
 <ebiggers@kernel.org>
 --- fs/ext4/ext4.h | 4 +-- fs/ext4/readpage.c | 66 ++++++++++++++++++++++
 fs/ext4/super.c | 6 ++--- 3 files changed, 37 insert [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wcFoU-0004mk-8z
Subject: [f2fs-dev] [PATCH 08/16] ext4: Further de-generalize the bio
 postprocessing code
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEE676BB5BA

Since the bio postprocessing code in fs/ext4/readpage.c is now used only
for fsverity, rename things accordingly.  Also don't create the caches
at all when !CONFIG_FS_VERITY.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ext4/ext4.h     |  4 +--
 fs/ext4/readpage.c | 66 ++++++++++++++++++++++------------------------
 fs/ext4/super.c    |  6 ++---
 3 files changed, 37 insertions(+), 39 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 920a8ec1b948..af6cf0bbc5e2 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3827,12 +3827,12 @@ static inline void ext4_set_de_type(struct super_block *sb,
 }
 
 /* readpages.c */
 int ext4_read_folio(struct file *file, struct folio *folio);
 void ext4_readahead(struct readahead_control *rac);
-extern int __init ext4_init_post_read_processing(void);
-extern void ext4_exit_post_read_processing(void);
+extern int __init ext4_init_verity_caches(void);
+extern void ext4_exit_verity_caches(void);
 
 /* symlink.c */
 extern const struct inode_operations ext4_encrypted_symlink_inode_operations;
 extern const struct inode_operations ext4_symlink_inode_operations;
 extern const struct inode_operations ext4_fast_symlink_inode_operations;
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index 8af183798a33..322226290e65 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -45,16 +45,16 @@
 #include <linux/backing-dev.h>
 
 #include "ext4.h"
 #include <trace/events/ext4.h>
 
-#define NUM_PREALLOC_POST_READ_CTXS	128
+#define NUM_VERITY_WORKS 128
 
-static struct kmem_cache *bio_post_read_ctx_cache;
-static mempool_t *bio_post_read_ctx_pool;
+static struct kmem_cache *ext4_verity_work_cache;
+static mempool_t *ext4_verity_work_pool;
 
-struct bio_post_read_ctx {
+struct ext4_verity_work {
 	struct bio *bio;
 	struct fsverity_info *vi;
 	struct work_struct work;
 };
 
@@ -63,39 +63,33 @@ static void __read_end_io(struct bio *bio)
 	struct folio_iter fi;
 
 	bio_for_each_folio_all(fi, bio)
 		folio_end_read(fi.folio, bio->bi_status == 0);
 	if (bio->bi_private)
-		mempool_free(bio->bi_private, bio_post_read_ctx_pool);
+		mempool_free(bio->bi_private, ext4_verity_work_pool);
 	bio_put(bio);
 }
 
 static void verity_work(struct work_struct *work)
 {
-	struct bio_post_read_ctx *ctx =
-		container_of(work, struct bio_post_read_ctx, work);
+	struct ext4_verity_work *ctx =
+		container_of(work, struct ext4_verity_work, work);
 	struct bio *bio = ctx->bio;
 	struct fsverity_info *vi = ctx->vi;
 
 	/*
-	 * Free the bio_post_read_ctx right away, since it's no longer needed.
+	 * Free the ext4_verity_work right away, since it's no longer needed.
 	 * This relieves the pressure on the mempool as much as possible.
 	 */
-	mempool_free(ctx, bio_post_read_ctx_pool);
+	mempool_free(ctx, ext4_verity_work_pool);
 	bio->bi_private = NULL;
 
 	fsverity_verify_bio(vi, bio);
 
 	__read_end_io(bio);
 }
 
-static bool bio_post_read_required(struct bio *bio)
-{
-	return IS_ENABLED(CONFIG_FS_VERITY) && bio->bi_private &&
-	       !bio->bi_status;
-}
-
 /*
  * I/O completion handler for multipage BIOs.
  *
  * The mpage code never puts partial pages into a BIO (except for end-of-file).
  * If a page does not map to a contiguous run of blocks then it simply falls
@@ -106,28 +100,28 @@ static bool bio_post_read_required(struct bio *bio)
  * status of that page is hard.  See end_buffer_async_read() for the details.
  * There is no point in duplicating all that complexity.
  */
 static void mpage_end_io(struct bio *bio)
 {
-	if (bio_post_read_required(bio)) {
-		struct bio_post_read_ctx *ctx = bio->bi_private;
+	if (IS_ENABLED(CONFIG_FS_VERITY) && bio->bi_private &&
+	    !bio->bi_status) {
+		struct ext4_verity_work *ctx = bio->bi_private;
 
 		INIT_WORK(&ctx->work, verity_work);
 		fsverity_enqueue_verify_work(&ctx->work);
 		return;
 	}
 	__read_end_io(bio);
 }
 
-static void ext4_set_bio_post_read_ctx(struct bio *bio,
-				       const struct inode *inode,
-				       struct fsverity_info *vi)
+static void ext4_set_verity_work(struct bio *bio, const struct inode *inode,
+				 struct fsverity_info *vi)
 {
 	if (vi) {
 		/* Due to the mempool, this never fails. */
-		struct bio_post_read_ctx *ctx =
-			mempool_alloc(bio_post_read_ctx_pool, GFP_NOFS);
+		struct ext4_verity_work *ctx =
+			mempool_alloc(ext4_verity_work_pool, GFP_NOFS);
 
 		ctx->bio = bio;
 		ctx->vi = vi;
 		bio->bi_private = ctx;
 	}
@@ -287,11 +281,11 @@ static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 			 * __GFP_DIRECT_RECLAIM is set, see bio_alloc_bioset().
 			 */
 			bio = bio_alloc(bdev, bio_max_segs(nr_pages),
 					REQ_OP_READ, GFP_KERNEL);
 			fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_KERNEL);
-			ext4_set_bio_post_read_ctx(bio, inode, vi);
+			ext4_set_verity_work(bio, inode, vi);
 			bio->bi_iter.bi_sector = first_block << (blkbits - 9);
 			bio->bi_end_io = mpage_end_io;
 			if (rac)
 				bio->bi_opf |= REQ_RAHEAD;
 		}
@@ -361,29 +355,33 @@ void ext4_readahead(struct readahead_control *rac)
 		fsverity_readahead(vi, readahead_index(rac),
 				   readahead_count(rac));
 	ext4_mpage_readpages(inode, vi, rac, NULL);
 }
 
-int __init ext4_init_post_read_processing(void)
+int __init ext4_init_verity_caches(void)
 {
-	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, SLAB_RECLAIM_ACCOUNT);
+	if (!IS_ENABLED(CONFIG_FS_VERITY))
+		return 0;
+	ext4_verity_work_cache =
+		KMEM_CACHE(ext4_verity_work, SLAB_RECLAIM_ACCOUNT);
 
-	if (!bio_post_read_ctx_cache)
+	if (!ext4_verity_work_cache)
 		goto fail;
-	bio_post_read_ctx_pool =
-		mempool_create_slab_pool(NUM_PREALLOC_POST_READ_CTXS,
-					 bio_post_read_ctx_cache);
-	if (!bio_post_read_ctx_pool)
+	ext4_verity_work_pool = mempool_create_slab_pool(
+		NUM_VERITY_WORKS, ext4_verity_work_cache);
+	if (!ext4_verity_work_pool)
 		goto fail_free_cache;
 	return 0;
 
 fail_free_cache:
-	kmem_cache_destroy(bio_post_read_ctx_cache);
+	kmem_cache_destroy(ext4_verity_work_cache);
 fail:
 	return -ENOMEM;
 }
 
-void ext4_exit_post_read_processing(void)
+void ext4_exit_verity_caches(void)
 {
-	mempool_destroy(bio_post_read_ctx_pool);
-	kmem_cache_destroy(bio_post_read_ctx_cache);
+	if (!IS_ENABLED(CONFIG_FS_VERITY))
+		return;
+	mempool_destroy(ext4_verity_work_pool);
+	kmem_cache_destroy(ext4_verity_work_cache);
 }
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 245f67d10ded..cb9ca0dc4664 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7529,11 +7529,11 @@ static int __init ext4_init_fs(void)
 
 	err = ext4_init_pending();
 	if (err)
 		goto out7;
 
-	err = ext4_init_post_read_processing();
+	err = ext4_init_verity_caches();
 	if (err)
 		goto out6;
 
 	err = ext4_init_pageio();
 	if (err)
@@ -7578,11 +7578,11 @@ static int __init ext4_init_fs(void)
 out3:
 	ext4_exit_system_zone();
 out4:
 	ext4_exit_pageio();
 out5:
-	ext4_exit_post_read_processing();
+	ext4_exit_verity_caches();
 out6:
 	ext4_exit_pending();
 out7:
 	ext4_exit_es();
 
@@ -7599,11 +7599,11 @@ static void __exit ext4_exit_fs(void)
 	destroy_inodecache();
 	ext4_exit_mballoc();
 	ext4_exit_sysfs();
 	ext4_exit_system_zone();
 	ext4_exit_pageio();
-	ext4_exit_post_read_processing();
+	ext4_exit_verity_caches();
 	ext4_exit_es();
 	ext4_exit_pending();
 }
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
