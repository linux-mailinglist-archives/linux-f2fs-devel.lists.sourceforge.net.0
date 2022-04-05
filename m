Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C944F208E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Apr 2022 03:11:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nbXiu-0003mI-8a; Tue, 05 Apr 2022 01:11:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nbXis-0003mC-GW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Apr 2022 01:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h2+clEchGnl7KgpNymuTbyFTJ1ZkabSL+OiSVkhHdso=; b=ZFEzMK4JW73YzE7Xyhcos0ALIg
 jZ77I9JwEVuQZeAqHsHpsxkJ/uS8EuDf34LIYFiyQEMDOERHn5ydeHznWvCEepCqPOf9R3YlNQVcX
 q/5fuDq9EF0Gfx29psgnqXPuDcDDQAF8bakt2xeNbyyA9yKOD73E1NbNhQ+zmiH/fQuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h2+clEchGnl7KgpNymuTbyFTJ1ZkabSL+OiSVkhHdso=; b=A
 PXAJsgEw9cKCLw51uPsCYEm7zTSh8upBxZbRoAZklvCAVD4J1IUaUXWGzuVCapvcWPyfG4roCB+C+
 ai1S3MEoRtfuW9eIEiBmNSHlAVU30spdTzLVN/fhxDcV64qiY5jrHlp8LMg40F/w0TW0GSAguBwX9
 i775nLaAdHlQD1dg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nbXim-0001R0-3U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Apr 2022 01:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6DC35CE172D;
 Tue,  5 Apr 2022 01:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5985C2BBE4;
 Tue,  5 Apr 2022 01:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649121043;
 bh=/wQGv+a5YNqAzNePjyG4n29JhJYDL+Zyw5nRut7cPrc=;
 h=From:To:Cc:Subject:Date:From;
 b=q8VfEa/oASHdKAkWs2vcgyr8IFyfZpgeO+2YxRec8fu1S5I/16C+2g1X8fOEDJ/dB
 64eOp+fLrNCiX4pmDDz89Fvaz28wO5peHW1tvH8Q+ANFh8+b3JSAnWgTGSQNUnuMfY
 GvDS3RbRdDy3f0v35lJ6CsuXQxnlXMq+uHCcECfkLY8apdfr3xbR7Nrm4TC6erTq1u
 x8aKSIeDPdXmMZqU0KAZEKjtNJN/2enPWNfDMlHiU3yzn+DlIZORiMljEtv48rXNZN
 +xS+ZQcGnl+E3Z37rSp9+BvQxGB7G7gIziWS54dIpEFGfYRYNpyU3TlXt9kBNrnKtT
 rjU1AZVFsuHyQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  4 Apr 2022 18:09:14 -0700
