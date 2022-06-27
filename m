Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC955B804
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jun 2022 08:52:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5ibO-0003gW-Tt; Mon, 27 Jun 2022 06:52:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o5ibN-0003gO-RZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 06:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EB8LKhiqH4U6s4zY/l+tuyd1yjtvz9qyKMj4Wv4+LZg=; b=Um2Gc/JyPqu4OK7a/etccOpBXc
 h13409K8tbLgJT+sCVwc7MapV3oRPdj11e4s6C0hDA9uajdIhoxOPwiRT9BJ4xBWv/bTwgjRdkGuu
 b873SXrjhYPhxhiEGCKy/xlV2zVRj2TKdj71OF1TSk0ZhA1AuQdfiuPzWk5tVMpSYKjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EB8LKhiqH4U6s4zY/l+tuyd1yjtvz9qyKMj4Wv4+LZg=; b=WthJfjSfkG0qdBNSJCx2SztB3T
 ZkgPpEYe+1um9RCIxx16XB6m4lkCUfv0Ho00zfThhtTFZh+0TdMHDTpsnNjP9R/JU6rdHJrnHqWlA
 EKlCIVIm4ckuylCWKdfBfQ6puWl8kmfF8pnyqoIxxnrolRvya9/mY2wY1917vUyAS4Ow=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5ibI-00FMQd-7p
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 06:52:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCF9C61185;
 Mon, 27 Jun 2022 06:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B4BC341CA;
 Mon, 27 Jun 2022 06:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656312714;
 bh=+AyvxCvn4yrPcBcWfqYEVWf1b1GQlpHfuY/Cybxb1qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u0kyDImxb6ZyniuA/XFG2ZruQkJXYj/PfvDeFPPIezA765VThYsDr0ji2oiz5QF3F
 s1jByKAMJMVVEXc5AuuOQLBnBq86wBerTj9/815un4oI9ozaoP0eeS8AWP9+7tAT6R
 7RX3MwLUokZiHug3h6a3TdaiphQDUbgY2Uzbsm5xq75/eqw0FN1OcWMYObRQLFxedC
 mn2dPEufhuVilIqA//hKPekPP9ycmFsNDul+tU66lBUF/sVnnJTaiJf0nDTcB+KBaS
 l2sT2EGU5EygVJobO9Jr3V9xkWr750hBsJUGi3Tg3rMkO8virBGT3EjrFsh0tGIULe
 48KLCemLgTGpQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 26 Jun 2022 23:50:49 -0700
Message-Id: <20220627065050.274716-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627065050.274716-1-ebiggers@kernel.org>
References: <20220627065050.274716-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> As a step towards
 freeing the PG_error flag for other uses, change ext4 and f2fs to stop using
 PG_error to track decryption errors. Instead, if a decryption error occurs,
 just mark the whole bio as fa [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o5ibI-00FMQd-7p
Subject: [f2fs-dev] [PATCH 1/2] fscrypt: stop using PG_error to track error
 status
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
 fs/f2fs/data.c          | 17 +++++++++--------
 include/linux/fscrypt.h |  5 +++--
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 2217fe5ece6f9..1b4403136d05c 100644
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
index e02a5f14e0211..5ce4706f68a7c 100644
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
index 7fcbcf9797372..47065f17d579c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -138,7 +138,7 @@ static void f2fs_finish_read_bio(struct bio *bio)
 			continue;
 		}
 
-		/* PG_error was set if decryption or verity failed. */
+		/* PG_error was set if verity failed. */
 		if (bio->bi_status || PageError(page)) {
 			ClearPageUptodate(page);
 			/* will re-read again later */
@@ -184,7 +184,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 			struct page *page = bv->bv_page;
 
 			if (!f2fs_is_compressed_page(page) &&
-			    !PageError(page) && !fsverity_verify_page(page))
+			    !fsverity_verify_page(page))
 				SetPageError(page);
 		}
 	} else {
@@ -234,10 +234,8 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx)
 	bio_for_each_segment_all(bv, ctx->bio, iter_all) {
 		struct page *page = bv->bv_page;
 
-		/* PG_error was set if decryption failed. */
 		if (f2fs_is_compressed_page(page))
-			f2fs_end_read_compressed_page(page, PageError(page),
-						blkaddr);
+			f2fs_end_read_compressed_page(page, false, blkaddr);
 		else
 			all_compressed = false;
 
@@ -257,14 +255,17 @@ static void f2fs_post_read_work(struct work_struct *work)
 {
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
+	struct bio *bio = ctx->bio;
 
-	if (ctx->enabled_steps & STEP_DECRYPT)
-		fscrypt_decrypt_bio(ctx->bio);
+	if ((ctx->enabled_steps & STEP_DECRYPT) && !fscrypt_decrypt_bio(bio)) {
+		f2fs_finish_read_bio(bio);
+		return;
+	}
 
 	if (ctx->enabled_steps & STEP_DECOMPRESS)
 		f2fs_handle_step_decompress(ctx);
 
-	f2fs_verify_and_finish_bio(ctx->bio);
+	f2fs_verify_and_finish_bio(bio);
 }
 
 static void f2fs_read_end_io(struct bio *bio)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e60d57c99cb6f..e9a3a51f29632 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -348,7 +348,7 @@ u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
 int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
-void fscrypt_decrypt_bio(struct bio *bio);
+bool fscrypt_decrypt_bio(struct bio *bio);
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 			  sector_t pblk, unsigned int len);
 
@@ -641,8 +641,9 @@ static inline int fscrypt_d_revalidate(struct dentry *dentry,
 }
 
 /* bio.c */
-static inline void fscrypt_decrypt_bio(struct bio *bio)
+static inline bool fscrypt_decrypt_bio(struct bio *bio)
 {
+	return true;
 }
 
 static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,

-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
