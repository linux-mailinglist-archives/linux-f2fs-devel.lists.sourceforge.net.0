Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A979228C67
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 01:01:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jy1G6-0002qF-En; Tue, 21 Jul 2020 23:01:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jy1G4-0002q0-QT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cQP1rrwn96wGq2CH+ioYXuMzwryRVrSkJXn+De2N/z8=; b=G93HmOk0jiuOS4m3xq2BfWqXeq
 yF7CdOqeqz7tYI0LTzst08Vlhrl5NsvMV6sBX4/anKxSB55EloPfCC1c1WJyk3Dg8B2uA1aUxghBU
 V97JmMExMpkZdFyH4Jkcz/JbpoeZJ0U+qFG4BMRjAGC+QtZ7FXmAVq91YFl1NxQ9cLsw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cQP1rrwn96wGq2CH+ioYXuMzwryRVrSkJXn+De2N/z8=; b=Njw9wZ4CXq4pSnqAecw5s0KdqD
 uFLAabq4pf+VJLYjYYM0xrLBjJS3LNCD9mGaYX7dh7kWOtdbtuEKm6VfeU7c5HRzoKhxsFvQ5qjS8
 Uc7ZxeqxJCAOyTbLpK8vVmqkAAdf+MAuFao88MM7abk2v8+8DhO1R+dPi+qOZrl5wHC8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jy1G3-00Cile-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:12 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED9DF2073A;
 Tue, 21 Jul 2020 23:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595372459;
 bh=i10MleHpPiD+UlqvEBbCBk40R3U1eodRZ9LmKRTef48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2UrKh8jVKP4YqMR+ott79ppUtxS+O7gHH9ShvxNTAuNFBZmTmqlCG5CWy9w79n+Cg
 XiIpP7yNESIvQqfvRZiaQZxEVS7x37eKyEqXzXOksAXo5PoR6DPlVSMqDfBnF9DnxQ
 6p9F6n2gtDZpXH1niAqfrcTbH+cjpR+CZkOdM19g=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 21 Jul 2020 15:59:16 -0700
Message-Id: <20200721225920.114347-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721225920.114347-1-ebiggers@kernel.org>
References: <20200721225920.114347-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jy1G3-00Cile-Jr
Subject: [f2fs-dev] [PATCH 1/5] fscrypt: switch fscrypt_do_sha256() to use
 the SHA-256 library
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Daniel Rosenberg <drosen@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

fscrypt_do_sha256() is only used for hashing encrypted filenames to
create no-key tokens, which isn't performance-critical.  Therefore a C
implementation of SHA-256 is sufficient.

Also, the logic to create no-key tokens is always potentially needed.
This differs from fscrypt's other dependencies on crypto API algorithms,
which are conditionally needed depending on what encryption policies
userspace is using.  Therefore, for fscrypt there isn't much benefit to
allowing SHA-256 to be a loadable module.

So, make fscrypt_do_sha256() use the SHA-256 library instead of the
crypto_shash API.  This is much simpler, since it avoids having to
implement one-time-init (which is hard to do correctly, and in fact was
implemented incorrectly) and handle failures to allocate the
crypto_shash object.

Fixes: edc440e3d27f ("fscrypt: improve format of no-key names")
Cc: Daniel Rosenberg <drosen@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/Kconfig |  2 +-
 fs/crypto/fname.c | 41 ++++++++++-------------------------------
 2 files changed, 11 insertions(+), 32 deletions(-)

diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index f1f11a6228eb..a5f5c30368a2 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -4,6 +4,7 @@ config FS_ENCRYPTION
 	select CRYPTO
 	select CRYPTO_HASH
 	select CRYPTO_SKCIPHER
+	select CRYPTO_LIB_SHA256
 	select KEYS
 	help
 	  Enable encryption of files and directories.  This
@@ -21,7 +22,6 @@ config FS_ENCRYPTION_ALGS
 	select CRYPTO_CTS
 	select CRYPTO_ECB
 	select CRYPTO_HMAC
-	select CRYPTO_SHA256
 	select CRYPTO_SHA512
 	select CRYPTO_XTS
 
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index d828e3df898b..011830f84d8d 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -61,30 +61,13 @@ struct fscrypt_nokey_name {
  */
 #define FSCRYPT_NOKEY_NAME_MAX	offsetofend(struct fscrypt_nokey_name, sha256)
 
-static struct crypto_shash *sha256_hash_tfm;
-
-static int fscrypt_do_sha256(const u8 *data, unsigned int data_len, u8 *result)
+static void fscrypt_do_sha256(const u8 *data, unsigned int data_len, u8 *result)
 {
-	struct crypto_shash *tfm = READ_ONCE(sha256_hash_tfm);
-
-	if (unlikely(!tfm)) {
-		struct crypto_shash *prev_tfm;
-
-		tfm = crypto_alloc_shash("sha256", 0, 0);
-		if (IS_ERR(tfm)) {
-			fscrypt_err(NULL,
-				    "Error allocating SHA-256 transform: %ld",
-				    PTR_ERR(tfm));
-			return PTR_ERR(tfm);
-		}
-		prev_tfm = cmpxchg(&sha256_hash_tfm, NULL, tfm);
-		if (prev_tfm) {
-			crypto_free_shash(tfm);
-			tfm = prev_tfm;
-		}
-	}
+	struct sha256_state sctx;
 
-	return crypto_shash_tfm_digest(tfm, data, data_len, result);
+	sha256_init(&sctx);
+	sha256_update(&sctx, data, data_len);
+	sha256_final(&sctx, result);
 }
 
 static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
@@ -349,7 +332,6 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 	const struct qstr qname = FSTR_TO_QSTR(iname);
 	struct fscrypt_nokey_name nokey_name;
 	u32 size; /* size of the unencoded no-key name */
-	int err;
 
 	if (fscrypt_is_dot_dotdot(&qname)) {
 		oname->name[0] = '.';
@@ -387,11 +369,9 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 	} else {
 		memcpy(nokey_name.bytes, iname->name, sizeof(nokey_name.bytes));
 		/* Compute strong hash of remaining part of name. */
-		err = fscrypt_do_sha256(&iname->name[sizeof(nokey_name.bytes)],
-					iname->len - sizeof(nokey_name.bytes),
-					nokey_name.sha256);
-		if (err)
-			return err;
+		fscrypt_do_sha256(&iname->name[sizeof(nokey_name.bytes)],
+				  iname->len - sizeof(nokey_name.bytes),
+				  nokey_name.sha256);
 		size = FSCRYPT_NOKEY_NAME_MAX;
 	}
 	oname->len = base64_encode((const u8 *)&nokey_name, size, oname->name);
@@ -530,9 +510,8 @@ bool fscrypt_match_name(const struct fscrypt_name *fname,
 		return false;
 	if (memcmp(de_name, nokey_name->bytes, sizeof(nokey_name->bytes)))
 		return false;
-	if (fscrypt_do_sha256(&de_name[sizeof(nokey_name->bytes)],
-			      de_name_len - sizeof(nokey_name->bytes), sha256))
-		return false;
+	fscrypt_do_sha256(&de_name[sizeof(nokey_name->bytes)],
+			  de_name_len - sizeof(nokey_name->bytes), sha256);
 	return !memcmp(sha256, nokey_name->sha256, sizeof(sha256));
 }
 EXPORT_SYMBOL_GPL(fscrypt_match_name);
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
