Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6AC24F276
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Aug 2020 08:18:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kA5od-0000we-Qr; Mon, 24 Aug 2020 06:18:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kA5oZ-0000wE-Ac
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mYqKmrJ4535Zk7fLSph2muuBwBxLAybsRAMYE+GByN8=; b=mllIKYDASF5ULgkMIlTqjTWqNZ
 RYM+fP8xdRhu/hX/5oq0KHB8NHFuwm29fgfy/k+4YoArQS/mh+6/hSmSpbA1Ow8pAzzUNWmdfrvt6
 tpVKLJaoCOXjN4qlgrPDYHrwBcbzxMHP5RNA/+DZ5rQMAKy46/QWxSWzsAtVKJqhZx7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mYqKmrJ4535Zk7fLSph2muuBwBxLAybsRAMYE+GByN8=; b=T7zY19bCSNx5xM0Yatcn5siUHW
 EdLO3H2K0JkRGCRyy1mia0M4h6RvhnaurHXN1V2J3BzrdmLlXxwvVZ5/IwjyAfOkuqZOfyVMKUHlB
 4B3Etu9AIC7zXQbgKkXzLLfaaAe2qfG2e3YECboLB5himq6Td7fGt9neVDrQYZcW8SGk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kA5oY-002EwE-3N
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Aug 2020 06:18:43 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9733422BEA;
 Mon, 24 Aug 2020 06:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598249900;
 bh=FIdPAQ4uVgqepfVvwpPtlAMJGJ/BCwZf2dDwk5M0shA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aOFOzAVN6aex+LS5Y2deYUb9Qjxp+H46wBD4Q4HDvUhaKg92JKU/CLVURb4LyzBUw
 2+WvbtU7sO6GQxDGsaEnuYSknW0lS3fpbkqF4Evz/SyGisvOuCd6oEkWg/7aYH/ioI
 8+eqiG/nQFxpH2RSz/7EstoUxgliPnfNi17KeKtQ=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 23 Aug 2020 23:17:12 -0700
Message-Id: <20200824061712.195654-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824061712.195654-1-ebiggers@kernel.org>
References: <20200824061712.195654-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kA5oY-002EwE-3N
Subject: [f2fs-dev] [RFC PATCH 8/8] fscrypt: stop pretending that key setup
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
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
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
index 6ac816d3e8478..ad64525ec6800 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -477,7 +477,7 @@ fscrypt_setup_encryption_info(struct inode *inode,
 	struct key *master_key = NULL;
 	int res;
 
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
