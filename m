Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E2C9BA8AA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Nov 2024 23:32:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7j9Q-0007RV-It;
	Sun, 03 Nov 2024 22:32:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t7j9O-0007R8-Jq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxtLcIpLsxIOs+ZUAXGnljwsBkxxRQSxyFQFNgdzHH0=; b=ijhLe3Ko8IrGyrCMqeAh2/fp8G
 zaYnHauDx2XtPNCJwMSW/caCNyqp6Up59rmUyw3XW1IV6n1GU2RM8cgqGYWjb5gZNdFHLPiWPwd1K
 V6VkwBJoenpKo7L4mvnb4x9jtn3VBgRxG+ccOVdGbimc2cr1XPgxDh5AKn9ZdnPfe0Eo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BxtLcIpLsxIOs+ZUAXGnljwsBkxxRQSxyFQFNgdzHH0=; b=fmPHFZbpPQtqWGXKnPYRivQhPQ
 /bwv1nMh9V5zGAkooy+vk9Ovu8MyPTVqyRnX4XUOap+m4jTe1atFV8b41fPM6ZTjFYohNPzK9qp84
 HfidXxQrqSximytqG6WySAPaO/iVJPfF+iZ5/Ye/T2NP94wNZ38Mu6RuybWKQ35gMDgg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7j9J-0005sm-Jm for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 38C5BA41F01;
 Sun,  3 Nov 2024 22:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1437C4CED9;
 Sun,  3 Nov 2024 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730673149;
 bh=f+2N4brYUYTtI9VkPIVGdMQfynotEJ/v7dbK1tF3nNY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YR8n7ggR1x/a46HsXpDJR0KCidbbb+D2BqsxTJPcwx5U+T5i9ktY56EzFM7iCdNZQ
 QBHYqbHw5NqZeWXH1K6kO8TzYQhZlA+VZFwKnsgKUvvDF0Ukj7/DxERud/3ThBO4We
 jyj/a2Xx/I0Zl/wU3IlmPfbV4u8rnpc46gYseM7v9V/qrY2v6wJUVL2yPDZvz1bfbJ
 TCfRDNESvGvZMeca3HSwHZP+thUXwY69aHXdBPQoHJ0VFTt8M9HaehrJj4AmWXuKH6
 s2DXiRWhdEz5EsYtL1vck83b6Viah4WV6vvh/0kqtuRjD56AQe40CG21gUrx1/T6Gd
 iNgi3UjuaZHSQ==
