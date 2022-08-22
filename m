Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA259C819
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Aug 2022 21:09:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQCnn-0002B0-BX;
	Mon, 22 Aug 2022 19:09:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oQCnZ-0002Ai-7P
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 19:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xthnK5K1QpAryANqPGXVng1KFr0G/2XhE1GUviaHpMc=; b=UfiYADnwApAJF6oiR2c+Q5aJpb
 29A+Hl5MjXEN2yGN8bruTUH6dfoCWAlZpY/HuhyYia5rKiE4d9qi0tDJ79hdVVU7Sn5tDEYXR7IBY
 wcwOP3Yr3FSa/ooY0IcqzWlnl1TDrAvFbwDz0aBSVIOrrSoFOE4x1pKZQhRMNRrdI6fg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xthnK5K1QpAryANqPGXVng1KFr0G/2XhE1GUviaHpMc=; b=D6c2JimLonzZjcta7z9Tc6B3ec
 8K2R6Ej8jy6J8LFtzdliqdh7dRMbH2N/68Yj6JRfGt7s3ApACJeSR6zXn67HWt29e/596vSWvrpMJ
 yqD+bsRGL2FOkaWCgsnMhTip13B9aVYUr4QUrzO/Igh4J2/bGWx74+mzA6kwfRbT2oW4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQCnU-00DRyd-KU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Aug 2022 19:09:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37299611AA;
 Mon, 22 Aug 2022 19:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB61FC433D6;
 Mon, 22 Aug 2022 19:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661195351;
 bh=FU3u6qa3Id0JTrIkCSG3A1Y9KETL1u6wCBMj2K++PEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fX4Mpem+OujhDDl3JK6bZz/q6qFlWTIIoJVHFS5inG4vWMhmvTDd3Jz3FyqQrxEPT
 pERgcxLgwJCSN63laQ0OtrTnqWvP2yLaCDIYSZbSgYWJe0osx8wGj7YnAc10WlED2J
 tAhTw4YNkmp7vRZ0K2lYDYOc6voiGALNCN8wrgqH6dTIt8y8MyLgA7iav5/kqrqsvH
 EWpm6H+h6Sp3Thm8PWtXeD/v4+HJ69DLw+SZVEA/Hw+w97YUJ02HEKUC3kLFibX5ik
 MazVRVnnQ5EiGjVxFKGB7jcMhef1XWSHe/fZExR/6VQYySdZZDGMM3xmWPHO09MDN+
 Abm1tgbU0fIjw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Aug 2022 12:08:11 -0700
Message-Id: <20220822190812.54581-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822190812.54581-1-ebiggers@kernel.org>
References: <20220822190812.54581-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that the
 fscrypt_master_key
 lifetime has been reworked to not be subject to the quirks of the keyrings
 subsystem, blk_crypto_evict_key() no longer gets called after the filesystem
 has already been [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oQCnU-00DRyd-KU
Subject: [f2fs-dev] [PATCH v3 2/3] fscrypt: stop holding extra request_queue
 references
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
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that the fscrypt_master_key lifetime has been reworked to not be
subject to the quirks of the keyrings subsystem, blk_crypto_evict_key()
no longer gets called after the filesystem has already been unmounted.
Therefore, there is no longer any need to hold extra references to the
filesystem's request_queue(s).  (And these references didn't always do
their intended job anyway, as pinning a request_queue doesn't
necessarily pin the corresponding blk_crypto_profile.)

Stop taking these extra references.  Instead, just pass the super_block
to fscrypt_destroy_inline_crypt_key(), and use it to get the list of
block devices the key needs to be evicted from.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 11 +++--
 fs/crypto/inline_crypt.c    | 83 ++++++++++++++++---------------------
 fs/crypto/keyring.c         |  9 ++--
 fs/crypto/keysetup.c        |  8 ++--
 fs/crypto/keysetup_v1.c     |  4 +-
 5 files changed, 57 insertions(+), 58 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 0e2d3b0af0f79e..dcc005e3491453 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -184,7 +184,7 @@ struct fscrypt_symlink_data {
 struct fscrypt_prepared_key {
 	struct crypto_skcipher *tfm;
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
-	struct fscrypt_blk_crypto_key *blk_key;
+	struct blk_crypto_key *blk_key;
 #endif
 };
 
@@ -344,7 +344,8 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 				     const u8 *raw_key,
 				     const struct fscrypt_info *ci);
 
