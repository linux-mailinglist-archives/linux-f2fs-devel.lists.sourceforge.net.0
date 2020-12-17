Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 328442DD3A5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 16:05:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YNGKP2fOkQIt1OKFEQPKFsK77BwE+lbme2L19PpD2zs=; b=nMCjK8wdrqgF30N+persSfSTp
	TZbQxyE8TxM5LLDU7O5ZAF0H/hdH+ftrVChNaXEPyjcA/HxKl6ybXpHP73pMSowIS6t/aw0o5nWVH
	PhUuY8q//1aDoBuiVmkbqBve7xcZlC6+vCa18uWIoPMvsU7QP+nddiG2b9k9yp965r5Gs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpuq8-0004cf-Vp; Thu, 17 Dec 2020 15:05:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3kXPbXwYKAOoeMfkMfSaaSXQ.OaY@flex--satyat.bounces.google.com>)
 id 1kpuq7-0004bx-El
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iba9a+YIImAU65XLGcZxW0R3oo7lGqbTQl6hTNSHrlg=; b=GbjH6AJpJkl/vCPkkOnzO2kdL
 LMkqrH+bAwxB7e6VxmBKrfif0t3jkeozw8qtQ3uur1bBYayXkxrewM2nwfanccd/ufZYnwIQ+V3PG
 4ZZHyUlFvf24VyixuQrNXeeJxSr2tXv0VSs9kv3OF8QK0bee4PTKn7Ec7bi5ouVOqaXtg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iba9a+YIImAU65XLGcZxW0R3oo7lGqbTQl6hTNSHrlg=; b=Iz7fcWsZtawAZOwWT+OdjwfSdC
 sah0DqZAprSEShdNmXdP6pfdGx/UWjxOa0Z5GeeX3Zpe0FgTu/tdV/tpLsrYLR0dLPHiMcWE1clK7
 dLU1wZs0/KOXz4Q1r65fqBUGBvVGzDS6CIU4dk8ujTmATRpn78AYccY6trAAMS6Mm4Hg=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kpupr-000F0L-1y
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 15:05:11 +0000
Received: by mail-qk1-f202.google.com with SMTP id a6so22445413qkd.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 17 Dec 2020 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Iba9a+YIImAU65XLGcZxW0R3oo7lGqbTQl6hTNSHrlg=;
 b=G2EGSMw2ftq3pSorWo0Aj2UdZGHpaaCN0Mb6Xt0Vr9OvRBcBQ4U16YmZtwB0rIF8an
 1VEvra1cHfcl5t2V8L+3mKMOop6jafHldKKp7zfk5ZcDGs1A2NpTDHY/LvUWdIITLX6v
 pP0C9RluYlNuFSvgpJnKCwkRdzlBZMb/ZHZK3znfAjLCI+rs/kDpil7KVao2FJVsIP9K
 VGCFgFGddu+Mtl/iIT4E4CjuiExXSJKayN4gl5D9WepEBzd1MPv3EECjCoiO2HIVI1Uq
 np84I7uacbAiaswRgONElB4JVNS8b6geQ5aeMO8i5VPHCwUJCNg8AtGIJQKylS1ARAQG
 NVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Iba9a+YIImAU65XLGcZxW0R3oo7lGqbTQl6hTNSHrlg=;
 b=pU85Pdwri8dLFjXsMWIfW1CofzzfEknwMbtVvCfPuGQ63SbMQ1D0wOLKcQddBlNyik
 BQZNJMlgexgf5fv2bTDth7ajIKsJJSNhm5PorAcmPb49v+Iv/aUmVWYVC0yMAYAMpGz6
 GDQmYFJQ/glx3uBMzQ3qWF9ab3hwTO8M+PdNJgr6Sb5wko2o2rjCzwlLiL3V9pIGtgvI
 xnkN4SjCWDoVmDSlTRGjR9lY/TX+kk/MT6N8ZuU4PV+kfDEAIxLrBBPYO049O8BNS0hP
 daTkQ+qdwaN8qQPrfgJmkrDutNzPQBAPeUFpVQyB7+wTmy2lHd3vAEZ7cj2HShpL3QCC
 vNZg==
X-Gm-Message-State: AOAM530/Yq/7htEsH3X610rYsXYgyJPbs6UJCyfEmESxae58aS7wpb2H
 SuZThV6gtCUtRofKGZTB5cFfEfziTQM=
X-Google-Smtp-Source: ABdhPJw1L0F7lWrTCNLsHQvJLxtafjYV9WQDT3jeebDMtbZFUAyUODkPSXOeF7U9QNUEiiyPup6w06KocFE=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:ad4:5192:: with SMTP id
 b18mr49662264qvp.46.1608217489114; 
 Thu, 17 Dec 2020 07:04:49 -0800 (PST)
