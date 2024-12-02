Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5689DF7B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 02:10:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tHuww-0002WK-CI;
	Mon, 02 Dec 2024 01:10:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1tHuwp-0002TI-Un
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Pr1RsZMdS8XCG9bVfSHkgaX72e4VoeYwH49x5R3SzQ=; b=bP0xHes354UBnWmSWrty0QF2i/
 AO9QnyXofYz9r9bku9UmkvW6mMprp9LOWYmn7nePEOawTFShUKjyTk/f+ZXp8aP9J6KzXnQUV0Sjb
 n1wwZWauRY256fX5Be+OSNxbNFq9hvIbzQcq1XJxYAOrISPp1rdHRvk8yMQnCpFh/Guw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Pr1RsZMdS8XCG9bVfSHkgaX72e4VoeYwH49x5R3SzQ=; b=OH0QzB82li3RmKs7baaKMLXpfq
 OvIM9azo4lHh1XZXC5vmkXlGK/5lUBJwOr1QaogtexVE/IzWkuxNBALhIytLfL8NFMFciT3j0z7BV
 ACAhegHDgNeAied/b+dyBfjyMb7oG5YpfkrRPUaqdmIKgi84xcKyUPjADqT42j9N3wp0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tHuwY-0006Lf-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ED72C5C64F4;
 Mon,  2 Dec 2024 01:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E272C4CEE2;
 Mon,  2 Dec 2024 01:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733101773;
 bh=gTqOZxWuUMOtML33jITsoShS2PUWS/j+YXsuv+977g8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uZZ5KLDgQPO5MWhGcyygO7Y0QcFRy/j/0ePunZH4zrZWOuvBW7F81kR/WA779z8Fv
 qtyfH2yrGNA4ctW8YF/5ZfSJSviOY5Qj7toT4UV+iKqbpQA0rNg5FzTK/if55hpbx6
 hXgtksF68aMDCyc9ZWtzVGb91HaBr21jk2BJGZ1sq8NAVqf3ug1WGQs9rWpfRMXJkw
 7942zxQ47h8rtpmkcmfzx8uimpjAW5sBpNDJoEiQlTSwGjKkZjqRwgpX++CiZCiI+A
 39CZdot87QUfzp+QigjWfwNNK4U0lzm7b9IHpScFMCfZo5bXhP4KVpGvkdcmo2TtGh
 3BFfQ75hXMPwQ==
To: linux-kernel@vger.kernel.org
Date: Sun,  1 Dec 2024 17:08:33 -0800
Message-ID: <20241202010844.144356-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Move the powerpc
 CRC32C assembly code into the lib directory and wire it up to the library
 interface. This allows it to be used without going through the crypto API.
 It remains usable via the crypto A [...] 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tHuwY-0006Lf-Ta
Subject: [f2fs-dev] [PATCH v4 08/19] powerpc/crc32: expose CRC32 functions
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
 linux-scsi@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, linux-mips@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Move the powerpc CRC32C assembly code into the lib directory and wire it
up to the library interface.  This allows it to be used without going
through the crypto API.  It remains usable via the crypto API too via
the shash algorithms that use the library interface.  Thus all the
arch-specific "shash" code becomes unnecessary and is removed.

