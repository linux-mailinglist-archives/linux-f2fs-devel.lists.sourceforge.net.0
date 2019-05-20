Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6223D69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBQ-0004pt-Bq; Mon, 20 May 2019 16:30:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBP-0004pJ-4s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gDqpPdD0dmPDIqS0R1TXkwsgEPnAcXL1EaChhgZdSSQ=; b=CJAsV3XuotNfNQ72Vse8ZyrptZ
 tyxHu9W2jHQ38+b8pxgTOCJSk6bQQOS6Q5QwTlNgpTdfpzVeWP8/mSz7/mtw9PHXHRkVGzS9GreU0
 Efh966y7R3hjepDv2kDvnlX1ujSp4zm52RjebLWvI9V+HBO+CjHZSMrZyZir0+6adZi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gDqpPdD0dmPDIqS0R1TXkwsgEPnAcXL1EaChhgZdSSQ=; b=fIavm3vyewuLyBNd8rY4nrKaST
 ABoLbgsd32/CUfIC+B9pb0DBbGhITLVBiUS9Y9tCFGI094VlWBe8YiQFFdm/K11BAapsDSwBAdM40
 /uq73LK7z8cVF1orXnZQy5V3L14w1Bj8u34WUoy++PVFm3LZAye6FxiUfBqW5cjpoqWE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBN-00BnRm-Ji
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:38 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C852621744;
 Mon, 20 May 2019 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369824;
 bh=Cp2ESAfDj/HVxHCEM+s4Pwds+GJgxCmhBhAP50lPZjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ItmYUDpuu5DYNarsTLaOVPOaPhwq3r3eWHN6em2jAOqDlWhuuErIo+yQxmCW3DPJ2
 eie0Tyg7oct43KHYJwQJ9Ml/ZiLiqzAbs4NnnsONfUddSXay+Go9TplvYF0MKt/3pp
 tHCMm9QiNW32Crl85y/sh/eNqI0Dtei++w33G82c=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:47 -0700
Message-Id: <20190520162952.156212-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSlBN-00BnRm-Ji
Subject: [f2fs-dev] [PATCH v2 09/14] fscrypt: support decrypting multiple
 filesystem blocks per page
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Rename fscrypt_decrypt_page() to fscrypt_decrypt_pagecache_blocks() and
redefine its behavior to decrypt all filesystem blocks in the given
region of the given page, rather than assuming that the region consists
of just one filesystem block.  Also remove the 'inode' and 'lblk_num'
parameters, since they can be retrieved from the page as it's already
assumed to be a pagecache page.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

This is based on work by Chandan Rajendra.

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c         |  3 +--
 fs/crypto/crypto.c      | 46 ++++++++++++++++++++++++++++-------------
 fs/ext4/inode.c         |  7 +++----
 include/linux/fscrypt.h | 12 +++++------
 4 files changed, 42 insertions(+), 26 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index f9111ffa12ffd..61da06fda45cc 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -33,8 +33,7 @@ static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
 
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		struct page *page = bv->bv_page;
-		int ret = fscrypt_decrypt_page(page->mapping->host, page,
-				PAGE_SIZE, 0, page->index);
+		int ret = fscrypt_decrypt_pagecache_blocks(page, PAGE_SIZE, 0);
 
 		if (ret)
 			SetPageError(page);
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 2e6fb5e4f7a7f..dcf630d7e4460 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -282,29 +282,47 @@ int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
 EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
 
 /**
- * fscrypt_decrypt_page() - Decrypts a page in-place
- * @inode:     The corresponding inode for the page to decrypt.
- * @page:      The page to decrypt. Must be locked.
- * @len:       Number of bytes in @page to be decrypted.
- * @offs:      Start of data in @page.
- * @lblk_num:  Logical block number.
+ * fscrypt_decrypt_pagecache_blocks() - Decrypt filesystem blocks in a pagecache page
+ * @page:      The locked pagecache page containing the block(s) to decrypt
+ * @len:       Total size of the block(s) to decrypt.  Must be a nonzero
+ *		multiple of the filesystem's block size.
+ * @offs:      Byte offset within @page of the first block to decrypt.  Must be
+ *		a multiple of the filesystem's block size.
  *
- * Decrypts page in-place using the ctx encryption context.
+ * The specified block(s) are decrypted in-place within the pagecache page,
+ * which must still be locked and not uptodate.  Normally, blocksize ==
+ * PAGE_SIZE and the whole page is decrypted at once.
  *
- * Called from the read completion callback.
+ * This is for use by the filesystem's ->readpages() method.
  *
- * Return: Zero on success, non-zero otherwise.
+ * Return: 0 on success; -errno on failure
  */
