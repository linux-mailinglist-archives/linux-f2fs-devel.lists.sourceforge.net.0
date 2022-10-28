Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2286611D91
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 00:48:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooY8v-0004TG-Dl;
	Fri, 28 Oct 2022 22:48:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ooY8s-0004Sr-SB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 22:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjQjmkOk7hK6O0b2725GUhJe8kYPdG3VL8Tvj58c+5Y=; b=cjdSjS+4EEcrZK0iLwKIx3K4yn
 b/SoK2WLRS8vJFowpqMR4RY5T35I0sz/Mljp0IjGtgIUwWwxJ9NnWR4WI/fLk+f5UEOQ6UN9AKR4i
 oaFL7vYVw3J2K2CuptF9XW4IrmE64odvwR07Fsj3UwfcxCTG3WndkbiuLMC753cL2B7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UjQjmkOk7hK6O0b2725GUhJe8kYPdG3VL8Tvj58c+5Y=; b=jekMNtJt9InHqG6rrDmVWkpB1K
 sbLlvP2p84YN4b85p8e5k7D9PhpVAMx1ZZnx4H8CAnTSDDX2WuCypw1UbRgpkOS+On+e+DC6k1Auw
 +yuVOnSoDPD8PC61CbwBTYt+9CCQ3ltvoNOJWARPcoHtsl3GgvRtIuRrOdUykyn7Jg7Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooY8r-003vjA-DH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 22:47:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D52262AC7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Oct 2022 22:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B18C4347C;
 Fri, 28 Oct 2022 22:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666997266;
 bh=TIPDTx2LUw4vx8E38rt9OO0EAC7WyDogJc0vLXFp3gY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=prnT5TA3ENz77NTNdV+c9bCieHMI/QrZSKTizjWQ916UJ5X+s6Hlh7fbZl1PMmUgL
 QkTU8Z3btWM3HLzOSZUqqqdDaXKhHD0o5Nd1YZJ2npy4WCgiK8CAcBkqej4hle22sH
 44SNdI2+T0ES5EaHJpEqv6+BoLJ57ZeFnNegqpzzb98VrADluq9B6Ri5kihaeVwaV+
 9/CuWdrJARI/nCuTkX8vmeL4XFs3c7/1I4KxtxKFOCPGQvjzR0b2s08P8TdYnePpMC
 dQ5Z5aX/75R806VvVd0wU4GyDfweo1mAQ+zFAordRj1+Ca/upMrLi8CCY0yaNIEB0j
 Cgr3K4lrGKwFA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 28 Oct 2022 15:45:38 -0700
Message-Id: <20221028224539.171818-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221028224539.171818-1-ebiggers@kernel.org>
References: <20221028224539.171818-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> After each
 filesystem
 block (as represented by a buffer_head) has been read from disk by
 block_read_full_folio(), 
 verify it if needed. The verification is done on the fsverity_read_workqueue.
 Also all [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooY8r-003vjA-DH
Subject: [f2fs-dev] [PATCH 5/6] fs/buffer.c: support fsverity in
 block_read_full_folio()
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
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

After each filesystem block (as represented by a buffer_head) has been
read from disk by block_read_full_folio(), verify it if needed.  The
verification is done on the fsverity_read_workqueue.  Also allow reads
of verity metadata past i_size, as required by ext4.

This is needed to support fsverity on ext4 filesystems where the
filesystem block size is less than the page size.

The new code is compiled away when CONFIG_FS_VERITY=n.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/buffer.c | 66 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 56 insertions(+), 10 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index d9c6d1fbb6dde..bea0f63031129 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -48,6 +48,7 @@
 #include <linux/sched/mm.h>
 #include <trace/events/block.h>
 #include <linux/fscrypt.h>
+#include <linux/fsverity.h>
 
 #include "internal.h"
 
@@ -295,20 +296,51 @@ static void end_buffer_async_read(struct buffer_head *bh, int uptodate)
 	return;
 }
 
