Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 192FD9BA893
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Nov 2024 23:32:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7j9E-00051r-0L;
	Sun, 03 Nov 2024 22:32:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t7j9C-00051b-8b
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0fm/v7pfsGIWxQJG+ZOfu8jRC3wMm+SVFY2EbDYp1+0=; b=PeBbw85pudCsp5w7vdAL7tvkBx
 gUz5SaiuP9exiyY8lmCKc626w59Eozu/zRiorXsnlFnjU+Ku1AINc3bCbinl/v1q7o6BbaOrAeF4S
 bWaRCU5Ren34QiHDh2WBe0evbJmfepp4XZhwzAle6A+mX0daeyY3MQ978tpfqEH8+f30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0fm/v7pfsGIWxQJG+ZOfu8jRC3wMm+SVFY2EbDYp1+0=; b=JEnEeZMq8D7o9eZNIQw2qxWPVa
 hAp07kSU/1afc8oujo9CNNQA6dYZG3VCBC2x/zFx5TfGvrfaK0uAjHp6Sey6g33CaIl3+v6Lb59yG
 DIWJ0fAaTWiKIHBO1NEt7QAcGR+ybSUWsdiBhmhmkiJdjN9P08n9CLzo03/ZRK9NIBpM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7j9A-0005s0-8e for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 409E7A41F06;
 Sun,  3 Nov 2024 22:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE5CC4CED4;
 Sun,  3 Nov 2024 22:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730673145;
 bh=aQx2of0YxY8WIGZoMkP00SggKkaZtnWYsiXvyH2QOMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VtOJZhHa7cYAybApcWeSaKbpiudoVOFGuFDH8l6SegXZ2A40or+s7/q8DtnBsf0vG
 wbjsUVEeQhrHMrNRM9Lc6QRpLufHetMUuXNbVW837WyVju0Dxo0nIbv8iY+13/ZrCs
 IJFYvAGkty3sioHEgihQt4Figk5+JGLnPJ5kkv2zDFuYYVIiTHcq3rtS5BzCQ0Fuje
 XpxxkUh9SDZGF9+paViPv8+5wuzGpFa4jy6YgrbXBqTwjQKRedPXy7G6GS0L3QS1kY
 ZIg1ppJVdfoq/RrbtQICFwficNgBUuJ+dJ9qO1Q50qy7QLp4lppuFxYrGwhAKsQ1iy
 /2NiwTwXRSEfg==
To: linux-kernel@vger.kernel.org
Date: Sun,  3 Nov 2024 14:31:38 -0800
Message-ID: <20241103223154.136127-3-ebiggers@kernel.org>
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
 Content preview: From: Eric Biggers <ebiggers@google.com> Currently the CRC32
 library functions are defined as weak symbols,
 and the arm64 and riscv architectures
 override them. This method of arch-specific overrides has the limitation
 that it only works when both the base and arch code is built-in. Also, it
 makes the arch-specific code be silently not used if it is accidenta [...]
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
X-Headers-End: 1t7j9A-0005s0-8e
Subject: [f2fs-dev] [PATCH v3 02/18] lib/crc32: improve support for
 arch-specific overrides
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

Currently the CRC32 library functions are defined as weak symbols, and
the arm64 and riscv architectures override them.

This method of arch-specific overrides has the limitation that it only
works when both the base and arch code is built-in.  Also, it makes the
arch-specific code be silently not used if it is accidentally built with
lib-y instead of obj-y; unfortunately the RISC-V code does this.

This commit reorganizes the code to have explicit *_arch() functions
that are called when they are enabled, similar to how some of the crypto
library code works (e.g. chacha_crypt() calls chacha_crypt_arch()).

Make the existing kconfig choice for the CRC32 implementation also
control whether the arch-optimized implementation (if one is available)
is enabled or not.  Make it enabled by default if CRC32 is also enabled.

The result is that arch-optimized CRC32 library functions will be
included automatically when appropriate, but it is now possible to
disable them.  They can also now be built as a loadable module if the
CRC32 library functions happen to be used only by loadable modules, in
which case the arch and base CRC32 modules will be automatically loaded
via direct symbol dependency when appropriate.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/Kconfig                        |  1 +
 arch/arm64/lib/Makefile                   |  3 +-
 arch/arm64/lib/crc32-glue.c               | 13 ++++-
 arch/riscv/Kconfig                        |  1 +
 arch/riscv/lib/Makefile                   |  3 +-
 arch/riscv/lib/{crc32.c => crc32-riscv.c} | 13 ++++-
 crypto/crc32_generic.c                    |  4 +-
 crypto/crc32c_generic.c                   |  4 +-
 include/linux/crc32.h                     | 35 +++++++++---
 lib/Kconfig                               | 70 +++++++++++++++++------
 lib/crc32.c                               | 22 +++----
 11 files changed, 118 insertions(+), 51 deletions(-)
 rename arch/riscv/lib/{crc32.c => crc32-riscv.c} (94%)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..1e48f40f654e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -19,10 +19,11 @@ config ARM64
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
+	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_OPS if XEN
 	select ARCH_HAS_DMA_PREP_COHERENT
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 8e882f479d98..5fbcf0d56665 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -11,11 +11,12 @@ CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
 CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