-void fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key);
+void fscrypt_destroy_inline_crypt_key(struct super_block *sb,
+				      struct fscrypt_prepared_key *prep_key);
 
 /*
  * Check whether the crypto transform or blk-crypto key has been allocated in
@@ -390,7 +391,8 @@ fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 }
 
 static inline void
-fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key)
+fscrypt_destroy_inline_crypt_key(struct super_block *sb,
+				 struct fscrypt_prepared_key *prep_key)
 {
 }
 
@@ -600,7 +602,8 @@ extern struct fscrypt_mode fscrypt_modes[];
 int fscrypt_prepare_key(struct fscrypt_prepared_key *prep_key,
 			const u8 *raw_key, const struct fscrypt_info *ci);
 
-void fscrypt_destroy_prepared_key(struct fscrypt_prepared_key *prep_key);
+void fscrypt_destroy_prepared_key(struct super_block *sb,
+				  struct fscrypt_prepared_key *prep_key);
 
 int fscrypt_set_per_file_enc_key(struct fscrypt_info *ci, const u8 *raw_key);
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 90f3e68f166e39..a3225fe2291361 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -21,12 +21,6 @@
 
 #include "fscrypt_private.h"
 
-struct fscrypt_blk_crypto_key {
-	struct blk_crypto_key base;
-	int num_devs;
-	struct request_queue *devs[];
-};
-
 static int fscrypt_get_num_devices(struct super_block *sb)
 {
 	if (sb->s_cop->get_num_devices)
@@ -162,47 +156,37 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	const struct inode *inode = ci->ci_inode;
 	struct super_block *sb = inode->i_sb;
 	enum blk_crypto_mode_num crypto_mode = ci->ci_mode->blk_crypto_mode;
-	int num_devs = fscrypt_get_num_devices(sb);
-	int queue_refs = 0;
-	struct fscrypt_blk_crypto_key *blk_key;
+	struct blk_crypto_key *blk_key;
+	int num_devs;
+	struct request_queue **devs = NULL;
 	int err;
 	int i;
 
-	blk_key = kzalloc(struct_size(blk_key, devs, num_devs), GFP_KERNEL);
+	blk_key = kmalloc(sizeof(*blk_key), GFP_KERNEL);
 	if (!blk_key)
 		return -ENOMEM;
 
-	blk_key->num_devs = num_devs;
-	fscrypt_get_devices(sb, num_devs, blk_key->devs);
-
-	err = blk_crypto_init_key(&blk_key->base, raw_key, crypto_mode,
+	err = blk_crypto_init_key(blk_key, raw_key, crypto_mode,
 				  fscrypt_get_dun_bytes(ci), sb->s_blocksize);
 	if (err) {
 		fscrypt_err(inode, "error %d initializing blk-crypto key", err);
-		goto fail;
+		goto out;
 	}
 
-	/*
-	 * We have to start using blk-crypto on all the filesystem's devices.
-	 * We also have to save all the request_queue's for later so that the
-	 * key can be evicted from them.  This is needed because some keys
-	 * aren't destroyed until after the filesystem was already unmounted
-	 * (namely, the per-mode keys in struct fscrypt_master_key).
-	 */
+	/* Start using blk-crypto on all the filesystem's block devices. */
+	num_devs = fscrypt_get_num_devices(sb);
+	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
+	if (!devs) {
+		err = -ENOMEM;
+		goto out;
+	}
+	fscrypt_get_devices(sb, num_devs, devs);
 	for (i = 0; i < num_devs; i++) {
-		if (!blk_get_queue(blk_key->devs[i])) {
-			fscrypt_err(inode, "couldn't get request_queue");
-			err = -EAGAIN;
-			goto fail;
-		}
-		queue_refs++;
-
-		err = blk_crypto_start_using_key(&blk_key->base,
-						 blk_key->devs[i]);
+		err = blk_crypto_start_using_key(blk_key, devs[i]);
 		if (err) {
 			fscrypt_err(inode,
 				    "error %d starting to use blk-crypto", err);
-			goto fail;
+			goto out;
 		}
 	}
 	/*
@@ -212,27 +196,32 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	 * possible for per-mode keys, not for per-file keys.
 	 */
 	smp_store_release(&prep_key->blk_key, blk_key);
-	return 0;
-
-fail:
-	for (i = 0; i < queue_refs; i++)
-		blk_put_queue(blk_key->devs[i]);
+	blk_key = NULL;
+	err = 0;
+out:
+	kfree(devs);
 	kfree_sensitive(blk_key);
 	return err;
 }
 
