Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SMCIKcplO2opXQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB66BB586
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bN8fEdcf;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Gx7kWCPC;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="buAZ/pbo";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=JugIIXXT;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtWxTQmXL2wbWbZgu2CcNCO94eAtGVpampPKCxAR56o=; b=bN8fEdcfW4ZOqTf71gmWnWcRVM
	Y0tvfSBj919zIHZENaANGtXz5ijlL2POobM64VXb/TYBjUoemOk45OI/NOTaDnf4qNEoUowSPBCT6
	YrvSr0DQrW0Di58NpaOe6DvlCmVWkZbYh1F7jXEHcXv1wm14Ax3Tz9GjzIu9OqPyeThQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoQ-0006S4-7E;
	Wed, 24 Jun 2026 05:06:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoP-0006Rr-60
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BPB5pfvUiYbqr85/eya/ptFy2JeslN2IlNccMgpzCLM=; b=Gx7kWCPCqAU1L4VDq0thR4AXVS
 2BsZ07JwK6PREmQA7IK7HzUjlj63lO3MSEvW4IDfif9Mi5BFEAhwi6JNKITrVM37Hjve33UP6JXXP
 dpZn/Xu/n9jJmg72J5OOb+QRDohZPVKliGCkukFrwR1dhb2DrfHJmYyKTEYbX5vwb8AY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BPB5pfvUiYbqr85/eya/ptFy2JeslN2IlNccMgpzCLM=; b=buAZ/pboZIehWBw5q98op+/XSK
 5gmPmrDZMyP2qcVb0qxaiyGAYnRpdK3XrEKxqsaZjcTsD5ga650WlaPSUAT+bWlNUeK6Q6Hr/dJGt
 VkALTtCmeGb5kZ8S6YHp7bAZ/eZBNCxCBWqA5mZPstQa9aSA6+39taEZdLQ7FKQoRih4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoM-0004mL-NL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DFAF844526;
 Wed, 24 Jun 2026 05:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257DB1F00ACA;
 Wed, 24 Jun 2026 05:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277561;
 bh=BPB5pfvUiYbqr85/eya/ptFy2JeslN2IlNccMgpzCLM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=JugIIXXTCTJN0X09/gy8bzULmd6/W4+1F00qw0qwFlE87u78tipyPMgmKGD74KjVY
 rDnpQ+DFEI7B2RB4QlaECOnduvDvDc5iol2FoUjTONzByTpY77GVeEK9JTcNIICLkC
 ZyMQKqF5F1cygEiSDbJ+UVkqqw2tyY7CTsCBg2yBQnitrRZAR65UorcpbGMGx15zi1
 7LmKdFCcGH6+1d31PasL6Gmg8JCoN+WR2kbRQ3YoObHwfvLr5rAd7fgaZDPP8uPlEr
 l7b7uEYrah60VviUM7WNL5HYzPjD8fbNYqL+fvJ4HZqCaOHinNXnpR1qY++T+CwYiH
 4wGdfuWh+Jj/A==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:23 -0700
Message-ID: <20260624050334.124606-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624050334.124606-1-ebiggers@kernel.org>
References: <20260624050334.124606-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For encrypting and decrypting file contents on block-based
 filesystems (i.e., ext4 and f2fs, but not ceph and ubifs),
 always use blk-crypto
 instead of fs-layer crypto (direct use of crypto_skcipher). 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wcFoM-0004mL-NL
Subject: [f2fs-dev] [PATCH 05/16] fscrypt: Always use blk-crypto for
 contents on block-based filesystems
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
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FBB66BB586

For encrypting and decrypting file contents on block-based filesystems
(i.e., ext4 and f2fs, but not ceph and ubifs), always use blk-crypto
instead of fs-layer crypto (direct use of crypto_skcipher).

