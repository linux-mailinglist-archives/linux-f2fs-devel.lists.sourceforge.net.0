Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D40CF50057A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Apr 2022 07:34:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nes7o-00013M-5s; Thu, 14 Apr 2022 05:34:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nes7n-00013G-4k
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 05:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZedbBJK8YIqHkQj6kcUxEVSEtBhPQW3wQmUiWHd49KU=; b=mFdbooDb+QoNhLbV4BBZwb2Pb0
 jmmPeasbcgkjZQmQ1ru18+PH4gNnggCVhchQa77hndW/rNqDkiLik/0Yh3iUha2aS58hbEfSlNO03
 QSr9ZavrSIrGBlvC//vcCd4M4GyEPhhvRmqcEmGIylVnlDFz0HPvPFiSuuPfuzYAtHsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZedbBJK8YIqHkQj6kcUxEVSEtBhPQW3wQmUiWHd49KU=; b=B
 yaD6HaQTHhN6GqfxF/1NIgyvSn7RZ3I/2ZOE/QUWRT9H1N6vPBE4KSPHJ6OpwWz2JSqc+ERvKUZVe
 l5aSe3YUf1ReUPEnX79eCnHVQ0RieN5LW8ovLu0Yd6U/vuq5PlCVJBO2MV5RLyuF1H9whhyX2wPzg
 w3TlVO8zbmFLpJEM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nes7k-0002qa-TR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Apr 2022 05:34:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80B0261D2E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Apr 2022 05:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFABC385A1;
 Thu, 14 Apr 2022 05:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649914466;
 bh=wHbFG3DggZ5vxAeshgXbgApNdQmT+w1qK86JQDvki8E=;
 h=From:To:Cc:Subject:Date:From;
 b=fHniNMHUCqyzPkzAsSGFbtjmt6AjfV14lpNnO97SL1jR349g/X0gEpW/z11V6Sl/w
 ZVQp4EWGIFDMLMEKxR8PKB182HFzETU+w5CJA+B3L9eF39VR6PSLwcI0xkCZfij45d
 043nWiH4sdCuL6LOsGlI+YnhuwZXPFxOV87EFACKHwaN1R+jBo96JAnxhQTug0nLGO
 /7dgWqE5NdtYSyGK1eCwfMfyvXXRrhkGC93S00GUyPzDLpmybfeDAQOP62oxcamx2g
 gKa3xHucGV/ub9ESxIKFhL5LItIrQImq+W7vAYOdlGE1Hl4g+iDXhz2C0OpwaOtZTi
 ge7kYdo7qebAA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 13 Apr 2022 22:34:15 -0700
Message-Id: <20220414053415.158986-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> When inline
 encryption
 is used, the usual message "fscrypt: AES-256-XTS using implementation <impl>"
 doesn't appear in the kernel log. Add a similar message for the blk-crypto
 case that indicates that [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nes7k-0002qa-TR
Subject: [f2fs-dev] [PATCH] fscrypt: log when starting to use inline
 encryption
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

When inline encryption is used, the usual message "fscrypt: AES-256-XTS
using implementation <impl>" doesn't appear in the kernel log.  Add a
similar message for the blk-crypto case that indicates that inline
encryption was used, and whether blk-crypto-fallback was used or not.
This can be useful for debugging performance problems.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |  4 +++-
 fs/crypto/inline_crypt.c    | 33 ++++++++++++++++++++++++++++++++-
 fs/crypto/keysetup.c        |  2 +-
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 5b0a9e6478b5d..33f08f1b1974e 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -561,7 +561,9 @@ struct fscrypt_mode {
 	int keysize;		/* key size in bytes */
 	int security_strength;	/* security strength in bytes */
 	int ivsize;		/* IV size in bytes */
-	int logged_impl_name;
+	int logged_cryptoapi_impl;
+	int logged_blk_crypto_native;
+	int logged_blk_crypto_fallback;
 	enum blk_crypto_mode_num blk_crypto_mode;
 };
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 93c2ca8580923..90f3e68f166e3 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -12,7 +12,7 @@
  * provides the key and IV to use.
  */
 
-#include <linux/blk-crypto.h>
+#include <linux/blk-crypto-profile.h>
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
@@ -64,6 +64,35 @@ static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
 	return DIV_ROUND_UP(lblk_bits, 8);
 }
 
+/*
+ * Log a message when starting to use blk-crypto (native) or blk-crypto-fallback
+ * for an encryption mode for the first time.  This is the blk-crypto
+ * counterpart to the message logged when starting to use the crypto API for the
+ * first time.  A limitation is that these messages don't convey which specific
+ * filesystems or files are using each implementation.  However, *usually*
+ * systems use just one implementation per mode, which makes these messages
+ * helpful for debugging problems where the "wrong" implementation is used.
+ */
+static void fscrypt_log_blk_crypto_impl(struct fscrypt_mode *mode,
+					struct request_queue **devs,
+					int num_devs,
+					const struct blk_crypto_config *cfg)
+{
+	int i;
+
+	for (i = 0; i < num_devs; i++) {
+		if (!IS_ENABLED(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK) ||
+		    __blk_crypto_cfg_supported(devs[i]->crypto_profile, cfg)) {
+			if (!xchg(&mode->logged_blk_crypto_native, 1))
+				pr_info("fscrypt: %s using blk-crypto (native)\n",
+					mode->friendly_name);
+		} else if (!xchg(&mode->logged_blk_crypto_fallback, 1)) {
+			pr_info("fscrypt: %s using blk-crypto-fallback\n",
+				mode->friendly_name);
+		}
+	}
+}
+
 /* Enable inline encryption for this file if supported. */
 int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 {
@@ -117,6 +146,8 @@ int fscrypt_select_encryption_impl(struct fscrypt_info *ci)
 			goto out_free_devs;
 	}
 
+	fscrypt_log_blk_crypto_impl(ci->ci_mode, devs, num_devs, &crypto_cfg);
+
 	ci->ci_inlinecrypt = true;
 out_free_devs:
 	kfree(devs);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index eede186b04ce3..6b509af13e0da 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -94,7 +94,7 @@ fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
 			    mode->cipher_str, PTR_ERR(tfm));
 		return tfm;
 	}
-	if (!xchg(&mode->logged_impl_name, 1)) {
+	if (!xchg(&mode->logged_cryptoapi_impl, 1)) {
 		/*
 		 * fscrypt performance can vary greatly depending on which
 		 * crypto algorithm implementation is used.  Help people debug

base-commit: 63cec1389e116ae0e2a15e612a5b49651e04be3f
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
