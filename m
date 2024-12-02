Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 772409DF797
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 02:09:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tHuwU-0003YG-Bu;
	Mon, 02 Dec 2024 01:09:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1tHuwS-0003Y8-O6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mfXOHMJJ1SO4S5P1j2JJE0j4xFN7R/DKu1qU6HbsvtY=; b=QHmErBK4KPB64NiV37RFHh8MlO
 Bh90tA8DzLVa4Lsyp3FCUWcRzkPaaN1Hy5RYm4W2YrZc59t97AhLFZ4NBNQ2OKfiODziOk7JufDug
 SqDhwAQ/wXXOXZ0K3ie8uxgXqQi+iHtFpIfTKWUH7cAnWBmXfXfuck9qw1Fsn4+us6o0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mfXOHMJJ1SO4S5P1j2JJE0j4xFN7R/DKu1qU6HbsvtY=; b=c+1+PiCjvU6vv4GUdptUegEray
 TZUE5LbxicxlJ52NsePUqxkpjPCpTvLlniHAtd3v0MWlq4xyR2uloy7D0DX3VQ8D+evM+xvOol6hS
 unOsgVrmSlfsVf8Cku39WCsCXjxUL23ZYGUp6NSIgeNP9AKAU09A/yuN+dMmBiAPcjgI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tHuwS-0006L9-Ob for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 01:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 43E9E5C64DE;
 Mon,  2 Dec 2024 01:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8375EC4CED2;
 Mon,  2 Dec 2024 01:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733101770;
 bh=xGrDkzLVO6E+4eZPpUKlS5IVcLqNoW+35bwjrDUo+QU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EHIb8zCHP+vl2aUf9gsNTQKvhQPpIJe149ciYbVO87fgEOB8QEzD5mkkNgj2oLvIN
 RD9uOMwbVEn9ixtJV6J++v5W+aeigXHnaU2G/jDK1AmC666nrEqU8n4PpSAjNS7fe4
 m7yDkQbN9iQ3lJbrHu6Vd9H7fd28T+uCR1Y0xl/HKKJoLrcwN/zqc/L9WE3zx+Lu6m
 Vb516vPDT136JhQULhykyOXyYUMiqC2hjEGNE/OX2taAEgvLGq/DGqeon5cTe7J+aL
 5Qr6+wuzVmW0MIE9lysg4Jr0i5+Zrqnnx/iPzdPFqnQu6Pa67Mzt0jVnqGByP+h+p0
 pZjkrS5hoYPjA==
To: linux-kernel@vger.kernel.org
Date: Sun,  1 Dec 2024 17:08:28 -0800
Message-ID: <20241202010844.144356-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make the CRC32
 library
 export a function crc32_optimizations() which returns flags that indicate
 which CRC32 functions are actually executing optimized code at runtime. 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tHuwS-0006L9-Ob
Subject: [f2fs-dev] [PATCH v4 03/19] lib/crc32: expose whether the lib is
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
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make the CRC32 library export a function crc32_optimizations() which
returns flags that indicate which CRC32 functions are actually executing
optimized code at runtime.

This will be used to determine whether the crc32[c]-$arch shash
algorithms should be registered in the crypto API.  btrfs could also
start using these flags instead of the hack that it currently uses where
it parses the crypto_shash_driver_name.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/crc32-glue.c  | 10 ++++++++++
 arch/riscv/lib/crc32-riscv.c | 10 ++++++++++
 include/linux/crc32.h        | 15 +++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index d7f6e1cbf0d2..15c4c9db573e 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -83,7 +83,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 
 	return crc32_be_arm64(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+u32 crc32_optimizations(void)
+{
+	if (alternative_has_cap_likely(ARM64_HAS_CRC32))
+		return CRC32_LE_OPTIMIZATION |
+		       CRC32_BE_OPTIMIZATION |
+		       CRC32C_OPTIMIZATION;
+	return 0;
+}
+EXPORT_SYMBOL(crc32_optimizations);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
index a3ff7db2a1ce..53d56ab422c7 100644
--- a/arch/riscv/lib/crc32-riscv.c
+++ b/arch/riscv/lib/crc32-riscv.c
@@ -295,7 +295,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 legacy:
 	return crc32_be_base(crc, p, len);
 }
 EXPORT_SYMBOL(crc32_be_arch);
 
+u32 crc32_optimizations(void)
+{
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
+		return CRC32_LE_OPTIMIZATION |
+		       CRC32_BE_OPTIMIZATION |
+		       CRC32C_OPTIMIZATION;
+	return 0;
+}
+EXPORT_SYMBOL(crc32_optimizations);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 58c632533b08..e9bd40056687 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
 	if (IS_ENABLED(CONFIG_CRC32_ARCH))
 		return crc32c_le_arch(crc, p, len);
 	return crc32c_le_base(crc, p, len);
 }
 
+/*
+ * crc32_optimizations() returns flags that indicate which CRC32 library
+ * functions are using architecture-specific optimizations.  Unlike
+ * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
+ * variants and also whether any needed CPU features are available at runtime.
+ */
+#define CRC32_LE_OPTIMIZATION	BIT(0) /* crc32_le() is optimized */
+#define CRC32_BE_OPTIMIZATION	BIT(1) /* crc32_be() is optimized */
+#define CRC32C_OPTIMIZATION	BIT(2) /* __crc32c_le() is optimized */
+#if IS_ENABLED(CONFIG_CRC32_ARCH)
+u32 crc32_optimizations(void);
+#else
+static inline u32 crc32_optimizations(void) { return 0; }
+#endif
+
 /**
  * crc32_le_combine - Combine two crc32 check values into one. For two
  * 		      sequences of bytes, seq1 and seq2 with lengths len1
  * 		      and len2, crc32_le() check values were calculated
  * 		      for each, crc1 and crc2.
-- 
2.47.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