-obj-$(CONFIG_CRC32) += crc32.o crc32-glue.o
+obj-$(CONFIG_CRC32_ARCH) += crc32-arm64.o
+crc32-arm64-y := crc32.o crc32-glue.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
 
diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index ad015223d15d..d7f6e1cbf0d2 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/crc32.h>
 #include <linux/linkage.h>
+#include <linux/module.h>
 
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
@@ -19,11 +20,11 @@ asmlinkage u32 crc32_be_arm64(u32 crc, unsigned char const *p, size_t len);
 
 asmlinkage u32 crc32_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32c_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32_be_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 
-u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -38,12 +39,13 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 			return crc;
 	}
 
 	return crc32_le_arm64(crc, p, len);
 }
+EXPORT_SYMBOL(crc32_le_arch);
 
-u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32c_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -58,12 +60,13 @@ u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 			return crc;
 	}
 
 	return crc32c_le_arm64(crc, p, len);
 }
+EXPORT_SYMBOL(crc32c_le_arch);
 
-u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_be_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -78,5 +81,9 @@ u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
 			return crc;
 	}
 
 	return crc32_be_arm64(crc, p, len);
 }
+EXPORT_SYMBOL(crc32_be_arch);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f4c570538d55..046f0cb119da 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -22,10 +22,11 @@ config RISCV
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CRC32 if RISCV_ISA_ZBC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_FAST_MULTIPLIER
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 8eec6b69a875..79368a895fee 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -13,10 +13,9 @@ ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
 endif
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
-lib-$(CONFIG_RISCV_ISA_ZBC)	+= crc32.o
-
+obj-$(CONFIG_CRC32_ARCH)	+= crc32-riscv.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32-riscv.c
similarity index 94%
rename from arch/riscv/lib/crc32.c
rename to arch/riscv/lib/crc32-riscv.c
index 333fb7af1192..a3ff7db2a1ce 100644
--- a/arch/riscv/lib/crc32.c
+++ b/arch/riscv/lib/crc32-riscv.c
@@ -12,10 +12,11 @@
 #include <linux/types.h>
 #include <linux/minmax.h>
 #include <linux/crc32poly.h>
 #include <linux/crc32.h>
 #include <linux/byteorder/generic.h>
