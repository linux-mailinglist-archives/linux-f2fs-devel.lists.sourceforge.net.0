Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5D9B0E27
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 21:16:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Pn6-0000JM-7p;
	Fri, 25 Oct 2024 19:16:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t4Pn1-0000Ij-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+pwnwNHNYBbLRaokl+Y14RyWoWAnqH9omSw/wIqbxRM=; b=k2MT9wQixazf3zARbH9f++ldO3
 GiabpYM9bxaKX9MRvoAa44xc0OYiAHHp/qkQtKFH3qzOz5RtPWwIfMv/PHqE2KHZjXymNJPjbAlZR
 DhQSOXvIH51VK6UovL+K9Q89Gc7ct8NJPSBDZKEop609vaAITht89+/gN8sC3Tu7VQ8A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+pwnwNHNYBbLRaokl+Y14RyWoWAnqH9omSw/wIqbxRM=; b=KJwXRLcgQwavPJtPoc8to2Kat+
 tEfETXe/mgIdYFepTKm+w9t9Jz4tPKNni+ifpdD4l1PWWnFAuDmxThBkEC8JeenmH6NURWUkOYqAv
 kZ4nJN8tFGyZdlG+WcbElyCcj/KOaKebbls0PHpYTKmaoGfkvK5Y9Wq5nVOJhq7s/3Lk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Pn0-0005jj-P0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 39EEE5C5F75;
 Fri, 25 Oct 2024 19:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA2EC4CEE6;
 Fri, 25 Oct 2024 19:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729883750;
 bh=C1Eoo6ZdwZ6ma+QPnxpHev6POdiDHK4uQ/Pd5lLsWBY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O0JkxrBorptbSvjunEMdzjVna9W+A1uELYkTSfUNqQrYSCNu52AYFloOnoRLCKHKi
 X3N16jUW6Rl5Uo3v0mCBUJF+sXIQP8W7yCppnn9CadyOO5L6+KYpv84QIrJHZOxv0j
 nqUVd7DRRJi2Un4U8qZ38BhDK//NXRxwORwqrvkNHpHZFmxEQf8FspDfYF/n1OxZp5
 3xVaLnrOlYSwZFQl88EA+bxGzVATTL6d+hSBjzf2hsmxn0baLnoLbtScPZ8CXcUsVS
 MRFEYvu9UjYXA9kt4RR0BK+J41yJVaAIYwsDjHV9TS4bCGmcCDA1xOQFRUi0ULfrvO
 NWx5wfpLuCikg==
To: linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2024 12:14:47 -0700
Message-ID: <20241025191454.72616-12-ebiggers@kernel.org>
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
 Content preview:  From: Eric Biggers <ebiggers@google.com> - Change the len
 parameter from unsigned int to size_t, so that the library function which
 takes a size_t can safely use this code. - Rename to crc32c_x86_3way() which
 is much clearer. 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4Pn0-0005jj-P0
Subject: [f2fs-dev] [PATCH v2 11/18] x86/crc32: update prototype for
 crc_pcl()
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

- Rename to crc32c_x86_3way() which is much clearer.

- Move the crc parameter to the front, as this is the usual convention.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/crc32c-intel_glue.c       |  7 ++-
 arch/x86/crypto/crc32c-pcl-intel-asm_64.S | 63 ++++++++++++-----------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/x86/crypto/crc32c-intel_glue.c b/arch/x86/crypto/crc32c-intel_glue.c
index 52c5d47ef5a1..603d159de400 100644
--- a/arch/x86/crypto/crc32c-intel_glue.c
+++ b/arch/x86/crypto/crc32c-intel_glue.c
@@ -39,12 +39,11 @@
  * size is >= 512 to account
  * for fpu state save/restore overhead.
  */
 #define CRC32C_PCL_BREAKEVEN	512
 