Since the blk-crypto API provides a fallback to CPU-based encryption,
it's all that's needed on block-based filesystems.  The support for two
alternative block-based file contents encryption implementations,
fs-layer and blk-crypto, existed mainly for historical reasons, as the
fs-layer path came first.  Some of it is also still needed for the
non-block-based filesystems, but a lot of it isn't.

Removing the duplicate fs-layer code paths greatly simplifies the code,
most of which is done in later commits.

Specific implementation details:

- SB_INLINECRYPT now controls whether blk_crypto_config::allow_hw is set
  to true, instead of whether blk-crypto is used at all.  The effect is
  that the semantics are preserved: the inlinecrypt mount option selects
  the use of inline encryption hardware instead of the CPU.

- Set up a blk_crypto_key iff the file is a regular file on a
  block-based filesystem.  To determine whether the filesystem is
  block-based, add a bit fscrypt_operations::is_block_based.

- Remove fscrypt_select_encryption_impl().  Move the logging logic that
  was previously there into fscrypt_prepare_inline_crypt_key().  Note
  that blk_crypto_config_supported() is no longer needed.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/filesystems/fscrypt.rst       |  36 +++----
 arch/loongarch/configs/loongson32_defconfig |   1 -
 arch/loongarch/configs/loongson64_defconfig |   1 -
 fs/crypto/Kconfig                           |   8 +-
 fs/crypto/fscrypt_private.h                 |  21 +---
 fs/crypto/inline_crypt.c                    | 110 ++++++--------------
 fs/crypto/keysetup.c                        |  31 +-----
 fs/ext4/crypto.c                            |   1 +
 fs/f2fs/super.c                             |   1 +
 include/linux/fscrypt.h                     |  28 ++---
 10 files changed, 69 insertions(+), 169 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 92b8f311e211..370a5ef73ef2 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -1316,36 +1316,24 @@ this by validating all top-level encryption policies prior to access.
 Inline encryption support
 =========================
 
 Many newer systems (especially mobile SoCs) have *inline encryption
 hardware* that can encrypt/decrypt data while it is on its way to/from
-the storage device.  Linux supports inline encryption through a set of
-extensions to the block layer called *blk-crypto*.  blk-crypto allows
-filesystems to attach encryption contexts to bios (I/O requests) to
-specify how the data will be encrypted or decrypted in-line.  For more
-information about blk-crypto, see
-:ref:`Documentation/block/inline-encryption.rst <inline_encryption>`.
+the storage device.
 
 On supported filesystems (currently ext4 and f2fs), fscrypt can use
-blk-crypto instead of the kernel crypto API to encrypt/decrypt file
-contents.  To enable this, set CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y in
-the kernel configuration, and specify the "inlinecrypt" mount option
-when mounting the filesystem.
-
-Note that the "inlinecrypt" mount option just specifies to use inline
-encryption when possible; it doesn't force its use.  fscrypt will
-still fall back to using the kernel crypto API on files where the
-inline encryption hardware doesn't have the needed crypto capabilities
-(e.g. support for the needed encryption algorithm and data unit size)
-and where blk-crypto-fallback is unusable.  (For blk-crypto-fallback
-to be usable, it must be enabled in the kernel configuration with
-CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y, and the file must be
-protected by a raw key rather than a hardware-wrapped key.)
-
-Currently fscrypt always uses the filesystem block size (which is
-usually 4096 bytes) as the data unit size.  Therefore, it can only use
-inline encryption hardware that supports that data unit size.
+inline encryption hardware instead of the CPU to encrypt/decrypt file
+contents.  To enable this, specify the "inlinecrypt" mount option when
+mounting the filesystem.
+
+This causes the filesystem to use inline encryption hardware whenever
+possible, falling back to the CPU only if such hardware is absent or
+doesn't provide the needed crypto capabilities.
+
+For more information about the kernel's support for inline encryption
+hardware, see :ref:`Documentation/block/inline-encryption.rst
+<inline_encryption>`.
 
 Inline encryption doesn't affect the ciphertext or other aspects of
 the on-disk format, so users may freely switch back and forth between
 using "inlinecrypt" and not using "inlinecrypt".  An exception is that
 files that are protected by a hardware-wrapped key can only be
diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
index 7c8f01513ed2..6bf2867dbdc6 100644
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -967,11 +967,10 @@ CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_F2FS_FS=m
 CONFIG_F2FS_FS_SECURITY=y
 CONFIG_F2FS_CHECK_FS=y
 CONFIG_F2FS_FS_COMPRESSION=y
 CONFIG_FS_ENCRYPTION=y
-CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
 CONFIG_FS_VERITY=y
 CONFIG_FANOTIFY=y
 CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
 CONFIG_QUOTA=y
 # CONFIG_PRINT_QUOTA_WARNING is not set
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
index 8e3906d3bd70..def104c9d405 100644
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -998,11 +998,10 @@ CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_F2FS_FS=m
 CONFIG_F2FS_FS_SECURITY=y
 CONFIG_F2FS_CHECK_FS=y
 CONFIG_F2FS_FS_COMPRESSION=y
 CONFIG_FS_ENCRYPTION=y
-CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
 CONFIG_FS_VERITY=y
 CONFIG_FANOTIFY=y
 CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
 CONFIG_QUOTA=y
 # CONFIG_PRINT_QUOTA_WARNING is not set
diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index 983d8ad1f417..cd934e31dec4 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -1,8 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config FS_ENCRYPTION
 	bool "FS Encryption (Per-file encryption)"
+	select BLK_INLINE_ENCRYPTION if BLOCK
+	select BLK_INLINE_ENCRYPTION_FALLBACK if BLOCK
 	select CRYPTO
 	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_SHA256
 	select CRYPTO_LIB_SHA512
@@ -32,9 +34,7 @@ config FS_ENCRYPTION_ALGS
 	select CRYPTO_CBC
 	select CRYPTO_CTS
 	select CRYPTO_XTS
 
 config FS_ENCRYPTION_INLINE_CRYPT