Message-Id: <20220405010914.18519-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> FS_CRYPTO_BLOCK_SIZE
 is neither the filesystem block size nor the granularity of encryption. Rather,
 it defines two logically separate constraints that both arise from the block
 size of the AES cipher [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nbXim-0001R0-3U
Subject: [f2fs-dev] [PATCH] fscrypt: split up FS_CRYPTO_BLOCK_SIZE
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
Cc: ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

FS_CRYPTO_BLOCK_SIZE is neither the filesystem block size nor the
granularity of encryption.  Rather, it defines two logically separate
constraints that both arise from the block size of the AES cipher:

- The alignment required for the lengths of file contents blocks
- The minimum input/output length for the filenames encryption modes

Since there are way too many things called the "block size", and the
connection with the AES block size is not easily understood, split
FS_CRYPTO_BLOCK_SIZE into two constants FSCRYPT_CONTENTS_ALIGNMENT and
FSCRYPT_FNAME_MIN_MSG_LEN that more clearly describe what they are.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c      | 10 +++++-----
 fs/crypto/fname.c       | 11 +++++++++--
 fs/ubifs/ubifs.h        |  2 +-
 include/linux/fscrypt.h | 12 +++++++++++-
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 526a4c1bed994..e78be66bbf015 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -113,7 +113,7 @@ int fscrypt_crypt_block(const struct inode *inode, fscrypt_direction_t rw,
 
 	if (WARN_ON_ONCE(len <= 0))
 		return -EINVAL;
-	if (WARN_ON_ONCE(len % FS_CRYPTO_BLOCK_SIZE != 0))
+	if (WARN_ON_ONCE(len % FSCRYPT_CONTENTS_ALIGNMENT != 0))
 		return -EINVAL;
 
 	fscrypt_generate_iv(&iv, lblk_num, ci);
@@ -213,8 +213,8 @@ EXPORT_SYMBOL(fscrypt_encrypt_pagecache_blocks);
  * fscrypt_encrypt_block_inplace() - Encrypt a filesystem block in-place
  * @inode:     The inode to which this block belongs
  * @page:      The page containing the block to encrypt
- * @len:       Size of block to encrypt.  Doesn't need to be a multiple of the
- *		fs block size, but must be a multiple of FS_CRYPTO_BLOCK_SIZE.
+ * @len:       Size of block to encrypt.  This must be a multiple of
+ *		FSCRYPT_CONTENTS_ALIGNMENT.
  * @offs:      Byte offset within @page at which the block to encrypt begins
  * @lblk_num:  Filesystem logical block number of the block, i.e. the 0-based
  *		number of the block within the file
@@ -283,8 +283,8 @@ EXPORT_SYMBOL(fscrypt_decrypt_pagecache_blocks);
  * fscrypt_decrypt_block_inplace() - Decrypt a filesystem block in-place
  * @inode:     The inode to which this block belongs
  * @page:      The page containing the block to decrypt
- * @len:       Size of block to decrypt.  Doesn't need to be a multiple of the
- *		fs block size, but must be a multiple of FS_CRYPTO_BLOCK_SIZE.
+ * @len:       Size of block to decrypt.  This must be a multiple of
+ *		FSCRYPT_CONTENTS_ALIGNMENT.
  * @offs:      Byte offset within @page at which the block to decrypt begins
  * @lblk_num:  Filesystem logical block number of the block, i.e. the 0-based
  *		number of the block within the file
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index a9be4bc74a94a..14e0ef5e9a20a 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -18,6 +18,13 @@
 #include <crypto/skcipher.h>
 #include "fscrypt_private.h"
 
+/*
+ * The minimum message length (input and output length), in bytes, for all
+ * filenames encryption modes.  Filenames shorter than this will be zero-padded
+ * before being encrypted.
+ */
+#define FSCRYPT_FNAME_MIN_MSG_LEN 16
+
 /*
  * struct fscrypt_nokey_name - identifier for directory entry when key is absent
  *
@@ -267,7 +274,7 @@ bool fscrypt_fname_encrypted_size(const union fscrypt_policy *policy,
 
 	if (orig_len > max_len)
 		return false;
-	encrypted_len = max(orig_len, (u32)FS_CRYPTO_BLOCK_SIZE);
+	encrypted_len = max_t(u32, orig_len, FSCRYPT_FNAME_MIN_MSG_LEN);
 	encrypted_len = round_up(encrypted_len, padding);
 	*encrypted_len_ret = min(encrypted_len, max_len);
 	return true;
@@ -350,7 +357,7 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 		return 0;
 	}
 
-	if (iname->len < FS_CRYPTO_BLOCK_SIZE)
+	if (iname->len < FSCRYPT_FNAME_MIN_MSG_LEN)
 		return -EUCLEAN;
 
 	if (fscrypt_has_encryption_key(inode))
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 008fa46ef61e7..7d6d2f152e039 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -132,7 +132,7 @@
 #define WORST_COMPR_FACTOR 2
 
 #ifdef CONFIG_FS_ENCRYPTION
-#define UBIFS_CIPHER_BLOCK_SIZE FS_CRYPTO_BLOCK_SIZE
+#define UBIFS_CIPHER_BLOCK_SIZE FSCRYPT_CONTENTS_ALIGNMENT
 #else
 #define UBIFS_CIPHER_BLOCK_SIZE 0
 #endif
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 50d92d805bd8c..efc7f96e5e26b 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -18,7 +18,17 @@
 #include <linux/slab.h>
 #include <uapi/linux/fscrypt.h>
 
-#define FS_CRYPTO_BLOCK_SIZE		16
+/*
+ * The lengths of all file contents blocks must be divisible by this value.
+ * This is needed to ensure that all contents encryption modes will work, as
+ * some of the supported modes don't support arbitrarily byte-aligned messages.
+ *
+ * Since the needed alignment is 16 bytes, most filesystems will meet this
+ * requirement naturally, as typical block sizes are powers of 2.  However, if a
+ * filesystem can generate arbitrarily byte-aligned block lengths (e.g., via
+ * compression), then it will need to pad to this alignment before encryption.
+ */
+#define FSCRYPT_CONTENTS_ALIGNMENT 16
 
 union fscrypt_policy;
 struct fscrypt_info;
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
