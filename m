Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36344655485
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8onK-0004kk-VG;
	Fri, 23 Dec 2022 20:37:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8onI-0004kS-Sg
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GMQjjAWXkkReWZnQCnm47aZCDZndXQFBfZeTvRQJF38=; b=hYgtLHG5igYrmFxvCGLLoihmFF
 JbIG/L9K4jwpZnZuLBoJ08btjQaNFpc8YmOHoWg5Wvb3GWYj7sShjyPbmGlizxaxR8ke3SLCLcSq+
 x9cI1uJyoV3/Xs4rz3Y66oaON7yv3zbi6UEZIps4zEn0e7fm/KhBTPOKBHfz3jqGmaxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GMQjjAWXkkReWZnQCnm47aZCDZndXQFBfZeTvRQJF38=; b=Gk4XFvFb/I0KbfpaTznbDSWWBW
 Vuvvk3PCd7t6jyA+BFh4dR0jf16sf9H8dI0GcJqJXdIBUzqZ1cjdzzBBUpULuFVKjRx9ob/+u+Vx/
 kPyY2PGf+yOGxVsVhp582c6OkCv4aMZY4ZuoB6fZ7EhUmj8uCYzxSw+oaGYpAEyLEaUU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8omz-00089d-0W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1760861F06;
 Fri, 23 Dec 2022 20:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B74C433F2;
 Fri, 23 Dec 2022 20:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827819;
 bh=ZAQDnq69vyL+/4co41JjRU2DGFFuthO5Y0yROMIMgR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L42jWAOPyzBsjZyV0RC2uRBBHb7VQUDo04SQEsVfPfM53O/1p3GzZc4xc6RppHs+P
 vXqNUSIOR7PAsynDU3iVs91NeXitcgNOZ28uYx8buGakL4eLsy+6ziBLsoh84A4xKs
 jIXj8Svc/d3rSr+W4lEL2SIsI3KJr+DdmJ6KsD6q68Jje2NpEXrAQe8bi3lVx6wtRK
 hTDqJJKLxPT/DpT4Gp8Elk0qVHHi0dwq6Zu28JZuOOwChUAwwHaY/C/1iIaoObhjp6
 cUy2KXNv7jrNlVfhF5Y8RD/xD2jk7I3uqQnwfvVITMe2wZPMNF6Ec7c3sV7fE9hAUA
 N8ThIDpVWIdxg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:37 -0800
Message-Id: <20221223203638.41293-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
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
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8omz-00089d-0W
Subject: [f2fs-dev] [PATCH v2 10/11] fs/buffer.c: support fsverity in
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
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
 fs/buffer.c | 67 +++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 10 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index d9c6d1fbb6dde..2e65ba2b3919b 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -48,6 +48,7 @@
 #include <linux/sched/mm.h>
 #include <trace/events/block.h>
 #include <linux/fscrypt.h>
+#include <linux/fsverity.h>
 
 #include "internal.h"
 
@@ -295,20 +296,52 @@ static void end_buffer_async_read(struct buffer_head *bh, int uptodate)
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
+	struct page *page = bh->b_page;
+	struct inode *inode = page->mapping->host;
+
+	return fsverity_active(inode) &&
+		/* needed by ext4 */
+		page->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
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
@@ -319,15 +352,24 @@ static void decrypt_bh(struct work_struct *work)
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
@@ -2245,6 +2287,11 @@ int block_read_full_folio(struct folio *folio, get_block_t *get_block)
 	int nr, i;
 	int fully_mapped = 1;
 	bool page_error = false;
+	loff_t limit = i_size_read(inode);
+
+	/* This is needed for ext4. */
+	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
+		limit = inode->i_sb->s_maxbytes;
 
 	VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
 
@@ -2253,7 +2300,7 @@ int block_read_full_folio(struct folio *folio, get_block_t *get_block)
 	bbits = block_size_bits(blocksize);
 
 	iblock = (sector_t)folio->index << (PAGE_SHIFT - bbits);
-	lblock = (i_size_read(inode)+blocksize-1) >> bbits;
+	lblock = (limit+blocksize-1) >> bbits;
 	bh = head;
 	nr = 0;
 	i = 0;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
