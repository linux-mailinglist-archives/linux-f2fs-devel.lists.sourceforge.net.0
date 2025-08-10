Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F446B1F901
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWPRY0rtZkwfAtuEdKubqdi+VH+93+wfwJm7OneR69I=; b=g/JCN+j2Ep2tRPrGzEuj1pPqoA
	sbbftZCyC03hnpadag/Foa3L7bvm5w+RX0RzYsAROSciYDctC0+wMub5YrHz9OPeIMs8acous/Z0D
	tWxrLL8LE577eE1phTpIu6QpU9UE/QwEKDQtGw7p0F6M1BXUPVczKTscNj1L0ZTJgSCs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yW-0002XD-Ke;
	Sun, 10 Aug 2025 08:00:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yV-0002X7-EB
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+POvm6qnmrRaxfgdft5Zx+HNG1CKF/n+pr/rWAsHCTM=; b=Yb5mKmBuavoX83m6tZAyBfQPIR
 KeJrYMWXtvR4ehPi6/YSEBKIgi/DLDEuzJ41MZEkzkm4R42P7KmubyTPQFFqTCGk5BABr76SAPLH4
 Cj+p7LEcKAONcDzM1CbHJ02yqaqcMVNCn6ICwQlcX2KLSN/gkLeR/gQ3NlbE+DZkM8yI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+POvm6qnmrRaxfgdft5Zx+HNG1CKF/n+pr/rWAsHCTM=; b=nT5BD4lR1WFSSs+Hipm+HNWbTa
 shmDZRbTUGO5UQIiY35DMRb+z1twY1uB8qW6m7vRolwXmXwM7TyPU7pjvYIWaImwjSrJUTL3Aoyhb
 iCEdd/SxZrzFQ9UU+y2aj/HXvXXZoz1LgMiIokhd/wP8LNYIbk8Zql0xeAGXxNRrBx0E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yU-00010K-3R for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4480845C48;
 Sun, 10 Aug 2025 08:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6BCC4CEF9;
 Sun, 10 Aug 2025 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812808;
 bh=ogrPRs7G8yJ7ig6hN3bBPR4xal7BchcvqoEaGpf5IUo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q1YmITnlvaUyFNILQ9X6zKvnnJFYBQMzjjrSzIQnyhUY75fRncZJvRAdxol91udiy
 w37urZcJ7FyOFVRrTXWwLPbh/n7aubfjoQvS4xABWoW0bcdmXOn5AQdtEgpkihqiMd
 PtbmWiIqTXVjb3aI7kvSH6OAwiIzdLi3zw/jZPpN2x8UHp0WgwX6w9wyik2QOk6ndb
 P9JyeU137aToIcR8T/QsP5eW1aRVM3CiW8OEm0dYWxgCwG2/fhO+QrNJeVWxtEZ6F+
 KqiZgi2Y6Hb3SLfdwzPz/e0u+gCVe/djINSJ0Kuaf/aMXeZwyZ4v7Uc488OzI2JmqD
 IZclhf1nQlgww==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:56:54 -0700
Message-ID: <20250810075706.172910-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add and use a helper function fscrypt_get_inode_info_raw().
 It loads an inode's fscrypt info pointer using a raw dereference, which is
 appropriate when the caller knows the key setup already happened. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0yU-00010K-3R
Subject: [f2fs-dev] [PATCH v5 01/13] fscrypt: replace raw loads of info
 pointer with helper function
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
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add and use a helper function fscrypt_get_inode_info_raw().  It loads an
inode's fscrypt info pointer using a raw dereference, which is
appropriate when the caller knows the key setup already happened.

