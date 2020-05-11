Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AD01CE3C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 21:17:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYDvg-0002m1-Sw; Mon, 11 May 2020 19:17:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYDv1-0002k8-Ll
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aZNSd3cGLQBQ/5ZpXnj4a8Box4YYMJZkcD4DrGWEC7Q=; b=BylkEo0iB7Mm0I8ZAAgSexQegM
 xw2EmCKzm0kyPqerVfLa3Anf/VXyMxmP30mWuxLtufubb9DWh3xPy8fZ2I3lPwIBLkrtCHRzcKj9p
 7F0fvKI9PcGnOh12sz+68OHuDO8edF5Vxkg4g6VU/eBO6T3ZQAhmcXuLMj8RWinvDpQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aZNSd3cGLQBQ/5ZpXnj4a8Box4YYMJZkcD4DrGWEC7Q=; b=bVJeYRQIXRREZC120MfLEvR65V
 o9PBRindpQdN3SUeqc/r5QelIhr6otXBb6wVWC6r/LEc8mMB591i7amtzLo9TKVIxWsqaEEhv3M1K
 +FNY1rSn9YDTZQ2gaZbgZw/32pUboUAh7NZVg8OSGkYc1i6ueCQ8tG4i1ae8PjAC22QY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYDuz-009alo-G3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:16:51 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9BADF20720;
 Mon, 11 May 2020 19:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589224596;
 bh=TAU9eM3cu0PiSwiOYzAmwADuHK/5LAq42BdtCo2L/XY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vkk2Zs27VuEzn1bQQmvrFBC6BnzApsuE7LoB3/56Il4Rx5wiE7BXtZd7IfO24fBhP
 OBwkVHAGFr5HXlkCldny6OFQKT4mRD+ID526dMd2Z5u6SvAG1uZnDoFjXRIxMBXxnm
 oDVxBVqP+ZlnEDB5WQvHD/bnocI2HFLIi5Id3mgU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 11 May 2020 12:13:56 -0700
Message-Id: <20200511191358.53096-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511191358.53096-1-ebiggers@kernel.org>
References: <20200511191358.53096-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYDuz-009alo-G3
Subject: [f2fs-dev] [PATCH 1/3] fscrypt: fix all kerneldoc warnings
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Fix all kerneldoc warnings in fs/crypto/ and include/linux/fscrypt.h.
Most of these were due to missing documentation for function parameters.