-struct decrypt_bh_ctx {
+struct postprocess_bh_ctx {
 	struct work_struct work;
 	struct buffer_head *bh;
 };
 
+static void verify_bh(struct work_struct *work)
+{
+	struct postprocess_bh_ctx *ctx =
+		container_of(work, struct postprocess_bh_ctx, work);
+	struct buffer_head *bh = ctx->bh;
+	bool valid;
+
+	valid = fsverity_verify_blocks(bh->b_page, bh->b_size, bh_offset(bh));
+	end_buffer_async_read(bh, valid);
+	kfree(ctx);
+}
+
+static bool need_fsverity(struct buffer_head *bh)
+{
+	struct inode *inode = bh->b_page->mapping->host;
+
+	return fsverity_active(inode) &&
+		/* needed by ext4 */
+		bh->b_page->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
+}
+
 static void decrypt_bh(struct work_struct *work)
 {
-	struct decrypt_bh_ctx *ctx =
-		container_of(work, struct decrypt_bh_ctx, work);
+	struct postprocess_bh_ctx *ctx =
+		container_of(work, struct postprocess_bh_ctx, work);
 	struct buffer_head *bh = ctx->bh;
 	int err;
 
 	err = fscrypt_decrypt_pagecache_blocks(bh->b_page, bh->b_size,
 					       bh_offset(bh));
+	if (err == 0 && need_fsverity(bh)) {
+		/*
+		 * We use different work queues for decryption and for verity
+		 * because verity may require reading metadata pages that need
+		 * decryption, and we shouldn't recurse to the same workqueue.
+		 */
+		INIT_WORK(&ctx->work, verify_bh);
+		fsverity_enqueue_verify_work(&ctx->work);
+		return;
+	}
 	end_buffer_async_read(bh, err == 0);
 	kfree(ctx);
 }
@@ -319,15 +351,24 @@ static void decrypt_bh(struct work_struct *work)
  */
 static void end_buffer_async_read_io(struct buffer_head *bh, int uptodate)
 {
-	/* Decrypt if needed */
-	if (uptodate &&
-	    fscrypt_inode_uses_fs_layer_crypto(bh->b_page->mapping->host)) {
-		struct decrypt_bh_ctx *ctx = kmalloc(sizeof(*ctx), GFP_ATOMIC);
+	struct inode *inode = bh->b_page->mapping->host;
+	bool decrypt = fscrypt_inode_uses_fs_layer_crypto(inode);
+	bool verify = need_fsverity(bh);
+
+	/* Decrypt (with fscrypt) and/or verify (with fsverity) if needed. */
+	if (uptodate && (decrypt || verify)) {
+		struct postprocess_bh_ctx *ctx =
+			kmalloc(sizeof(*ctx), GFP_ATOMIC);
 
 		if (ctx) {
-			INIT_WORK(&ctx->work, decrypt_bh);
 			ctx->bh = bh;
-			fscrypt_enqueue_decrypt_work(&ctx->work);
+			if (decrypt) {
+				INIT_WORK(&ctx->work, decrypt_bh);
+				fscrypt_enqueue_decrypt_work(&ctx->work);
+			} else {
+				INIT_WORK(&ctx->work, verify_bh);
+				fsverity_enqueue_verify_work(&ctx->work);
+			}
 			return;
 		}
 		uptodate = 0;
@@ -2245,6 +2286,11 @@ int block_read_full_folio(struct folio *folio, get_block_t *get_block)
 	int nr, i;
 	int fully_mapped = 1;
 	bool page_error = false;
+	loff_t limit = i_size_read(inode);
+
+	/* This is needed for ext4. */
+	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
+		limit = inode->i_sb->s_maxbytes;
 
 	VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
 
@@ -2253,7 +2299,7 @@ int block_read_full_folio(struct folio *folio, get_block_t *get_block)
 	bbits = block_size_bits(blocksize);
 
 	iblock = (sector_t)folio->index << (PAGE_SHIFT - bbits);
-	lblock = (i_size_read(inode)+blocksize-1) >> bbits;
+	lblock = (limit+blocksize-1) >> bbits;
 	bh = head;
 	nr = 0;
 	i = 0;
-- 
2.38.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
