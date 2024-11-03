Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC19BA8A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Nov 2024 23:32:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7j9N-0001tA-JF;
	Sun, 03 Nov 2024 22:32:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t7j9H-0001sP-FF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dvjZkh3zkAhMlbw52j1ldldjhDmcPTBwWYL8Z0l92B8=; b=biFDT9QJ0J8d/GOk84FZZmLAp2
 7olP529HoePPnptrovfyUH8yFlJ5FcgevBxFImKbT3zH9HtgCoF2QATK1WFEaVP6/9keoL6Xll3s0
 YZiz3i1Ral7j70xTUbAb1MQ8kWDfRSudzCkTbYP46qRZwUuPvWIlxXygFUO5QCCDgliQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dvjZkh3zkAhMlbw52j1ldldjhDmcPTBwWYL8Z0l92B8=; b=l2TDfq+7Sh4CD1niec64NAXC9G
 0qjMuRlYmC6tC9kXa05e2WOOKc8foNANzIzep8HeONUGHVQ82bs2y8t5Q3hpwonOhcOBIfuaXqcJ+
 rFNWCYN7rjVw+EiTslvkvMmpJPx72H3NTdWY8E+4uG5P9n54/JuJ03WtkpYmOjjyoJ1s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7j9H-0005sb-C7 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AD645A41F27;
 Sun,  3 Nov 2024 22:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1B1C4CED5;
 Sun,  3 Nov 2024 22:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730673150;
 bh=kHWHhodawY/PaSA95ElCxVPVWHZVNPifFLwbM7bCJig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gDJYU9VdynkbrvLTjDKcTxSufZxtp+Z/zMYrGwL5d2/F5cTIiZu1Wiw+ZESK7zmQS
 +FFVnjuv4vyOUFtNqcdFrGqLx5zsxKvE3A/xalMHiUtHdDZkIjSfdPYQrmB+6ySqN+
 ddALTCJazXYVXhJOLaKgL3dfJtSCjV81z+BsXvYwPjGClNzLQ4cQVDO2B3vdW7vngf
 Ygplb6uFLVhngaCOPYPIZPgRzKkBx/DiAHo4iNxyCSe/0PUKsaXTUY0emAEWvjikbw
 EnEr47Hb2cCBNuPm9gE5gZTGCE0N5bdYov6knFp5JgN+MZa5XIQpyBQ3L84i8WidC1
 QmT6y3lT/YF/w==
To: linux-kernel@vger.kernel.org
Date: Sun,  3 Nov 2024 14:31:48 -0800
Message-ID: <20241103223154.136127-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241103223154.136127-1-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> - Change the len
 parameter from unsigned int to size_t, so that the library function which
 takes a size_t can safely use this code. - Move the crc parameter to the front,
 as this is the usual convention. 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7j9H-0005sb-C7
Subject: [f2fs-dev] [PATCH v3 12/18] x86/crc32: update prototype for
 crc32_pclmul_le_16()
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

- Change the len parameter from unsigned int to size_t, so that the
  library function which takes a size_t can safely use this code.

- Move the crc parameter to the front, as this is the usual convention.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/crc32-pclmul_asm.S  | 19 +++++++++----------
 arch/x86/crypto/crc32-pclmul_glue.c |  4 ++--
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/x86/crypto/crc32-pclmul_asm.S b/arch/x86/crypto/crc32-pclmul_asm.S
index 5d31137e2c7d..f9637789cac1 100644
--- a/arch/x86/crypto/crc32-pclmul_asm.S
+++ b/arch/x86/crypto/crc32-pclmul_asm.S
@@ -56,30 +56,29 @@
 	.octa 0x00000001F701164100000001DB710641
 
 #define CONSTANT %xmm0
 
 #ifdef __x86_64__
-#define BUF     %rdi
-#define LEN     %rsi
-#define CRC     %edx
+#define CRC     %edi
+#define BUF     %rsi
+#define LEN     %rdx
 #else
-#define BUF     %eax
-#define LEN     %edx
-#define CRC     %ecx
+#define CRC     %eax
+#define BUF     %edx
+#define LEN     %ecx
 #endif
 
 
 
 .text
 /**
  *      Calculate crc32
- *      BUF - buffer (16 bytes aligned)
- *      LEN - sizeof buffer (16 bytes aligned), LEN should be grater than 63
  *      CRC - initial crc32
+ *      BUF - buffer (16 bytes aligned)
+ *      LEN - sizeof buffer (16 bytes aligned), LEN should be greater than 63
  *      return %eax crc32
- *      uint crc32_pclmul_le_16(unsigned char const *buffer,
- *	                     size_t len, uint crc32)
+ *      u32 crc32_pclmul_le_16(u32 crc, const u8 *buffer, size_t len);
  */
 
 SYM_FUNC_START(crc32_pclmul_le_16) /* buffer and buffer size are 16 bytes aligned */
 	movdqa  (BUF), %xmm1
 	movdqa  0x10(BUF), %xmm2
diff --git a/arch/x86/crypto/crc32-pclmul_glue.c b/arch/x86/crypto/crc32-pclmul_glue.c
index 9f5e342b9845..9d14eac51c5b 100644
--- a/arch/x86/crypto/crc32-pclmul_glue.c
+++ b/arch/x86/crypto/crc32-pclmul_glue.c
@@ -44,11 +44,11 @@
 #define PCLMUL_MIN_LEN		64L     /* minimum size of buffer
 					 * for crc32_pclmul_le_16 */
 #define SCALE_F			16L	/* size of xmm register */
 #define SCALE_F_MASK		(SCALE_F - 1)
 
-u32 crc32_pclmul_le_16(unsigned char const *buffer, size_t len, u32 crc32);
+u32 crc32_pclmul_le_16(u32 crc, const u8 *buffer, size_t len);
 
 static u32 __attribute__((pure))
 	crc32_pclmul_le(u32 crc, unsigned char const *p, size_t len)
 {
 	unsigned int iquotient;
@@ -69,11 +69,11 @@ static u32 __attribute__((pure))
 	}
 	iquotient = len & (~SCALE_F_MASK);
 	iremainder = len & SCALE_F_MASK;
 
 	kernel_fpu_begin();
-	crc = crc32_pclmul_le_16(p, iquotient, crc);
+	crc = crc32_pclmul_le_16(crc, p, iquotient);
 	kernel_fpu_end();
 
 	if (iremainder)
 		crc = crc32_le(crc, p + iquotient, iremainder);
 
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
