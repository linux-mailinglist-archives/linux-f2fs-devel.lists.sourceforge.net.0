Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A19BA895
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Nov 2024 23:32:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7j97-00051E-D9;
	Sun, 03 Nov 2024 22:32:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t7j95-000516-Jl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VGBp7xg5bbktCIOtNSfw0mey6LuY0iApp9870TryDRI=; b=C6TyyNjACgLB3R3Io/Z2xS2R76
 DYHuiD2vScI1A4vU1s6JLwUsRZc9y/WWduxUpH7PLot1yfiC/+jGcViOQ3iDqHMvWDCJRu7H6S8Rg
 eByBLplQPb6Gyu1EuV3rQkOt4LbHqcjvMe/g1e5EQKTGfYY3LKnB8npwoj4Ca4uj/L+A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VGBp7xg5bbktCIOtNSfw0mey6LuY0iApp9870TryDRI=; b=k
 EGc/nBWDB+Iz83EcO6xRbKT8bt54uTWKmb6ckultRdO+g9eXC4oanNy09gzfRIo0TQeHT6KjPf1Ls
 gCcPKhJr/T8Wq/1O814T1FKWrt7UslU9tkf5aT9R9qxW9C7MZyDC4E9ZTvpsZy1qxCEk1NsYUiVgX
 A+wZizT8aPRkYwPA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7j94-0005rl-04 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 Nov 2024 22:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7FE75C4C17;
 Sun,  3 Nov 2024 22:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E7DC4CECD;
 Sun,  3 Nov 2024 22:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730673144;
 bh=nCJr5YZ51Rq0RqYBX7x9aWTimg5T0/7mUZK5InNTpsg=;
 h=From:To:Cc:Subject:Date:From;
 b=PnmZ90oU5i4J92xYyGZ3XmP25PGrXHYK+0F3GdkIvqRngfTC1qA7u32g2LObfD6VD
 xm+9aaCzGMmoijTXROBp3SSQJaalhnEUUDN65hgSvAQYHyHOsv1U38bdA8Ui8t+7kT
 OI7xgPt2b5FY+ADNu1xH4h1Y/z1PvLDe1SjMOsuaD3UcW0AodNB6GrRQDubTkmOMZ/
 u8RCtN/JXpEdBLbC3Qokjyz2VBBEe7iu1IAVF4S+yGstg0f39GPCqqCya5v1AtN1NP
 iSo2Kc9JeNs6BNVlIROfhgzYjbUjh4qG+n/x9qyykZPVxvnXd5Ug+8teKZ1Fy1v7r1
 +r6FRYeVHLOIg==