-int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
-			unsigned int len, unsigned int offs, u64 lblk_num)
+int fscrypt_decrypt_pagecache_blocks(struct page *page, unsigned int len,
+				     unsigned int offs)
 {
+	const struct inode *inode = page->mapping->host;
+	const unsigned int blockbits = inode->i_blkbits;
+	const unsigned int blocksize = 1 << blockbits;
+	u64 lblk_num = ((u64)page->index << (PAGE_SHIFT - blockbits)) +
+		       (offs >> blockbits);
+	unsigned int i;
+	int err;
+
 	if (WARN_ON_ONCE(!PageLocked(page)))
 		return -EINVAL;
 
-	return fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page, page,
-				   len, offs, GFP_NOFS);
+	if (WARN_ON_ONCE(len <= 0 || !IS_ALIGNED(len | offs, blocksize)))
+		return -EINVAL;
+
+	for (i = offs; i < offs + len; i += blocksize, lblk_num++) {
+		err = fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page,
+					  page, blocksize, i, GFP_NOFS);
+		if (err)
+			return err;
+	}
+	return 0;
 }
-EXPORT_SYMBOL(fscrypt_decrypt_page);
+EXPORT_SYMBOL(fscrypt_decrypt_pagecache_blocks);
 
 /**
  * fscrypt_decrypt_block_inplace() - Decrypt a filesystem block in-place
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 82298c63ea6d6..34fda4864c0eb 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1232,8 +1232,7 @@ static int ext4_block_write_begin(struct page *page, loff_t pos, unsigned len,
 	if (unlikely(err))
 		page_zero_new_buffers(page, from, to);
 	else if (decrypt)
-		err = fscrypt_decrypt_page(page->mapping->host, page,
-				PAGE_SIZE, 0, page->index);
+		err = fscrypt_decrypt_pagecache_blocks(page, PAGE_SIZE, 0);
 	return err;
 }
 #endif
@@ -4066,8 +4065,8 @@ static int __ext4_block_zero_page_range(handle_t *handle,
 			/* We expect the key to be set. */
 			BUG_ON(!fscrypt_has_encryption_key(inode));
 			BUG_ON(blocksize != PAGE_SIZE);
-			WARN_ON_ONCE(fscrypt_decrypt_page(page->mapping->host,
-						page, PAGE_SIZE, 0, page->index));
+			WARN_ON_ONCE(fscrypt_decrypt_pagecache_blocks(
+						page, PAGE_SIZE, 0));
 		}
 	}
 	if (ext4_should_journal_data(inode)) {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 315affc99b050..bd8f207a2fb68 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -112,8 +112,9 @@ extern int fscrypt_encrypt_block_inplace(const struct inode *inode,
 					 struct page *page, unsigned int len,
 					 unsigned int offs, u64 lblk_num,
 					 gfp_t gfp_flags);
-extern int fscrypt_decrypt_page(const struct inode *, struct page *, unsigned int,
-				unsigned int, u64);
+
+extern int fscrypt_decrypt_pagecache_blocks(struct page *page, unsigned int len,
+					    unsigned int offs);
 extern int fscrypt_decrypt_block_inplace(const struct inode *inode,
 					 struct page *page, unsigned int len,
 					 unsigned int offs, u64 lblk_num);
@@ -310,10 +311,9 @@ static inline int fscrypt_encrypt_block_inplace(const struct inode *inode,
 	return -EOPNOTSUPP;
 }
 
-static inline int fscrypt_decrypt_page(const struct inode *inode,
-				       struct page *page,
-				       unsigned int len, unsigned int offs,
-				       u64 lblk_num)
+static inline int fscrypt_decrypt_pagecache_blocks(struct page *page,
+						   unsigned int len,
+						   unsigned int offs)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
