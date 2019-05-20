Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BE23D66
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBO-0001X1-Ot; Mon, 20 May 2019 16:30:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBN-0001Wa-4X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bOfgFDlRjp+X2SZ593xTMrpJofUfLnQNPfveMREy6+4=; b=lBKiSj9QnJktEK0FFp77FD1i2Q
 4+0Kuc1g8eq1MDanORg12/ZDnW7ca2z9jqi0V1aiPtbdWIGpPdQ6nlsNI8gPl7XWPDZhrBb93GurH
 AfgpyUTNcr80K4NWjeDWysape3BXtTay9v3UeNQNGY7r9sIlIqSHxy4z1IYXP3RErY+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bOfgFDlRjp+X2SZ593xTMrpJofUfLnQNPfveMREy6+4=; b=jNpsAeCzGCg9I3ZPZsnqVILMf6
 y7ItBS1nhjv0obdLUaY/1ptlm0On7Foqx97H+YCVe23AENMFuVGdDUIaTeFrTPocxPjor7Z11uwgy
 fQBU3nToVcKbyIYmPfaavq9pSQpH0bl3KQK+PguX1LT0Yv5eOnUWnB1t1tdTGEXA1aIM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBL-0005J9-Oe
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:37 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C6E8B2173E;
 Mon, 20 May 2019 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369823;
 bh=9QdpTEHuf1OrocytJjxo0GKTFXi55ekeZurQgDf8cyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oP28H7RDt58UjtO464eTlhzvfLwquwG/s3VGS01lHee0Cmvt3cxQX8SYv5NnBnN4+
 UzjaVmQyi31Xz/cZrcdpVv5gaMK82/xcCLb1cdB/VwUueDOY/bs77sc7sniiklHwtY
 8J1vq0v6d8+Rgl6Z8VrGhAT5S+4BpQLpehTdLb3w=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:44 -0700
Message-Id: <20190520162952.156212-7-ebiggers@kernel.org>
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
X-Headers-End: 1hSlBL-0005J9-Oe
Subject: [f2fs-dev] [PATCH v2 06/14] fscrypt: support encrypting multiple
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

Rename fscrypt_encrypt_page() to fscrypt_encrypt_pagecache_blocks() and
redefine its behavior to encrypt all filesystem blocks from the given
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
 fs/crypto/crypto.c      | 67 ++++++++++++++++++++++++-----------------
 fs/ext4/page-io.c       |  4 +--
 fs/f2fs/data.c          |  5 +--
 include/linux/fscrypt.h | 17 ++++++-----
 4 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 6877b7c6165de..7bdb985126d97 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -121,8 +121,8 @@ struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
 /**
  * fscrypt_free_bounce_page() - free a ciphertext bounce page
  *
- * Free a bounce page that was allocated by fscrypt_encrypt_page(), or by
- * fscrypt_alloc_bounce_page() directly.
+ * Free a bounce page that was allocated by fscrypt_encrypt_pagecache_blocks(),
+ * or by fscrypt_alloc_bounce_page() directly.
  */
 void fscrypt_free_bounce_page(struct page *bounce_page)
 {
@@ -197,52 +197,63 @@ int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
 }
 
 /**
- * fscypt_encrypt_page() - Encrypts a page
- * @inode:     The inode for which the encryption should take place
- * @page:      The page to encrypt. Must be locked.
- * @len:       Length of data to encrypt in @page and encrypted
- *             data in returned page.
- * @offs:      Offset of data within @page and returned
- *             page holding encrypted data.
- * @lblk_num:  Logical block number. This must be unique for multiple
- *             calls with same inode, except when overwriting
- *             previously written data.
- * @gfp_flags: The gfp flag for memory allocation
+ * fscrypt_encrypt_pagecache_blocks() - Encrypt filesystem blocks from a pagecache page
+ * @page:      The locked pagecache page containing the block(s) to encrypt
+ * @len:       Total size of the block(s) to encrypt.  Must be a nonzero
+ *		multiple of the filesystem's block size.
+ * @offs:      Byte offset within @page of the first block to encrypt.  Must be
+ *		a multiple of the filesystem's block size.
+ * @gfp_flags: Memory allocation flags
+ *
+ * A new bounce page is allocated, and the specified block(s) are encrypted into
+ * it.  In the bounce page, the ciphertext block(s) will be located at the same
+ * offsets at which the plaintext block(s) were located in the source page; any
+ * other parts of the bounce page will be left uninitialized.  However, normally
+ * blocksize == PAGE_SIZE and the whole page is encrypted at once.
  *
- * Encrypts @page.  A bounce page is allocated, the data is encrypted into the
- * bounce page, and the bounce page is returned.  The caller is responsible for
- * calling fscrypt_free_bounce_page().
+ * This is for use by the filesystem's ->writepages() method.
  *
- * Return: A page containing the encrypted data on success, else an ERR_PTR()
+ * Return: the new encrypted bounce page on success; an ERR_PTR() on failure
  */
