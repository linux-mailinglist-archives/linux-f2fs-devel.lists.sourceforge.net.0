Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A89B0E1D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 21:16:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Pmv-0000Hs-0C;
	Fri, 25 Oct 2024 19:15:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t4Pmt-0000Hj-Rv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VEpWY4sXA/S1bLoLnoNT9MT92zIxt9Oz+i41XLKt/cM=; b=JySK75zYGI04Fnj8dmgldaieuC
 GwOhNtRcarLS93JYHHKs9UBBULXTyjcFV+JKSb0INlaXJOcFuy6fQyew1MkNOuqiyvja+pYRp/91e
 VqbyGvCTTAhHGFdcy3zCzTlXEqFgEUxJ09HdVI+eVx7OOdD4RtthBp77wuwp8VoHWa6k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VEpWY4sXA/S1bLoLnoNT9MT92zIxt9Oz+i41XLKt/cM=; b=gfrHspemLM0CixuBkhRif8awSY
 YoYmqwoMZ+n3wY6Edfag5LcM6fhVQlBcNfKODbU+oWIxIpIh1WgcRRInKZEakjp5/eAsOpnopSBnB
 gPI8wh6UBEg0BEnPGYZU9ffTduEw/RHn74DHXwOG5/APg7rj8oOqzVJq1cC+3GaWzwwk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Pmt-0005hI-1I for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 698025C061C;
 Fri, 25 Oct 2024 19:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4FEAC4CEE3;
 Fri, 25 Oct 2024 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729883744;
 bh=ABiaGm+ovhik7YFigewZFubogtN32tz5BD1p0OQq720=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vz1H2ANIZERjEpj+I85MKJfdlEpz1SofCIjzgMXNRgrjt8vSPi8NWgf8Q6R4pjn5r
 X2cGZ6mXRM4KH4EJHSmPpw/sQpx1SXtGmPuNI0f4GTkha+23sVsdFNFd7oNgiKNIcK
 Jeiz7i0/NpA9zcRhJUWRAgAppnb1vyaxtwlHI2wVbMQvS5SJL0WhiR5D+Epx1sd9PD
 t6xEbw2ztBl7vtK2VjB5bf9Hc9lkERBR+cTObiA8hRyoMeNv+0AKkbhZIhy9ZUJYqD
 nAQgRkoDXClPz1x5qFL7LMaY1913EqBa3xDEAbpa7lNBBD6ftJGS6Y6RMRGWhPAf/s
 UKLLrPEYq5UmQ==
To: linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2024 12:14:37 -0700
Message-ID: <20241025191454.72616-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025191454.72616-1-ebiggers@kernel.org>
References: <20241025191454.72616-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Remove the leading
 underscores from __crc32c_le_base(). This is in preparation for adding
 crc32c_le_arch()
 and eventually renaming __crc32c_le() to crc32c_le(). 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4Pmt-0005hI-1I
Subject: [f2fs-dev] [PATCH v2 01/18] lib/crc32: drop leading underscores
 from __crc32c_le_base
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Remove the leading underscores from __crc32c_le_base().

This is in preparation for adding crc32c_le_arch() and eventually
renaming __crc32c_le() to crc32c_le().

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc32-glue.c | 2 +-
 arch/riscv/lib/crc32.c      | 2 +-
 crypto/crc32c_generic.c     | 8 ++++----
 include/linux/crc32.h       | 2 +-
 lib/crc32.c                 | 4 ++--
 lib/crc32test.c             | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index 295ae3e6b997..ad015223d15d 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -42,11 +42,11 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
-		return __crc32c_le_base(crc, p, len);
+		return crc32c_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
 		kernel_neon_begin();
 		crc = crc32c_le_arm64_4way(crc, p, len);
 		kernel_neon_end();
diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32.c
index d7dc599af3ef..333fb7af1192 100644
--- a/arch/riscv/lib/crc32.c
+++ b/arch/riscv/lib/crc32.c
@@ -224,11 +224,11 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
-				CRC32C_POLY_QT_LE, __crc32c_le_base);
+				CRC32C_POLY_QT_LE, crc32c_le_base);
 }
 
 static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 				     size_t len)
 {
diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
index 7c2357c30fdf..635599b255ec 100644
--- a/crypto/crc32c_generic.c
+++ b/crypto/crc32c_generic.c
@@ -83,11 +83,11 @@ static int chksum_setkey(struct crypto_shash *tfm, const u8 *key,
 static int chksum_update(struct shash_desc *desc, const u8 *data,
 			 unsigned int length)
 {
 	struct chksum_desc_ctx *ctx = shash_desc_ctx(desc);
 
-	ctx->crc = __crc32c_le_base(ctx->crc, data, length);
+	ctx->crc = crc32c_le_base(ctx->crc, data, length);
 	return 0;
 }
 
 static int chksum_update_arch(struct shash_desc *desc, const u8 *data,
 			      unsigned int length)
@@ -106,11 +106,11 @@ static int chksum_final(struct shash_desc *desc, u8 *out)
 	return 0;
 }
 
 static int __chksum_finup(u32 *crcp, const u8 *data, unsigned int len, u8 *out)
 {
-	put_unaligned_le32(~__crc32c_le_base(*crcp, data, len), out);
+	put_unaligned_le32(~crc32c_le_base(*crcp, data, len), out);
 	return 0;
 }
 
 static int __chksum_finup_arch(u32 *crcp, const u8 *data, unsigned int len,
 			       u8 *out)
@@ -198,16 +198,16 @@ static struct shash_alg algs[] = {{
 }};
 
 static int __init crc32c_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &__crc32c_le_base));
+	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &__crc32c_le_base));
+	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
 }
 
 subsys_initcall(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 87f788c0d607..5b07fc9081c4 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -37,11 +37,11 @@ static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
 {
 	return crc32_le_shift(crc1, len2) ^ crc2;
 }
 
 u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
-u32 __pure __crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
+u32 __pure crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
 
 /**
  * __crc32c_le_combine - Combine two crc32c check values into one. For two
  * 			 sequences of bytes, seq1 and seq2 with lengths len1
  * 			 and len2, __crc32c_le() check values were calculated
diff --git a/lib/crc32.c b/lib/crc32.c
index ff587fee3893..c67059b0082b 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -205,12 +205,12 @@ EXPORT_SYMBOL(crc32_le);
 EXPORT_SYMBOL(__crc32c_le);
 
 u32 __pure crc32_le_base(u32, unsigned char const *, size_t) __alias(crc32_le);
 EXPORT_SYMBOL(crc32_le_base);
 
-u32 __pure __crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
-EXPORT_SYMBOL(__crc32c_le_base);
+u32 __pure crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
+EXPORT_SYMBOL(crc32c_le_base);
 
 u32 __pure crc32_be_base(u32, unsigned char const *, size_t) __alias(crc32_be);
 
 /*
  * This multiplies the polynomials x and y modulo the given modulus.
diff --git a/lib/crc32test.c b/lib/crc32test.c
index 03cf5c1f2f5d..30b8da4d8be4 100644
--- a/lib/crc32test.c
+++ b/lib/crc32test.c
@@ -824,11 +824,11 @@ static void crc32test_regenerate(void)
 	for (i = 0; i < ARRAY_SIZE(test); i++) {
 		pr_info("{0x%08x, 0x%08x, 0x%08x, 0x%08x, 0x%08x, 0x%08x},\n",
 			test[i].crc, test[i].start, test[i].length,
 			crc32_le_base(test[i].crc, test_buf + test[i].start, test[i].length),
 			crc32_be_base(test[i].crc, test_buf + test[i].start, test[i].length),
-			__crc32c_le_base(test[i].crc, test_buf + test[i].start, test[i].length));
+			crc32c_le_base(test[i].crc, test_buf + test[i].start, test[i].length));
 	}
 }
 
 static int __init crc32test_init(void)
 {
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
