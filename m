Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDA57ACFBE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Sep 2023 07:59:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qkeck-00055I-9P;
	Mon, 25 Sep 2023 05:59:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qkeci-00055B-KB
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KS4OvMzXhlSnFFBiMtouWlvTvFyfGOBriwL6Fg5wnS8=; b=dFdUQkJUuZc84nHSKYnVz3do+I
 GqUPLlGQ0Hgn72mZs3/Tg1Q9bF6uBXboEayluY9iD7i2oc23CqrpalZJFXadBIaT64D1Hv8UtAzbv
 WFnTjCPWMjWl1q/qKvQKY7gEczf1TE64dP8BHrmAA3N5J5QylRabNeKULADtGFjZRHDc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KS4OvMzXhlSnFFBiMtouWlvTvFyfGOBriwL6Fg5wnS8=; b=fjhwNNHoxFQe48O/BXa1cBDppi
 pOZi/RclinsU30gKmY8G5idNEl4FkdL532syQWFB4KAQnD9dLJnGkVL+LKLzShn8pkOiUHBcA+SUK
 L50D4AXI3FHAcjl0TAaN5+erfcfc2YuV+1e+iKEnrF3lhisGAqp01ffctJZJa+nJGeRE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qkece-005UJl-GL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AB72BB80B94;
 Mon, 25 Sep 2023 05:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7002C433CC;
 Mon, 25 Sep 2023 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695621539;
 bh=cz+gERetg21kponi71Jesmq5RBOAugZisOFCZXrnPoE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aOIWr4FQuLTUSVe5DbQnUf8DYvsA6dOLF9Z8hgHs6YuXdu2eRspUt+JKXDxnUaiUc
 8yMz1HAIqzuWfvAUNZ8eDM2pWxaSDQZO7eredhZ2tgvTx1x/avI2dukZCuiFPUD+i6
 SqqWxscoEtpz3c4VmWJwC8/LwksgCYIjTDTy6KEAptztbp0+QAaSjQYN9c4dIkAVhM
 zg5Fj17CjuNI3ensjc0Fk+X74jvFedal048aEJ5xpM8xAOaYodPiCV1BkXm65WjjHB
 PZoi7kMfEj6WHgQ5z2Z6RTGyb/7n9yLpB2ryYMDCWqAcFUGG3SBUU8REcCIr+aXCk9
 rOW3vF+8eGmWg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 24 Sep 2023 22:54:48 -0700
Message-ID: <20230925055451.59499-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925055451.59499-1-ebiggers@kernel.org>
References: <20230925055451.59499-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Replace
 FS_CFLG_OWN_PAGES
 with a bit flag 'needs_bounce_pages' which has the opposite meaning. I.e.,
 filesystems now opt into the bounce page pool instead of opt out. Make
 fscrypt_alloc_bounce_page() [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qkece-005UJl-GL
Subject: [f2fs-dev] [PATCH v3 2/5] fscrypt: make the bounce page pool opt-in
 instead of opt-out
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Replace FS_CFLG_OWN_PAGES with a bit flag 'needs_bounce_pages' which has
the opposite meaning.  I.e., filesystems now opt into the bounce page
pool instead of opt out.  Make fscrypt_alloc_bounce_page() check that
the bounce page pool has been initialized.

I believe the opt-in makes more sense, since nothing else in
fscrypt_operations is opt-out, and these days filesystems can choose to
use blk-crypto which doesn't need the fscrypt bounce page pool.  Also, I
happen to be planning to add two more flags, and I wanted to fix the
"FS_CFLG_" name anyway as it wasn't prefixed with "FSCRYPT_".

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ceph/crypto.c        |  1 +
 fs/crypto/crypto.c      |  9 ++++++++-
 fs/ext4/crypto.c        |  1 +
 fs/f2fs/super.c         |  1 +
 fs/ubifs/crypto.c       |  1 -
 include/linux/fscrypt.h | 20 +++++++++++---------
 6 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/fs/ceph/crypto.c b/fs/ceph/crypto.c
index e4d5cd56a80b9..cc63f1e6fdef6 100644
--- a/fs/ceph/crypto.c
+++ b/fs/ceph/crypto.c
@@ -126,20 +126,21 @@ static bool ceph_crypt_empty_dir(struct inode *inode)
 
 	return ci->i_rsubdirs + ci->i_rfiles == 1;
 }
 
 static const union fscrypt_policy *ceph_get_dummy_policy(struct super_block *sb)
 {
 	return ceph_sb_to_client(sb)->fsc_dummy_enc_policy.policy;
 }
 
 static struct fscrypt_operations ceph_fscrypt_ops = {
+	.needs_bounce_pages	= 1,
 	.get_context		= ceph_crypt_get_context,
 	.set_context		= ceph_crypt_set_context,
 	.get_dummy_policy	= ceph_get_dummy_policy,
 	.empty_dir		= ceph_crypt_empty_dir,
 };
 
 void ceph_fscrypt_set_ops(struct super_block *sb)
 {
 	fscrypt_set_ops(sb, &ceph_fscrypt_ops);
 }
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 6a837e4b80dcb..aed0c5ea75781 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -42,20 +42,27 @@ static DEFINE_MUTEX(fscrypt_init_mutex);
 struct kmem_cache *fscrypt_info_cachep;
 
 void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
 	queue_work(fscrypt_read_workqueue, work);
 }
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_work);
 
 struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
 {
+	if (WARN_ON_ONCE(!fscrypt_bounce_page_pool)) {
+		/*
+		 * Oops, the filesystem called a function that uses the bounce
+		 * page pool, but it didn't set needs_bounce_pages.
+		 */
+		return NULL;
+	}
 	return mempool_alloc(fscrypt_bounce_page_pool, gfp_flags);
 }
 
 /**
  * fscrypt_free_bounce_page() - free a ciphertext bounce page
  * @bounce_page: the bounce page to free, or NULL
  *
  * Free a bounce page that was allocated by fscrypt_encrypt_pagecache_blocks(),
  * or by fscrypt_alloc_bounce_page() directly.
  */