Note: to see the diff from arch/powerpc/crypto/crc32c-vpmsum_glue.c to
arch/powerpc/lib/crc32-glue.c, view this commit with 'git show -M10'.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |  15 +-
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/crc32c-vpmsum_glue.c      | 173 ------------------
 arch/powerpc/crypto/crct10dif-vpmsum_asm.S    |   2 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/crc32-glue.c                 |  92 ++++++++++
 .../{crypto => lib}/crc32-vpmsum_core.S       |   0
 .../{crypto => lib}/crc32c-vpmsum_asm.S       |   0
 11 files changed, 98 insertions(+), 192 deletions(-)
 delete mode 100644 arch/powerpc/crypto/crc32c-vpmsum_glue.c
 create mode 100644 arch/powerpc/lib/crc32-glue.c
 rename arch/powerpc/{crypto => lib}/crc32-vpmsum_core.S (100%)
 rename arch/powerpc/{crypto => lib}/crc32c-vpmsum_asm.S (100%)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a0ce777f9706..b5050a09a27f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -125,10 +125,11 @@ config PPC
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_COPY_MC			if PPC64
+	select ARCH_HAS_CRC32			if PPC64 && ALTIVEC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index ee84ade7a033..4a7ddea05b4d 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -318,11 +318,10 @@ CONFIG_FTR_FIXUP_SELFTEST=y
 CONFIG_MSI_BITMAP_SELFTEST=y
 CONFIG_XMON=y
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_CRC32C_VPMSUM=m
 CONFIG_CRYPTO_CRCT10DIF_VPMSUM=m
 CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_SHA256=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index f39c0d000c43..58e5f4488da4 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -387,11 +387,10 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_LZO=m
-CONFIG_CRYPTO_CRC32C_VPMSUM=m
 CONFIG_CRYPTO_CRCT10DIF_VPMSUM=m
 CONFIG_CRYPTO_VPMSUM_TESTER=m
 CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_AES_GCM_P10=m
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 951a43726461..2d89e35b3cdd 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -11,23 +11,10 @@ config CRYPTO_CURVE25519_PPC64
 	  Curve25519 algorithm
 
 	  Architecture: PowerPC64
 	  - Little-endian
 
-config CRYPTO_CRC32C_VPMSUM
-	tristate "CRC32c"
-	depends on PPC64 && ALTIVEC
-	select CRYPTO_HASH
-	select CRC32
-	help
-	  CRC32c CRC algorithm with the iSCSI polynomial (RFC 3385 and RFC 3720)
-
-	  Architecture: powerpc64 using
-	  - AltiVec extensions
-
-	  Enable on POWER8 and newer processors for improved performance.
-
 config CRYPTO_CRCT10DIF_VPMSUM
 	tristate "CRC32T10DIF"
 	depends on PPC64 && ALTIVEC && CRC_T10DIF
 	select CRYPTO_HASH
 	help
@@ -38,11 +25,11 @@ config CRYPTO_CRCT10DIF_VPMSUM
 
 	  Enable on POWER8 and newer processors for improved performance.
 
 config CRYPTO_VPMSUM_TESTER
 	tristate "CRC32c and CRC32T10DIF hardware acceleration tester"
-	depends on CRYPTO_CRCT10DIF_VPMSUM && CRYPTO_CRC32C_VPMSUM
+	depends on CRYPTO_CRCT10DIF_VPMSUM && CRYPTO_CRC32C && CRC32_ARCH
 	help
 	  Stress test for CRC32c and CRCT10DIF algorithms implemented with
 	  powerpc64 AltiVec extensions (POWER8 vpmsum instructions).
 	  Unless you are testing these algorithms, you don't need this.
 
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index 59808592f0a1..54486192273c 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -8,11 +8,10 @@
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
 obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC) += sha1-powerpc.o
 obj-$(CONFIG_CRYPTO_SHA1_PPC_SPE) += sha1-ppc-spe.o
 obj-$(CONFIG_CRYPTO_SHA256_PPC_SPE) += sha256-ppc-spe.o
-obj-$(CONFIG_CRYPTO_CRC32C_VPMSUM) += crc32c-vpmsum.o
 obj-$(CONFIG_CRYPTO_CRCT10DIF_VPMSUM) += crct10dif-vpmsum.o
 obj-$(CONFIG_CRYPTO_VPMSUM_TESTER) += crc-vpmsum_test.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_CHACHA20_P10) += chacha-p10-crypto.o
 obj-$(CONFIG_CRYPTO_POLY1305_P10) += poly1305-p10-crypto.o
