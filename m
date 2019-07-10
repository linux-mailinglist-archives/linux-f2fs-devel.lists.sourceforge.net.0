Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C79264F2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 01:20:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ikQwG0PCqBUx7Z/F0Pdxu2CXZABqBBJ8P2zQ8J0GZjU=; b=EkznUDUJaow//SK/3h6FwOUYy
	IzIl4Amv8sHz6yanTmGB2ulU/mcnOnb66TEq9Yug5MlD65/1HC628GwCN7whgoBkGuUPC0Fal7kW4
	WxCuWe3rxHhejz1lt2slocnjJ4tQRRfob4DlCWIfricBiRYS/Uc7TscE5Vmxgc795rBHk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlLt9-0000v5-Lu; Wed, 10 Jul 2019 23:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3KW0mXQYKAIw8q9Eq9w44w1u.s42@flex--satyat.bounces.google.com>)
 id 1hlLt9-0000us-0h
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 23:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xnaq2LigTNouZIZTCXO4TK3ctv2qJOzyxgayhtjNKoo=; b=DINv4KFR5IvRffdaqE3OGNqPj
 X0f47SAYYrlhoP6xuYBDoHkAR+dR9157mkqww9FRNai0lMqGaMVQeX8WmKIiyFL3+Q6SBWp8rvKqD
 QDNx7CACkdfaA8WemvGYaCdSQD5UWAo5l9GiEOiDrz8lfFicOPyqDE9A/lXDPT3G+mgaQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xnaq2LigTNouZIZTCXO4TK3ctv2qJOzyxgayhtjNKoo=; b=lbmvH0a4JYV3j9VcWUi6ba2hEM
 ef1In9ANhRIHQ7f0Paq3Omjjhp6+/g2DM2QGlvCRfJZ+/OcvaxZQBrj1VfRczgsI7mpCefC1Og5NO
 FU5mcPa2OdARmLs8tRRrUcchVz+qFhGuNiEmzCFcWU6wh4KKPfVgZKRmhivQx7xWJ1k0=;