+#include <linux/module.h>
 
 /*
  * Refer to https://www.corsix.org/content/barrett-reduction-polynomials for
  * better understanding of how this math works.
  *
@@ -215,21 +216,23 @@ static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
 
 legacy:
 	return crc_fb(crc, p, len);
 }
 
-u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, CRC32_POLY_LE, CRC32_POLY_QT_LE,
 				crc32_le_base);
 }
+EXPORT_SYMBOL(crc32_le_arch);
 
-u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
 				CRC32C_POLY_QT_LE, crc32c_le_base);
 }
+EXPORT_SYMBOL(crc32c_le_arch);
 
 static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 				     size_t len)
 {
 	size_t bits = len * 8;
@@ -251,11 +254,11 @@ static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 	crc ^= crc_low;
 
 	return crc;
 }
 
-u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	size_t offset, head_len, tail_len;
 	unsigned long const *p_ul;
 	unsigned long s;
 
@@ -290,5 +293,9 @@ u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
 	return crc;
 
 legacy:
 	return crc32_be_base(crc, p, len);
 }
+EXPORT_SYMBOL(crc32_be_arch);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
index 6a55d206fab3..cc064ea8240e 100644
--- a/crypto/crc32_generic.c
+++ b/crypto/crc32_generic.c
@@ -158,16 +158,16 @@ static struct shash_alg algs[] = {{
 }};
 
 static int __init crc32_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + (&crc32_le != &crc32_le_base));
+	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 static void __exit crc32_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + (&crc32_le != &crc32_le_base));
+	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 subsys_initcall(crc32_mod_init);
 module_exit(crc32_mod_fini);
 
diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
index 635599b255ec..04b03d825cf4 100644
--- a/crypto/crc32c_generic.c
+++ b/crypto/crc32c_generic.c
@@ -198,16 +198,16 @@ static struct shash_alg algs[] = {{
 }};
 
 static int __init crc32c_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
+	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
+	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 subsys_initcall(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 5b07fc9081c4..58c632533b08 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -6,14 +6,38 @@
 #define _LINUX_CRC32_H
 
 #include <linux/types.h>
 #include <linux/bitrev.h>
 
-u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32_le_base(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32_be_base(u32 crc, unsigned char const *p, size_t len);
+u32 __pure crc32_le_arch(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32_le_base(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32c_le_arch(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32c_le_base(u32 crc, const u8 *p, size_t len);
+
+static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
+{
+	if (IS_ENABLED(CONFIG_CRC32_ARCH))
+		return crc32_le_arch(crc, p, len);
+	return crc32_le_base(crc, p, len);
+}
+
+static inline u32 __pure crc32_be(u32 crc, const u8 *p, size_t len)
+{
+	if (IS_ENABLED(CONFIG_CRC32_ARCH))
+		return crc32_be_arch(crc, p, len);
+	return crc32_be_base(crc, p, len);
+}
+
+/* TODO: leading underscores should be dropped once callers have been updated */
+static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
+{
+	if (IS_ENABLED(CONFIG_CRC32_ARCH))
+		return crc32c_le_arch(crc, p, len);
+	return crc32c_le_base(crc, p, len);
+}
 
 /**
  * crc32_le_combine - Combine two crc32 check values into one. For two
  * 		      sequences of bytes, seq1 and seq2 with lengths len1
  * 		      and len2, crc32_le() check values were calculated
@@ -36,13 +60,10 @@ u32 __attribute_const__ crc32_le_shift(u32 crc, size_t len);
 static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
 {
 	return crc32_le_shift(crc1, len2) ^ crc2;
 }
 
-u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
-
 /**
  * __crc32c_le_combine - Combine two crc32c check values into one. For two
  * 			 sequences of bytes, seq1 and seq2 with lengths len1
  * 			 and len2, __crc32c_le() check values were calculated
  * 			 for each, crc1 and crc2.
diff --git a/lib/Kconfig b/lib/Kconfig
index b38849af6f13..07afcf214f35 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -176,10 +176,13 @@ config CRC32
 	  This option is provided for the case where no in-kernel-tree
 	  modules require CRC32/CRC32c functions, but a module built outside
 	  the kernel tree does. Such modules that use library CRC32/CRC32c
 	  functions require M here.
 
+config ARCH_HAS_CRC32
+	bool
+
 config CRC32_SELFTEST
 	tristate "CRC32 perform self test on init"
 	depends on CRC32
 	help
 	  This option enables the CRC32 library functions to perform a
@@ -188,54 +191,89 @@ config CRC32_SELFTEST
 	  and computes the total elapsed time and number of bytes processed.
 
 choice
 	prompt "CRC32 implementation"
 	depends on CRC32
-	default CRC32_SLICEBY8
+	default CRC32_IMPL_ARCH_PLUS_SLICEBY8 if ARCH_HAS_CRC32
+	default CRC32_IMPL_SLICEBY8 if !ARCH_HAS_CRC32
 	help
-	  This option allows a kernel builder to override the default choice
-	  of CRC32 algorithm.  Choose the default ("slice by 8") unless you
-	  know that you need one of the others.
+	  This option allows you to override the default choice of CRC32
+	  implementation.  Choose the default unless you know that you need one
+	  of the others.
 
-config CRC32_SLICEBY8
+config CRC32_IMPL_ARCH_PLUS_SLICEBY8
+	bool "Arch-optimized, with fallback to slice-by-8" if ARCH_HAS_CRC32
+	help
+	  Use architecture-optimized implementation of CRC32.  Fall back to
+	  slice-by-8 in cases where the arch-optimized implementation cannot be
+	  used, e.g. if the CPU lacks support for the needed instructions.
+
+	  This is the default when an arch-optimized implementation exists.
+
+config CRC32_IMPL_ARCH_PLUS_SLICEBY1
+	bool "Arch-optimized, with fallback to slice-by-1" if ARCH_HAS_CRC32
+	help
+	  Use architecture-optimized implementation of CRC32, but fall back to
+	  slice-by-1 instead of slice-by-8 in order to reduce the binary size.
+
+config CRC32_IMPL_SLICEBY8
 	bool "Slice by 8 bytes"
 	help
 	  Calculate checksum 8 bytes at a time with a clever slicing algorithm.
-	  This is the fastest algorithm, but comes with a 8KiB lookup table.
-	  Most modern processors have enough cache to hold this table without
-	  thrashing the cache.
-
-	  This is the default implementation choice.  Choose this one unless
-	  you have a good reason not to.
+	  This is much slower than the architecture-optimized implementation of
+	  CRC32 (if the selected arch has one), but it is portable and is the
+	  fastest implementation when no arch-optimized implementation is
+	  available.  It uses an 8KiB lookup table.  Most modern processors have
+	  enough cache to hold this table without thrashing the cache.
 
-config CRC32_SLICEBY4
+config CRC32_IMPL_SLICEBY4
 	bool "Slice by 4 bytes"
 	help
 	  Calculate checksum 4 bytes at a time with a clever slicing algorithm.
 	  This is a bit slower than slice by 8, but has a smaller 4KiB lookup
 	  table.
 
 	  Only choose this option if you know what you are doing.
 
-config CRC32_SARWATE
-	bool "Sarwate's Algorithm (one byte at a time)"
+config CRC32_IMPL_SLICEBY1
+	bool "Slice by 1 byte (Sarwate's algorithm)"
 	help
 	  Calculate checksum a byte at a time using Sarwate's algorithm.  This
-	  is not particularly fast, but has a small 256 byte lookup table.
+	  is not particularly fast, but has a small 1KiB lookup table.
 
 	  Only choose this option if you know what you are doing.
 
-config CRC32_BIT
+config CRC32_IMPL_BIT
 	bool "Classic Algorithm (one bit at a time)"
 	help
 	  Calculate checksum one bit at a time.  This is VERY slow, but has
 	  no lookup table.  This is provided as a debugging option.
 
 	  Only choose this option if you are debugging crc32.
 
 endchoice
 
+config CRC32_ARCH
+	tristate
+	default CRC32 if CRC32_IMPL_ARCH_PLUS_SLICEBY8 || CRC32_IMPL_ARCH_PLUS_SLICEBY1
+
+config CRC32_SLICEBY8
+	bool
+	default y if CRC32_IMPL_SLICEBY8 || CRC32_IMPL_ARCH_PLUS_SLICEBY8
+
+config CRC32_SLICEBY4
+	bool
+	default y if CRC32_IMPL_SLICEBY4
+
+config CRC32_SARWATE
+	bool
+	default y if CRC32_IMPL_SLICEBY1 || CRC32_IMPL_ARCH_PLUS_SLICEBY1
+
+config CRC32_BIT
+	bool
+	default y if CRC32_IMPL_BIT
+
 config CRC64
 	tristate "CRC64 functions"
 	help
 	  This option is provided for the case where no in-kernel-tree
 	  modules require CRC64 functions, but a module built outside
diff --git a/lib/crc32.c b/lib/crc32.c
index c67059b0082b..47151624332e 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -181,39 +181,31 @@ static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
 #endif
 	return crc;
 }
 
 #if CRC_LE_BITS == 1
-u32 __pure __weak crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, NULL, CRC32_POLY_LE);
 }
-u32 __pure __weak __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, NULL, CRC32C_POLY_LE);
 }
 #else
-u32 __pure __weak crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, crc32table_le, CRC32_POLY_LE);
 }
-u32 __pure __weak __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, crc32ctable_le, CRC32C_POLY_LE);
 }
 #endif
-EXPORT_SYMBOL(crc32_le);
-EXPORT_SYMBOL(__crc32c_le);
-
-u32 __pure crc32_le_base(u32, unsigned char const *, size_t) __alias(crc32_le);
 EXPORT_SYMBOL(crc32_le_base);
-
-u32 __pure crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
 EXPORT_SYMBOL(crc32c_le_base);
 
-u32 __pure crc32_be_base(u32, unsigned char const *, size_t) __alias(crc32_be);
-
 /*
  * This multiplies the polynomials x and y modulo the given modulus.
  * This follows the "little-endian" CRC convention that the lsbit
  * represents the highest power of x, and the msbit represents x^0.
  */
@@ -333,16 +325,16 @@ static inline u32 __pure crc32_be_generic(u32 crc, unsigned char const *p,
 # endif
 	return crc;
 }
 
 #if CRC_BE_BITS == 1
-u32 __pure __weak crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, NULL, CRC32_POLY_BE);
 }
 #else
-u32 __pure __weak crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
 }
 #endif
-EXPORT_SYMBOL(crc32_be);
+EXPORT_SYMBOL(crc32_be_base);
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