@@ -22,11 +21,10 @@ obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
 md5-ppc-y := md5-asm.o md5-glue.o
 sha1-powerpc-y := sha1-powerpc-asm.o sha1.o
 sha1-ppc-spe-y := sha1-spe-asm.o sha1-spe-glue.o
 sha256-ppc-spe-y := sha256-spe-asm.o sha256-spe-glue.o
-crc32c-vpmsum-y := crc32c-vpmsum_asm.o crc32c-vpmsum_glue.o
 crct10dif-vpmsum-y := crct10dif-vpmsum_asm.o crct10dif-vpmsum_glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 chacha-p10-crypto-y := chacha-p10-glue.o chacha-p10le-8x.o
 poly1305-p10-crypto-y := poly1305-p10-glue.o poly1305-p10le_64.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
diff --git a/arch/powerpc/crypto/crc32c-vpmsum_glue.c b/arch/powerpc/crypto/crc32c-vpmsum_glue.c
deleted file mode 100644
index 63760b7dbb76..000000000000
--- a/arch/powerpc/crypto/crc32c-vpmsum_glue.c
+++ /dev/null
@@ -1,173 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#include <linux/crc32.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-#include <linux/cpufeature.h>
-#include <asm/simd.h>
-#include <asm/switch_to.h>
-
-#define CHKSUM_BLOCK_SIZE	1
-#define CHKSUM_DIGEST_SIZE	4
-
-#define VMX_ALIGN		16
-#define VMX_ALIGN_MASK		(VMX_ALIGN-1)
-
-#define VECTOR_BREAKPOINT	512
-
-u32 __crc32c_vpmsum(u32 crc, unsigned char const *p, size_t len);
-
-static u32 crc32c_vpmsum(u32 crc, unsigned char const *p, size_t len)
-{
-	unsigned int prealign;
-	unsigned int tail;
-
-	if (len < (VECTOR_BREAKPOINT + VMX_ALIGN) || !crypto_simd_usable())
-		return __crc32c_le(crc, p, len);
-
-	if ((unsigned long)p & VMX_ALIGN_MASK) {
-		prealign = VMX_ALIGN - ((unsigned long)p & VMX_ALIGN_MASK);
-		crc = __crc32c_le(crc, p, prealign);
-		len -= prealign;
-		p += prealign;
-	}
-
-	if (len & ~VMX_ALIGN_MASK) {
-		preempt_disable();
-		pagefault_disable();
-		enable_kernel_altivec();
-		crc = __crc32c_vpmsum(crc, p, len & ~VMX_ALIGN_MASK);
-		disable_kernel_altivec();
-		pagefault_enable();
-		preempt_enable();
-	}
-
-	tail = len & VMX_ALIGN_MASK;
-	if (tail) {
-		p += len & ~VMX_ALIGN_MASK;
-		crc = __crc32c_le(crc, p, tail);
-	}
-
-	return crc;
-}
-
-static int crc32c_vpmsum_cra_init(struct crypto_tfm *tfm)
-{
-	u32 *key = crypto_tfm_ctx(tfm);
-
-	*key = ~0;
-
-	return 0;
-}
-
-/*
- * Setting the seed allows arbitrary accumulators and flexible XOR policy
- * If your algorithm starts with ~0, then XOR with ~0 before you set
- * the seed.
- */
-static int crc32c_vpmsum_setkey(struct crypto_shash *hash, const u8 *key,
-			       unsigned int keylen)
-{
-	u32 *mctx = crypto_shash_ctx(hash);
-
-	if (keylen != sizeof(u32))
-		return -EINVAL;
-	*mctx = le32_to_cpup((__le32 *)key);
-	return 0;
-}
-
-static int crc32c_vpmsum_init(struct shash_desc *desc)
-{
-	u32 *mctx = crypto_shash_ctx(desc->tfm);
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*crcp = *mctx;
-
-	return 0;
-}
-
-static int crc32c_vpmsum_update(struct shash_desc *desc, const u8 *data,
-			       unsigned int len)
-{
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*crcp = crc32c_vpmsum(*crcp, data, len);
-
-	return 0;
-}
-
-static int __crc32c_vpmsum_finup(u32 *crcp, const u8 *data, unsigned int len,
-				u8 *out)
-{
-	*(__le32 *)out = ~cpu_to_le32(crc32c_vpmsum(*crcp, data, len));
-
-	return 0;
-}
-
-static int crc32c_vpmsum_finup(struct shash_desc *desc, const u8 *data,
-			      unsigned int len, u8 *out)
-{
-	return __crc32c_vpmsum_finup(shash_desc_ctx(desc), data, len, out);
-}
-
-static int crc32c_vpmsum_final(struct shash_desc *desc, u8 *out)
-{
-	u32 *crcp = shash_desc_ctx(desc);
-
-	*(__le32 *)out = ~cpu_to_le32p(crcp);
-
-	return 0;
-}
-
-static int crc32c_vpmsum_digest(struct shash_desc *desc, const u8 *data,
-			       unsigned int len, u8 *out)
-{
-	return __crc32c_vpmsum_finup(crypto_shash_ctx(desc->tfm), data, len,
-				     out);
-}
-
-static struct shash_alg alg = {
-	.setkey		= crc32c_vpmsum_setkey,
-	.init		= crc32c_vpmsum_init,
-	.update		= crc32c_vpmsum_update,
-	.final		= crc32c_vpmsum_final,
-	.finup		= crc32c_vpmsum_finup,
-	.digest		= crc32c_vpmsum_digest,
-	.descsize	= sizeof(u32),
-	.digestsize	= CHKSUM_DIGEST_SIZE,
-	.base		= {
-		.cra_name		= "crc32c",
-		.cra_driver_name	= "crc32c-vpmsum",
-		.cra_priority		= 200,
-		.cra_flags		= CRYPTO_ALG_OPTIONAL_KEY,
-		.cra_blocksize		= CHKSUM_BLOCK_SIZE,
-		.cra_ctxsize		= sizeof(u32),
-		.cra_module		= THIS_MODULE,
-		.cra_init		= crc32c_vpmsum_cra_init,
-	}
-};
-
-static int __init crc32c_vpmsum_mod_init(void)
-{
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	return crypto_register_shash(&alg);
-}
-
-static void __exit crc32c_vpmsum_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_cpu_feature_match(PPC_MODULE_FEATURE_VEC_CRYPTO, crc32c_vpmsum_mod_init);
-module_exit(crc32c_vpmsum_mod_fini);
-
-MODULE_AUTHOR("Anton Blanchard <anton@samba.org>");
-MODULE_DESCRIPTION("CRC32C using vector polynomial multiply-sum instructions");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS_CRYPTO("crc32c");
-MODULE_ALIAS_CRYPTO("crc32c-vpmsum");
diff --git a/arch/powerpc/crypto/crct10dif-vpmsum_asm.S b/arch/powerpc/crypto/crct10dif-vpmsum_asm.S
index f0b93a0fe168..0a52261bf859 100644
--- a/arch/powerpc/crypto/crct10dif-vpmsum_asm.S
+++ b/arch/powerpc/crypto/crct10dif-vpmsum_asm.S
@@ -840,6 +840,6 @@
 	.octa 0x000000000000000000000001f65a57f8	/* x^64 div p(x) */
 	/* Barrett constant n */
 	.octa 0x0000000000000000000000018bb70000
 
 #define CRC_FUNCTION_NAME __crct10dif_vpmsum