Received: from mail-vk1-f201.google.com ([209.85.221.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hlLt6-00ET1U-U1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 23:20:38 +0000
Received: by mail-vk1-f201.google.com with SMTP id m1so1679836vkl.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jul 2019 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Xnaq2LigTNouZIZTCXO4TK3ctv2qJOzyxgayhtjNKoo=;
 b=KIcx5JLB0GNWohGF1rMRIxgDOV2lva7Wdj3vcAWiSepXnBor3lCmQsEQkZVKLpvTSP
 +JEg92fPJoLJuj+r4sQcuuNGd/YNg7kp3CS003ctGwPQ2srZw57G4B/6VOG8fi7Q7t/X
 gEPjpmFzSc3Rwzdl3e9g3l3SytaTpwmmafdhwKJqHHT9z/qtEcFIZBB4yK/6GpfeRDfT
 RjxHKjXPFJE4hdGnWCAkopQikwLvdieagNolW6kd8t2jWSogqVdtVNTk4PZ9tbjLUgJd
 FRM4wkJXMYXsUrXg7tdIFxZ6klcLPd+p0fErHDft/6g2BBitmNSpOvdnQylsWThCtz6J
 qS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Xnaq2LigTNouZIZTCXO4TK3ctv2qJOzyxgayhtjNKoo=;
 b=fBw3xPkn6GXB41yRmF/kBMvq92v0R/rXY5pJNO29kBZiYWRhy4oWoP3s7x/TQ2bf99
 hRuq9zCpuIb4OPfhIgVkaaVOVjsXlRPEsC2aTWj+hv0Vo5eakoXyK9lYJMsP4iKyIPlD
 2yjqgvgC/XAGhotO7IkttJhc0PaHTz/QiLNL4a8hVvBJxPJDpzs2WY/XqRtvFbkSgUAO
 pPMjR2Urs660X42pz/LKphzC8R04c/w5GokOUWT9Swrbf/iABoNzU7PzujR9PoeGQ81z
 jDHr9wKwOIENJVE0+YNsCGk1SHb8Jno20AEA2myWT7/lxT4IfZA3l4XupCHAO7Eq1YtG
 V6Iw==
X-Gm-Message-State: APjAAAX6aYiFg9JwrwQmsb33OWOFF2yffrBEoN2jmYTzokZvq6kUeg/u
 8+g3d4gTs+zLxTYWcGbc+Spo2HZM32Q=
X-Google-Smtp-Source: APXvYqz8Rt0XLyqnLUV8SGQ7aiuwi6lzL2oOjFWH6VSXEu2D9K9sNEoq9u0Y4f3TnL26oAJVTXiFL5vwPSw=
X-Received: by 2002:a67:cd14:: with SMTP id u20mr382710vsl.36.1562799401693;
 Wed, 10 Jul 2019 15:56:41 -0700 (PDT)
Date: Wed, 10 Jul 2019 15:56:08 -0700
In-Reply-To: <20190710225609.192252-1-satyat@google.com>
Message-Id: <20190710225609.192252-8-satyat@google.com>
Mime-Version: 1.0
References: <20190710225609.192252-1-satyat@google.com>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
To: linux-block@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.3 PDS_NO_HELO_DNS        High profile HELO but no A record
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hlLt6-00ET1U-U1
Subject: [f2fs-dev] [PATCH 7/8] fscrypt: wire up fscrypt to use blk-crypto
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: Ladvine D Almeida <ladvine.dalmeida@synopsys.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Satya Tangirala <satyat@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce fscrypt_set_bio_crypt_ctx for filesystems to call to set up
encryption contexts in bios, and fscrypt_evict_crypt_key to evict
the encryption context associated with an inode.

Inline encryption is controlled by a policy flag in the fscrypt_info
in the inode, and filesystems may check if an inode should use inline
encryption by calling fscrypt_inode_is_inline_crypted. Files can be marked
as inline encrypted from userspace by appropriately modifying the flags
(OR-ing FS_POLICY_FLAGS_INLINE_ENCRYPTION to it) in the fscrypt_policy
passed to fscrypt_ioctl_set_policy.

To test inline encryption with the fscrypt dummy context, add
ctx.flags |= FS_POLICY_FLAGS_INLINE_ENCRYPTION
when setting up the dummy context in fs/crypto/keyinfo.c.

Note that blk-crypto will fall back to software en/decryption in the
absence of inline crypto hardware, so setting up the ctx.flags in the
dummy context without inline crypto hardware serves as a test for
the software fallback in blk-crypto.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/crypto/Kconfig           |   6 ++
 fs/crypto/bio.c             | 138 +++++++++++++++++++++++++++++++-----
 fs/crypto/crypto.c          |   4 ++
 fs/crypto/fscrypt_private.h |  11 +++
 fs/crypto/keyinfo.c         |  94 +++++++++++++++++-------
 fs/crypto/policy.c          |  10 +++
 include/linux/fscrypt.h     |  62 ++++++++++++++++
 include/uapi/linux/fs.h     |   3 +-
 8 files changed, 285 insertions(+), 43 deletions(-)

diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index 24ed99e2eca0..738368394a32 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -15,3 +15,9 @@ config FS_ENCRYPTION
 	  efficient since it avoids caching the encrypted and
 	  decrypted pages in the page cache.  Currently Ext4,
 	  F2FS and UBIFS make use of this feature.
+
+config FS_ENCRYPTION_INLINE_CRYPT
+	bool "Enable fscrypt to use inline crypto"
+	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
+	help
+	  Enables fscrypt to use inline crypto hardware if available.
diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index b46021ebde85..0e16189e1679 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -24,6 +24,9 @@
 #include <linux/module.h>
 #include <linux/bio.h>
 #include <linux/namei.h>
+#include <linux/keyslot-manager.h>
+#include <linux/blkdev.h>
+#include <crypto/algapi.h>
 #include "fscrypt_private.h"
 
 static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
@@ -34,7 +37,7 @@ static void __fscrypt_decrypt_bio(struct bio *bio, bool done)
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		struct page *page = bv->bv_page;
 		int ret = fscrypt_decrypt_page(page->mapping->host, page,
-				PAGE_SIZE, 0, page->index);
+					       PAGE_SIZE, 0, page->index);
 
 		if (ret)
 			SetPageError(page);
@@ -94,29 +97,33 @@ EXPORT_SYMBOL(fscrypt_pullback_bio_page);
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 				sector_t pblk, unsigned int len)
 {
-	struct fscrypt_ctx *ctx;
+	struct fscrypt_ctx *ctx = NULL;
 	struct page *ciphertext_page = NULL;
 	struct bio *bio;
 	int ret, err = 0;
 
 	BUG_ON(inode->i_sb->s_blocksize != PAGE_SIZE);
 
-	ctx = fscrypt_get_ctx(GFP_NOFS);
-	if (IS_ERR(ctx))
-		return PTR_ERR(ctx);
+	if (!fscrypt_inode_is_inline_crypted(inode)) {
+		ctx = fscrypt_get_ctx(GFP_NOFS);
+		if (IS_ERR(ctx))
+			return PTR_ERR(ctx);
 
-	ciphertext_page = fscrypt_alloc_bounce_page(ctx, GFP_NOWAIT);
-	if (IS_ERR(ciphertext_page)) {
-		err = PTR_ERR(ciphertext_page);
-		goto errout;
+		ciphertext_page = fscrypt_alloc_bounce_page(ctx, GFP_NOWAIT);
+		if (IS_ERR(ciphertext_page)) {
+			err = PTR_ERR(ciphertext_page);
+			goto errout;
+		}
 	}
 
 	while (len--) {
-		err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk,
+		if (!fscrypt_inode_is_inline_crypted(inode)) {
+			err = fscrypt_do_page_crypto(inode, FS_ENCRYPT, lblk,
 					     ZERO_PAGE(0), ciphertext_page,
 					     PAGE_SIZE, 0, GFP_NOFS);
-		if (err)
-			goto errout;
+			if (err)
+				goto errout;
+		}
 
 		bio = bio_alloc(GFP_NOWAIT, 1);
 		if (!bio) {
@@ -127,8 +134,14 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		bio->bi_iter.bi_sector =
 			pblk << (inode->i_sb->s_blocksize_bits - 9);
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
-		ret = bio_add_page(bio, ciphertext_page,
-					inode->i_sb->s_blocksize, 0);
+		if (!fscrypt_inode_is_inline_crypted(inode)) {
+			ret = bio_add_page(bio, ciphertext_page,
+						inode->i_sb->s_blocksize, 0);
+		} else {
+			ret = bio_add_page(bio, ZERO_PAGE(0),
+						inode->i_sb->s_blocksize, 0);
+		}
+
 		if (ret != inode->i_sb->s_blocksize) {
 			/* should never happen! */
 			WARN_ON(1);
@@ -136,9 +149,12 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 			err = -EIO;
 			goto errout;
 		}
-		err = submit_bio_wait(bio);
-		if (err == 0 && bio->bi_status)
-			err = -EIO;
+		err = fscrypt_set_bio_crypt_ctx(inode, bio, pblk);
+		if (!err) {
+			err = submit_bio_wait(bio);
+			if (err == 0 && bio->bi_status)
+				err = -EIO;
+		}
 		bio_put(bio);
 		if (err)
 			goto errout;
@@ -147,7 +163,93 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 	}
 	err = 0;
 errout:
-	fscrypt_release_ctx(ctx);
+	if (!fscrypt_inode_is_inline_crypted(inode))
+		fscrypt_release_ctx(ctx);
 	return err;
 }
 EXPORT_SYMBOL(fscrypt_zeroout_range);
+
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+static enum blk_crypt_mode_num
+get_blk_crypto_alg_for_fscryptalg(u8 fscrypt_alg)
+{
+	switch (fscrypt_alg) {
+	case FS_ENCRYPTION_MODE_AES_256_XTS:
+		return BLK_ENCRYPTION_MODE_AES_256_XTS;
+	default: return -EINVAL;
+	}
+}
+
+int fscrypt_set_bio_crypt_ctx(const struct inode *inode,
+				 struct bio *bio, u64 data_unit_num)
+{
+	struct fscrypt_info *ci = inode->i_crypt_info;
+
+	/* If inode is not inline encrypted, nothing to do. */
+	if (!fscrypt_inode_is_inline_crypted(inode))
+		return 0;
+
+	return bio_crypt_set_ctx(bio, ci->ci_master_key->mk_raw,
+			get_blk_crypto_alg_for_fscryptalg(ci->ci_data_mode),
+			data_unit_num,
+			inode->i_blkbits);
+}
+EXPORT_SYMBOL(fscrypt_set_bio_crypt_ctx);
+
+void fscrypt_unset_bio_crypt_ctx(struct bio *bio)
+{
+	bio_crypt_free_ctx(bio);
+}
+EXPORT_SYMBOL(fscrypt_unset_bio_crypt_ctx);
+
+int fscrypt_evict_crypt_key(struct inode *inode)
+{
+	struct request_queue *q;
+	struct fscrypt_info *ci;
+
+	if (!inode)
+		return 0;
+
+	q = inode->i_sb->s_bdev->bd_queue;
+	ci = inode->i_crypt_info;
+
+	if (!q || !q->ksm || !ci ||
+	    !fscrypt_inode_is_inline_crypted(inode)) {
+		return 0;
+	}
+
+	return keyslot_manager_evict_key(q->ksm,
+					 ci->ci_master_key->mk_raw,
+					 get_blk_crypto_alg_for_fscryptalg(
+						ci->ci_data_mode),
+					 1 << inode->i_blkbits);
+}
+EXPORT_SYMBOL(fscrypt_evict_crypt_key);
+
+bool fscrypt_inode_crypt_mergeable(const struct inode *inode_1,
+				   const struct inode *inode_2)
+{
+	struct fscrypt_info *ci_1, *ci_2;
+	bool enc_1 = fscrypt_inode_is_inline_crypted(inode_1);
+	bool enc_2 = fscrypt_inode_is_inline_crypted(inode_2);
+
+	if (enc_1 != enc_2)
+		return false;
+
+	if (!enc_1)
+		return true;
+
+	if (inode_1 == inode_2)
+		return true;
+
+	ci_1 = inode_1->i_crypt_info;
+	ci_2 = inode_2->i_crypt_info;
+
+	return ci_1->ci_data_mode == ci_2->ci_data_mode &&
+	       crypto_memneq(ci_1->ci_master_key->mk_raw,
+			     ci_2->ci_master_key->mk_raw,
+			     ci_1->ci_master_key->mk_mode->keysize) == 0;
+}
+EXPORT_SYMBOL(fscrypt_inode_crypt_mergeable);
+
+#endif /* FS_ENCRYPTION_INLINE_CRYPT */
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 335a362ee446..58a01889fac7 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -302,6 +302,10 @@ int fscrypt_decrypt_page(const struct inode *inode, struct page *page,
 	if (!(inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES))
 		BUG_ON(!PageLocked(page));
 
+	/* If we have HW encryption, then this page is already decrypted */
+	if (fscrypt_inode_is_inline_crypted(inode))
+		return 0;
+
 	return fscrypt_do_page_crypto(inode, FS_DECRYPT, lblk_num, page, page,
 				      len, offs, GFP_NOFS);
 }
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 7da276159593..67a8ca058996 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -49,6 +49,17 @@ struct fscrypt_symlink_data {
 	char encrypted_path[1];
 } __packed;
 
+/* Master key referenced by FS_POLICY_FLAG_DIRECT_KEY policy */
+struct fscrypt_master_key {
+	struct hlist_node mk_node;
+	refcount_t mk_refcount;
+	const struct fscrypt_mode *mk_mode;
+	struct crypto_skcipher *mk_ctfm;
+	u8 mk_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	u8 mk_raw[FS_MAX_KEY_SIZE];
+	struct super_block *mk_sb;
+};
+
 /*
  * fscrypt_info - the "encryption key" for an inode
  *
diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
index dcd91a3fbe49..3a3b27b99706 100644
--- a/fs/crypto/keyinfo.c
+++ b/fs/crypto/keyinfo.c
@@ -25,6 +25,21 @@ static struct crypto_shash *essiv_hash_tfm;
 static DEFINE_HASHTABLE(fscrypt_master_keys, 6); /* 6 bits = 64 buckets */
 static DEFINE_SPINLOCK(fscrypt_master_keys_lock);
 
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+static inline bool flags_inline_crypted(u8 flags,
+					const struct inode *inode)
+{
+	return inode && (flags & FS_POLICY_FLAGS_INLINE_CRYPT) &&
+	       S_ISREG(inode->i_mode);
+}
+#else
+static inline bool flags_inline_crypted(u8 flags,
+					const struct inode *inode)
+{
+	return false;
+}
+#endif /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
+
 /*
  * Key derivation function.  This generates the derived key by encrypting the
  * master key with AES-128-ECB using the inode's nonce as the AES key.
@@ -220,6 +235,9 @@ static int find_and_derive_key(const struct inode *inode,
 			memcpy(derived_key, payload->raw, mode->keysize);
 			err = 0;
 		}
+	} else if (flags_inline_crypted(ctx->flags, inode)) {
+		memcpy(derived_key, payload->raw, mode->keysize);
+		err = 0;
 	} else {
 		err = derive_key_aes(payload->raw, ctx, derived_key,
 				     mode->keysize);
@@ -269,16 +287,6 @@ allocate_skcipher_for_mode(struct fscrypt_mode *mode, const u8 *raw_key,
 	return ERR_PTR(err);
 }
 
-/* Master key referenced by FS_POLICY_FLAG_DIRECT_KEY policy */
-struct fscrypt_master_key {
-	struct hlist_node mk_node;
-	refcount_t mk_refcount;
-	const struct fscrypt_mode *mk_mode;
-	struct crypto_skcipher *mk_ctfm;
-	u8 mk_descriptor[FS_KEY_DESCRIPTOR_SIZE];
-	u8 mk_raw[FS_MAX_KEY_SIZE];
-};
-
 static void free_master_key(struct fscrypt_master_key *mk)
 {
 	if (mk) {
@@ -287,13 +295,15 @@ static void free_master_key(struct fscrypt_master_key *mk)
 	}
 }
 
-static void put_master_key(struct fscrypt_master_key *mk)
+static void put_master_key(struct fscrypt_master_key *mk,
+			   struct inode *inode)
 {
 	if (!refcount_dec_and_lock(&mk->mk_refcount, &fscrypt_master_keys_lock))
 		return;
 	hash_del(&mk->mk_node);
 	spin_unlock(&fscrypt_master_keys_lock);
 
+	fscrypt_evict_crypt_key(inode);
 	free_master_key(mk);
 }
 
@@ -306,7 +316,9 @@ static void put_master_key(struct fscrypt_master_key *mk)
 static struct fscrypt_master_key *
 find_or_insert_master_key(struct fscrypt_master_key *to_insert,
 			  const u8 *raw_key, const struct fscrypt_mode *mode,
-			  const struct fscrypt_info *ci)
+			  const struct fscrypt_info *ci,
+			  bool should_have_ctfm,
+			  struct super_block *sb)
 {
 	unsigned long hash_key;
 	struct fscrypt_master_key *mk;
@@ -329,6 +341,10 @@ find_or_insert_master_key(struct fscrypt_master_key *to_insert,
 			continue;
 		if (crypto_memneq(raw_key, mk->mk_raw, mode->keysize))
 			continue;
+		if (should_have_ctfm != (bool)mk->mk_ctfm)
+			continue;
+		if (sb != mk->mk_sb)
+			continue;
 		/* using existing tfm with same (descriptor, mode, raw_key) */
 		refcount_inc(&mk->mk_refcount);
 		spin_unlock(&fscrypt_master_keys_lock);
@@ -348,9 +364,11 @@ fscrypt_get_master_key(const struct fscrypt_info *ci, struct fscrypt_mode *mode,
 {
 	struct fscrypt_master_key *mk;
 	int err;
+	bool inline_crypted = flags_inline_crypted(ci->ci_flags, inode);
 
 	/* Is there already a tfm for this key? */
-	mk = find_or_insert_master_key(NULL, raw_key, mode, ci);
+	mk = find_or_insert_master_key(NULL, raw_key, mode, ci, !inline_crypted,
+				       inode->i_sb);
 	if (mk)
 		return mk;
 
@@ -360,17 +378,21 @@ fscrypt_get_master_key(const struct fscrypt_info *ci, struct fscrypt_mode *mode,
 		return ERR_PTR(-ENOMEM);
 	refcount_set(&mk->mk_refcount, 1);
 	mk->mk_mode = mode;
-	mk->mk_ctfm = allocate_skcipher_for_mode(mode, raw_key, inode);
-	if (IS_ERR(mk->mk_ctfm)) {
-		err = PTR_ERR(mk->mk_ctfm);
-		mk->mk_ctfm = NULL;
-		goto err_free_mk;
+	if (!inline_crypted) {
+		mk->mk_ctfm = allocate_skcipher_for_mode(mode, raw_key, inode);
+		if (IS_ERR(mk->mk_ctfm)) {
+			err = PTR_ERR(mk->mk_ctfm);
+			mk->mk_ctfm = NULL;
+			goto err_free_mk;
+		}
 	}
 	memcpy(mk->mk_descriptor, ci->ci_master_key_descriptor,
 	       FS_KEY_DESCRIPTOR_SIZE);
 	memcpy(mk->mk_raw, raw_key, mode->keysize);
+	mk->mk_sb = inode->i_sb;
 
-	return find_or_insert_master_key(mk, raw_key, mode, ci);
+	return find_or_insert_master_key(mk, raw_key, mode, ci, !inline_crypted,
+					 inode->i_sb);
 
 err_free_mk:
 	free_master_key(mk);
@@ -456,7 +478,8 @@ static int setup_crypto_transform(struct fscrypt_info *ci,
 	struct crypto_skcipher *ctfm;
 	int err;
 
-	if (ci->ci_flags & FS_POLICY_FLAG_DIRECT_KEY) {
+	if ((ci->ci_flags & FS_POLICY_FLAG_DIRECT_KEY) ||
+	    flags_inline_crypted(ci->ci_flags, inode)) {
 		mk = fscrypt_get_master_key(ci, mode, raw_key, inode);
 		if (IS_ERR(mk))
 			return PTR_ERR(mk);
@@ -486,13 +509,13 @@ static int setup_crypto_transform(struct fscrypt_info *ci,
 	return 0;
 }
 
-static void put_crypt_info(struct fscrypt_info *ci)
+static void put_crypt_info(struct fscrypt_info *ci, struct inode *inode)
 {
 	if (!ci)
 		return;
 
 	if (ci->ci_master_key) {
-		put_master_key(ci->ci_master_key);
+		put_master_key(ci->ci_master_key, inode);
 	} else {
 		crypto_free_skcipher(ci->ci_ctfm);
 		crypto_free_cipher(ci->ci_essiv_tfm);
@@ -577,7 +600,7 @@ int fscrypt_get_encryption_info(struct inode *inode)
 out:
 	if (res == -ENOKEY)
 		res = 0;
-	put_crypt_info(crypt_info);
+	put_crypt_info(crypt_info, NULL);
 	kzfree(raw_key);
 	return res;
 }
@@ -591,7 +614,7 @@ EXPORT_SYMBOL(fscrypt_get_encryption_info);
  */
 void fscrypt_put_encryption_info(struct inode *inode)
 {
-	put_crypt_info(inode->i_crypt_info);
+	put_crypt_info(inode->i_crypt_info, inode);
 	inode->i_crypt_info = NULL;
 }
 EXPORT_SYMBOL(fscrypt_put_encryption_info);
@@ -610,3 +633,26 @@ void fscrypt_free_inode(struct inode *inode)
 	}
 }
 EXPORT_SYMBOL(fscrypt_free_inode);
+
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+bool fscrypt_inode_is_inline_crypted(const struct inode *inode)
+{
+	struct fscrypt_info *ci;
+
+	if (!inode)
+		return false;
+	ci = inode->i_crypt_info;
+
+	return ci && flags_inline_crypted(ci->ci_flags, inode);
+}
+EXPORT_SYMBOL(fscrypt_inode_is_inline_crypted);
+
+#endif /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
+
+bool fscrypt_needs_fs_layer_crypto(const struct inode *inode)
+{
+	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode) &&
+	       !fscrypt_inode_is_inline_crypted(inode);
+}
+EXPORT_SYMBOL(fscrypt_needs_fs_layer_crypto);
+
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index d536889ac31b..7bcf5cc0d20d 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -36,6 +36,7 @@ static int create_encryption_context_from_policy(struct inode *inode,
 	struct fscrypt_context ctx;
 
 	ctx.format = FS_ENCRYPTION_CONTEXT_FORMAT_V1;
+
 	memcpy(ctx.master_key_descriptor, policy->master_key_descriptor,
 					FS_KEY_DESCRIPTOR_SIZE);
 
@@ -46,8 +47,17 @@ static int create_encryption_context_from_policy(struct inode *inode,
 	if (policy->flags & ~FS_POLICY_FLAGS_VALID)
 		return -EINVAL;
 
+	/*
+	 * TODO: expose inline encryption via some toggleable knob
+	 * instead of as a policy?
+	 */
+	if (!inode->i_sb->s_cop->inline_crypt_supp &&
+	    (policy->flags & FS_POLICY_FLAGS_INLINE_CRYPT))
+		return -EINVAL;
+
 	ctx.contents_encryption_mode = policy->contents_encryption_mode;
 	ctx.filenames_encryption_mode = policy->filenames_encryption_mode;
+
 	ctx.flags = policy->flags;
 	BUILD_BUG_ON(sizeof(ctx.nonce) != FS_KEY_DERIVATION_NONCE_SIZE);
 	get_random_bytes(ctx.nonce, FS_KEY_DERIVATION_NONCE_SIZE);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index f7680ef1abd2..ea205aa8a24a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -61,6 +61,7 @@ struct fscrypt_operations {
 	bool (*dummy_context)(struct inode *);
 	bool (*empty_dir)(struct inode *);
 	unsigned int max_namelen;
+	bool inline_crypt_supp;
 };
 
 struct fscrypt_ctx {
@@ -129,6 +130,23 @@ extern int fscrypt_inherit_context(struct inode *, struct inode *,
 extern int fscrypt_get_encryption_info(struct inode *);
 extern void fscrypt_put_encryption_info(struct inode *);
 extern void fscrypt_free_inode(struct inode *);
+extern bool fscrypt_needs_fs_layer_crypto(const struct inode *inode);
+
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+extern bool fscrypt_inode_is_inline_crypted(const struct inode *inode);
+extern bool fscrypt_inode_crypt_mergeable(const struct inode *inode_1,
+					  const struct inode *inode_2);
+#else
+static inline bool fscrypt_inode_is_inline_crypted(const struct inode *inode)
+{
+	return false;
+}
+static inline bool fscrypt_inode_crypt_mergeable(const struct inode *inode_1,
+						 const struct inode *inode_2)
+{
+	return true;
+}
+#endif /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 /* fname.c */
 extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
@@ -226,6 +244,25 @@ extern void fscrypt_enqueue_decrypt_bio(struct fscrypt_ctx *ctx,
 extern void fscrypt_pullback_bio_page(struct page **, bool);
 extern int fscrypt_zeroout_range(const struct inode *, pgoff_t, sector_t,
 				 unsigned int);
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+extern int fscrypt_set_bio_crypt_ctx(const struct inode *inode,
+				     struct bio *bio, u64 data_unit_num);
+extern void fscrypt_unset_bio_crypt_ctx(struct bio *bio);
+extern int fscrypt_evict_crypt_key(struct inode *inode);
+#else
+static inline int fscrypt_set_bio_crypt_ctx(const struct inode *inode,
+					    struct bio *bio, u64 data_unit_num)
+{
+	return 0;
+}
+
+static inline void fscrypt_unset_bio_crypt_ctx(struct bio *bio) { }
+
+static inline int fscrypt_evict_crypt_key(struct inode *inode)
+{
+	return 0;
+}
+#endif
 
 /* hooks.c */
 extern int fscrypt_file_open(struct inode *inode, struct file *filp);
@@ -351,6 +388,17 @@ static inline void fscrypt_free_inode(struct inode *inode)
 {
 }
 
+static inline bool fscrypt_inode_is_inline_crypted(const struct inode *inode)
+{
+	return false;
+}
+
+static inline bool fscrypt_inode_crypt_mergeable(const struct inode *inode_1,
+						 const struct inode *inode_2)
+{
+	return true;
+}
+
  /* fname.c */
 static inline int fscrypt_setup_filename(struct inode *dir,
 					 const struct qstr *iname,
@@ -421,6 +469,20 @@ static inline int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_set_bio_crypt_ctx(const struct inode *inode,
+					    struct bio *bio,
+					    u64 data_unit_num)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void fscrypt_unset_bio_crypt_ctx(struct bio *bio) { }
+
+static inline int fscrypt_evict_crypt_key(struct inode *inode)
+{
+	return 0;
+}
+
 /* hooks.c */
 
 static inline int fscrypt_file_open(struct inode *inode, struct file *filp)
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 59c71fa8c553..ec5a9913886c 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -224,7 +224,8 @@ struct fsxattr {
 #define FS_POLICY_FLAGS_PAD_32		0x03
 #define FS_POLICY_FLAGS_PAD_MASK	0x03
 #define FS_POLICY_FLAG_DIRECT_KEY	0x04	/* use master key directly */
-#define FS_POLICY_FLAGS_VALID		0x07
+#define FS_POLICY_FLAGS_INLINE_CRYPT	0x08
+#define FS_POLICY_FLAGS_VALID		0x0F
 
 /* Encryption algorithms */
 #define FS_ENCRYPTION_MODE_INVALID		0
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