-void fscrypt_destroy_inline_crypt_key(struct fscrypt_prepared_key *prep_key)
+void fscrypt_destroy_inline_crypt_key(struct super_block *sb,
+				      struct fscrypt_prepared_key *prep_key)
 {
-	struct fscrypt_blk_crypto_key *blk_key = prep_key->blk_key;
+	struct blk_crypto_key *blk_key = prep_key->blk_key;
+	int num_devs;
+	struct request_queue **devs;
 	int i;
 
-	if (blk_key) {
-		for (i = 0; i < blk_key->num_devs; i++) {
-			blk_crypto_evict_key(blk_key->devs[i], &blk_key->base);
-			blk_put_queue(blk_key->devs[i]);
-		}
-		kfree_sensitive(blk_key);
+	/* Evict the key from all the filesystem's block devices. */
+	num_devs = fscrypt_get_num_devices(sb);
+	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
+	if (devs) {
+		fscrypt_get_devices(sb, num_devs, devs);
+		for (i = 0; i < num_devs; i++)
+			blk_crypto_evict_key(devs[i], blk_key);
+		kfree(devs);
 	}
+	kfree_sensitive(blk_key);
 }
 
 bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
@@ -282,7 +271,7 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 	ci = inode->i_crypt_info;
 
 	fscrypt_generate_dun(ci, first_lblk, dun);
-	bio_crypt_set_ctx(bio, &ci->ci_enc_key.blk_key->base, dun, gfp_mask);
+	bio_crypt_set_ctx(bio, ci->ci_enc_key.blk_key, dun, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
 
@@ -369,7 +358,7 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	 * uses the same pointer.  I.e., there's currently no need to support
 	 * merging requests where the keys are the same but the pointers differ.
 	 */
-	if (bc->bc_key != &inode->i_crypt_info->ci_enc_key.blk_key->base)
+	if (bc->bc_key != inode->i_crypt_info->ci_enc_key.blk_key)
 		return false;
 
 	fscrypt_generate_dun(inode->i_crypt_info, next_lblk, next_dun);
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 9b98d6a576e6a0..1cca09aa43f8b3 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -105,9 +105,12 @@ void fscrypt_put_master_key_activeref(struct fscrypt_master_key *mk)
 	WARN_ON(!list_empty(&mk->mk_decrypted_inodes));
 
 	for (i = 0; i <= FSCRYPT_MODE_MAX; i++) {
-		fscrypt_destroy_prepared_key(&mk->mk_direct_keys[i]);
-		fscrypt_destroy_prepared_key(&mk->mk_iv_ino_lblk_64_keys[i]);
-		fscrypt_destroy_prepared_key(&mk->mk_iv_ino_lblk_32_keys[i]);
+		fscrypt_destroy_prepared_key(
+				sb, &mk->mk_direct_keys[i]);
+		fscrypt_destroy_prepared_key(
+				sb, &mk->mk_iv_ino_lblk_64_keys[i]);
+		fscrypt_destroy_prepared_key(
+				sb, &mk->mk_iv_ino_lblk_32_keys[i]);
 	}
 	memzero_explicit(&mk->mk_ino_hash_key,
 			 sizeof(mk->mk_ino_hash_key));
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index e037a7b8e9e42b..f7407071a95242 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -154,10 +154,11 @@ int fscrypt_prepare_key(struct fscrypt_prepared_key *prep_key,
 }
 
 /* Destroy a crypto transform object and/or blk-crypto key. */
-void fscrypt_destroy_prepared_key(struct fscrypt_prepared_key *prep_key)
+void fscrypt_destroy_prepared_key(struct super_block *sb,
+				  struct fscrypt_prepared_key *prep_key)
 {
 	crypto_free_skcipher(prep_key->tfm);
-	fscrypt_destroy_inline_crypt_key(prep_key);
+	fscrypt_destroy_inline_crypt_key(sb, prep_key);
 	memzero_explicit(prep_key, sizeof(*prep_key));
 }
 
@@ -494,7 +495,8 @@ static void put_crypt_info(struct fscrypt_info *ci)
 	if (ci->ci_direct_key)
 		fscrypt_put_direct_key(ci->ci_direct_key);
 	else if (ci->ci_owns_key)
-		fscrypt_destroy_prepared_key(&ci->ci_enc_key);
+		fscrypt_destroy_prepared_key(ci->ci_inode->i_sb,
+					     &ci->ci_enc_key);
 
 	mk = ci->ci_master_key;
 	if (mk) {
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 2762c53504323f..75dabd9b27f9b6 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -143,6 +143,7 @@ find_and_lock_process_key(const char *prefix,
 
 /* Master key referenced by DIRECT_KEY policy */
 struct fscrypt_direct_key {
+	struct super_block		*dk_sb;
 	struct hlist_node		dk_node;
 	refcount_t			dk_refcount;
 	const struct fscrypt_mode	*dk_mode;
@@ -154,7 +155,7 @@ struct fscrypt_direct_key {
 static void free_direct_key(struct fscrypt_direct_key *dk)
 {
 	if (dk) {
-		fscrypt_destroy_prepared_key(&dk->dk_key);
+		fscrypt_destroy_prepared_key(dk->dk_sb, &dk->dk_key);
 		kfree_sensitive(dk);
 	}
 }
@@ -231,6 +232,7 @@ fscrypt_get_direct_key(const struct fscrypt_info *ci, const u8 *raw_key)
 	dk = kzalloc(sizeof(*dk), GFP_KERNEL);
 	if (!dk)
 		return ERR_PTR(-ENOMEM);
+	dk->dk_sb = ci->ci_inode->i_sb;
 	refcount_set(&dk->dk_refcount, 1);
 	dk->dk_mode = ci->ci_mode;
 	err = fscrypt_prepare_key(&dk->dk_key, raw_key, ci);
-- 
2.37.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
