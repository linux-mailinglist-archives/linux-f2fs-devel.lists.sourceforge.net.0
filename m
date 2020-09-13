Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6549D267EAB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Sep 2020 10:38:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHNWp-0000z3-7j; Sun, 13 Sep 2020 08:38:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kHNWg-0000wt-70
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qNLd6u8yK4/u7whPqNZJdouQ3NQPelAiD9ns+ehlrCc=; b=bZyhQ2gfsnqCEBBdUJ18ru23XJ
 XkQs3vm4pBzuLG2uGHLUuvLdG8MVIKLMNy/uGpoXoLSiLOEzC8WHsaipbD9uCV2G+101+X3HBl6L7
 BaonTOon6HOpMYBQfn3qpQUFS1A2sLwHTXzogfArU14jbqhikDLOVXN13NFhmE/UwW4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qNLd6u8yK4/u7whPqNZJdouQ3NQPelAiD9ns+ehlrCc=; b=QvmJYk9HxGdivwyaZJtiLOvDIe
 lDSu1dp/9OhqYMRz7i0Kn/6f4dPYaPkxdTC2re6cZw5PrEAsPAPuKrOaiBDyXHLam0qemoC3mmA/5
 6unEJ10lH8ABrxq0ECucBEBBqad+jXEWnNC3iWThJvDO0qHQ79ghI6MbKunVVTzUJ7/o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHNWc-006qAr-8b
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:22 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0090E221E7;
 Sun, 13 Sep 2020 08:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986280;
 bh=MK+A5d7zq9Y3Zsp3oOCC55fP5PFX6LAy1zZJkGWXiO0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BNXvgR5be/gzPpLGuUrvSdScKa/sWQTRwvtGRXdyLDV9JksHQuCd363gzeItv1NTO
 fe8DHiB/3NngDwFC1HJAMcMhn7T+d0fNkZRqLoTsAqiPgTyy1iW2iC1bdIXYivfggq
 BghRF3rUV5A5hGY+UX1g51VGbPjjlUjgDIdH+ssE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 13 Sep 2020 01:36:17 -0700
Message-Id: <20200913083620.170627-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913083620.170627-1-ebiggers@kernel.org>
References: <20200913083620.170627-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHNWc-006qAr-8b
Subject: [f2fs-dev] [PATCH v2 08/11] fscrypt: stop pretending that key setup
 is nofs-safe
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

fscrypt_get_encryption_info() has never actually been safe to call in a
context that needs GFP_NOFS, since it calls crypto_alloc_skcipher().

crypto_alloc_skcipher() isn't GFP_NOFS-safe, even if called under
memalloc_nofs_save().  This is because it may load kernel modules, and
also because it internally takes crypto_alg_sem.  Other tasks can do
GFP_KERNEL allocations while holding crypto_alg_sem for write.

The use of fscrypt_init_mutex isn't GFP_NOFS-safe either.

So, stop pretending that fscrypt_get_encryption_info() is nofs-safe.
I.e., when it allocates memory, just use GFP_KERNEL instead of GFP_NOFS.

Note, another reason to do this is that GFP_NOFS is deprecated in favor
of using memalloc_nofs_save() in the proper places.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/inline_crypt.c | 7 ++-----
 fs/crypto/keysetup.c     | 2 +-
 fs/crypto/keysetup_v1.c  | 8 ++++----
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index faa25541ccb68..89bffa82ed74a 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -106,7 +106,7 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 	crypto_cfg.data_unit_size = sb->s_blocksize;
 	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
 	num_devs = fscrypt_get_num_devices(sb);
-	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_NOFS);
+	devs = kmalloc_array(num_devs, sizeof(*devs), GFP_KERNEL);
 	if (!devs)
 		return -ENOMEM;
 	fscrypt_get_devices(sb, num_devs, devs);
@@ -135,9 +135,8 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	struct fscrypt_blk_crypto_key *blk_key;
 	int err;
 	int i;
-	unsigned int flags;
 
-	blk_key = kzalloc(struct_size(blk_key, devs, num_devs), GFP_NOFS);
+	blk_key = kzalloc(struct_size(blk_key, devs, num_devs), GFP_KERNEL);
 	if (!blk_key)
 		return -ENOMEM;
 
@@ -166,10 +165,8 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 		}
 		queue_refs++;
 
-		flags = memalloc_nofs_save();
 		err = blk_crypto_start_using_key(&blk_key->base,
 						 blk_key->devs[i]);
-		memalloc_nofs_restore(flags);
 		if (err) {
 			fscrypt_err(inode,
 				    "error %d starting to use blk-crypto", err);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 5371eee8f4b30..7f5fbc2654d57 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -485,7 +485,7 @@ fscrypt_setup_encryption_info(struct inode *inode,
 	if (res)
 		return res;
 
-	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_NOFS);
+	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_KERNEL);
 	if (!crypt_info)
 		return -ENOMEM;
 
diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index a3cb52572b05c..2762c53504323 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -60,7 +60,7 @@ static int derive_key_aes(const u8 *master_key,
 		goto out;
 	}
 	crypto_skcipher_set_flags(tfm, CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
-	req = skcipher_request_alloc(tfm, GFP_NOFS);
+	req = skcipher_request_alloc(tfm, GFP_KERNEL);
 	if (!req) {
 		res = -ENOMEM;
 		goto out;
@@ -99,7 +99,7 @@ find_and_lock_process_key(const char *prefix,
 	const struct user_key_payload *ukp;
 	const struct fscrypt_key *payload;
 
-	description = kasprintf(GFP_NOFS, "%s%*phN", prefix,
+	description = kasprintf(GFP_KERNEL, "%s%*phN", prefix,
 				FSCRYPT_KEY_DESCRIPTOR_SIZE, descriptor);
 	if (!description)
 		return ERR_PTR(-ENOMEM);
@@ -228,7 +228,7 @@ fscrypt_get_direct_key(const struct fscrypt_info *ci, const u8 *raw_key)
 		return dk;
 
 	/* Nope, allocate one. */
-	dk = kzalloc(sizeof(*dk), GFP_NOFS);
+	dk = kzalloc(sizeof(*dk), GFP_KERNEL);
 	if (!dk)
 		return ERR_PTR(-ENOMEM);
 	refcount_set(&dk->dk_refcount, 1);
@@ -272,7 +272,7 @@ static int setup_v1_file_key_derived(struct fscrypt_info *ci,
 	 * This cannot be a stack buffer because it will be passed to the
 	 * scatterlist crypto API during derive_key_aes().
 	 */
-	derived_key = kmalloc(ci->ci_mode->keysize, GFP_NOFS);
+	derived_key = kmalloc(ci->ci_mode->keysize, GFP_KERNEL);
 	if (!derived_key)
 		return -ENOMEM;
 
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
