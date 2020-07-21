Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 745EC228C64
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 01:01:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jy1Fz-0007fH-Dl; Tue, 21 Jul 2020 23:01:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jy1Fy-0007f9-01
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HvcLflWjuqNtzV0xZg7g9BoATtXXHpLygyrp2udaDaQ=; b=OO+0BSbyhB+k+m3mDGju5LVD7n
 bc+ywl0JcT3DeEMk+ZUUzr1W4Gn8hbg02cjqMadMzUOXmuMHZ/QRc1c1tf+XjFEJMzMtsqDin1sWd
 BVaxrqZsu9hnnV4JNvN2Ofck5vAGkfyNOJ9jZKb0wrtrYtl3JY0wvktBvBXXavm9weJ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HvcLflWjuqNtzV0xZg7g9BoATtXXHpLygyrp2udaDaQ=; b=a/vKi8A+o4M0eEhIRNeniln0E8
 Saga0VnnJN0ZZ5Ypqv1t8bsD/qMRhotH2bcq/OnFX55yKhm404k/pHSpsl315IIseSYYXnmXwocT7
 L2r/baaAPjzJqO2gQYzdHPTnD0dUmqKPJudAvmYBwEtWv1Uov7yObWDEaAJztXw08lKY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jy1Fw-00Cikw-PY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 23:01:05 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47D762077D;
 Tue, 21 Jul 2020 23:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595372459;
 bh=+JzszfrnukA7rp34K4rJ987oveUxD8x6PQPTeTcR6H0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UD7wGV6o8j/007/nURLRwUgh3FtROGYfwXlRmz2E+hWc/ErhCaZg7QhEk0J6rE/0G
 BJHPNkKnY4vns9lZKCHYAn0AyRVj/MdMod0spy99kT4HspV3dOEXWcfNm82loSvY4+
 Kl/7BHiom0gFkPFuluRnlrqwmYTBIXRPyd2QkAtk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 21 Jul 2020 15:59:17 -0700
Message-Id: <20200721225920.114347-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200721225920.114347-1-ebiggers@kernel.org>
References: <20200721225920.114347-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.3 (/)
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
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jy1Fw-00Cikw-PY
Subject: [f2fs-dev] [PATCH 2/5] fscrypt: use smp_load_acquire() for
 fscrypt_prepared_key
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
Cc: linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Normally smp_store_release() or cmpxchg_release() is paired with
smp_load_acquire().  Sometimes smp_load_acquire() can be replaced with
the more lightweight READ_ONCE().  However, for this to be safe, all the
published memory must only be accessed in a way that involves the
pointer itself.  This may not be the case if allocating the object also
involves initializing a static or global variable, for example.

fscrypt_prepared_key includes a pointer to a crypto_skcipher object,
which is internal to and is allocated by the crypto subsystem.  By using
READ_ONCE() for it, we're relying on internal implementation details of
the crypto subsystem.

Remove this fragile assumption by using smp_load_acquire() instead.

(Note: I haven't seen any real-world problems here.  This change is just
fixing the code to be guaranteed correct and less fragile.)

Fixes: 5fee36095cda ("fscrypt: add inline encryption support")
Cc: Satya Tangirala <satyat@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 15 +++++++++------
 fs/crypto/inline_crypt.c    |  6 ++++--
 fs/crypto/keysetup.c        |  6 ++++--
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index bc1a3fcd45ed..8117a61b6f55 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -351,13 +351,16 @@ fscrypt_is_key_prepared(struct fscrypt_prepared_key *prep_key,
 			const struct fscrypt_info *ci)
 {
 	/*
-	 * The READ_ONCE() here pairs with the smp_store_release() in
-	 * fscrypt_prepare_key().  (This only matters for the per-mode keys,
-	 * which are shared by multiple inodes.)
+	 * The two smp_load_acquire()'s here pair with the smp_store_release()'s
+	 * in fscrypt_prepare_inline_crypt_key() and fscrypt_prepare_key().
+	 * I.e., in some cases (namely, if this prep_key is a per-mode
+	 * encryption key) another task can publish blk_key or tfm concurrently,
+	 * executing a RELEASE barrier.  We need to use smp_load_acquire() here
+	 * to safely ACQUIRE the memory the other task published.
 	 */
 	if (fscrypt_using_inline_encryption(ci))
-		return READ_ONCE(prep_key->blk_key) != NULL;
-	return READ_ONCE(prep_key->tfm) != NULL;
+		return smp_load_acquire(&prep_key->blk_key) != NULL;
+	return smp_load_acquire(&prep_key->tfm) != NULL;
 }
 
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
@@ -391,7 +394,7 @@ static inline bool
 fscrypt_is_key_prepared(struct fscrypt_prepared_key *prep_key,
 			const struct fscrypt_info *ci)
 {
-	return READ_ONCE(prep_key->tfm) != NULL;
+	return smp_load_acquire(&prep_key->tfm) != NULL;
 }
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index d7aecadf33c1..dfb06375099a 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -176,8 +176,10 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 		}
 	}
 	/*
-	 * Pairs with READ_ONCE() in fscrypt_is_key_prepared().  (Only matters
-	 * for the per-mode keys, which are shared by multiple inodes.)
+	 * Pairs with the smp_load_acquire() in fscrypt_is_key_prepared().
+	 * I.e., here we publish ->blk_key with a RELEASE barrier so that
+	 * concurrent tasks can ACQUIRE it.  Note that this concurrency is only
+	 * possible for per-mode keys, not for per-file keys.
 	 */
 	smp_store_release(&prep_key->blk_key, blk_key);
 	return 0;
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 22a94b18fe70..7f85fc645602 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -129,8 +129,10 @@ int fscrypt_prepare_key(struct fscrypt_prepared_key *prep_key,
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 	/*
-	 * Pairs with READ_ONCE() in fscrypt_is_key_prepared().  (Only matters
-	 * for the per-mode keys, which are shared by multiple inodes.)
+	 * Pairs with the smp_load_acquire() in fscrypt_is_key_prepared().
+	 * I.e., here we publish ->tfm with a RELEASE barrier so that
+	 * concurrent tasks can ACQUIRE it.  Note that this concurrency is only
+	 * possible for per-mode keys, not for per-file keys.
 	 */
 	smp_store_release(&prep_key->tfm, tfm);
 	return 0;
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