-	bool "Enable fscrypt to use inline crypto"
-	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
-	help
-	  Enable fscrypt to use inline encryption hardware if available.
+	bool
+	default y if FS_ENCRYPTION && BLOCK
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 8234ee542476..57b7ae2cfafc 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -264,18 +264,10 @@ struct fscrypt_inode_info {
 	struct fscrypt_prepared_key ci_enc_key;
 
 	/* True if ci_enc_key should be freed when this struct is freed */
 	u8 ci_owns_key : 1;
 
-#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
-	/*
-	 * True if this inode will use inline encryption (blk-crypto) instead of
-	 * the traditional filesystem-layer encryption.
-	 */
-	u8 ci_inlinecrypt : 1;
-#endif
-
 	/* True if ci_dirhash_key is initialized */
 	u8 ci_dirhash_key_initialized : 1;
 
 	/*
 	 * log2 of the data unit size (granularity of contents encryption) of
@@ -408,17 +400,16 @@ void fscrypt_hkdf_expand(const struct hmac_sha512_key *hkdf, u8 context,
 			 const u8 *info, unsigned int infolen,
 			 u8 *okm, unsigned int okmlen);
 
 /* inline_crypt.c */
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
-int fscrypt_select_encryption_impl(struct fscrypt_inode_info *ci,
-				   bool is_hw_wrapped_key);
-
 static inline bool
 fscrypt_using_inline_encryption(const struct fscrypt_inode_info *ci)
 {
-	return ci->ci_inlinecrypt;
+	const struct inode *inode = ci->ci_inode;
+
+	return S_ISREG(inode->i_mode) && inode->i_sb->s_cop->is_block_based;
 }
 
 int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 				     const u8 *key_bytes, size_t key_size,
 				     bool is_hw_wrapped,
@@ -444,16 +435,10 @@ fscrypt_is_key_prepared(const struct fscrypt_prepared_key *prep_key,
 	return prep_key->tfm != NULL;
 }
 
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
-static inline int fscrypt_select_encryption_impl(struct fscrypt_inode_info *ci,
-						 bool is_hw_wrapped_key)
-{
-	return 0;
-}
-
 static inline bool
 fscrypt_using_inline_encryption(const struct fscrypt_inode_info *ci)
 {
 	return false;
 }
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 4f045ad1dca8..caf706215621 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -68,106 +68,61 @@ static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_inode_info *ci)
  * filesystems or files are using each implementation.  However, *usually*
  * systems use just one implementation per mode, which makes these messages
  * helpful for debugging problems where the "wrong" implementation is used.
  */
 static void fscrypt_log_blk_crypto_impl(struct fscrypt_mode *mode,
-					struct block_device **devs,
-					unsigned int num_devs,
-					const struct blk_crypto_config *cfg)
+					struct block_device *dev,
+					const struct blk_crypto_key *blk_key)
 {
-	unsigned int i;
-
-	for (i = 0; i < num_devs; i++) {
-		if (!IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) ||
-		    blk_crypto_config_supported_natively(devs[i], cfg)) {
-			if (!xchg(&mode->logged_blk_crypto_native, 1))
-				pr_info("fscrypt: %s using blk-crypto (native)\n",
-					mode->friendly_name);
-		} else if (!xchg(&mode->logged_blk_crypto_fallback, 1)) {
-			pr_info("fscrypt: %s using blk-crypto-fallback\n",
+	if (blk_crypto_config_supported_natively(dev, &blk_key->crypto_cfg)) {
+		if (!xchg(&mode->logged_blk_crypto_native, 1))
+			pr_info("fscrypt: %s using blk-crypto (native)\n",
 				mode->friendly_name);
-		}
+	} else if (!xchg(&mode->logged_blk_crypto_fallback, 1)) {
+		pr_info("fscrypt: %s using blk-crypto-fallback\n",
+			mode->friendly_name);
 	}
 }
 
-/* Enable inline encryption for this file if supported. */
-int fscrypt_select_encryption_impl(struct fscrypt_inode_info *ci,
-				   bool is_hw_wrapped_key)
-{
-	const struct inode *inode = ci->ci_inode;
-	struct super_block *sb = inode->i_sb;
-	struct blk_crypto_config crypto_cfg;
-	struct block_device **devs;
-	unsigned int num_devs;
-	unsigned int i;
-
-	/* The file must need contents encryption, not filenames encryption */
-	if (!S_ISREG(inode->i_mode))
-		return 0;
-
-	/* The crypto mode must have a blk-crypto counterpart */
-	if (ci->ci_mode->blk_crypto_mode == BLK_ENCRYPTION_MODE_INVALID)
-		return 0;
-
-	/* The filesystem must be mounted with -o inlinecrypt */
-	if (!(sb->s_flags & SB_INLINECRYPT))
-		return 0;
-
-	/*
-	 * On all the filesystem's block devices, blk-crypto must support the
-	 * crypto configuration that the file would use.
-	 */
-	crypto_cfg.crypto_mode = ci->ci_mode->blk_crypto_mode;
-	crypto_cfg.data_unit_size = 1U << ci->ci_data_unit_bits;
-	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
-	crypto_cfg.key_type = is_hw_wrapped_key ?
-		BLK_CRYPTO_KEY_TYPE_HW_WRAPPED : BLK_CRYPTO_KEY_TYPE_RAW;
-	crypto_cfg.allow_hw = true;
-
-	devs = fscrypt_get_devices(sb, &num_devs);
-	if (IS_ERR(devs))
-		return PTR_ERR(devs);
-
-	for (i = 0; i < num_devs; i++) {
-		if (!blk_crypto_config_supported(devs[i], &crypto_cfg))
-			goto out_free_devs;
-	}
-
-	fscrypt_log_blk_crypto_impl(ci->ci_mode, devs, num_devs, &crypto_cfg);
-
-	ci->ci_inlinecrypt = true;
-out_free_devs:
-	kfree(devs);
-
-	return 0;
-}
-
 int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 				     const u8 *key_bytes, size_t key_size,
 				     bool is_hw_wrapped,
 				     const struct fscrypt_inode_info *ci)
 {
 	const struct inode *inode = ci->ci_inode;
 	struct super_block *sb = inode->i_sb;
-	enum blk_crypto_mode_num crypto_mode = ci->ci_mode->blk_crypto_mode;
+	bool inlinecrypt = sb->s_flags & SB_INLINECRYPT;
+	struct fscrypt_mode *mode = ci->ci_mode;
 	enum blk_crypto_key_type key_type = is_hw_wrapped ?
 		BLK_CRYPTO_KEY_TYPE_HW_WRAPPED : BLK_CRYPTO_KEY_TYPE_RAW;
 	struct blk_crypto_key *blk_key;
 	struct block_device **devs;
 	unsigned int num_devs;
 	unsigned int i;
 	int err;
 
+	if (is_hw_wrapped && !inlinecrypt) {
+		/*
+		 * blk_crypto_init_key() would catch this anyway, but this
+		 * provides a clearer error message.
+		 */
+		fscrypt_err(
+			inode,
+			"Hardware-wrapped keys require inline encryption (-o inlinecrypt)");
+		return -EINVAL;
+	}
+
 	blk_key = kmalloc_obj(*blk_key);
 	if (!blk_key)
 		return -ENOMEM;
 
 	err = blk_crypto_init_key(blk_key, key_bytes, key_size, key_type,
-				  crypto_mode, fscrypt_get_dun_bytes(ci),
-				  1U << ci->ci_data_unit_bits, true);
+				  mode->blk_crypto_mode,
+				  fscrypt_get_dun_bytes(ci),
+				  1U << ci->ci_data_unit_bits, inlinecrypt);
 	if (err) {
-		fscrypt_err(inode, "error %d initializing blk-crypto key", err);
+		fscrypt_err(inode, "Error %d initializing blk-crypto key", err);
 		goto fail;
 	}
 
 	/* Start using blk-crypto on all the filesystem's block devices. */
 	devs = fscrypt_get_devices(sb, &num_devs);
