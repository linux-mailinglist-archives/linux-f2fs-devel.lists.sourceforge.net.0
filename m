Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE93594703
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Aug 2022 01:51:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oNjs7-0004jT-OB;
	Mon, 15 Aug 2022 23:51:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oNjs6-0004jM-AR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 23:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bX2jsnxk8q+J5JnklR8sI0Uk425y7Bb4yvNo7k7SrqI=; b=SnX0rNoU0tpfC1NMWWowmxX89L
 YdDKLapBBTqQMsGYSfi6A78ZRqbZqr6vF/gCTVbknzXwxp0f6MUQ6Jh7QuVQG7XJozi104Qns0K2T
 L/el4Seqf97+BhxHVoosxT95Sc74owhXikpayuf83Hxa5GunSEzYoIjVVUEqwL1O5iZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bX2jsnxk8q+J5JnklR8sI0Uk425y7Bb4yvNo7k7SrqI=; b=ciBD38/lpWk50hJ0N10DSzuiLP
 KO+nx0Dhnz/7u3OHvAHFtaD1b6cdQnb/UKnw1LIsRC5NxfajFIEWrae+ktqkH8O3jRcgOTZYt9w68
 P8Ig4IL7J0+lECRhHH4SZE+lpzVifZgmrr4gyos5z/+fxGjFYd4dfvMoWh6Sc/AvJ3/c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oNjs5-0001oj-JW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Aug 2022 23:51:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D1D261275;
 Mon, 15 Aug 2022 23:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CEFEC433D6;
 Mon, 15 Aug 2022 23:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660607503;
 bh=iXxQk1hszc9wAswA+G0HsmfnsoSaY8rCsUwpSpNAKas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PE3mHYNg8gf6VY/wUxXUPk+CieVfAFv6IoPfxXHTYHB7hpnZsLGz0ebeNs5loaX5u
 TZYKPOq1OmnJel+b5QLpzXOS6hzgKekPAbMpTuaW88/CVMbauXE+MUbRXBGpKh2Hml
 meWjr654b2+5w+m2pfkTbFpYqd5PH7XzYRSRjo+WE6hW+ARHxn0n2Xeo/KEX7By9Rb
 68h9CQoAwGDmdnggPStzgUKbYPXT/4GUWrEnX+Q7MAltJT8N9SiIumpJ9TQE+iYhoP
 9gD4dv19gqmYnsVtG2xr4N3fDC5x3WyUR9M8Y+QIJW92pR4EmyXF4zIsirnYW/MlMH
 wOkCmJG+2xebA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 15 Aug 2022 16:50:51 -0700