Date: Thu, 17 Dec 2020 15:04:34 +0000
In-Reply-To: <20201217150435.1505269-1-satyat@google.com>
Message-Id: <20201217150435.1505269-3-satyat@google.com>
Mime-Version: 1.0
References: <20201217150435.1505269-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kpupr-000F0L-1y
Subject: [f2fs-dev] [PATCH v2 2/3] fscrypt: Add metadata encryption support
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
Cc: linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduces functions that help with metadata encryption.

In particular, we introduce:

fscrypt_setup_metadata_encryption() - filesystems should call this function
to set up metadata encryption on a super block with the encryption
algorithm (the desired FSCRYPT_MODE_*) and the key identifier of the
encryption key. fscrypt looks for a logon key with the specified key
identifier with prefix "fscrypt:". fscrypt will verify that the key
identifier matches the identifier that is derived using HKDF-512 with the
logon key as the keying material, no salt, and
"fscrypt\0|HKDF_CONTEXT_KEY_IDENTIFIER" as the info string.

fscrypt_free_metadata_encryption() - this function should be called when
the super block is being freed. It ensures that the metadata encryption key
is evicted, if necessary, from devices.

Filesystems should call fscrypt_set_bio_crypt_ctx() on any bio that needs
either metadata or file contents encryption. fscrypt will choose the
appropriate key (based on the inode argument) to use for encrypting the
bio.

Note that the filesystem (rather than fscrypt) controls precisely which
blocks are encrypted with the metadata encryption key and which blocks are
encrypted with other keys/not encrypted at all. fscrypt only provides some
convenience functions that ultimately help encrypt a bio with the metadata
encryption key when desired.

This feature relies on the blk-crypto framework to do the actual
encryption.  As such, at least one of inline encryption hardware or the
blk-crypto-fallback needs to be present/enabled.

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 Documentation/filesystems/fscrypt.rst |  86 +++++++-
 fs/crypto/Kconfig                     |  12 +
 fs/crypto/Makefile                    |   1 +
 fs/crypto/bio.c                       |   2 +-
 fs/crypto/fscrypt_private.h           |  46 ++++
 fs/crypto/hkdf.c                      |   1 +
 fs/crypto/inline_crypt.c              |  33 +--
 fs/crypto/keyring.c                   |   4 +
 fs/crypto/metadata_crypt.c            | 303 ++++++++++++++++++++++++++
 fs/ext4/readpage.c                    |   2 +-
 fs/f2fs/data.c                        |   2 +-
 include/linux/fs.h                    |  10 +
 include/linux/fscrypt.h               |  46 +++-
 13 files changed, 511 insertions(+), 37 deletions(-)
 create mode 100644 fs/crypto/metadata_crypt.c

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 44b67ebd6e40..708164c413cc 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -27,8 +27,6 @@ at the block device level.  This allows it to encrypt different files
 with different keys and to have unencrypted files on the same
 filesystem.  This is useful for multi-user systems where each user's
 data-at-rest needs to be cryptographically isolated from the others.
-However, except for filenames, fscrypt does not encrypt filesystem
-metadata.
 
 Unlike eCryptfs, which is a stacked filesystem, fscrypt is integrated
 directly into supported filesystems --- currently ext4, F2FS, and
@@ -47,6 +45,15 @@ userspace provides the key, all regular files, directories, and
 symbolic links created in that directory tree are transparently
 encrypted.
 
+fscrypt also has support for encrypting filesystem metadata, which
+can be used independently of file contents encryption. For any
+filesystem block that isn't part of an encrypted file's contents,
+the filesystem can ask fscrypt to encrypt it with the metadata encryption
+key set up ahead of time. In general, filesystems should always choose
+to encrypt a filesystem block with the metadata encryption key, if
+that block isn't already encrypted with another key (filesystems may
+choose to leave certain blocks, like the superblock, unencrypted).
+
 Threat model
 ============
 
@@ -56,11 +63,17 @@ Offline attacks
 Provided that userspace chooses a strong encryption key, fscrypt
 protects the confidentiality of file contents and filenames in the
 event of a single point-in-time permanent offline compromise of the
-block device content.  fscrypt does not protect the confidentiality of
-non-filename metadata, e.g. file sizes, file permissions, file
-timestamps, and extended attributes.  Also, the existence and location
-of holes (unallocated blocks which logically contain all zeroes) in
-files is not protected.
+block device content.  fscrypt does not protect the existence and
+location of holes (unallocated blocks which logically contain all
+zeroes) in files.
+
+fscrypt protects the confidentiality of non-filename metadata, e.g.
+file sizes, file permissions, file timestamps, and extended attribute
+only when metadata encryption support is enabled for the filesystem,
+and the filesystem chooses to protect such information with the
+metadata encryption key. Presently only F2FS filesystems supports
+fscrypt metadata encryption. When metadata encryption is enabled, F2FS
+encrypts all not-otherwise-encrypted data in the filesystem with the metadata encryption key (except the filesystem superblock).
 
 fscrypt is not guaranteed to protect confidentiality or authenticity
 if an attacker is able to manipulate the filesystem offline prior to
