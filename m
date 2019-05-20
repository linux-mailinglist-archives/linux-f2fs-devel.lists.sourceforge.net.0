Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 005A023D61
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBK-0006KG-K4; Mon, 20 May 2019 16:30:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBJ-0006Jz-PW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s3/7dq5Hv2TZ94d1O2ZNARrvlYdbBElmW5uJkP5RFGY=; b=KO91v4FrlyVrubM4pZj3YN/UsT
 JR6QjiqjLKkUBilYQKaXoS5UtCUrG5XqimW07Dld1x0+Lg1IPUB76oEPtO/WYdfQpcs5nAALS1r/W
 wAYKAqg2iwCqV0s2sp3r7RwIH83NJkM3T37o5UvlWypd9629TSSY219qk3EoYTWp+LQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s3/7dq5Hv2TZ94d1O2ZNARrvlYdbBElmW5uJkP5RFGY=; b=H/sIkw829EaYbaQeBe8OEXuVRS
 0f9IHgKDIGtugF/AHj/ZSgsMSin/ey/tT+VVZ5U4EvUgDrRAJ+1sd62w5RTzrNee9ZpN85ImsBzTZ
 wvAQFFEpHqyNF6yxI44wj6HEZJmnGHg9t6TNHb/M/oaT/H5TZVGyXPqSym0OjVLEwbnc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBD-0005I2-LJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:32 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7F352173B;
 Mon, 20 May 2019 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369822;
 bh=SOcJbbqhRxdEFcK2jyoo821iyc6Vy9fOspmpjn/YoXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hn9O1LhVuFFUT6+gwic7GUq8fqtk7NLzwu97zIhC4CeEhGyFFm6ycdbEusitDGwKS
 rYTkbj78aIizPi1kdSZbf+s17paPdWO2K3HLebLco/XyWwkGlZVPEN1UCgLIeclM5A
 PiDcirluP255kpj8n6TkIJmxTTLJWTWYtgyZWceE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:41 -0700
Message-Id: <20190520162952.156212-4-ebiggers@kernel.org>
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
X-Headers-End: 1hSlBD-0005I2-LJ
Subject: [f2fs-dev] [PATCH v2 03/14] fscrypt: rename
 fscrypt_do_page_crypto() to fscrypt_crypt_block()
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

fscrypt_do_page_crypto() only does a single encryption or decryption
operation, with a single logical block number (single IV).  So it
actually operates on a filesystem block, not a "page" per se.  To
reflect this, rename it to fscrypt_crypt_block().

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c             |  6 +++---
 fs/crypto/crypto.c          | 24 ++++++++++++------------
 fs/crypto/fscrypt_private.h | 11 +++++------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index c534253483874..92b2d5da5d8e1 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -83,9 +83,9 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		return -ENOMEM;
 
 	while (len--) {
-		err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk,
-					     ZERO_PAGE(0), ciphertext_page,
-					     PAGE_SIZE, 0, GFP_NOFS);
+		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
+					  ZERO_PAGE(0), ciphertext_page,
+					  PAGE_SIZE, 0, GFP_NOFS);
 		if (err)
 			goto errout;
 
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index ebfa13cfecb7d..e6802d7aca3c7 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -147,10 +147,11 @@ void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 		crypto_cipher_encrypt_one(ci->ci_essiv_tfm, iv->raw, iv->raw);
 }
 
-int fscrypt_do_page_crypto(const struct inode *inode, fscrypt_direction_t rw,
-			   u64 lblk_num, struct page *src_page,
-			   struct page *dest_page, unsigned int len,
-			   unsigned int offs, gfp_t gfp_flags)
+/* Encrypt or decrypt a single filesystem block of file contents */
+int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
+			u64 lblk_num, struct page *src_page,
+			struct page *dest_page, unsigned int len,
+			unsigned int offs, gfp_t gfp_flags)
 {
 	union fscrypt_iv iv;
 	struct skcipher_request *req = NULL;
@@ -227,9 +228,9 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 
 	if (inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES) {
 		/* with inplace-encryption we just encrypt the page */
-		err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk_num, page,
-					     ciphertext_page, len, offs,
-					     gfp_flags);
+		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num, page,
+					  ciphertext_page, len, offs,
+					  gfp_flags);
 		if (err)
 			return ERR_PTR(err);
 
@@ -243,9 +244,8 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
 	if (!ciphertext_page)
 		return ERR_PTR(-ENOMEM);
 
-	err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk_num,
-				     page, ciphertext_page, len, offs,
-				     gfp_flags);
+	err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk_num, page,
+				  ciphertext_page, len, offs, gfp_flags);
 	if (err) {
 		fscrypt_free_bounce_page(ciphertext_page);
 		return ERR_PTR(err);
@@ -277,8 +277,8 @@ int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 	if (!(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES))
 		BUG_ON(!PageLocked(page));
 
-	return fscrypt_do_page_crypto(inode, FS_DECRYPT, lblk_num, page, page,
-				      len, offs, GFP_NOFS);
+	return fscrypt_crypt_block(inode, FS_DECRYPT, lblk_num, page, page,
+				   len, offs, GFP_NOFS);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_page);
 
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 4122ee1a0b7b1..8978eec9d766d 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -116,12 +116,11 @@ static inline bool fscrypt_valid_enc_modes(u32 contents_mode,
 /* crypto.c */
 extern struct kmem_cache *fscrypt_info_cachep;
 extern int fscrypt_initialize(unsigned int cop_flags);
-extern int fscrypt_do_page_crypto(const struct inode *inode,
-				  fscrypt_direction_t rw, u64 lblk_num,
-				  struct page *src_page,
-				  struct page *dest_page,
-				  unsigned int len, unsigned int offs,
-				  gfp_t gfp_flags);
+extern int fscrypt_crypt_block(const struct inode *inode,
+			       fscrypt_direction_t rw, u64 lblk_num,
+			       struct page *src_page, struct page *dest_page,
+			       unsigned int len, unsigned int offs,
+			       gfp_t gfp_flags);
 extern struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags);
 extern const struct dentry_operations fscrypt_d_ops;
 
-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