@@ -318,21 +325,21 @@ EXPORT_SYMBOL(fscrypt_decrypt_block_inplace);
 int fscrypt_initialize(struct super_block *sb)
 {
 	int err = 0;
 	mempool_t *pool;
 
 	/* pairs with smp_store_release() below */
 	if (likely(smp_load_acquire(&fscrypt_bounce_page_pool)))
 		return 0;
 
 	/* No need to allocate a bounce page pool if this FS won't use it. */
-	if (sb->s_cop->flags & FS_CFLG_OWN_PAGES)
+	if (!sb->s_cop->needs_bounce_pages)
 		return 0;
 
 	mutex_lock(&fscrypt_init_mutex);
 	if (fscrypt_bounce_page_pool)
 		goto out_unlock;
 
 	err = -ENOMEM;
 	pool = mempool_create_page_pool(num_prealloc_crypto_pages, 0);
 	if (!pool)
 		goto out_unlock;
diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 99a4769a53f63..5cd7bcfae46b2 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -233,18 +233,19 @@ static bool ext4_has_stable_inodes(struct super_block *sb)
 }
 
 static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
 				       int *ino_bits_ret, int *lblk_bits_ret)
 {
 	*ino_bits_ret = 8 * sizeof(EXT4_SB(sb)->s_es->s_inodes_count);
 	*lblk_bits_ret = 8 * sizeof(ext4_lblk_t);
 }
 
 const struct fscrypt_operations ext4_cryptops = {
+	.needs_bounce_pages	= 1,
 	.legacy_key_prefix	= "ext4:",
 	.get_context		= ext4_get_context,
 	.set_context		= ext4_set_context,
 	.get_dummy_policy	= ext4_get_dummy_policy,
 	.empty_dir		= ext4_empty_dir,
 	.has_stable_inodes	= ext4_has_stable_inodes,
 	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f60062b558fd1..55aa0ed531f22 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3224,20 +3224,21 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 	if (!devs)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < sbi->s_ndevs; i++)
 		devs[i] = FDEV(i).bdev;
 	*num_devs = sbi->s_ndevs;
 	return devs;
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
+	.needs_bounce_pages	= 1,
 	.legacy_key_prefix	= "f2fs:",
 	.get_context		= f2fs_get_context,
 	.set_context		= f2fs_set_context,
 	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
 	.get_devices		= f2fs_get_devices,
 };
 #endif
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 1be3e11da3b3e..921f9033d0d2d 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -81,16 +81,15 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 	if (err) {
 		ubifs_err(c, "fscrypt_decrypt_block_inplace() failed: %d", err);
 		return err;
 	}
 	*out_len = clen;
 
 	return 0;
 }
 
 const struct fscrypt_operations ubifs_crypt_operations = {
-	.flags			= FS_CFLG_OWN_PAGES,
 	.legacy_key_prefix	= "ubifs:",
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.empty_dir		= ubifs_crypt_empty_dir,
 };
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index b0037566ce308..4505078e89b7e 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -52,32 +52,34 @@ struct fscrypt_name {
 #define FSTR_INIT(n, l)		{ .name = n, .len = l }
 #define FSTR_TO_QSTR(f)		QSTR_INIT((f)->name, (f)->len)
 #define fname_name(p)		((p)->disk_name.name)
 #define fname_len(p)		((p)->disk_name.len)
 
 /* Maximum value for the third parameter of fscrypt_operations.set_context(). */
 #define FSCRYPT_SET_CONTEXT_MAX_SIZE	40
 
 #ifdef CONFIG_FS_ENCRYPTION
 
-/*
- * If set, the fscrypt bounce page pool won't be allocated (unless another
- * filesystem needs it).  Set this if the filesystem always uses its own bounce
- * pages for writes and therefore won't need the fscrypt bounce page pool.
- */
-#define FS_CFLG_OWN_PAGES (1U << 1)
-
 /* Crypto operations for filesystems */
 struct fscrypt_operations {
 
-	/* Set of optional flags; see above for allowed flags */
-	unsigned int flags;
+	/*
+	 * If set, then fs/crypto/ will allocate a global bounce page pool the
+	 * first time an encryption key is set up for a file.  The bounce page
+	 * pool is required by the following functions:
+	 *
+	 * - fscrypt_encrypt_pagecache_blocks()
+	 * - fscrypt_zeroout_range() for files not using inline crypto
+	 *
+	 * If the filesystem doesn't use those, it doesn't need to set this.
+	 */
+	unsigned int needs_bounce_pages : 1;
 
 	/*
 	 * This field exists only for backwards compatibility reasons and should
 	 * only be set by the filesystems that are setting it already.  It
 	 * contains the filesystem-specific key description prefix that is
 	 * accepted for "logon" keys for v1 fscrypt policies.  This
 	 * functionality is deprecated in favor of the generic prefix
 	 * "fscrypt:", which itself is deprecated in favor of the filesystem
 	 * keyring ioctls such as FS_IOC_ADD_ENCRYPTION_KEY.  Filesystems that
 	 * are newly adding fscrypt support should not set this field.
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
