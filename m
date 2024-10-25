Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECC79B0E1A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 21:16:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Pmx-0003Ar-T9;
	Fri, 25 Oct 2024 19:15:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t4Pmv-0003Ac-Ts
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZbM/dRE/cmjAUskRJwoD4lvL88KbXE8EmwY+oWCwVM=; b=mxvMHZlTtOK3e7tted7tYn4U6P
 17v0S8h+GVCbrs7NLXvvKl9KORYwRvdAJQ/kBOdnbr0P3CmFGXdhfryBjjtT+OCC6lBCrrtOzE8w2
 g79/Z7lE/HbK75hvV6ZezMEnXjqGvXtboyBhwFM6gvZr8kQSYT3c5L3NbjwQht8SP+cU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zZbM/dRE/cmjAUskRJwoD4lvL88KbXE8EmwY+oWCwVM=; b=JU66FpZyKE5LmPVyociLfV6jA2
 3tff9zVmwhfGrTSccadHUBqxj2RMc8jsDelRO0E/cjAJHg8X7Ei3LTNzKbZ5iAd32radNc9AM6nHl
 Vi99kiQ18mE5iE8VoNecXTWz8UZz6+m8tsGn9C99Xzw3CxE+MD6ShCFzJ/giwKx7FaeQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Pmu-0005hm-HL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EFA485C56B1;
 Fri, 25 Oct 2024 19:15:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AED1C4CEF2;
 Fri, 25 Oct 2024 19:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729883745;
 bh=cAJYaYF7J3aaXrRf/1YfFopFsst+6vDJ5/6wykaVcrg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QI9KH2T6touAeB0Bal3BOeVfOL9fssjod4GL6OqC7Pk6qRKNz9IPMverC8NgaWU7O
 ER6xq1eq2ZWfPo1xlfIxSL/jgpJppO0mPJ89PTjZdCahyFmziLwWnkwj43+YtLFUKh
 /cLt9rhrf2AqarRF5VND46RANchTj3PmSwBF/braEnqKyKknURDV8wgDod4hG3GHwt
 byCNSM8KoUkpZF/cgYu4kz52r7RJwzyRomoqpWsVuW7t4xdVjwDKO15dN8Fjxh5Riz
 t4wuPl8VpjQO5DRxjrsjFjxHcMDbZrCjQv+8hlnhaXJ1VjD5rLSfkGmv2hg6GCMm7U
 TOvve01DNwQ8w==
To: linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2024 12:14:39 -0700
Message-ID: <20241025191454.72616-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025191454.72616-1-ebiggers@kernel.org>
References: <20241025191454.72616-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make the CRC32
 library
 export some flags that indicate which CRC32 functions are actually executing
 optimized code at runtime. Set these correctly from the architectures that
 implement the CRC32 funct [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4Pmu-0005hm-HL
Subject: [f2fs-dev] [PATCH v2 03/18] lib/crc32: expose whether the lib is
 really optimized at runtime
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
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make the CRC32 library export some flags that indicate which CRC32
functions are actually executing optimized code at runtime.  Set these
correctly from the architectures that implement the CRC32 functions.

This will be used to determine whether the crc32[c]-$arch shash
algorithms should be registered in the crypto API.  btrfs could also
start using these flags instead of the hack that it currently uses where
it parses the crypto_shash_driver_name.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
 arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
 include/linux/crc32.h        | 15 +++++++++++++++
 lib/crc32.c                  |  5 +++++
 4 files changed, 50 insertions(+)

diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index d7f6e1cbf0d2..16f2b7c04294 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -83,7 +83,22 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 
 	return crc32_be_arm64(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+static int __init crc32_arm64_init(void)
+{
+	if (cpus_have_cap(ARM64_HAS_CRC32))
+		crc32_optimizations = CRC32_LE_OPTIMIZATION |
+				      CRC32_BE_OPTIMIZATION |
+				      CRC32C_OPTIMIZATION;
+	return 0;
+}
+arch_initcall(crc32_arm64_init);
+
+static void __exit crc32_arm64_exit(void)
+{
+}
+module_exit(crc32_arm64_exit);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
index a3ff7db2a1ce..a61c13d89364 100644
--- a/arch/riscv/lib/crc32-riscv.c
+++ b/arch/riscv/lib/crc32-riscv.c
@@ -295,7 +295,22 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 legacy:
 	return crc32_be_base(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+static int __init crc32_riscv_init(void)
+{
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+		crc32_optimizations = CRC32_LE_OPTIMIZATION |
+				      CRC32_BE_OPTIMIZATION |
+				      CRC32C_OPTIMIZATION;
+	return 0;
+}
+arch_initcall(crc32_riscv_init);
+
+static void __exit crc32_riscv_exit(void)
+{
+}
+module_exit(crc32_riscv_exit);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 58c632533b08..bf26d454b60d 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
 	if (IS_ENABLED(CONFIG_CRC32_ARCH))
 		return crc32c_le_arch(crc, p, len);
 	return crc32c_le_base(crc, p, len);
 }
 
+/*
+ * crc32_optimizations contains flags that indicate which CRC32 library
+ * functions are using architecture-specific optimizations.  Unlike
+ * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
+ * variants and also whether any needed CPU features are available at runtime.
+ */
+#define CRC32_LE_OPTIMIZATION	BIT(0) /* crc32_le() is optimized */
+#define CRC32_BE_OPTIMIZATION	BIT(1) /* crc32_be() is optimized */
+#define CRC32C_OPTIMIZATION	BIT(2) /* __crc32c_le() is optimized */
+#if IS_ENABLED(CONFIG_CRC32_ARCH)
+extern u32 crc32_optimizations;
+#else
+#define crc32_optimizations 0
+#endif
+
 /**
  * crc32_le_combine - Combine two crc32 check values into one. For two
  * 		      sequences of bytes, seq1 and seq2 with lengths len1
  * 		      and len2, crc32_le() check values were calculated
  * 		      for each, crc1 and crc2.
diff --git a/lib/crc32.c b/lib/crc32.c
index 47151624332e..194de73f30f8 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -336,5 +336,10 @@ u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
 }
 #endif
 EXPORT_SYMBOL(crc32_be_base);
+
+#if IS_ENABLED(CONFIG_CRC32_ARCH)
+u32 crc32_optimizations;
+EXPORT_SYMBOL(crc32_optimizations);
+#endif
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