Message-Id: <20220815235052.86545-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815235052.86545-1-ebiggers@kernel.org>
References: <20220815235052.86545-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> As a step towards
 freeing the PG_error flag for other uses, change ext4 and f2fs to stop using
 PG_error to track decryption errors. Instead, if a decryption error occurs,
 just mark the whole bio as fa [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oNjs5-0001oj-JW
Subject: [f2fs-dev] [PATCH v2 1/2] fscrypt: stop using PG_error to track
 error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

As a step towards freeing the PG_error flag for other uses, change ext4
and f2fs to stop using PG_error to track decryption errors.  Instead, if
a decryption error occurs, just mark the whole bio as failed.  The
coarser granularity isn't really a problem since it isn't any worse than
what the block layer provides, and errors from a multi-page readahead
aren't reported to applications unless a single-page read fails too.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c         | 16 ++++++++++------
 fs/ext4/readpage.c      |  8 +++++---
 fs/f2fs/data.c          | 18 ++++++++++--------
 include/linux/fscrypt.h |  5 +++--
 4 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 2217fe5ece6f9b..1b4403136d05c0 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -25,21 +25,25 @@
  * then this function isn't applicable.  This function may sleep, so it must be
  * called from a workqueue rather than from the bio's bi_end_io callback.
  *
- * This function sets PG_error on any pages that contain any blocks that failed
- * to be decrypted.  The filesystem must not mark such pages uptodate.
+ * Return: %true on success; %false on failure.  On failure, bio->bi_status is
+ *	   also set to an error status.
  */
-void fscrypt_decrypt_bio(struct bio *bio)
+bool fscrypt_decrypt_bio(struct bio *bio)
 {
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
 
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		struct page *page = bv->bv_page;
-		int ret = fscrypt_decrypt_pagecache_blocks(page, bv->bv_len,
+		int err = fscrypt_decrypt_pagecache_blocks(page, bv->bv_len,
 							   bv->bv_offset);
-		if (ret)
-			SetPageError(page);
+
+		if (err) {
+			bio->bi_status = errno_to_blk_status(err);
+			return false;
+		}
 	}
+	return true;
 }
 EXPORT_SYMBOL(fscrypt_decrypt_bio);
 
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index e02a5f14e0211e..5ce4706f68a7c6 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -96,10 +96,12 @@ static void decrypt_work(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
+	struct bio *bio = ctx->bio;
 
-	fscrypt_decrypt_bio(ctx->bio);
-
-	bio_post_read_processing(ctx);
+	if (fscrypt_decrypt_bio(bio))
+		bio_post_read_processing(ctx);
+	else
+		__read_end_io(bio);
 }
 
 static void verity_work(struct work_struct *work)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index aa3ccddfa03761..93cc2ec51c2aeb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -139,7 +139,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			continue;
 		}
 
-		/* PG_error was set if decryption or verity failed. */
+		/* PG_error was set if verity failed. */
 		if (bio->bi_status || PageError(page)) {
 			ClearPageUptodate(page);
 			/* will re-read again later */
@@ -185,7 +185,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 			struct page *page = bv->bv_page;
 
 			if (!f2fs_is_compressed_page(page) &&
-			    !PageError(page) && !fsverity_verify_page(page))
+			    !fsverity_verify_page(page))
 				SetPageError(page);
 		}
 	} else {
@@ -236,10 +236,9 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
 	bio_for_each_segment_all(bv, ctx->bio, iter_all) {
 		struct page *page = bv->bv_page;
 
-		/* PG_error was set if decryption failed. */
 		if (f2fs_is_compressed_page(page))
-			f2fs_end_read_compressed_page(page, PageError(page),
-						blkaddr, in_task);
+			f2fs_end_read_compressed_page(page, false, blkaddr,
+						      in_task);
 		else
 			all_compressed = false;
 
@@ -259,14 +258,17 @@ static void f2fs_post_read_work(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
+	struct bio *bio = ctx->bio;
 
-	if (ctx->enabled_steps & STEP_DECRYPT)
-		fscrypt_decrypt_bio(ctx->bio);
+	if ((ctx->enabled_steps & STEP_DECRYPT) && !fscrypt_decrypt_bio(bio)) {
+		f2fs_finish_read_bio(bio, true);
+		return;
+	}
 
 	if (ctx->enabled_steps & STEP_DECOMPRESS)
 		f2fs_handle_step_decompress(ctx, true);
 
-	f2fs_verify_and_finish_bio(ctx->bio, true);
+	f2fs_verify_and_finish_bio(bio, true);
 }
 
 static void f2fs_read_end_io(struct bio *bio)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 7d2f1e0f23b1fe..10c645685b32c2 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -353,7 +353,7 @@ u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
 int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
-void fscrypt_decrypt_bio(struct bio *bio);
+bool fscrypt_decrypt_bio(struct bio *bio);
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 			  sector_t pblk, unsigned int len);
 
@@ -646,8 +646,9 @@ static inline int fscrypt_d_revalidate(struct dentry *dentry,
 }
 
 /* bio.c */
-static inline void fscrypt_decrypt_bio(struct bio *bio)
+static inline bool fscrypt_decrypt_bio(struct bio *bio)
 {
+	return true;
 }
 
 static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
-- 
2.37.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