This eliminates most occurrences of inode::i_crypt_info in the source,
in preparation for replacing that with a filesystem-specific field.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/crypto/bio.c          |  2 +-
 fs/crypto/crypto.c       | 14 ++++++++------
 fs/crypto/fname.c        | 11 ++++++-----
 fs/crypto/hooks.c        |  2 +-
 fs/crypto/inline_crypt.c | 12 +++++++-----
 fs/crypto/policy.c       |  7 ++++---
 include/linux/fscrypt.h  | 16 ++++++++++++++++
 7 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 486fcb2ecf13e..0d746de4cd103 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -111,11 +111,11 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
  * Return: 0 on success; -errno on failure.
  */
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 			  sector_t pblk, unsigned int len)
 {
-	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 	const unsigned int du_bits = ci->ci_data_unit_bits;
 	const unsigned int du_size = 1U << du_bits;
 	const unsigned int du_per_page_bits = PAGE_SHIFT - du_bits;
 	const unsigned int du_per_page = 1U << du_per_page_bits;
 	u64 du_index = (u64)lblk << (inode->i_blkbits - du_bits);
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index b6ccab524fdef..07f9cbfe3ea41 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -171,11 +171,11 @@ int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
  */
 struct page *fscrypt_encrypt_pagecache_blocks(struct folio *folio,
 		size_t len, size_t offs, gfp_t gfp_flags)
 {
 	const struct inode *inode = folio->mapping->host;
-	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 	const unsigned int du_bits = ci->ci_data_unit_bits;
 	const unsigned int du_size = 1U << du_bits;
 	struct page *ciphertext_page;
 	u64 index = ((u64)folio->index << (PAGE_SHIFT - du_bits)) +
 		    (offs >> du_bits);
@@ -230,12 +230,13 @@ int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
 				  unsigned int len, unsigned int offs,
 				  u64 lblk_num)
 {
 	if (WARN_ON_ONCE(inode->i_sb->s_cop->supports_subblock_data_units))
 		return -EOPNOTSUPP;
-	return fscrypt_crypt_data_unit(inode->i_crypt_info, FS_ENCRYPT,
-				       lblk_num, page, page, len, offs);
+	return fscrypt_crypt_data_unit(fscrypt_get_inode_info_raw(inode),
+				       FS_ENCRYPT, lblk_num, page, page, len,
+				       offs);
 }
 EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
 
 /**
  * fscrypt_decrypt_pagecache_blocks() - Decrypt data from a pagecache folio
@@ -253,11 +254,11 @@ EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
  */
 int fscrypt_decrypt_pagecache_blocks(struct folio *folio, size_t len,
 				     size_t offs)
 {
 	const struct inode *inode = folio->mapping->host;
-	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 	const unsigned int du_bits = ci->ci_data_unit_bits;
 	const unsigned int du_size = 1U << du_bits;
 	u64 index = ((u64)folio->index << (PAGE_SHIFT - du_bits)) +
 		    (offs >> du_bits);
 	size_t i;
@@ -303,12 +304,13 @@ int fscrypt_decrypt_block_inplace(const struct inode *inode, struct page *page,
 				  unsigned int len, unsigned int offs,
 				  u64 lblk_num)
 {
 	if (WARN_ON_ONCE(inode->i_sb->s_cop->supports_subblock_data_units))
 		return -EOPNOTSUPP;
-	return fscrypt_crypt_data_unit(inode->i_crypt_info, FS_DECRYPT,
-				       lblk_num, page, page, len, offs);
+	return fscrypt_crypt_data_unit(fscrypt_get_inode_info_raw(inode),
+				       FS_DECRYPT, lblk_num, page, page, len,
+				       offs);
 }
 EXPORT_SYMBOL(fscrypt_decrypt_block_inplace);
 
 /**
  * fscrypt_initialize() - allocate major buffers for fs encryption.
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index f9f6713e144f7..fb77ad1ca74a2 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -92,11 +92,11 @@ static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
  * Return: 0 on success, -errno on failure
  */
 int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 			  u8 *out, unsigned int olen)
 {
-	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 	struct crypto_sync_skcipher *tfm = ci->ci_enc_key.tfm;
 	SYNC_SKCIPHER_REQUEST_ON_STACK(req, tfm);
 	union fscrypt_iv iv;
 	struct scatterlist sg;
 	int err;
@@ -136,11 +136,11 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_encrypt);
  */
 static int fname_decrypt(const struct inode *inode,
 			 const struct fscrypt_str *iname,
 			 struct fscrypt_str *oname)
 {
-	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 	struct crypto_sync_skcipher *tfm = ci->ci_enc_key.tfm;
 	SYNC_SKCIPHER_REQUEST_ON_STACK(req, tfm);
 	union fscrypt_iv iv;
 	struct scatterlist src_sg, dst_sg;
 	int err;
@@ -272,12 +272,13 @@ bool __fscrypt_fname_encrypted_size(const union fscrypt_policy *policy,
  *	   fill out encrypted_len_ret with the length (up to max_len).
  */
 bool fscrypt_fname_encrypted_size(const struct inode *inode, u32 orig_len,
 				  u32 max_len, u32 *encrypted_len_ret)
 {
-	return __fscrypt_fname_encrypted_size(&inode->i_crypt_info->ci_policy,
-					      orig_len, max_len,
+	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
+
+	return __fscrypt_fname_encrypted_size(&ci->ci_policy, orig_len, max_len,
 					      encrypted_len_ret);
 }
 EXPORT_SYMBOL_GPL(fscrypt_fname_encrypted_size);
 
 /**
@@ -541,11 +542,11 @@ EXPORT_SYMBOL_GPL(fscrypt_match_name);
  *
  * Return: the SipHash of @name using the hash key of @dir
  */
 u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name)
 {
-	const struct fscrypt_inode_info *ci = dir->i_crypt_info;
+	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(dir);
 
 	WARN_ON_ONCE(!ci->ci_dirhash_key_initialized);
 
 	return siphash(name->name, name->len, &ci->ci_dirhash_key);
 }
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index e0b32ac841f76..7a5d4c168c49e 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -197,11 +197,11 @@ int fscrypt_prepare_setflags(struct inode *inode,
 	 */
 	if (IS_ENCRYPTED(inode) && (flags & ~oldflags & FS_CASEFOLD_FL)) {
 		err = fscrypt_require_key(inode);
 		if (err)
 			return err;
-		ci = inode->i_crypt_info;
+		ci = fscrypt_get_inode_info_raw(inode);
 		if (ci->ci_policy.version != FSCRYPT_POLICY_V2)
 			return -EINVAL;
 		mk = ci->ci_master_key;
 		down_read(&mk->mk_sem);
 		if (mk->mk_present)
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index caaff809765b2..5dee7c498bc8c 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -261,11 +261,11 @@ int fscrypt_derive_sw_secret(struct super_block *sb,
 	return err;
 }
 
 bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 {
-	return inode->i_crypt_info->ci_inlinecrypt;
+	return fscrypt_get_inode_info_raw(inode)->ci_inlinecrypt;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_inode_uses_inline_crypto);
 
 static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
 				 u64 lblk_num,
@@ -305,11 +305,11 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 	const struct fscrypt_inode_info *ci;
 	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
 
 	if (!fscrypt_inode_uses_inline_crypto(inode))
 		return;
-	ci = inode->i_crypt_info;
+	ci = fscrypt_get_inode_info_raw(inode);
 
 	fscrypt_generate_dun(ci, first_lblk, dun);
 	bio_crypt_set_ctx(bio, ci->ci_enc_key.blk_key, dun, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
@@ -383,26 +383,28 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
  */
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   u64 next_lblk)
 {
 	const struct bio_crypt_ctx *bc = bio->bi_crypt_context;
+	const struct fscrypt_inode_info *ci;
 	u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
 
 	if (!!bc != fscrypt_inode_uses_inline_crypto(inode))
 		return false;
 	if (!bc)
 		return true;
+	ci = fscrypt_get_inode_info_raw(inode);
 
 	/*
 	 * Comparing the key pointers is good enough, as all I/O for each key
 	 * uses the same pointer.  I.e., there's currently no need to support
 	 * merging requests where the keys are the same but the pointers differ.
 	 */
-	if (bc->bc_key != inode->i_crypt_info->ci_enc_key.blk_key)
+	if (bc->bc_key != ci->ci_enc_key.blk_key)
 		return false;
 
-	fscrypt_generate_dun(inode->i_crypt_info, next_lblk, next_dun);
+	fscrypt_generate_dun(ci, next_lblk, next_dun);
 	return bio_crypt_dun_is_contiguous(bc, bio->bi_iter.bi_size, next_dun);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
 
 /**
@@ -500,11 +502,11 @@ u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks)
 		return nr_blocks;
 
 	if (nr_blocks <= 1)
 		return nr_blocks;
 
-	ci = inode->i_crypt_info;
+	ci = fscrypt_get_inode_info_raw(inode);
 	if (!(fscrypt_policy_flags(&ci->ci_policy) &
 	      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32))
 		return nr_blocks;
 
 	/* With IV_INO_LBLK_32, the DUN can wrap around from U32_MAX to 0. */
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 6ad30ae07c065..9d51f3500de37 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -725,11 +725,11 @@ const union fscrypt_policy *fscrypt_policy_to_inherit(struct inode *dir)
 
 	if (IS_ENCRYPTED(dir)) {
 		err = fscrypt_require_key(dir);
 		if (err)
 			return ERR_PTR(err);
-		return &dir->i_crypt_info->ci_policy;
+		return &fscrypt_get_inode_info_raw(dir)->ci_policy;
 	}
 
 	return fscrypt_get_dummy_policy(dir->i_sb);
 }
 
@@ -744,11 +744,11 @@ const union fscrypt_policy *fscrypt_policy_to_inherit(struct inode *dir)
  *
  * Return: size of the resulting context or a negative error code.
  */
 int fscrypt_context_for_new_inode(void *ctx, struct inode *inode)
 {
-	struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
 
 	BUILD_BUG_ON(sizeof(union fscrypt_context) !=
 			FSCRYPT_SET_CONTEXT_MAX_SIZE);
 
 	/* fscrypt_prepare_new_inode() should have set up the key already. */
@@ -769,11 +769,11 @@ EXPORT_SYMBOL_GPL(fscrypt_context_for_new_inode);
  *
  * Return: 0 on success, -errno on failure
  */
 int fscrypt_set_context(struct inode *inode, void *fs_data)
 {
-	struct fscrypt_inode_info *ci = inode->i_crypt_info;
+	struct fscrypt_inode_info *ci;
 	union fscrypt_context ctx;
 	int ctxsize;
 
 	ctxsize = fscrypt_context_for_new_inode(&ctx, inode);
 	if (ctxsize < 0)
@@ -781,10 +781,11 @@ int fscrypt_set_context(struct inode *inode, void *fs_data)
 
 	/*
 	 * This may be the first time the inode number is available, so do any
 	 * delayed key setup that requires the inode number.
 	 */
+	ci = fscrypt_get_inode_info_raw(inode);
 	if (ci->ci_policy.version == FSCRYPT_POLICY_V2 &&
 	    (ci->ci_policy.v2.flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32))
 		fscrypt_hash_inode_number(ci, ci->ci_master_key);
 
 	return inode->i_sb->s_cop->set_context(inode, &ctx, ctxsize, fs_data);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 10dd161690a28..23c5198612d1a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -193,10 +193,26 @@ struct fscrypt_operations {
 };
 
 int fscrypt_d_revalidate(struct inode *dir, const struct qstr *name,
 			 struct dentry *dentry, unsigned int flags);
 
+/*
+ * Load the inode's fscrypt info pointer, using a raw dereference.  Since this
+ * uses a raw dereference with no memory barrier, it is appropriate to use only
+ * when the caller knows the inode's key setup already happened, resulting in
+ * non-NULL fscrypt info.  E.g., the file contents en/decryption functions use
+ * this, since fscrypt_file_open() set up the key.
+ */
+static inline struct fscrypt_inode_info *
+fscrypt_get_inode_info_raw(const struct inode *inode)
+{
+	struct fscrypt_inode_info *ci = inode->i_crypt_info;
+
+	VFS_WARN_ON_ONCE(ci == NULL);
+	return ci;
+}
+
 static inline struct fscrypt_inode_info *
 fscrypt_get_inode_info(const struct inode *inode)
 {
 	/*
 	 * Pairs with the cmpxchg_release() in fscrypt_setup_encryption_info().
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