-#include "crc32-vpmsum_core.S"
+#include "../lib/crc32-vpmsum_core.S"
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index f14ecab674a3..da9381a1c95b 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -76,6 +76,9 @@ obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
 obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
 CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
 # Enable <altivec.h>
 CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
 
+obj-$(CONFIG_CRC32_ARCH) += crc32-powerpc.o
+crc32-powerpc-y := crc32-glue.o crc32c-vpmsum_asm.o
+
 obj-$(CONFIG_PPC64) += $(obj64-y)
diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
new file mode 100644
index 000000000000..79cc954f499f
--- /dev/null
+++ b/arch/powerpc/lib/crc32-glue.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/crc32.h>
+#include <crypto/internal/simd.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/cpufeature.h>
+#include <asm/simd.h>
+#include <asm/switch_to.h>
+
+#define VMX_ALIGN		16
+#define VMX_ALIGN_MASK		(VMX_ALIGN-1)
+
+#define VECTOR_BREAKPOINT	512
+
+static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
+
+u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
+
+u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
+{
+	return crc32_le_base(crc, p, len);
+}
+EXPORT_SYMBOL(crc32_le_arch);
+
+u32 crc32c_le_arch(u32 crc, const u8 *p, size_t len)
+{
+	unsigned int prealign;
+	unsigned int tail;
+
+	if (len < (VECTOR_BREAKPOINT + VMX_ALIGN) ||
+	    !static_branch_likely(&have_vec_crypto) || !crypto_simd_usable())
+		return crc32c_le_base(crc, p, len);
+
+	if ((unsigned long)p & VMX_ALIGN_MASK) {
+		prealign = VMX_ALIGN - ((unsigned long)p & VMX_ALIGN_MASK);
+		crc = crc32c_le_base(crc, p, prealign);
+		len -= prealign;
+		p += prealign;
+	}
+
+	if (len & ~VMX_ALIGN_MASK) {
+		preempt_disable();
+		pagefault_disable();
+		enable_kernel_altivec();
+		crc = __crc32c_vpmsum(crc, p, len & ~VMX_ALIGN_MASK);
+		disable_kernel_altivec();
+		pagefault_enable();
+		preempt_enable();
+	}
+
+	tail = len & VMX_ALIGN_MASK;
+	if (tail) {
+		p += len & ~VMX_ALIGN_MASK;
+		crc = crc32c_le_base(crc, p, tail);
+	}
+
+	return crc;
+}
+EXPORT_SYMBOL(crc32c_le_arch);
+
+u32 crc32_be_arch(u32 crc, const u8 *p, size_t len)
+{
+	return crc32_be_base(crc, p, len);
+}
+EXPORT_SYMBOL(crc32_be_arch);
+
+static int __init crc32_powerpc_init(void)
+{
+	if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
+	    (cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_VEC_CRYPTO))
+		static_branch_enable(&have_vec_crypto);
+	return 0;
+}
+arch_initcall(crc32_powerpc_init);
+
+static void __exit crc32_powerpc_exit(void)
+{
+}
+module_exit(crc32_powerpc_exit);
+
+u32 crc32_optimizations(void)
+{
+	if (static_key_enabled(&have_vec_crypto))
+		return CRC32C_OPTIMIZATION;
+	return 0;
+}
+EXPORT_SYMBOL(crc32_optimizations);
+
+MODULE_AUTHOR("Anton Blanchard <anton@samba.org>");
+MODULE_DESCRIPTION("CRC32C using vector polynomial multiply-sum instructions");
+MODULE_LICENSE("GPL");
diff --git a/arch/powerpc/crypto/crc32-vpmsum_core.S b/arch/powerpc/lib/crc32-vpmsum_core.S
similarity index 100%
rename from arch/powerpc/crypto/crc32-vpmsum_core.S
rename to arch/powerpc/lib/crc32-vpmsum_core.S
diff --git a/arch/powerpc/crypto/crc32c-vpmsum_asm.S b/arch/powerpc/lib/crc32c-vpmsum_asm.S
similarity index 100%
rename from arch/powerpc/crypto/crc32c-vpmsum_asm.S
rename to arch/powerpc/lib/crc32c-vpmsum_asm.S
-- 
2.47.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