To: linux-kernel@vger.kernel.org
Date: Sun,  3 Nov 2024 14:31:45 -0800
Message-ID: <20241103223154.136127-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Move the s390 CRC32
 assembly code into the lib directory and wire it up to the library interface.
 This allows it to be used without going through the crypto API. It remains
 usable via the crypto API t [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7j9J-0005sm-Jm
Subject: [f2fs-dev] [PATCH v3 09/18] s390/crc32: expose CRC32 functions
 through lib
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

Move the s390 CRC32 assembly code into the lib directory and wire it up
to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Note: to see the diff from arch/s390/crypto/crc32-vx.c to
arch/s390/lib/crc32-glue.c, view this commit with 'git show -M10'.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/Kconfig                      |   1 +
 arch/s390/configs/debug_defconfig      |   1 -
 arch/s390/configs/defconfig            |   1 -
 arch/s390/crypto/Kconfig               |  12 -
 arch/s390/crypto/Makefile              |   2 -
 arch/s390/crypto/crc32-vx.c            | 306 -------------------------
 arch/s390/lib/Makefile                 |   3 +
 arch/s390/lib/crc32-glue.c             |  92 ++++++++
 arch/s390/{crypto => lib}/crc32-vx.h   |   0
 arch/s390/{crypto => lib}/crc32be-vx.c |   0
 arch/s390/{crypto => lib}/crc32le-vx.c |   0
 11 files changed, 96 insertions(+), 322 deletions(-)
 delete mode 100644 arch/s390/crypto/crc32-vx.c
 create mode 100644 arch/s390/lib/crc32-glue.c
 rename arch/s390/{crypto => lib}/crc32-vx.h (100%)
 rename arch/s390/{crypto => lib}/crc32be-vx.c (100%)
 rename arch/s390/{crypto => lib}/crc32le-vx.c (100%)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index d339fe4fdedf..d1fde8b941d2 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -63,10 +63,11 @@ config S390
 	select ARCH_BINFMT_ELF_STATE
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
+	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index fb0e9a1d9be2..fd83d8958f0b 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -792,11 +792,10 @@ CONFIG_CRYPTO_ZSTD=m
 CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_CRC32_S390=y
 CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA256_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 88be0a734b60..3bdeb6d5cbd9 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -779,11 +779,10 @@ CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_JITTERENTROPY_OSR=1
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_CRC32_S390=y
 CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA256_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index d3eb3a233693..b760232537f1 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -1,21 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (s390)"
 
-config CRYPTO_CRC32_S390
-	tristate "CRC32c and CRC32"
-	depends on S390
-	select CRYPTO_HASH
-	select CRC32
-	help
-	  CRC32c and CRC32 CRC algorithms
-
-	  Architecture: s390
-
-	  It is available with IBM z13 or later.
-
 config CRYPTO_SHA512_S390
 	tristate "Hash functions: SHA-384 and SHA-512"
 	depends on S390
 	select CRYPTO_HASH
 	help
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index a0cb96937c3d..14dafadbcbed 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -12,11 +12,9 @@ obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
 obj-$(CONFIG_CRYPTO_PAES_S390) += paes_s390.o
 obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 obj-$(CONFIG_S390_PRNG) += prng.o
 obj-$(CONFIG_CRYPTO_GHASH_S390) += ghash_s390.o
-obj-$(CONFIG_CRYPTO_CRC32_S390) += crc32-vx_s390.o
 obj-$(CONFIG_CRYPTO_HMAC_S390) += hmac_s390.o
 obj-y += arch_random.o
 
-crc32-vx_s390-y := crc32-vx.o crc32le-vx.o crc32be-vx.o
 chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/crypto/crc32-vx.c b/arch/s390/crypto/crc32-vx.c
deleted file mode 100644
index 89a10337e6ea..000000000000
--- a/arch/s390/crypto/crc32-vx.c
+++ /dev/null
@@ -1,306 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Crypto-API module for CRC-32 algorithms implemented with the
- * z/Architecture Vector Extension Facility.
- *
- * Copyright IBM Corp. 2015
- * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
- */
-#define KMSG_COMPONENT	"crc32-vx"
-#define pr_fmt(fmt)	KMSG_COMPONENT ": " fmt
-
-#include <linux/module.h>
-#include <linux/cpufeature.h>
-#include <linux/crc32.h>
-#include <crypto/internal/hash.h>
-#include <asm/fpu.h>
-#include "crc32-vx.h"
-
-#define CRC32_BLOCK_SIZE	1
-#define CRC32_DIGEST_SIZE	4
-
-#define VX_MIN_LEN		64
-#define VX_ALIGNMENT		16L
-#define VX_ALIGN_MASK		(VX_ALIGNMENT - 1)
-
-struct crc_ctx {
-	u32 key;
-};
-
-struct crc_desc_ctx {
-	u32 crc;
-};
-
-/*
- * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
- *
- * Creates a function to perform a particular CRC-32 computation. Depending
- * on the message buffer, the hardware-accelerated or software implementation
- * is used.   Note that the message buffer is aligned to improve fetch
- * operations of VECTOR LOAD MULTIPLE instructions.
- *
- */
-#define DEFINE_CRC32_VX(___fname, ___crc32_vx, ___crc32_sw)		    \
-	static u32 __pure ___fname(u32 crc,				    \
-				unsigned char const *data, size_t datalen)  \
-	{								    \
-		unsigned long prealign, aligned, remaining;		    \
-		DECLARE_KERNEL_FPU_ONSTACK16(vxstate);			    \
-									    \
-		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK)		    \
-			return ___crc32_sw(crc, data, datalen);		    \
-									    \
-		if ((unsigned long)data & VX_ALIGN_MASK) {		    \
-			prealign = VX_ALIGNMENT -			    \
-				  ((unsigned long)data & VX_ALIGN_MASK);    \
-			datalen -= prealign;				    \
-			crc = ___crc32_sw(crc, data, prealign);		    \
-			data = (void *)((unsigned long)data + prealign);    \
-		}							    \
-									    \
-		aligned = datalen & ~VX_ALIGN_MASK;			    \
-		remaining = datalen & VX_ALIGN_MASK;			    \
-									    \
-		kernel_fpu_begin(&vxstate, KERNEL_VXR_LOW);		    \
-		crc = ___crc32_vx(crc, data, aligned);			    \
-		kernel_fpu_end(&vxstate, KERNEL_VXR_LOW);		    \
-									    \
-		if (remaining)						    \
-			crc = ___crc32_sw(crc, data + aligned, remaining);  \
-									    \
-		return crc;						    \
-	}
-
-DEFINE_CRC32_VX(crc32_le_vx, crc32_le_vgfm_16, crc32_le)
-DEFINE_CRC32_VX(crc32_be_vx, crc32_be_vgfm_16, crc32_be)
-DEFINE_CRC32_VX(crc32c_le_vx, crc32c_le_vgfm_16, __crc32c_le)
-
-
-static int crc32_vx_cra_init_zero(struct crypto_tfm *tfm)
-{
-	struct crc_ctx *mctx = crypto_tfm_ctx(tfm);
-
-	mctx->key = 0;
-	return 0;
-}
-
-static int crc32_vx_cra_init_invert(struct crypto_tfm *tfm)
-{
-	struct crc_ctx *mctx = crypto_tfm_ctx(tfm);
-
-	mctx->key = ~0;
-	return 0;
-}
-
-static int crc32_vx_init(struct shash_desc *desc)
-{
-	struct crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	ctx->crc = mctx->key;
-	return 0;
-}
-
-static int crc32_vx_setkey(struct crypto_shash *tfm, const u8 *newkey,
-			   unsigned int newkeylen)
-{
-	struct crc_ctx *mctx = crypto_shash_ctx(tfm);
-
-	if (newkeylen != sizeof(mctx->key))
-		return -EINVAL;
-	mctx->key = le32_to_cpu(*(__le32 *)newkey);
-	return 0;
-}
-
-static int crc32be_vx_setkey(struct crypto_shash *tfm, const u8 *newkey,
-			     unsigned int newkeylen)
-{
-	struct crc_ctx *mctx = crypto_shash_ctx(tfm);
-
-	if (newkeylen != sizeof(mctx->key))
-		return -EINVAL;
-	mctx->key = be32_to_cpu(*(__be32 *)newkey);
-	return 0;
-}
-
-static int crc32le_vx_final(struct shash_desc *desc, u8 *out)
-{
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	*(__le32 *)out = cpu_to_le32p(&ctx->crc);
-	return 0;
-}
-
-static int crc32be_vx_final(struct shash_desc *desc, u8 *out)
-{
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	*(__be32 *)out = cpu_to_be32p(&ctx->crc);
-	return 0;
-}
-
-static int crc32c_vx_final(struct shash_desc *desc, u8 *out)
-{
-	struct crc_desc_ctx *ctx = shash_desc_ctx(desc);
-
-	/*
-	 * Perform a final XOR with 0xFFFFFFFF to be in sync
-	 * with the generic crc32c shash implementation.
-	 */
-	*(__le32 *)out = ~cpu_to_le32p(&ctx->crc);
-	return 0;
-}
-
-static int __crc32le_vx_finup(u32 *crc, const u8 *data, unsigned int len,
-			      u8 *out)
-{
-	*(__le32 *)out = cpu_to_le32(crc32_le_vx(*crc, data, len));
-	return 0;
-}
-
-static int __crc32be_vx_finup(u32 *crc, const u8 *data, unsigned int len,
-			      u8 *out)
-{
-	*(__be32 *)out = cpu_to_be32(crc32_be_vx(*crc, data, len));
-	return 0;
-}
-
-static int __crc32c_vx_finup(u32 *crc, const u8 *data, unsigned int len,
-			     u8 *out)
-{
-	/*
-	 * Perform a final XOR with 0xFFFFFFFF to be in sync
-	 * with the generic crc32c shash implementation.
-	 */
-	*(__le32 *)out = ~cpu_to_le32(crc32c_le_vx(*crc, data, len));
-	return 0;
-}
-
-
-#define CRC32_VX_FINUP(alg, func)					      \
-	static int alg ## _vx_finup(struct shash_desc *desc, const u8 *data,  \
-				   unsigned int datalen, u8 *out)	      \
-	{								      \
-		return __ ## alg ## _vx_finup(shash_desc_ctx(desc),	      \
-					      data, datalen, out);	      \
-	}
-
-CRC32_VX_FINUP(crc32le, crc32_le_vx)
-CRC32_VX_FINUP(crc32be, crc32_be_vx)
-CRC32_VX_FINUP(crc32c, crc32c_le_vx)
-
-#define CRC32_VX_DIGEST(alg, func)					      \
-	static int alg ## _vx_digest(struct shash_desc *desc, const u8 *data, \
-				     unsigned int len, u8 *out)		      \
-	{								      \
-		return __ ## alg ## _vx_finup(crypto_shash_ctx(desc->tfm),    \
-					      data, len, out);		      \
-	}
-
-CRC32_VX_DIGEST(crc32le, crc32_le_vx)
-CRC32_VX_DIGEST(crc32be, crc32_be_vx)
-CRC32_VX_DIGEST(crc32c, crc32c_le_vx)
-
-#define CRC32_VX_UPDATE(alg, func)					      \
-	static int alg ## _vx_update(struct shash_desc *desc, const u8 *data, \
-				     unsigned int datalen)		      \
-	{								      \
-		struct crc_desc_ctx *ctx = shash_desc_ctx(desc);	      \
-		ctx->crc = func(ctx->crc, data, datalen);		      \
-		return 0;						      \
-	}
-
-CRC32_VX_UPDATE(crc32le, crc32_le_vx)
-CRC32_VX_UPDATE(crc32be, crc32_be_vx)
-CRC32_VX_UPDATE(crc32c, crc32c_le_vx)
-
-
-static struct shash_alg crc32_vx_algs[] = {
-	/* CRC-32 LE */
-	{
-		.init		=	crc32_vx_init,
-		.setkey		=	crc32_vx_setkey,
-		.update		=	crc32le_vx_update,
-		.final		=	crc32le_vx_final,
-		.finup		=	crc32le_vx_finup,
-		.digest		=	crc32le_vx_digest,
-		.descsize	=	sizeof(struct crc_desc_ctx),
-		.digestsize	=	CRC32_DIGEST_SIZE,
-		.base		=	{
-			.cra_name	 = "crc32",
-			.cra_driver_name = "crc32-vx",
-			.cra_priority	 = 200,
-			.cra_flags	 = CRYPTO_ALG_OPTIONAL_KEY,
-			.cra_blocksize	 = CRC32_BLOCK_SIZE,
-			.cra_ctxsize	 = sizeof(struct crc_ctx),
-			.cra_module	 = THIS_MODULE,
-			.cra_init	 = crc32_vx_cra_init_zero,
-		},
-	},
-	/* CRC-32 BE */
-	{
-		.init		=	crc32_vx_init,
-		.setkey		=	crc32be_vx_setkey,
-		.update		=	crc32be_vx_update,
-		.final		=	crc32be_vx_final,
-		.finup		=	crc32be_vx_finup,
-		.digest		=	crc32be_vx_digest,
-		.descsize	=	sizeof(struct crc_desc_ctx),
-		.digestsize	=	CRC32_DIGEST_SIZE,
-		.base		=	{
-			.cra_name	 = "crc32be",
-			.cra_driver_name = "crc32be-vx",
-			.cra_priority	 = 200,
-			.cra_flags	 = CRYPTO_ALG_OPTIONAL_KEY,
-			.cra_blocksize	 = CRC32_BLOCK_SIZE,
-			.cra_ctxsize	 = sizeof(struct crc_ctx),
-			.cra_module	 = THIS_MODULE,
-			.cra_init	 = crc32_vx_cra_init_zero,
-		},
-	},
-	/* CRC-32C LE */
-	{
-		.init		=	crc32_vx_init,
-		.setkey		=	crc32_vx_setkey,
-		.update		=	crc32c_vx_update,
-		.final		=	crc32c_vx_final,
-		.finup		=	crc32c_vx_finup,
-		.digest		=	crc32c_vx_digest,
-		.descsize	=	sizeof(struct crc_desc_ctx),
-		.digestsize	=	CRC32_DIGEST_SIZE,
-		.base		=	{
-			.cra_name	 = "crc32c",
-			.cra_driver_name = "crc32c-vx",
-			.cra_priority	 = 200,
-			.cra_flags	 = CRYPTO_ALG_OPTIONAL_KEY,
-			.cra_blocksize	 = CRC32_BLOCK_SIZE,
-			.cra_ctxsize	 = sizeof(struct crc_ctx),
-			.cra_module	 = THIS_MODULE,
-			.cra_init	 = crc32_vx_cra_init_invert,
-		},
-	},
-};
-
-
-static int __init crc_vx_mod_init(void)
-{
-	return crypto_register_shashes(crc32_vx_algs,
-				       ARRAY_SIZE(crc32_vx_algs));
-}
-
-static void __exit crc_vx_mod_exit(void)
-{
-	crypto_unregister_shashes(crc32_vx_algs, ARRAY_SIZE(crc32_vx_algs));
-}
-
-module_cpu_feature_match(S390_CPU_FEATURE_VXRS, crc_vx_mod_init);
-module_exit(crc_vx_mod_exit);
-
-MODULE_AUTHOR("Hendrik Brueckner <brueckner@linux.vnet.ibm.com>");
-MODULE_DESCRIPTION("CRC-32 algorithms using z/Architecture Vector Extension Facility");
-MODULE_LICENSE("GPL");
-
-MODULE_ALIAS_CRYPTO("crc32");
-MODULE_ALIAS_CRYPTO("crc32-vx");
-MODULE_ALIAS_CRYPTO("crc32c");
-MODULE_ALIAS_CRYPTO("crc32c-vx");
diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index f43f897d3fc0..14bbfe50033c 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -22,5 +22,8 @@ obj-$(CONFIG_S390_MODULES_SANITY_TEST) += test_modules.o
 obj-$(CONFIG_S390_MODULES_SANITY_TEST_HELPERS) += test_modules_helpers.o
 
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
+
+obj-$(CONFIG_CRC32_ARCH) += crc32-s390.o
+crc32-s390-y := crc32-glue.o crc32le-vx.o crc32be-vx.o
diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32-glue.c
new file mode 100644
index 000000000000..137080e61f90
--- /dev/null
+++ b/arch/s390/lib/crc32-glue.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * CRC-32 implemented with the z/Architecture Vector Extension Facility.
+ *
+ * Copyright IBM Corp. 2015
+ * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
+ */
+#define KMSG_COMPONENT	"crc32-vx"
+#define pr_fmt(fmt)	KMSG_COMPONENT ": " fmt
+
+#include <linux/module.h>
+#include <linux/cpufeature.h>
+#include <linux/crc32.h>
+#include <asm/fpu.h>
+#include "crc32-vx.h"
+
+#define VX_MIN_LEN		64
+#define VX_ALIGNMENT		16L
+#define VX_ALIGN_MASK		(VX_ALIGNMENT - 1)
+
+static DEFINE_STATIC_KEY_FALSE(have_vxrs);
+
+/*
+ * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
+ *
+ * Creates a function to perform a particular CRC-32 computation. Depending
+ * on the message buffer, the hardware-accelerated or software implementation
+ * is used.   Note that the message buffer is aligned to improve fetch
+ * operations of VECTOR LOAD MULTIPLE instructions.
+ */
+#define DEFINE_CRC32_VX(___fname, ___crc32_vx, ___crc32_sw)		    \
+	u32 ___fname(u32 crc, const u8 *data, size_t datalen)		    \
+	{								    \
+		unsigned long prealign, aligned, remaining;		    \
+		DECLARE_KERNEL_FPU_ONSTACK16(vxstate);			    \
+									    \
+		if (datalen < VX_MIN_LEN + VX_ALIGN_MASK ||		    \
+		    !static_branch_likely(&have_vxrs))			    \
+			return ___crc32_sw(crc, data, datalen);		    \
+									    \
+		if ((unsigned long)data & VX_ALIGN_MASK) {		    \
+			prealign = VX_ALIGNMENT -			    \
+				  ((unsigned long)data & VX_ALIGN_MASK);    \
+			datalen -= prealign;				    \
+			crc = ___crc32_sw(crc, data, prealign);		    \
+			data = (void *)((unsigned long)data + prealign);    \
+		}							    \
+									    \
+		aligned = datalen & ~VX_ALIGN_MASK;			    \
+		remaining = datalen & VX_ALIGN_MASK;			    \
+									    \
+		kernel_fpu_begin(&vxstate, KERNEL_VXR_LOW);		    \
+		crc = ___crc32_vx(crc, data, aligned);			    \
+		kernel_fpu_end(&vxstate, KERNEL_VXR_LOW);		    \
+									    \
+		if (remaining)						    \
+			crc = ___crc32_sw(crc, data + aligned, remaining);  \
+									    \
+		return crc;						    \
+	}								    \
+	EXPORT_SYMBOL(___fname);
+
+DEFINE_CRC32_VX(crc32_le_arch, crc32_le_vgfm_16, crc32_le_base)
+DEFINE_CRC32_VX(crc32_be_arch, crc32_be_vgfm_16, crc32_be_base)
+DEFINE_CRC32_VX(crc32c_le_arch, crc32c_le_vgfm_16, crc32c_le_base)
+
+static int __init crc32_s390_init(void)
+{
+	if (cpu_have_feature(S390_CPU_FEATURE_VXRS))
+		static_branch_enable(&have_vxrs);
+	return 0;
+}
+arch_initcall(crc32_s390_init);
+
+static void __exit crc32_s390_exit(void)
+{
+}
+module_exit(crc32_s390_exit);
+
+u32 crc32_optimizations(void)
+{
+	if (static_key_enabled(&have_vxrs))
+		return CRC32_LE_OPTIMIZATION |
+		       CRC32_BE_OPTIMIZATION |
+		       CRC32C_OPTIMIZATION;
+	return 0;
+}
+EXPORT_SYMBOL(crc32_optimizations);
+
+MODULE_AUTHOR("Hendrik Brueckner <brueckner@linux.vnet.ibm.com>");
+MODULE_DESCRIPTION("CRC-32 algorithms using z/Architecture Vector Extension Facility");
+MODULE_LICENSE("GPL");
diff --git a/arch/s390/crypto/crc32-vx.h b/arch/s390/lib/crc32-vx.h
similarity index 100%
rename from arch/s390/crypto/crc32-vx.h
rename to arch/s390/lib/crc32-vx.h
diff --git a/arch/s390/crypto/crc32be-vx.c b/arch/s390/lib/crc32be-vx.c
similarity index 100%
rename from arch/s390/crypto/crc32be-vx.c
rename to arch/s390/lib/crc32be-vx.c
diff --git a/arch/s390/crypto/crc32le-vx.c b/arch/s390/lib/crc32le-vx.c
similarity index 100%
rename from arch/s390/crypto/crc32le-vx.c
rename to arch/s390/lib/crc32le-vx.c
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