@@ -177,14 +132,21 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	}
 	for (i = 0; i < num_devs; i++) {
 		err = blk_crypto_start_using_key(devs[i], blk_key);
 		if (err)
 			break;
+		fscrypt_log_blk_crypto_impl(mode, devs[i], blk_key);
 	}
 	kfree(devs);
 	if (err) {
-		fscrypt_err(inode, "error %d starting to use blk-crypto", err);
+		if (err == -EOPNOTSUPP && is_hw_wrapped)
+			fscrypt_err(
+				inode,
+				"Hardware-wrapped key required, but no suitable inline encryption capabilities are available");
+		else
+			fscrypt_err(inode,
+				    "Error %d starting to use blk-crypto", err);
 		goto fail;
 	}
 
 	prep_key->blk_key = blk_key;
 	return 0;
@@ -241,16 +203,10 @@ int fscrypt_derive_sw_secret(struct super_block *sb,
 			     "%s: block device doesn't support hardware-wrapped keys\n",
 			     sb->s_id);
 	return err;
 }
 
-bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
-{
-	return fscrypt_get_inode_info_raw(inode)->ci_inlinecrypt;
-}
-EXPORT_SYMBOL_GPL(__fscrypt_inode_uses_inline_crypto);
-
 static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
 				 loff_t pos, u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
 {
 	union fscrypt_iv iv;
 	int i;
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index cfd348e2252e..c9041f245246 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -142,13 +142,13 @@ fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
 	return ERR_PTR(err);
 }
 
 /*
  * Prepare the crypto transform object or blk-crypto key in @prep_key, given the
- * raw key, encryption mode (@ci->ci_mode), flag indicating which encryption
- * implementation (fs-layer or blk-crypto) will be used (@ci->ci_inlinecrypt),
- * and IV generation method (@ci->ci_policy.flags).
+ * raw key, encryption mode (@ci->ci_mode), predicate indicating which style of
+ * key is needed (fscrypt_using_inline_encryption(ci)), IV generation method
+ * (@ci->ci_policy.flags), and data unit size (@ci->ci_data_unit_bits).
  */
 int fscrypt_prepare_key(struct fscrypt_prepared_key *prep_key,
 			const u8 *raw_key, const struct fscrypt_inode_info *ci)
 {
 	struct crypto_sync_skcipher *tfm;
@@ -222,27 +222,12 @@ static int setup_per_mode_enc_key(struct fscrypt_inode_info *ci,
 	struct fscrypt_prepared_key *prep_key;
 	struct fscrypt_mode_key *new_node;
 	u8 raw_mode_key[FSCRYPT_MAX_RAW_KEY_SIZE];
 	u8 hkdf_info[sizeof(mode_num) + sizeof(sb->s_uuid)];
 	unsigned int hkdf_infolen = 0;
-	bool use_hw_wrapped_key = false;
 	int err;
 
-	if (mk->mk_secret.is_hw_wrapped && S_ISREG(inode->i_mode)) {
-		/* Using a hardware-wrapped key for file contents encryption */
-		if (!fscrypt_using_inline_encryption(ci)) {
-			if (sb->s_flags & SB_INLINECRYPT)
-				fscrypt_warn(ci->ci_inode,
-					     "Hardware-wrapped key required, but no suitable inline encryption capabilities are available");
-			else
-				fscrypt_warn(ci->ci_inode,
-					     "Hardware-wrapped keys require inline encryption (-o inlinecrypt)");
-			return -EINVAL;
-		}
-		use_hw_wrapped_key = true;
-	}
-
 	prep_key = fscrypt_find_mode_key(mk, hkdf_context, mode_num, ci);
 	if (prep_key) {
 		ci->ci_enc_key = *prep_key;
 		return 0;
 	}
@@ -261,11 +246,11 @@ static int setup_per_mode_enc_key(struct fscrypt_inode_info *ci,
 	new_node->hkdf_context = hkdf_context;
 	new_node->mode_num = mode_num;
 	new_node->data_unit_bits = ci->ci_data_unit_bits;
 	prep_key = &new_node->key;
 
-	if (use_hw_wrapped_key) {
+	if (mk->mk_secret.is_hw_wrapped && S_ISREG(inode->i_mode)) {
 		err = fscrypt_prepare_inline_crypt_key(prep_key,
 						       mk->mk_secret.bytes,
 						       mk->mk_secret.size, true,
 						       ci);
 	} else {
@@ -507,14 +492,10 @@ static int setup_file_encryption_key(struct fscrypt_inode_info *ci,
 	}
 	if (unlikely(!mk)) {
 		if (ci->ci_policy.version != FSCRYPT_POLICY_V1)
 			return -ENOKEY;
 
-		err = fscrypt_select_encryption_impl(ci, false);
-		if (err)
-			return err;
-
 		/*
 		 * As a legacy fallback for v1 policies, search for the key in
 		 * the current task's subscribed keyrings too.  Don't move this
 		 * to before the search of ->s_master_keys, since users
 		 * shouldn't be able to override filesystem-level keys.
@@ -532,14 +513,10 @@ static int setup_file_encryption_key(struct fscrypt_inode_info *ci,
 	if (!fscrypt_valid_master_key_size(mk, ci)) {
 		err = -ENOKEY;
 		goto out_release_key;
 	}
 
-	err = fscrypt_select_encryption_impl(ci, mk->mk_secret.is_hw_wrapped);
-	if (err)
-		goto out_release_key;
-
 	switch (ci->ci_policy.version) {
 	case FSCRYPT_POLICY_V1:
 		if (WARN_ON_ONCE(mk->mk_secret.is_hw_wrapped)) {
 			/*
 			 * This should never happen, as adding a v1 policy key
diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index f41f320f4437..6b809ac80ef7 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -234,10 +234,11 @@ static bool ext4_has_stable_inodes(struct super_block *sb)
 }
 
 const struct fscrypt_operations ext4_cryptops = {
 	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_crypt_info) -
 				  (int)offsetof(struct ext4_inode_info, vfs_inode),
+	.is_block_based		= 1,
 	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "ext4:",
 	.get_context		= ext4_get_context,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccf806b676f5..f3f6768f8cca 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3752,10 +3752,11 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
 	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_crypt_info) -
 				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
+	.is_block_based		= 1,
 	.needs_bounce_pages	= 1,
 	.has_32bit_inodes	= 1,
 	.supports_subblock_data_units = 1,
 	.legacy_key_prefix	= "f2fs:",
 	.get_context		= f2fs_get_context,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 54712ec61ffb..8d19b95150f1 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -67,18 +67,19 @@ struct fscrypt_operations {
 	 * the common part of the inode (the 'struct inode').
 	 */
 	ptrdiff_t inode_info_offs;
 
 	/*
-	 * If set, then fs/crypto/ will allocate a global bounce page pool the
-	 * first time an encryption key is set up for a file.  The bounce page
-	 * pool is required by the following functions:
-	 *
-	 * - fscrypt_encrypt_pagecache_blocks()
-	 * - fscrypt_zeroout_range() for files not using inline crypto
-	 *
-	 * If the filesystem doesn't use those, it doesn't need to set this.
+	 * Set to 1 if the filesystem is block-based.  This causes fs/crypto/ to
+	 * set up the key for regular files as a blk_crypto_key.  The filesystem
+	 * then uses fscrypt_set_bio_crypt_ctx() and similar functions.
+	 */
+	unsigned int is_block_based : 1;
+
+	/*
+	 * Set to 1 if the filesystem uses fscrypt_encrypt_pagecache_blocks().
+	 * This enables the allocation of the bounce page pool it requires.
 	 */
 	unsigned int needs_bounce_pages : 1;
 
 	/*
 	 * If set, then fs/crypto/ will allow the use of encryption settings
@@ -861,12 +862,10 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 #endif	/* !CONFIG_FS_ENCRYPTION */
 
 /* inline_crypt.c */
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 
-bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode);
-
 void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 			       loff_t pos, gfp_t gfp_mask);
 
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   loff_t pos);
@@ -875,15 +874,10 @@ bool fscrypt_dio_supported(struct inode *inode);
 
 u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);
 
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
-static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
-{
-	return false;
-}
-
 static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
 					     const struct inode *inode,
 					     loff_t pos, gfp_t gfp_mask) { }
 
 static inline bool fscrypt_mergeable_bio(struct bio *bio,
@@ -915,11 +909,11 @@ static inline u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk,
  *	   than in the filesystem layer.
  */
 static inline bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 {
 	return fscrypt_needs_contents_encryption(inode) &&
-	       __fscrypt_inode_uses_inline_crypto(inode);
+	       inode->i_sb->s_cop->is_block_based;
 }
 
 /**
  * fscrypt_inode_uses_fs_layer_crypto() - test whether an inode uses fs-layer
  *					  encryption
@@ -930,11 +924,11 @@ static inline bool fscrypt_inode_uses_inline_crypto(const struct inode *inode)
  *	   block layer via blk-crypto.
  */
 static inline bool fscrypt_inode_uses_fs_layer_crypto(const struct inode *inode)
 {
 	return fscrypt_needs_contents_encryption(inode) &&
-	       !__fscrypt_inode_uses_inline_crypto(inode);
+	       !inode->i_sb->s_cop->is_block_based;
 }
 
 /**
  * fscrypt_has_encryption_key() - check whether an inode has had its key set up
  * @inode: the inode to check
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
