Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D99B0E19
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 21:16:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Pmu-0003AO-D3;
	Fri, 25 Oct 2024 19:15:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t4Pmp-0003AG-Pa
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gUD0JLQy8tP5Fw9hKaruBFI07YFmoZewbrA21ci4eMg=; b=KiIoycYoouxmvogNOXj9r1q4lk
 GxpfmqkkYWViW/bzTZ1VROitztGxMeYHiLxZkymUru9cfN+xYNp+w9x+vWY8tZVrgcgJmwp4SdwSY
 eIRATvFLfMA7JVGwHx+NcE/4zGLDWgNByQB2DfmrW60qCec7fDQZF5GKzQy5ACC5f/yM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gUD0JLQy8tP5Fw9hKaruBFI07YFmoZewbrA21ci4eMg=; b=h
 MvqI7ad4Wz0APSTUyB2vg+Geg9DxElxkVNPZ84xrVRqyapJRzbYuERsx+q0spnA31YZejhVk+F0Z+
 76P/FdyEyPZw951qCsSBD73xPSKnHjtLRJHtCrflrdMt/sEvRCrcjiiQmP5uvWVyRdAYa46maL5zP
 /st67zWqEM4Em1os=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Pmo-0005fn-4q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 19:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A6020A42B5F;
 Fri, 25 Oct 2024 19:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475E8C4CEC3;
 Fri, 25 Oct 2024 19:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729883743;
 bh=LZGDCp6OlDYJbJtHkdL+6H+pJYptArgs+2dHiDwITZc=;
 h=From:To:Cc:Subject:Date:From;
 b=Y0JN0wkwmr6zmfPhz4zcMXdXSOIJbvpOQK3aM+nPrlr7L/tFCk8os9NBxtFpg4vn0
 dLFBc416VqXGWtM9r9ov1yFLzdJ7tDKGM3DTCm8C1XP9h3pn2R5oHv8i37yCEgNrJm
 jYd7oy404MvLPHIfNzBnLjpTzFYm0NWzCQkNZVQfFpxZEqMgh8fzPSDEFy8pzvFM8E
 4KZ9a1M2IYILzjlFTs/Xmryv9MzjfXWbQQ7IPSnK/QrKO0u1MI4GWcbTM+oT+2ekdq
 6x6BQv/pD0QnVl3anqQ1StDrNgn9Gl/i37yoAyrCsV09En0oO+DVPJWjdzHdFCLW5G
 IjXRhBohyIqoQ==