-asmlinkage unsigned int crc_pcl(const u8 *buffer, unsigned int len,
-				unsigned int crc_init);
+asmlinkage u32 crc32c_x86_3way(u32 crc, const u8 *buffer, size_t len);
 #endif /* CONFIG_X86_64 */
 
 static u32 crc32c_intel_le_hw_byte(u32 crc, unsigned char const *data, size_t length)
 {
 	while (length--) {
@@ -157,11 +156,11 @@ static int crc32c_pcl_intel_update(struct shash_desc *desc, const u8 *data,
 	 * use faster PCL version if datasize is large enough to
 	 * overcome kernel fpu state save/restore overhead
 	 */
 	if (len >= CRC32C_PCL_BREAKEVEN && crypto_simd_usable()) {
 		kernel_fpu_begin();
-		*crcp = crc_pcl(data, len, *crcp);
+		*crcp = crc32c_x86_3way(*crcp, data, len);
 		kernel_fpu_end();
 	} else
 		*crcp = crc32c_intel_le_hw(*crcp, data, len);
 	return 0;
 }
@@ -169,11 +168,11 @@ static int crc32c_pcl_intel_update(struct shash_desc *desc, const u8 *data,
 static int __crc32c_pcl_intel_finup(u32 *crcp, const u8 *data, unsigned int len,
 				u8 *out)
 {
 	if (len >= CRC32C_PCL_BREAKEVEN && crypto_simd_usable()) {
 		kernel_fpu_begin();
-		*(__le32 *)out = ~cpu_to_le32(crc_pcl(data, len, *crcp));
+		*(__le32 *)out = ~cpu_to_le32(crc32c_x86_3way(*crcp, data, len));
 		kernel_fpu_end();
 	} else
 		*(__le32 *)out =
 			~cpu_to_le32(crc32c_intel_le_hw(*crcp, data, len));
 	return 0;
diff --git a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
index 752812bc4991..9b8770503bbc 100644
--- a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
+++ b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
@@ -50,19 +50,20 @@
 
 # Define threshold below which buffers are considered "small" and routed to
 # regular CRC code that does not interleave the CRC instructions.
 #define SMALL_SIZE 200
 
-# unsigned int crc_pcl(const u8 *buffer, unsigned int len, unsigned int crc_init);
+# u32 crc32c_x86_3way(u32 crc, const u8 *buffer, size_t len);
 
 .text
-SYM_FUNC_START(crc_pcl)
-#define    bufp		  %rdi
-#define    bufp_d	  %edi
-#define    len		  %esi
-#define    crc_init	  %edx
-#define    crc_init_q	  %rdx
+SYM_FUNC_START(crc32c_x86_3way)
+#define    crc0		  %edi
+#define    crc0_q	  %rdi
+#define    bufp		  %rsi
+#define    bufp_d	  %esi
+#define    len		  %rdx
+#define    len_dw	  %edx
 #define    n_misaligned	  %ecx /* overlaps chunk_bytes! */
 #define    n_misaligned_q %rcx
 #define    chunk_bytes	  %ecx /* overlaps n_misaligned! */
 #define    chunk_bytes_q  %rcx
 #define    crc1		  %r8
@@ -83,13 +84,13 @@ SYM_FUNC_START(crc_pcl)
 	# Process 1 <= n_misaligned <= 7 bytes individually in order to align
 	# the remaining data to an 8-byte boundary.
 .Ldo_align:
 	movq	(bufp), %rax
 	add	n_misaligned_q, bufp
-	sub	n_misaligned, len
+	sub	n_misaligned_q, len
 .Lalign_loop:
-	crc32b	%al, crc_init		# compute crc32 of 1-byte
+	crc32b	%al, crc0		# compute crc32 of 1-byte
 	shr	$8, %rax		# get next byte
 	dec	n_misaligned
 	jne     .Lalign_loop
 .Laligned:
 
@@ -100,11 +101,11 @@ SYM_FUNC_START(crc_pcl)
 	cmp	$128*24, len
 	jae     .Lfull_block
 
 .Lpartial_block:
 	# Compute floor(len / 24) to get num qwords to process from each lane.
-	imul	$2731, len, %eax	# 2731 = ceil(2^16 / 24)
+	imul	$2731, len_dw, %eax	# 2731 = ceil(2^16 / 24)
 	shr	$16, %eax
 	jmp	.Lcrc_3lanes
 
 .Lfull_block:
 	# Processing 128 qwords from each lane.
@@ -123,20 +124,20 @@ SYM_FUNC_START(crc_pcl)
 	jl	.Lcrc_3lanes_4x_done
 
 	# Unroll the loop by a factor of 4 to reduce the overhead of the loop
 	# bookkeeping instructions, which can compete with crc32q for the ALUs.
 .Lcrc_3lanes_4x_loop:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	crc32q	(bufp,chunk_bytes_q), crc1
 	crc32q	(bufp,chunk_bytes_q,2), crc2
-	crc32q	8(bufp), crc_init_q
+	crc32q	8(bufp), crc0_q
 	crc32q	8(bufp,chunk_bytes_q), crc1
 	crc32q	8(bufp,chunk_bytes_q,2), crc2
-	crc32q	16(bufp), crc_init_q
+	crc32q	16(bufp), crc0_q
 	crc32q	16(bufp,chunk_bytes_q), crc1
 	crc32q	16(bufp,chunk_bytes_q,2), crc2
-	crc32q	24(bufp), crc_init_q
+	crc32q	24(bufp), crc0_q
 	crc32q	24(bufp,chunk_bytes_q), crc1
 	crc32q	24(bufp,chunk_bytes_q,2), crc2
 	add	$32, bufp
 	sub	$4, %eax
 	jge	.Lcrc_3lanes_4x_loop
@@ -144,42 +145,42 @@ SYM_FUNC_START(crc_pcl)
 .Lcrc_3lanes_4x_done:
 	add	$4, %eax
 	jz	.Lcrc_3lanes_last_qword
 
 .Lcrc_3lanes_1x_loop:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	crc32q	(bufp,chunk_bytes_q), crc1
 	crc32q	(bufp,chunk_bytes_q,2), crc2
 	add	$8, bufp
 	dec	%eax
 	jnz	.Lcrc_3lanes_1x_loop
 
 .Lcrc_3lanes_last_qword:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	crc32q	(bufp,chunk_bytes_q), crc1
 # SKIP  crc32q	(bufp,chunk_bytes_q,2), crc2	; Don't do this one yet
 
 	################################################################
 	## 4) Combine three results:
 	################################################################
 
 	lea	(K_table-8)(%rip), %rax		# first entry is for idx 1
 	pmovzxdq (%rax,chunk_bytes_q), %xmm0	# 2 consts: K1:K2
 	lea	(chunk_bytes,chunk_bytes,2), %eax # chunk_bytes * 3
-	sub	%eax, len			# len -= chunk_bytes * 3
+	sub	%rax, len			# len -= chunk_bytes * 3
 
-	movq	crc_init_q, %xmm1		# CRC for block 1
+	movq	crc0_q, %xmm1			# CRC for block 1
 	pclmulqdq $0x00, %xmm0, %xmm1		# Multiply by K2
 
 	movq    crc1, %xmm2			# CRC for block 2
 	pclmulqdq $0x10, %xmm0, %xmm2		# Multiply by K1
 
 	pxor    %xmm2,%xmm1
 	movq    %xmm1, %rax
 	xor	(bufp,chunk_bytes_q,2), %rax
-	mov	crc2, crc_init_q
-	crc32	%rax, crc_init_q
+	mov	crc2, crc0_q
+	crc32	%rax, crc0_q
 	lea	8(bufp,chunk_bytes_q,2), bufp
 
 	################################################################
 	## 5) If more blocks remain, goto (2):
 	################################################################
@@ -191,38 +192,38 @@ SYM_FUNC_START(crc_pcl)
 
 	#######################################################################
 	## 6) Process any remainder without interleaving:
 	#######################################################################
 .Lsmall:
-	test	len, len
+	test	len_dw, len_dw
 	jz	.Ldone
-	mov	len, %eax
+	mov	len_dw, %eax
 	shr	$3, %eax
 	jz	.Ldo_dword
 .Ldo_qwords:
-	crc32q	(bufp), crc_init_q
+	crc32q	(bufp), crc0_q
 	add	$8, bufp
 	dec	%eax
 	jnz	.Ldo_qwords
 .Ldo_dword:
-	test	$4, len
+	test	$4, len_dw
 	jz	.Ldo_word
-	crc32l	(bufp), crc_init
+	crc32l	(bufp), crc0
 	add	$4, bufp
 .Ldo_word:
-	test	$2, len
+	test	$2, len_dw
 	jz	.Ldo_byte
-	crc32w	(bufp), crc_init
+	crc32w	(bufp), crc0
 	add	$2, bufp
 .Ldo_byte:
-	test	$1, len
+	test	$1, len_dw
 	jz	.Ldone
-	crc32b	(bufp), crc_init
+	crc32b	(bufp), crc0
 .Ldone:
-	mov	crc_init, %eax
+	mov	crc0, %eax
         RET
-SYM_FUNC_END(crc_pcl)
+SYM_FUNC_END(crc32c_x86_3way)
 
 .section	.rodata, "a", @progbits
 	################################################################
 	## PCLMULQDQ tables
 	## Table is 128 entries x 2 words (8 bytes) each
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