To: linux-kernel@vger.kernel.org
Date: Sun,  3 Nov 2024 14:31:36 -0800
Message-ID: <20241103223154.136127-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Score: -3.0 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patchset is also available in git via: git fetch
 https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 crc32-lib-v3 CRC32 is a family of common non-cryptographic integrity check
 algorithms that are fairly fast with a portable C implementation and become
 far faster still with the CRC32 or carryless multiplication in [...] 
 Content analysis details:   (-3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7j94-0005rl-04
Subject: [f2fs-dev] [PATCH v3 00/18] Wire up CRC32 library functions to
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v3

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

- Each arch's CRC32 library code is enabled by default when CRC32 is
  enabled, but it can now be disabled, controlled by the choice that
  previously controlled the base implementation only.  It can also now
  be built as a module if CRC32 is a module too, in which case it will
  be automatically loaded via direct symbol dependency when appropriate.

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

This patchset has the following dependencies on recent patches which
have been applied to the appropriate trees and are in linux-next:

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

The dependencies will be merged for 6.13.  I suggest that for 6.14 I
submit a pull request to Linus with patches 1-14.  Acks would be
appreciated.  Converting users from the crypto API to the library API
would then happen later through the appropriate subsystem trees.

Changed in v3:
  - Replaced crc32_optimizations global variable with
    crc32_optimizations() function.
  - Make ISCSI_TARGET keep selecting CRYPTO_HASH, since
    iscsi_target_auth.c still uses the shash API for other algorithms.

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
 arch/arm/lib/crc32-glue.c                     | 123 ++++++
 arch/arm64/Kconfig                            |   1 +
 arch/arm64/lib/Makefile                       |   3 +-
 arch/arm64/lib/crc32-glue.c                   |  25 +-
 arch/loongarch/Kconfig                        |   1 +
 arch/loongarch/configs/loongson3_defconfig    |   1 -
 arch/loongarch/crypto/Kconfig                 |   9 -
 arch/loongarch/crypto/Makefile                |   2 -
 arch/loongarch/crypto/crc32-loongarch.c       | 300 ---------------
 arch/loongarch/lib/Makefile                   |   2 +
 arch/loongarch/lib/crc32-loongarch.c          | 135 +++++++
 arch/mips/Kconfig                             |   5 +-
 arch/mips/configs/eyeq5_defconfig             |   1 -
 arch/mips/configs/eyeq6_defconfig             |   1 -
 arch/mips/configs/generic/32r6.config         |   2 -
 arch/mips/configs/generic/64r6.config         |   1 -
 arch/mips/crypto/Kconfig                      |   9 -
 arch/mips/crypto/Makefile                     |   2 -
 arch/mips/crypto/crc32-mips.c                 | 354 ------------------
 arch/mips/lib/Makefile                        |   2 +
 arch/mips/lib/crc32-mips.c                    | 192 ++++++++++
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |  15 +-
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/crc32c-vpmsum_glue.c      | 173 ---------
 arch/powerpc/crypto/crct10dif-vpmsum_asm.S    |   2 +-
 arch/powerpc/lib/Makefile                     |   3 +
 arch/powerpc/lib/crc32-glue.c                 |  92 +++++
 .../{crypto => lib}/crc32-vpmsum_core.S       |   0
 .../{crypto => lib}/crc32c-vpmsum_asm.S       |   0
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/lib/Makefile                       |   3 +-
 arch/riscv/lib/{crc32.c => crc32-riscv.c}     |  25 +-
 arch/s390/Kconfig                             |   1 +
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  12 -
 arch/s390/crypto/Makefile                     |   2 -
 arch/s390/crypto/crc32-vx.c                   | 306 ---------------
 arch/s390/lib/Makefile                        |   3 +
 arch/s390/lib/crc32-glue.c                    |  92 +++++
 arch/s390/{crypto => lib}/crc32-vx.h          |   0
 arch/s390/{crypto => lib}/crc32be-vx.c        |   0
 arch/s390/{crypto => lib}/crc32le-vx.c        |   0
 arch/sparc/Kconfig                            |   1 +
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/crc32c_glue.c               | 184 ---------
 arch/sparc/lib/Makefile                       |   2 +
 arch/sparc/lib/crc32_glue.c                   |  93 +++++
 arch/sparc/{crypto => lib}/crc32c_asm.S       |   2 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/crypto/Kconfig                       |  22 --
 arch/x86/crypto/Makefile                      |   7 -
 arch/x86/crypto/crc32-pclmul_glue.c           | 202 ----------
 arch/x86/crypto/crc32c-intel_glue.c           | 250 -------------
 arch/x86/lib/Makefile                         |   4 +
 arch/x86/lib/crc32-glue.c                     | 124 ++++++
 .../crc32-pclmul_asm.S => lib/crc32-pclmul.S} |  19 +-
 .../crc32c-3way.S}                            |  63 ++--
 crypto/crc32_generic.c                        |   8 +-
 crypto/crc32c_generic.c                       |  12 +-
 drivers/target/iscsi/Kconfig                  |   4 +-
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
 lib/crc32.c                                   |  24 +-
 lib/crc32test.c                               |   2 +-
 lib/libcrc32c.c                               |  74 ----
 94 files changed, 1156 insertions(+), 2637 deletions(-)
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
 rename arch/riscv/lib/{crc32.c => crc32-riscv.c} (91%)
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