To: linux-kernel@vger.kernel.org
Date: Fri, 25 Oct 2024 12:14:36 -0700
Message-ID: <20241025191454.72616-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patchset is also available in git via: git fetch
 https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 crc32-lib-v2 CRC32 is a family of common non-cryptographic integrity check
 algorithms that are fairly fast with a portable C implementation and become
 far faster still with the CRC32 or carryless multiplication in [...] 
 Content analysis details:   (1.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
X-Headers-End: 1t4Pmo-0005fn-4q
Subject: [f2fs-dev] [PATCH v2 00/18] Wire up CRC32 library functions to
 arch-optimized code
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

This patchset is also available in git via:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v2

CRC32 is a family of common non-cryptographic integrity check algorithms
that are fairly fast with a portable C implementation and become far
faster still with the CRC32 or carryless multiplication instructions
that most CPUs have.  9 architectures already have optimized code for at
least some CRC32 variants; however, except for arm64 this optimized code
was only accessible through the crypto API, not the library functions.

This patchset fixes that so that the CRC32 library functions use the
optimized code.  This allows users to just use the library instead of
the crypto API.  This is much simpler and also improves performance due
to eliminating the crypto API overhead including an indirect call.  Some
examples of updating users are included at the end of the patchset.

Note: crc32c() was a weird case.  It was a library function layered on
top of the crypto API, which in turn is layered on top of the real
library functions.  So while it was easy to use, it was still subject to
the crypto API overhead.  This patchset provides CRC32C acceleration in
the real library functions directly.

The updated CRC32 library design is:

- Each arch's CRC32 code (all variants) is in arch/$ARCH/lib/crc32*.
  This adopts what arm64 and riscv already did.  Note, the crypto
  directory is not used because CRC32 is not a cryptographic algorithm.

- Weak symbols are no longer used.  Instead there are crc32*_base() and
  crc32*_arch(), and the appropriate ones are called based on the
  kconfig.  This is similar to how the ChaCha20 library code works.

- Each arch's CRC32 code is enabled by default when CRC32 is enabled,
  but it can now be disabled, controlled by the choice that previously
  controlled the base implementation only.  It can also now be built as
  a module if CRC32 is a module too, in which case it will be
  automatically loaded via direct symbol dependency when appropriate.

- Instead of lots of pointless glue code that wires up each CRC32
  variant to the crypto API for each architecture, we now just rely on
  the existing shash algorithms that use the library functions.

- As before, the library functions don't provide access to off-CPU
  crypto accelerators.  But these appear to have very little, if any,
  real-world relevance for CRC32 which is very fast on CPUs.

Future work should apply a similar cleanup to crct10dif which is a
variant of CRC16.

I tested all arches in QEMU using CONFIG_CRC32_SELFTEST and the crypto
self-tests, except for mips which I couldn't figure out how to do.

This patchset has the following dependencies on recent patches, which
hopefully will be merged soon through the appropriate trees:

- "crypto - move crypto_simd_disabled_for_test to lib"
  (https://lore.kernel.org/linux-crypto/20241018235343.425758-1-ebiggers@kernel.org/)
- "crypto: x86/crc32c - jump table elimination and other cleanups"
  (https://lore.kernel.org/linux-crypto/20241014042447.50197-1-ebiggers@kernel.org/)
- "arm64: Speed up CRC-32 using PMULL instructions"
  (https://lore.kernel.org/linux-crypto/20241018075347.2821102-5-ardb+git@google.com/)
- "crypto: Enable fuzz testing for arch code"
  (https://lore.kernel.org/linux-crypto/20241016185722.400643-4-ardb+git@google.com/)
- "crypto: mips/crc32 - fix the CRC32C implementation"
  (https://lore.kernel.org/linux-crypto/20241020180258.8060-1-ebiggers@kernel.org/)
- "bcachefs: Explicitly select CRYPTO from BCACHEFS_FS"
  (https://lore.kernel.org/linux-bcachefs/20241023183521.3752681-1-ebiggers@kernel.org/)

Everything can be retrieved from git using the command given earlier.

Since this patchset touches many areas, getting it merged may be
difficult.  One option is a pull request with the whole patchset
directly to Linus.  Another is to have at least patches 1-4 taken
through the crypto tree in v6.13; then the arch patches can land
separately afterwards, followed by the rest.

Changed in v2:
  - Added a way to determine if the arch-optimized code is actually
    being used at runtime, and used this to register the appropriate
    shash algorithms with crypto API.
  - Added a patch that converts iSCSI to use the library.
  - Listed a bcachefs patch as a dependency.
  - Added Ard's Reviewed-by.

Eric Biggers (18):
  lib/crc32: drop leading underscores from __crc32c_le_base
  lib/crc32: improve support for arch-specific overrides
  lib/crc32: expose whether the lib is really optimized at runtime
  crypto: crc32 - don't unnecessarily register arch algorithms
  arm/crc32: expose CRC32 functions through lib
  loongarch/crc32: expose CRC32 functions through lib
  mips/crc32: expose CRC32 functions through lib
  powerpc/crc32: expose CRC32 functions through lib
  s390/crc32: expose CRC32 functions through lib
  sparc/crc32: expose CRC32 functions through lib
  x86/crc32: update prototype for crc_pcl()
  x86/crc32: update prototype for crc32_pclmul_le_16()
  x86/crc32: expose CRC32 functions through lib
  lib/crc32: make crc32c() go directly to lib
  ext4: switch to using the crc32c library
  jbd2: switch to using the crc32c library
  f2fs: switch to using the crc32 library
  scsi: target: iscsi: switch to using the crc32c library

 arch/arm/Kconfig                              |   1 +
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/crypto/Kconfig                       |  14 -
 arch/arm/crypto/Makefile                      |   2 -
 arch/arm/crypto/crc32-ce-glue.c               | 247 ------------
 arch/arm/lib/Makefile                         |   3 +
 .../crc32-ce-core.S => lib/crc32-core.S}      |   0
 arch/arm/lib/crc32-glue.c                     | 118 ++++++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/lib/Makefile                       |   3 +-
 arch/arm64/lib/crc32-glue.c                   |  30 +-
 arch/loongarch/Kconfig                        |   1 +
 arch/loongarch/configs/loongson3_defconfig    |   1 -
 arch/loongarch/crypto/Kconfig                 |   9 -
 arch/loongarch/crypto/Makefile                |   2 -
 arch/loongarch/crypto/crc32-loongarch.c       | 300 ---------------
 arch/loongarch/lib/Makefile                   |   2 +
 arch/loongarch/lib/crc32-loongarch.c          | 130 +++++++
 arch/mips/Kconfig                             |   5 +-
 arch/mips/configs/eyeq5_defconfig             |   1 -
 arch/mips/configs/eyeq6_defconfig             |   1 -
 arch/mips/configs/generic/32r6.config         |   2 -
 arch/mips/configs/generic/64r6.config         |   1 -
 arch/mips/crypto/Kconfig                      |   9 -
 arch/mips/crypto/Makefile                     |   2 -
 arch/mips/crypto/crc32-mips.c                 | 354 ------------------
 arch/mips/lib/Makefile                        |   2 +
 arch/mips/lib/crc32-mips.c                    | 187 +++++++++
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |  15 +-
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/crc32c-vpmsum_glue.c      | 173 ---------
 arch/powerpc/crypto/crct10dif-vpmsum_asm.S    |   2 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/crc32-glue.c                 |  86 +++++
 .../{crypto => lib}/crc32-vpmsum_core.S       |   0
 .../{crypto => lib}/crc32c-vpmsum_asm.S       |   0
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/lib/Makefile                       |   3 +-
 arch/riscv/lib/{crc32.c => crc32-riscv.c}     |  30 +-
 arch/s390/Kconfig                             |   1 +
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  12 -
 arch/s390/crypto/Makefile                     |   2 -
 arch/s390/crypto/crc32-vx.c                   | 306 ---------------
 arch/s390/lib/Makefile                        |   3 +
 arch/s390/lib/crc32-glue.c                    |  86 +++++
 arch/s390/{crypto => lib}/crc32-vx.h          |   0
 arch/s390/{crypto => lib}/crc32be-vx.c        |   0
 arch/s390/{crypto => lib}/crc32le-vx.c        |   0
 arch/sparc/Kconfig                            |   1 +
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/crc32c_glue.c               | 184 ---------
 arch/sparc/lib/Makefile                       |   2 +
 arch/sparc/lib/crc32_glue.c                   |  86 +++++
 arch/sparc/{crypto => lib}/crc32c_asm.S       |   2 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/crypto/Kconfig                       |  22 --
 arch/x86/crypto/Makefile                      |   7 -
 arch/x86/crypto/crc32-pclmul_glue.c           | 202 ----------
 arch/x86/crypto/crc32c-intel_glue.c           | 250 -------------
 arch/x86/lib/Makefile                         |   4 +
 arch/x86/lib/crc32-glue.c                     | 116 ++++++
 .../crc32-pclmul_asm.S => lib/crc32-pclmul.S} |  19 +-
 .../crc32c-3way.S}                            |  63 ++--
 crypto/crc32_generic.c                        |   8 +-
 crypto/crc32c_generic.c                       |  12 +-
 drivers/target/iscsi/Kconfig                  |   3 +-
 drivers/target/iscsi/iscsi_target.c           | 153 +++-----
 drivers/target/iscsi/iscsi_target_login.c     |  50 ---
 drivers/target/iscsi/iscsi_target_login.h     |   1 -
 drivers/target/iscsi/iscsi_target_nego.c      |  21 +-
 fs/ext4/Kconfig                               |   3 +-
 fs/ext4/ext4.h                                |  25 +-
 fs/ext4/super.c                               |  15 -
 fs/f2fs/Kconfig                               |   3 +-
 fs/f2fs/f2fs.h                                |  19 +-
 fs/f2fs/super.c                               |  15 -
 fs/jbd2/Kconfig                               |   2 -
 fs/jbd2/journal.c                             |  25 +-
 include/linux/crc32.h                         |  50 ++-
 include/linux/crc32c.h                        |   7 +-
 include/linux/jbd2.h                          |  31 +-
 include/target/iscsi/iscsi_target_core.h      |   3 -
 lib/Kconfig                                   |  80 ++--
 lib/Makefile                                  |   1 -
 lib/crc32.c                                   |  29 +-
 lib/crc32test.c                               |   2 +-
 lib/libcrc32c.c                               |  74 ----
 94 files changed, 1128 insertions(+), 2637 deletions(-)
 delete mode 100644 arch/arm/crypto/crc32-ce-glue.c
 rename arch/arm/{crypto/crc32-ce-core.S => lib/crc32-core.S} (100%)
 create mode 100644 arch/arm/lib/crc32-glue.c
 delete mode 100644 arch/loongarch/crypto/crc32-loongarch.c
 create mode 100644 arch/loongarch/lib/crc32-loongarch.c
 delete mode 100644 arch/mips/crypto/crc32-mips.c
 create mode 100644 arch/mips/lib/crc32-mips.c
 delete mode 100644 arch/powerpc/crypto/crc32c-vpmsum_glue.c
 create mode 100644 arch/powerpc/lib/crc32-glue.c
 rename arch/powerpc/{crypto => lib}/crc32-vpmsum_core.S (100%)
 rename arch/powerpc/{crypto => lib}/crc32c-vpmsum_asm.S (100%)
 rename arch/riscv/lib/{crc32.c => crc32-riscv.c} (90%)
 delete mode 100644 arch/s390/crypto/crc32-vx.c
 create mode 100644 arch/s390/lib/crc32-glue.c
 rename arch/s390/{crypto => lib}/crc32-vx.h (100%)
 rename arch/s390/{crypto => lib}/crc32be-vx.c (100%)
 rename arch/s390/{crypto => lib}/crc32le-vx.c (100%)
 delete mode 100644 arch/sparc/crypto/crc32c_glue.c
 create mode 100644 arch/sparc/lib/crc32_glue.c
 rename arch/sparc/{crypto => lib}/crc32c_asm.S (92%)
 delete mode 100644 arch/x86/crypto/crc32-pclmul_glue.c
 delete mode 100644 arch/x86/crypto/crc32c-intel_glue.c
 create mode 100644 arch/x86/lib/crc32-glue.c
 rename arch/x86/{crypto/crc32-pclmul_asm.S => lib/crc32-pclmul.S} (95%)
 rename arch/x86/{crypto/crc32c-pcl-intel-asm_64.S => lib/crc32c-3way.S} (92%)
 delete mode 100644 lib/libcrc32c.c

-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