Detected with:

    scripts/kernel-doc -v -none fs/crypto/*.{c,h} include/linux/fscrypt.h

This cleanup makes it possible to check new patches for kerneldoc
warnings without having to filter out all the existing ones.

For consistency, also adjust some function "brief descriptions" to
include the parentheses and to wrap at 80 characters.  (The latter
matches the checkpatch expectation.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c          |  9 +++++--
 fs/crypto/fname.c           | 52 +++++++++++++++++++++++++++----------
 fs/crypto/fscrypt_private.h |  4 +--
 fs/crypto/hooks.c           |  4 +--
 fs/crypto/keysetup.c        |  9 ++++---
 fs/crypto/policy.c          | 19 +++++++++++---
 include/linux/fscrypt.h     | 19 +++++++++-----
 7 files changed, 82 insertions(+), 34 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 1ecaac7ee3cb8e..40c2821a341e8e 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -54,6 +54,7 @@ struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
 
 /**
  * fscrypt_free_bounce_page() - free a ciphertext bounce page
+ * @bounce_page: the bounce page to free, or NULL
  *
  * Free a bounce page that was allocated by fscrypt_encrypt_pagecache_blocks(),
  * or by fscrypt_alloc_bounce_page() directly.
@@ -132,7 +133,8 @@ int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
 }
 
 /**
- * fscrypt_encrypt_pagecache_blocks() - Encrypt filesystem blocks from a pagecache page
+ * fscrypt_encrypt_pagecache_blocks() - Encrypt filesystem blocks from a
+ *					pagecache page
  * @page:      The locked pagecache page containing the block(s) to encrypt
  * @len:       Total size of the block(s) to encrypt.  Must be a nonzero
  *		multiple of the filesystem's block size.
@@ -222,7 +224,8 @@ int fscrypt_encrypt_block_inplace(const struct inode *inode, struct page *page,
 EXPORT_SYMBOL(fscrypt_encrypt_block_inplace);
 
 /**
- * fscrypt_decrypt_pagecache_blocks() - Decrypt filesystem blocks in a pagecache page
+ * fscrypt_decrypt_pagecache_blocks() - Decrypt filesystem blocks in a
+ *					pagecache page
  * @page:      The locked pagecache page containing the block(s) to decrypt
  * @len:       Total size of the block(s) to decrypt.  Must be a nonzero
  *		multiple of the filesystem's block size.
@@ -346,6 +349,8 @@ void fscrypt_msg(const struct inode *inode, const char *level,
 
 /**
  * fscrypt_init() - Set up for fs encryption.
+ *
+ * Return: 0 on success; -errno on failure
  */
 static int __init fscrypt_init(void)
 {
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 4c212442a8f7f1..fce3fa29f058e8 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -18,7 +18,7 @@
 #include <crypto/skcipher.h>
 #include "fscrypt_private.h"
 
-/**
+/*
  * struct fscrypt_nokey_name - identifier for directory entry when key is absent
  *
  * When userspace lists an encrypted directory without access to the key, the
@@ -105,9 +105,12 @@ static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
 
 /**
  * fscrypt_fname_encrypt() - encrypt a filename
- *
- * The output buffer must be at least as large as the input buffer.
- * Any extra space is filled with NUL padding before encryption.
+ * @inode: inode of the parent directory (for regular filenames)
+ *	   or of the symlink (for symlink targets)
+ * @iname: the filename to encrypt
+ * @out: (output) the encrypted filename
+ * @olen: size of the encrypted filename.  It must be at least @iname->len.
+ *	  Any extra space is filled with NUL padding before encryption.
  *
  * Return: 0 on success, -errno on failure
  */
@@ -157,8 +160,11 @@ int fscrypt_fname_encrypt(const struct inode *inode, const struct qstr *iname,
 
 /**
  * fname_decrypt() - decrypt a filename
- *
- * The caller must have allocated sufficient memory for the @oname string.
+ * @inode: inode of the parent directory (for regular filenames)
+ *	   or of the symlink (for symlink targets)
+ * @iname: the encrypted filename to decrypt
+ * @oname: (output) the decrypted filename.  The caller must have allocated
+ *	   enough space for this, e.g. using fscrypt_fname_alloc_buffer().
  *
  * Return: 0 on success, -errno on failure
  */
@@ -206,7 +212,10 @@ static const char lookup_table[65] =
 #define BASE64_CHARS(nbytes)	DIV_ROUND_UP((nbytes) * 4, 3)
 
 /**
- * base64_encode() -
+ * base64_encode() - base64-encode some bytes
+ * @src: the bytes to encode
+ * @len: number of bytes to encode
+ * @dst: (output) the base64-encoded string.  Not NUL-terminated.
  *
  * Encodes the input string using characters from the set [A-Za-z0-9+,].
  * The encoded string is roughly 4/3 times the size of the input string.
@@ -272,7 +281,12 @@ bool fscrypt_fname_encrypted_size(const struct inode *inode, u32 orig_len,
 }
 
 /**
- * fscrypt_fname_alloc_buffer - allocate a buffer for presented filenames
+ * fscrypt_fname_alloc_buffer() - allocate a buffer for presented filenames
+ * @inode: inode of the parent directory (for regular filenames)
+ *	   or of the symlink (for symlink targets)
+ * @max_encrypted_len: maximum length of encrypted filenames the buffer will be
+ *		       used to present
+ * @crypto_str: (output) buffer to allocate
  *
  * Allocate a buffer that is large enough to hold any decrypted or encoded
  * filename (null-terminated), for the given maximum encrypted filename length.
@@ -297,9 +311,10 @@ int fscrypt_fname_alloc_buffer(const struct inode *inode,
 EXPORT_SYMBOL(fscrypt_fname_alloc_buffer);
 
 /**
- * fscrypt_fname_free_buffer - free the buffer for presented filenames
+ * fscrypt_fname_free_buffer() - free a buffer for presented filenames
+ * @crypto_str: the buffer to free
  *
- * Free the buffer allocated by fscrypt_fname_alloc_buffer().
+ * Free a buffer that was allocated by fscrypt_fname_alloc_buffer().
  */
 void fscrypt_fname_free_buffer(struct fscrypt_str *crypto_str)
 {
@@ -311,10 +326,19 @@ void fscrypt_fname_free_buffer(struct fscrypt_str *crypto_str)
 EXPORT_SYMBOL(fscrypt_fname_free_buffer);
 
 /**
- * fscrypt_fname_disk_to_usr() - converts a filename from disk space to user
- * space
- *
- * The caller must have allocated sufficient memory for the @oname string.
+ * fscrypt_fname_disk_to_usr() - convert an encrypted filename to
+ *				 user-presentable form
+ * @inode: inode of the parent directory (for regular filenames)
+ *	   or of the symlink (for symlink targets)
+ * @hash: first part of the name's dirhash, if applicable.  This only needs to
+ *	  be provided if the filename is located in an indexed directory whose
+ *	  encryption key may be unavailable.  Not needed for symlink targets.
+ * @minor_hash: second part of the name's dirhash, if applicable
+ * @iname: encrypted filename to convert.  May also be "." or "..", which
+ *	   aren't actually encrypted.
+ * @oname: output buffer for the user-presentable filename.  The caller must
+ *	   have allocated enough space for this, e.g. using
+ *	   fscrypt_fname_alloc_buffer().
  *
  * If the key is available, we'll decrypt the disk name.  Otherwise, we'll
  * encode it for presentation in fscrypt_nokey_name format.
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index dbced2937ec895..f547094100be1e 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -43,7 +43,7 @@ struct fscrypt_context_v2 {
 	u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
 };
 
-/**
+/*
  * fscrypt_context - the encryption context of an inode
  *
  * This is the on-disk equivalent of an fscrypt_policy, stored alongside each
@@ -157,7 +157,7 @@ fscrypt_policy_flags(const union fscrypt_policy *policy)
 	BUG();
 }
 
-/**
+/*
  * For encrypted symlinks, the ciphertext length is stored at the beginning
  * of the string in little-endian format.
  */
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 5ef861742921c3..09fb8aa0f2e930 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -10,7 +10,7 @@
 #include "fscrypt_private.h"
 
 /**
- * fscrypt_file_open - prepare to open a possibly-encrypted regular file
+ * fscrypt_file_open() - prepare to open a possibly-encrypted regular file
  * @inode: the inode being opened
  * @filp: the struct file being set up
  *
@@ -262,7 +262,7 @@ int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 EXPORT_SYMBOL_GPL(__fscrypt_encrypt_symlink);
 
 /**
- * fscrypt_get_symlink - get the target of an encrypted symlink
+ * fscrypt_get_symlink() - get the target of an encrypted symlink
  * @inode: the symlink inode
  * @caddr: the on-disk contents of the symlink
  * @max_size: size of @caddr buffer
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 302375e9f719eb..edc4590c69f083 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -475,7 +475,8 @@ int fscrypt_get_encryption_info(struct inode *inode)
 EXPORT_SYMBOL(fscrypt_get_encryption_info);
 
 /**
- * fscrypt_put_encryption_info - free most of an inode's fscrypt data
+ * fscrypt_put_encryption_info() - free most of an inode's fscrypt data
+ * @inode: an inode being evicted
  *
  * Free the inode's fscrypt_info.  Filesystems must call this when the inode is
  * being evicted.  An RCU grace period need not have elapsed yet.
@@ -488,7 +489,8 @@ void fscrypt_put_encryption_info(struct inode *inode)
 EXPORT_SYMBOL(fscrypt_put_encryption_info);
 
 /**
- * fscrypt_free_inode - free an inode's fscrypt data requiring RCU delay
+ * fscrypt_free_inode() - free an inode's fscrypt data requiring RCU delay
+ * @inode: an inode being freed
  *
  * Free the inode's cached decrypted symlink target, if any.  Filesystems must
  * call this after an RCU grace period, just before they free the inode.
@@ -503,7 +505,8 @@ void fscrypt_free_inode(struct inode *inode)
 EXPORT_SYMBOL(fscrypt_free_inode);
 
 /**
- * fscrypt_drop_inode - check whether the inode's master key has been removed
+ * fscrypt_drop_inode() - check whether the inode's master key has been removed
+ * @inode: an inode being considered for eviction
  *
  * Filesystems supporting fscrypt must call this from their ->drop_inode()
  * method so that encrypted inodes are evicted as soon as they're no longer in
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 10ccf945020ce5..0a95537fcef9a1 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -16,7 +16,9 @@
 #include "fscrypt_private.h"
 
 /**
- * fscrypt_policies_equal - check whether two encryption policies are the same
+ * fscrypt_policies_equal() - check whether two encryption policies are the same
+ * @policy1: the first policy
+ * @policy2: the second policy
  *
  * Return: %true if equal, else %false
  */
@@ -170,7 +172,9 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 }
 
 /**
- * fscrypt_supported_policy - check whether an encryption policy is supported
+ * fscrypt_supported_policy() - check whether an encryption policy is supported
+ * @policy_u: the encryption policy
+ * @inode: the inode on which the policy will be used
  *
  * Given an encryption policy, check whether all its encryption modes and other
  * settings are supported by this kernel on the given inode.  (But we don't
@@ -192,7 +196,10 @@ bool fscrypt_supported_policy(const union fscrypt_policy *policy_u,
 }
 
 /**
- * fscrypt_new_context_from_policy - create a new fscrypt_context from a policy
+ * fscrypt_new_context_from_policy() - create a new fscrypt_context from
+ *				       an fscrypt_policy
+ * @ctx_u: output context
+ * @policy_u: input policy
  *
  * Create an fscrypt_context for an inode that is being assigned the given
  * encryption policy.  A new nonce is randomly generated.
@@ -242,7 +249,11 @@ static int fscrypt_new_context_from_policy(union fscrypt_context *ctx_u,
 }
 
 /**
- * fscrypt_policy_from_context - convert an fscrypt_context to an fscrypt_policy
+ * fscrypt_policy_from_context() - convert an fscrypt_context to
+ *				   an fscrypt_policy
+ * @policy_u: output policy
+ * @ctx_u: input context
+ * @ctx_size: size of input context in bytes
  *
  * Given an fscrypt_context, build the corresponding fscrypt_policy.
  *
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e3c2d2a155250a..cb2c41f8dfdee7 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -75,6 +75,7 @@ static inline bool fscrypt_has_encryption_key(const struct inode *inode)
 /**
  * fscrypt_needs_contents_encryption() - check whether an inode needs
  *					 contents encryption
+ * @inode: the inode to check
  *
  * Return: %true iff the inode is an encrypted regular file and the kernel was
  * built with fscrypt support.
@@ -504,7 +505,7 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 #endif	/* !CONFIG_FS_ENCRYPTION */
 
 /**
- * fscrypt_require_key - require an inode's encryption key
+ * fscrypt_require_key() - require an inode's encryption key
  * @inode: the inode we need the key for
  *
  * If the inode is encrypted, set up its encryption key if not already done.
@@ -530,7 +531,8 @@ static inline int fscrypt_require_key(struct inode *inode)
 }
 
 /**
- * fscrypt_prepare_link - prepare to link an inode into a possibly-encrypted directory
+ * fscrypt_prepare_link() - prepare to link an inode into a possibly-encrypted
+ *			    directory
  * @old_dentry: an existing dentry for the inode being linked
  * @dir: the target directory
  * @dentry: negative dentry for the target filename
@@ -557,7 +559,8 @@ static inline int fscrypt_prepare_link(struct dentry *old_dentry,
 }
 
 /**
- * fscrypt_prepare_rename - prepare for a rename between possibly-encrypted directories
+ * fscrypt_prepare_rename() - prepare for a rename between possibly-encrypted
+ *			      directories
  * @old_dir: source directory
  * @old_dentry: dentry for source file
  * @new_dir: target directory
@@ -590,7 +593,8 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
 }
 
 /**
- * fscrypt_prepare_lookup - prepare to lookup a name in a possibly-encrypted directory
+ * fscrypt_prepare_lookup() - prepare to lookup a name in a possibly-encrypted
+ *			      directory
  * @dir: directory being searched
  * @dentry: filename being looked up
  * @fname: (output) the name to use to search the on-disk directory
@@ -623,7 +627,8 @@ static inline int fscrypt_prepare_lookup(struct inode *dir,
 }
 
 /**
- * fscrypt_prepare_setattr - prepare to change a possibly-encrypted inode's attributes
+ * fscrypt_prepare_setattr() - prepare to change a possibly-encrypted inode's
+ *			       attributes
  * @dentry: dentry through which the inode is being changed
  * @attr: attributes to change
  *
@@ -648,7 +653,7 @@ static inline int fscrypt_prepare_setattr(struct dentry *dentry,
 }
 
 /**
- * fscrypt_prepare_symlink - prepare to create a possibly-encrypted symlink
+ * fscrypt_prepare_symlink() - prepare to create a possibly-encrypted symlink
  * @dir: directory in which the symlink is being created
  * @target: plaintext symlink target
  * @len: length of @target excluding null terminator
@@ -687,7 +692,7 @@ static inline int fscrypt_prepare_symlink(struct inode *dir,
 }
 
 /**
- * fscrypt_encrypt_symlink - encrypt the symlink target if needed
+ * fscrypt_encrypt_symlink() - encrypt the symlink target if needed
  * @inode: symlink inode
  * @target: plaintext symlink target
  * @len: length of @target excluding null terminator
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