@@ -90,6 +103,10 @@ After an encryption key has been added, fscrypt does not hide the
 plaintext file contents or filenames from other users on the same
 system.  Instead, existing access control mechanisms such as file mode
 bits, POSIX ACLs, LSMs, or namespaces should be used for this purpose.
+The above is also applicable for the metadata encryption key, if
+metadata encryption is enabled for the filesystem (once the key is added
+and the filesystem is mounted, fscrypt does not hide filesystem metadata
+from other users in the system).
 
 (For the reasoning behind this, understand that while the key is
 added, the confidentiality of the data, from the perspective of the
@@ -229,6 +246,15 @@ derived, the application-specific information string is the file's
 nonce prefixed with "fscrypt\\0" and a context byte.  Different
 context bytes are used for other types of derived keys.
 
+For v2 encryption policies, if the filesystem has a metadata crypt key,
+the master key is first "mixed" with the metadata crypt key, generating
+a "mixed-metadata key", which is then used in place of the master key
+in the process described above. The "mixed-metadata key" is generated
+by using the metadata crypt key as the input keying material, and
+a context specific byte and the original master key as the
+application-specific information string with HKDF-SHA512 (refer to
+fscrypt_mix_in_metadata_key() for details).
+
 HKDF-SHA512 is preferred to the original AES-128-ECB based KDF because
 HKDF is more flexible, is nonreversible, and evenly distributes
 entropy from the master key.  HKDF is also standardized and widely
@@ -1024,8 +1050,16 @@ process-subscribed keyrings.
 Access semantics
 ================
 
-With the key
-------------
+Without the metadata encryption key
+-----------------------------------
+
+If metadata encryption is enabled on a filesystem, it can't be mounted
+without the metadata encryption key, so no accesses are supported.
+The rest of this section assumes that the metadata encryption key is
+available.
+
+With the file encryption key
+----------------------------
 
 With the encryption key, encrypted regular files, directories, and
 symlinks behave very similarly to their unencrypted counterparts ---
@@ -1077,8 +1111,8 @@ astute users may notice some differences in behavior:
 Note that mmap *is* supported.  This is possible because the pagecache
 for an encrypted file contains the plaintext, not the ciphertext.
 
-Without the key
----------------
+Without the file encryption key
+-------------------------------
 
 Some filesystem operations may be performed on encrypted regular
 files, directories, and symlinks even before their encryption key has
@@ -1255,6 +1289,36 @@ without the key is subject to change in the future.  It is only meant
 as a way to temporarily present valid filenames so that commands like
 ``rm -r`` work as expected on encrypted directories.
 
+Filesystem metadata encryption
+------------------------------
+
+fscrypt metadata encryption relies on FS_ENCRYPTION_INLINE_CRYPT, and
+in particular on the blk-crypto framework (so either
+hardware inline encryption support must be present, or
+blk-crypto-fallback must be enabled).
+
+fscrypt metadata encryption requires the filesystem to keep track of
+the required metadata encryption key's identifier, and pass it to
+fscrypt at mount time. fscrypt will search for a logon key with
+description "fscrypt:<metadata_key_ident>". If the key is found, it will
+derive the payload's identifier from the payload and check that it
+matches the given <metadata_key_ident>. The metadata key identifier is
+calculated as hkdf(key=metadata_crypt_key,
+info="fscrypt\\0"|HKDF_CONTEXT_KEY_IDENTIFIER), where | represents
+concatenation).
+
+Filesystems have complete control over which blocks are encrypted with
+the metadata encryption key (other than blocks that are encrypted with
+fscrypt file content encryption keys - those blocks can't be encrypted
+again with the metadata encryption key). In general, filesystems should
+encrypt (almost) all not-otherwise-encrypted blocks with the metadata
+encryption key.
+
+fscrypt will encrypt each filesystem block in a bio as a single data
+unit. Filesystems control the IV used to encrypt the first filesystem
+block in a bio. The IVs of the rest of the blocks in the bio are computed
+by blk-crypto (by incrementing the IV by one for each additional block).
+
 Tests
 =====
 
diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index a5f5c30368a2..58b79d757608 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -30,3 +30,15 @@ config FS_ENCRYPTION_INLINE_CRYPT
 	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
 	help
 	  Enable fscrypt to use inline encryption hardware if available.