-struct page *fscrypt_encrypt_page(const struct inode *inode,
-				struct page *page,
-				unsigned int len,
-				unsigned int offs,
-				u64 lblk_num, gfp_t gfp_flags)
+struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
+					      unsigned int len,
+					      unsigned int offs,
+					      gfp_t gfp_flags)
 
 {
+	const struct inode *inode = page->mapping->host;
+	const unsigned int blockbits = inode->i_blkbits;
+	const unsigned int blocksize = 1 << blockbits;
 	struct page *ciphertext_page;
+	u64 lblk_num = ((u64)page->index << (PAGE_SHIFT - blockbits)) +
+		       (offs >> blockbits);
+	unsigned int i;
 	int err;
 
 	if (WARN_ON_ONCE(!PageLocked(page)))
 		return ERR_PTR(-EINVAL);
 
+	if (WARN_ON_ONCE(len <= 0 || !IS_ALIGNED(len | offs, blocksize)))
+		return ERR_PTR(-EINVAL);
+
 	ciphertext_page = fscrypt_alloc_bounce_page(gfp_flags);
 	if (!ciphertext_page)
 		return ERR_PTR(-ENOMEM);
 
-	err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num, page,
-				  ciphertext_page, len, offs, gfp_flags);
-	if (err) {
-		fscrypt_free_bounce_page(ciphertext_page);
-		return ERR_PTR(err);
+	for (i = offs; i < offs + len; i += blocksize, lblk_num++) {
+		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num,
+					  page, ciphertext_page,
+					  blocksize, i, gfp_flags);
+		if (err) {
+			fscrypt_free_bounce_page(ciphertext_page);
+			return ERR_PTR(err);
+		}
 	}
 	SetPagePrivate(ciphertext_page);
 	set_page_private(ciphertext_page, (unsigned long)page);
 	return ciphertext_page;
 }
-EXPORT_SYMBOL(fscrypt_encrypt_page);
+EXPORT_SYMBOL(fscrypt_encrypt_pagecache_blocks);
 
 /**
  * fscrypt_encrypt_block_inplace() - Encrypt a filesystem block in-place
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 13d5ecc0af03f..40ee33df57649 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -471,8 +471,8 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 		gfp_t gfp_flags = GFP_NOFS;
 
 	retry_encrypt:
-		bounce_page = fscrypt_encrypt_page(inode, page, PAGE_SIZE, 0,
-						   page->index, gfp_flags);
+		bounce_page = fscrypt_encrypt_pagecache_blocks(page, PAGE_SIZE,
+							       0, gfp_flags);
 		if (IS_ERR(bounce_page)) {
 			ret = PTR_ERR(bounce_page);
 			if (ret == -ENOMEM && wbc->sync_mode == WB_SYNC_ALL) {
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 968ebdbcb5834..a546ac8685ea6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1726,8 +1726,9 @@ static int encrypt_one_page(struct f2fs_io_info *fio)
 	f2fs_wait_on_block_writeback(inode, fio->old_blkaddr);
 
 retry_encrypt:
-	fio->encrypted_page = fscrypt_encrypt_page(inode, fio->page,
-			PAGE_SIZE, 0, fio->page->index, gfp_flags);
+	fio->encrypted_page = fscrypt_encrypt_pagecache_blocks(fio->page,
+							       PAGE_SIZE, 0,
+							       gfp_flags);
 	if (IS_ERR(fio->encrypted_page)) {
 		/* flush pending IOs and wait for a while in the ENOMEM case */
 		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a9b2d26e615d5..c7e16bd16a6c2 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -103,9 +103,11 @@ static inline void fscrypt_handle_d_move(struct dentry *dentry)
 extern void fscrypt_enqueue_decrypt_work(struct work_struct *);
 extern struct fscrypt_ctx *fscrypt_get_ctx(gfp_t);
 extern void fscrypt_release_ctx(struct fscrypt_ctx *);
-extern struct page *fscrypt_encrypt_page(const struct inode *, struct page *,
-						unsigned int, unsigned int,
-						u64, gfp_t);
+
+extern struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
+						     unsigned int len,
+						     unsigned int offs,
+						     gfp_t gfp_flags);
 extern int fscrypt_encrypt_block_inplace(const struct inode *inode,
 					 struct page *page, unsigned int len,
 					 unsigned int offs, u64 lblk_num,
@@ -288,11 +290,10 @@ static inline void fscrypt_release_ctx(struct fscrypt_ctx *ctx)
 	return;
 }
 
-static inline struct page *fscrypt_encrypt_page(const struct inode *inode,
-						struct page *page,
-						unsigned int len,
-						unsigned int offs,
-						u64 lblk_num, gfp_t gfp_flags)
+static inline struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
+							    unsigned int len,
+							    unsigned int offs,
+							    gfp_t gfp_flags)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