+
+config FS_ENCRYPTION_METADATA
+	bool "Enable metadata encryption with fscrypt"
+	depends on FS_ENCRYPTION_INLINE_CRYPT
+	help
+	  Enable fscrypt to encrypt metadata. This allows filesystems
+	  that support metadata encryption through fscrypt to mount
+	  and use filesystem images formatted with metadata encryption
+	  enabled. Such filesystem images generally have all
+	  otherwise-non-encrypted data (like filesystem metadata,
+	  and unencrypted files) encrypted with a metadata encryption
+	  key instead.
\ No newline at end of file
diff --git a/fs/crypto/Makefile b/fs/crypto/Makefile
index 652c7180ec6d..8403c7956983 100644
--- a/fs/crypto/Makefile
+++ b/fs/crypto/Makefile
@@ -12,3 +12,4 @@ fscrypto-y := crypto.o \
 
 fscrypto-$(CONFIG_BLOCK) += bio.o
 fscrypto-$(CONFIG_FS_ENCRYPTION_INLINE_CRYPT) += inline_crypt.o
+fscrypto-$(CONFIG_FS_ENCRYPTION_METADATA) += metadata_crypt.o
\ No newline at end of file
diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index b048a0e38516..d5c1dc38461b 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -59,7 +59,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 		unsigned int bytes_this_page = blocks_this_page << blockbits;
 
 		if (num_pages == 0) {
-			fscrypt_set_bio_crypt_ctx(bio, inode, lblk, GFP_NOFS);
+			fscrypt_set_bio_crypt_ctx(bio, 0, inode, lblk, GFP_NOFS);
 			bio_set_dev(bio, inode->i_sb->s_bdev);
 			bio->bi_iter.bi_sector =
 					pblk << (blockbits - SECTOR_SHIFT);
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 4f5806a3b73d..d13bb5e9d400 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -319,6 +319,8 @@ int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
 #define HKDF_CONTEXT_DIRHASH_KEY	5 /* info=file_nonce		*/
 #define HKDF_CONTEXT_IV_INO_LBLK_32_KEY	6 /* info=mode_num||fs_uuid	*/
 #define HKDF_CONTEXT_INODE_HASH_KEY	7 /* info=<empty>		*/
+#define HKDF_CONTEXT_METADATA_ENC_KEY	8 /* info=<empty>		*/
+#define HKDF_CONTEXT_MIX_METADATA_KEY	9 /* info=raw_secret		*/
 
 int fscrypt_hkdf_expand(const struct fscrypt_hkdf *hkdf, u8 context,
 			const u8 *info, unsigned int infolen,
@@ -327,6 +329,25 @@ int fscrypt_hkdf_expand(const struct fscrypt_hkdf *hkdf, u8 context,
 void fscrypt_destroy_hkdf(struct fscrypt_hkdf *hkdf);
 
 /* inline_crypt.c */
+
+static inline int fscrypt_get_num_devices(struct super_block *sb)
+{
+	if (sb->s_cop->get_num_devices)
+		return sb->s_cop->get_num_devices(sb);
+	return 1;
+}
+
+static inline struct request_queue *fscrypt_get_device(struct super_block *sb,
+						unsigned int device_index)
+{
+	if (sb->s_cop->get_device)
+		return sb->s_cop->get_device(sb, device_index);
+	else if (WARN_ON_ONCE(device_index != 0))
+		return NULL;
+	else
+		return bdev_get_queue(sb->s_bdev);
+}
+
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 int fscrypt_select_encryption_impl(struct fscrypt_info *ci);
 
@@ -595,4 +616,29 @@ int fscrypt_policy_from_context(union fscrypt_policy *policy_u,
 				int ctx_size);
 const union fscrypt_policy *fscrypt_policy_to_inherit(struct inode *dir);
 
+/* metadata_crypt.c */
+
+#ifdef CONFIG_FS_ENCRYPTION_METADATA
+
+int fscrypt_mix_in_metadata_key(struct super_block *sb,
+				struct fscrypt_master_key_secret *secret);
+
+void fscrypt_metadata_crypt_bio(struct bio *bio, u64 fsblk,
+				struct super_block *sb, gfp_t gfp_mask);
+
+#else /* !CONFIG_FS_ENCRYPTION_METADATA */
+
+static inline int
+fscrypt_mix_in_metadata_key(struct super_block *sb,
+			    struct fscrypt_master_key_secret *secret)
+{
+	return 0;
+}
+
+static inline void fscrypt_metadata_crypt_bio(struct bio *bio, u64 fsblk,
+					      struct super_block *sb,
+					      gfp_t gfp_mask) { }
+
+#endif /* !CONFIG_FS_ENCRYPTION_METADATA */
+
 #endif /* _FSCRYPT_PRIVATE_H */
diff --git a/fs/crypto/hkdf.c b/fs/crypto/hkdf.c
index 0cba7928446d..61d1f0aa802e 100644
--- a/fs/crypto/hkdf.c
+++ b/fs/crypto/hkdf.c
@@ -174,4 +174,5 @@ int fscrypt_hkdf_expand(const struct fscrypt_hkdf *hkdf, u8 context,
 void fscrypt_destroy_hkdf(struct fscrypt_hkdf *hkdf)
 {
 	crypto_free_shash(hkdf->hmac_tfm);
+	hkdf->hmac_tfm = NULL;
 }
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 8234217b42f4..ebd1db1707e6 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -26,24 +26,6 @@ struct fscrypt_blk_crypto_key {
 	struct request_queue *devs[];
 };
 
-static int fscrypt_get_num_devices(struct super_block *sb)
-{
-	if (sb->s_cop->get_num_devices)
-		return sb->s_cop->get_num_devices(sb);
-	return 1;
-}
-
-static struct request_queue *fscrypt_get_device(struct super_block *sb,
-						unsigned int device_index)
-{
-	if (sb->s_cop->get_device)
-		return sb->s_cop->get_device(sb, device_index);
-	else if (WARN_ON_ONCE(device_index != 0))
-		return NULL;
-	else
-		return bdev_get_queue(sb->s_bdev);
-}
-
 static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
 {
 	struct super_block *sb = ci->ci_inode->i_sb;
@@ -221,6 +203,8 @@ static void fscrypt_generate_dun(const struct fscrypt_info *ci, u64 lblk_num,
 /**
  * fscrypt_set_bio_crypt_ctx() - prepare a file contents bio for inline crypto
  * @bio: a bio which will eventually be submitted to the file
+ * @first_fsblk: the first FS block number in the I/O (only used if bio will be
+ *		 metadata crypted)
  * @inode: the file's inode
  * @first_lblk: the first file logical block number in the I/O
  * @gfp_mask: memory allocation flags - these must be a waiting mask so that
@@ -234,12 +218,19 @@ static void fscrypt_generate_dun(const struct fscrypt_info *ci, u64 lblk_num,
  *
  * The encryption context will be freed automatically when the bio is freed.
  */
-void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
-			       u64 first_lblk, gfp_t gfp_mask)
+void fscrypt_set_bio_crypt_ctx(struct bio *bio, u64 first_fsblk,
+			       const struct inode *inode, u64 first_lblk,
+			       gfp_t gfp_mask)
 {
 	const struct fscrypt_info *ci;
 	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
 
+	if (!fscrypt_needs_contents_encryption(inode)) {
+		fscrypt_metadata_crypt_bio(bio, first_fsblk, inode->i_sb,
+					   gfp_mask);
+		return;
+	}
+
 	if (!fscrypt_inode_uses_inline_crypto(inode))
 		return;
 	ci = inode->i_crypt_info;
@@ -291,7 +282,7 @@ void fscrypt_set_bio_crypt_ctx_bh(struct bio *bio,
 	u64 first_lblk;
 
 	if (bh_get_inode_and_lblk_num(first_bh, &inode, &first_lblk))
-		fscrypt_set_bio_crypt_ctx(bio, inode, first_lblk, gfp_mask);
+		fscrypt_set_bio_crypt_ctx(bio, 0, inode, first_lblk, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
 
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 53cc552a7b8f..3a3bc9403882 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -483,6 +483,10 @@ static int add_master_key(struct super_block *sb,
 	int err;
 
 	if (key_spec->type == FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER) {
+		err = fscrypt_mix_in_metadata_key(sb, secret);
+		if (err)
+			return err;
+
 		err = fscrypt_init_hkdf(&secret->hkdf, secret->raw,
 					secret->size);
 		if (err)
diff --git a/fs/crypto/metadata_crypt.c b/fs/crypto/metadata_crypt.c
new file mode 100644
index 000000000000..7e6044b21624
--- /dev/null
+++ b/fs/crypto/metadata_crypt.c
@@ -0,0 +1,303 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Metadata encryption support for fscrypt
+ *
+ * Copyright 2020 Google LLC
+ */
+
+#include <keys/user-type.h>
+#include <linux/blk-crypto.h>
+#include <linux/blkdev.h>
+#include <linux/buffer_head.h>
+#include <linux/sched/mm.h>
+#include <linux/slab.h>
+
+#include "fscrypt_private.h"
+
+/**
+ * fscrypt_mix_in_metadata_key() - Mix in the metadata crypt key with an fscrypt
+ *				   master key
+ * @sb: The superblock whose metadata_crypt_key to mix in
+ * @secret: The secret that needs to be mixed with the metadata_crypt_key
+ *
+ * Replaces @secret->raw with hkdf(key=metadata_crypt_key,
+ * info=HKDF_CONTEXT_MIX_METADATA_KEY|@secret->raw). As such,
+ * @secret->raw is at least as strong as the metadata_crypt_key.
+ *
+ * Returns 0 on success and a negative value on error;
+ */
+int fscrypt_mix_in_metadata_key(struct super_block *sb,
+				struct fscrypt_master_key_secret *secret)
+{
+	u8 orig_key[FSCRYPT_MAX_KEY_SIZE];
+	int err;
+
+	if (WARN_ON(secret->size > sizeof(orig_key)))
+		return -EINVAL;
+
+	if (!sb->s_metadata_hkdf)
+		return 0;
+
+	memcpy(orig_key, secret->raw, secret->size);
+	err = fscrypt_hkdf_expand(sb->s_metadata_hkdf,
+				  HKDF_CONTEXT_MIX_METADATA_KEY,
+				  orig_key, secret->size,
+				  secret->raw, secret->size);
+	memzero_explicit(orig_key, secret->size);
+	return err;
+}
+
+static int fscrypt_metadata_get_key_from_id(
+				u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],
+				unsigned int keysize,
+				u8 raw_key[FSCRYPT_MAX_KEY_SIZE])
+{
+	char description[FSCRYPT_KEY_DESC_PREFIX_SIZE +
+			 FSCRYPT_KEY_IDENTIFIER_SIZE * 2 + 1];
+	struct key *key;
+	const struct user_key_payload *ukp;
+	int err = -ENOKEY;
+
+	sprintf(description, "%s%*phN", FSCRYPT_KEY_DESC_PREFIX,
+		FSCRYPT_KEY_IDENTIFIER_SIZE, key_ident);
+
+	key = request_key(&key_type_logon, description, NULL);
+	if (IS_ERR(key)) {
+		fscrypt_warn(NULL, "Metadata key couldn't be found");
+		return PTR_ERR(key);
+	}
+
+	down_read(&key->sem);
+	ukp = user_key_payload_locked(key);
+
+	/* was the key revoked before we acquired its semaphore? */
+	if (!ukp) {
+		fscrypt_warn(NULL, "Metadata key was revoked");
+		goto out;
+	}
+
+	if (ukp->datalen != keysize) {
+		fscrypt_warn(NULL,
+			     "key with description '%s' has incorrect length (got %u bytes, need %u bytes)",
+			     key->description, ukp->datalen, keysize);
+		goto out;
+	}
+
+	memcpy(raw_key, ukp->data, keysize);
+	err = 0;
+
+out:
+	up_read(&key->sem);
+	key_put(key);
+
+	return err;
+}
+
+static bool fscrypt_metadata_mode_valid(int fscrypt_mode_num)
+{
+	return fscrypt_mode_num == FSCRYPT_MODE_AES_256_XTS ||
+	       fscrypt_mode_num == FSCRYPT_MODE_AES_128_CBC ||
+	       fscrypt_mode_num == FSCRYPT_MODE_ADIANTUM;
+}
+
+static int fscrypt_metadata_setup_hkdf(struct super_block *sb,
+				       u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],
+				       unsigned int keysize)
+{
+	u8 raw_key[FSCRYPT_MAX_KEY_SIZE];
+	u8 key_ident_computed[FSCRYPT_KEY_IDENTIFIER_SIZE];
+	int err;
+
+	err = fscrypt_metadata_get_key_from_id(key_ident, keysize, raw_key);
+	if (err)
+		return err;
+
+	sb->s_metadata_hkdf = kzalloc(sizeof(*sb->s_metadata_hkdf), GFP_KERNEL);
+	if (!sb->s_metadata_hkdf)
+		goto out_zero_key;
+
+	err = fscrypt_init_hkdf(sb->s_metadata_hkdf, raw_key, keysize);
+	if (err)
+		goto err_free_hkdf;
+
+	err = fscrypt_hkdf_expand(sb->s_metadata_hkdf,
+				  HKDF_CONTEXT_KEY_IDENTIFIER, NULL, 0,
+				  key_ident_computed,
+				  FSCRYPT_KEY_IDENTIFIER_SIZE);
+	if (err)
+		goto err_destroy_hkdf;
+
+	if (memcmp(key_ident, key_ident_computed, FSCRYPT_KEY_IDENTIFIER_SIZE)) {
+		err = -EINVAL;
+		fscrypt_warn(NULL,
+			     "Metadata encryption key did not have the correct key identifier. Rejecting the key.");
+		goto err_destroy_hkdf;
+	}
+
+	goto out_zero_key;
+
+err_destroy_hkdf:
+	fscrypt_destroy_hkdf(sb->s_metadata_hkdf);
+err_free_hkdf:
+	kfree(sb->s_metadata_hkdf);
+	sb->s_metadata_hkdf = NULL;
+out_zero_key:
+	memzero_explicit(raw_key, keysize);
+	return err;
+}
+
+/**
+ * fscrypt_setup_metadata_encryption() - prepare a super_block for metadata
+ *					 encryption
+ * @sb: The super_block to set up metadata encryption for
+ * @key_ident: The key identifier of a logon key to look for in the process
+ *	       subscribed keyrings.
+ * @fscrypt_mode_num: The FSCRYPT_MODE_* to use as the encryption algorithm.
+ * @fs_blk_bytes: The number of bytes required to represent fs block numbers.
+ *
+ * Return: 0 on success, negative number on error.
+ */
+int fscrypt_setup_metadata_encryption(struct super_block *sb,
+				u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],
+				int fscrypt_mode_num,
+				unsigned int fs_blk_bytes)
+{
+	int err = 0;
+	struct fscrypt_mode *fscrypt_mode;
+	u8 derived_metadata_key[FSCRYPT_MAX_KEY_SIZE];
+
+	if (!fscrypt_metadata_mode_valid(fscrypt_mode_num)) {
+		fscrypt_warn(NULL, "Invalid fscrypt mode %d specified for metadata encryption.",
+			     fscrypt_mode_num);
+		return -EOPNOTSUPP;
+	}
+
+	fscrypt_mode = &fscrypt_modes[fscrypt_mode_num];
+	fs_blk_bytes = DIV_ROUND_UP(fs_blk_bytes, 8);
+	if (fscrypt_mode->ivsize < fs_blk_bytes) {
+		fscrypt_warn(NULL, "The fscrypt mode only supports %d DUN bytes, but FS requires support for %d DUN bytes.",
+			     fscrypt_mode->ivsize, fs_blk_bytes);
+		return -EOPNOTSUPP;
+	}
+
+	err = fscrypt_metadata_setup_hkdf(sb, key_ident, fscrypt_mode->keysize);
+	if (err)
+		return err;
+
+	err = fscrypt_hkdf_expand(sb->s_metadata_hkdf,
+				  HKDF_CONTEXT_METADATA_ENC_KEY, NULL, 0,
+				  derived_metadata_key, fscrypt_mode->keysize);
+	if (err)
+		goto err_free_metadata_encryption;
+
+	sb->s_metadata_key = kzalloc(sizeof(*sb->s_metadata_key), GFP_KERNEL);
+	if (!sb->s_metadata_key) {
+		err = -ENOMEM;
+		goto err_free_metadata_encryption;
+	}
+
+	err = blk_crypto_init_key(sb->s_metadata_key, derived_metadata_key,
+				  fscrypt_mode->blk_crypto_mode,
+				  fs_blk_bytes, sb->s_blocksize);
+	if (err)
+		goto err_free_metadata_encryption;
+
+	err = blk_crypto_start_using_key(sb->s_metadata_key,
+					 bdev_get_queue(sb->s_bdev));
+	if (err)
+		goto err_free_metadata_encryption;
+
+	goto out;
+err_free_metadata_encryption:
+	fscrypt_free_metadata_encryption(sb);
+out:
+	memzero_explicit(derived_metadata_key, sizeof(derived_metadata_key));
+	return err;
+}
+EXPORT_SYMBOL_GPL(fscrypt_setup_metadata_encryption);
+
+/**
+ * fscrypt_metadata_crypt_prepare_all_devices() - prepare all devices used by
+ *					the filesystem for metadata encryption.
+ * @sb: The super_block whose devices to prepare
+ *
+ * This function should be called when the filesystem has determined all its
+ * devices. This might happen only after some initial setup, which is why
+ * this is a separate function from fscrypt_setup_metadata_encryption().
+ *
+ * Return: 0 on success, negative on error.
+ */
+int fscrypt_metadata_crypt_prepare_all_devices(struct super_block *sb)
+{
+	int num_devices;
+	int i;
+	struct request_queue *q;
+
+	if (!sb->s_metadata_key)
+		return 0;
+
+	num_devices = fscrypt_get_num_devices(sb);
+	for (i = 0; i < num_devices; i++) {
+		q = fscrypt_get_device(sb, i);
+		if (!q || blk_crypto_start_using_key(sb->s_metadata_key, q))
+			return -EOPNOTSUPP;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fscrypt_metadata_crypt_prepare_all_devices);
+
+/**
+ * fscrypt_free_metadata_encryption() - free metadata encryption fields in
+ *					super_block.
+ * @sb: The super_block to free metatdata encryption fields from
+ */
+void fscrypt_free_metadata_encryption(struct super_block *sb)
+{
+	int num_devices;
+	int i;
+	struct request_queue *q;
+
+	if (!sb->s_metadata_hkdf)
+		return;
+
+	fscrypt_destroy_hkdf(sb->s_metadata_hkdf);
+	kfree(sb->s_metadata_hkdf);
+	sb->s_metadata_hkdf = NULL;
+
+	if (!sb->s_metadata_key)
+		return;
+
+	num_devices = fscrypt_get_num_devices(sb);
+
+	for (i = 0; i < num_devices; i++) {
+		q = fscrypt_get_device(sb, i);
+		if (WARN_ON(!q))
+			continue;
+		blk_crypto_evict_key(q, sb->s_metadata_key);
+	}
+
+	kfree_sensitive(sb->s_metadata_key);
+	sb->s_metadata_key = NULL;
+}
+EXPORT_SYMBOL_GPL(fscrypt_free_metadata_encryption);
+
+/**
+ * fscrypt_metadata_crypt_bio() - Add metadata encryption context to bio.
+ *
+ * @bio: The bio to add the encryption context to
+ * @fsblk: The block number within the filesystem at which this bio starts
+ *	   reading/writing data.
+ * @sb: The superblock of the filesystem
+ * @gfp_mask: gfp_mask for bio_crypt_context allocation
+ */
+void fscrypt_metadata_crypt_bio(struct bio *bio, u64 fsblk,
+				struct super_block *sb, gfp_t gfp_mask)
+{
+	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE] = { 0 };
+
+	if (!sb->s_metadata_key)
+		return;
+
+	dun[0] = fsblk;
+	bio_crypt_set_ctx(bio, sb->s_metadata_key, dun, gfp_mask);
+}
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index f014c5e473a9..c473da5ee906 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -373,7 +373,7 @@ int ext4_mpage_readpages(struct inode *inode,
 			 */
 			bio = bio_alloc(GFP_KERNEL,
 				min_t(int, nr_pages, BIO_MAX_PAGES));
-			fscrypt_set_bio_crypt_ctx(bio, inode, next_block,
+			fscrypt_set_bio_crypt_ctx(bio, 0, inode, next_block,
 						  GFP_KERNEL);
 			ext4_set_bio_post_read_ctx(bio, inode, page->index);
 			bio_set_dev(bio, bdev);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index be4da52604ed..627164706029 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -470,7 +470,7 @@ static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 	 * read/write raw data without encryption.
 	 */
 	if (!fio || !fio->encrypted_page)
-		fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
+		fscrypt_set_bio_crypt_ctx(bio, 0, inode, first_idx, gfp_mask);
 }
 
 static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 8667d0cdc71e..93a97cfa585b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -68,6 +68,7 @@ struct fsverity_info;
 struct fsverity_operations;
 struct fs_context;
 struct fs_parameter_spec;
+struct fscrypt_hkdf;
 
 extern void __init inode_init(void);
 extern void __init inode_init_early(void);
@@ -1439,6 +1440,15 @@ struct super_block {
 	const struct fscrypt_operations	*s_cop;
 	struct key		*s_master_keys; /* master crypto keys in use */
 #endif
+#ifdef CONFIG_FS_ENCRYPTION_METADATA
+	/* HKDF initialized with the raw metadata key */
+	struct fscrypt_hkdf	*s_metadata_hkdf;
+	/*
+	 * Encryption key derived from raw metadata key (this is the encryption
+	 * key used to encrypt metadata)
+	 */
+	struct blk_crypto_key	*s_metadata_key;
+#endif
 #ifdef CONFIG_FS_VERITY
 	const struct fsverity_operations *s_vop;
 #endif
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a7d1af4932aa..bed89de57a0c 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -553,7 +553,7 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 
 bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode);
 
-void fscrypt_set_bio_crypt_ctx(struct bio *bio,
+void fscrypt_set_bio_crypt_ctx(struct bio *bio, u64 first_fsblk,
 			       const struct inode *inode, u64 first_lblk,
 			       gfp_t gfp_mask);
 
@@ -574,7 +574,7 @@ static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 	return false;
 }
 
-static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio,
+static inline void fscrypt_set_bio_crypt_ctx(struct bio *bio, u64 first_fsblk,
 					     const struct inode *inode,
 					     u64 first_lblk, gfp_t gfp_mask) { }
 
@@ -597,6 +597,48 @@ static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
 }
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
+/* metadata_crypt.c */
+#ifdef CONFIG_FS_ENCRYPTION_METADATA
+
+int fscrypt_setup_metadata_encryption(struct super_block *sb,
+				      u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],
+				      int fscrypt_mode_num,
+				      unsigned int fs_blk_bytes);
+
+int fscrypt_metadata_crypt_prepare_all_devices(struct super_block *sb);
+
+void fscrypt_free_metadata_encryption(struct super_block *sb);
+
+static inline bool fscrypt_metadata_crypted(struct super_block *sb)
+{
+	return sb->s_metadata_key;
+}
+
+#else /* CONFIG_FS_ENCRYPTION_METADATA */
+
+static inline int fscrypt_setup_metadata_encryption(struct super_block *sb,
+				u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],
+				int fscrypt_mode_num,
+				unsigned int fs_blk_bytes)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int
+fscrypt_metadata_crypt_prepare_all_devices(struct super_block *sb)
+{
+	return 0;
+}
+
+static inline void fscrypt_free_metadata_encryption(struct super_block *sb) { }
+
+static inline bool fscrypt_metadata_crypted(struct super_block *sb)
+{
+	return false;
+}
+
+#endif /* CONFIG_FS_ENCRYPTION_METADATA */
+
 /**
  * fscrypt_inode_uses_inline_crypto() - test whether an inode uses inline
  *					encryption
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
