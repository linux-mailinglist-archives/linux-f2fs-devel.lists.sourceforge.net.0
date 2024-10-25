Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F739AFB4D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 09:40:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Ew4-0001j4-T3;
	Fri, 25 Oct 2024 07:40:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t4Ew3-0001iv-Gv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 07:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Z5ww8tsz14z0EpRv1r8MjOBORCOnzfSXkYCYwpD6ZE=; b=T/Xc7QdjzMig1rxLsKOQpiSFDA
 QFKUH9J+64CMPK/qLJFQ2/XnLn7/yOmlkiICKK13LI+VHJzs8tv/uDSnbH+bEKSKCuSVULRPBJB0T
 pA90er+sJeNhZjGs6Ifj1ggiOQOQILob/dZeYs+ESxAwAaTJpacm/joVZ5pC9V4Ruv/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Z5ww8tsz14z0EpRv1r8MjOBORCOnzfSXkYCYwpD6ZE=; b=ajV2C8UVXX8j9MXT0BgKUA7JkP
 zPfXOGVvx7tFOi+TMr8hV+t9hvuVx19DqPTL/5Go0Wn5Qfib7JvpH3uknPIUxfSpVkbYuxbkIOr7u
 20PNfkZLLSxnyk+8L0U+D9eH341MEm7jloB4t9UNhqy273UVE7SSGzSngyuKRgqOWYQw=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Ew3-0005w3-Av for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 07:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26BB9A42BE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 07:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E32C4CEE5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 07:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729842028;
 bh=MU0jg6+43zlNLQVd5aws5IUywfNhZ0pf6SBTcrSFP0A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bns4FpYEweNUDYPWIatTemxTcPXBriNtb6rjMCIGvpZQbQ7/qRGjK2NUk57EKd8ri
 Mk7HPhv+F7E7+ne72q/Ef8D3KErbLL714tyOI87uCXXzpqZPjXEj/i4/+9MWReDl8T
 31XCgHFlQsFjl2p95RIKGtfYYk1e4JVgIerVkCXXYdafVkZcg3QKpbq5FXjAqZ38fM
 DtIUhA6qC/BFjMOrnIVEq9dcd5psyxRFBFdvdxlZAU53TWdpVzWckgliF8es3kpb65
 T8IX9T0uVRiGneDDJjNiP5c9pbh4ac6m1We4OCbuxBE3WORWLtjtdEfr9QTbaV9H3L
 0RlKKzK9CtgkA==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so1594050e87.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 00:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU1R7px/dggitUwxUQCAbV5/QpqOh2glP4eLZIIUezAr4P9D9TqPMWhWb48bxnuT9hTO0tdB6/vdZPt+S/QkbGd@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxk14ZIDfYtqxBZGfAG92iaRIFGKFJZcJpl2YXeNr0HUyghDdl8
 y3d+3hj6+gM1BolRa+6IrSGav7Os99UNEdePf1z+gKjwf3rZIrrs8AJ3VGfbNAfnRou0wjRDseE
 uNZDTMmIhxNyD9TgJUGvLFas5ris=
X-Google-Smtp-Source: AGHT+IEDAFlBfPHEymedMPiV9v2ocdpZeEcg/F0dpwJWqR1hIRTo+DXjnmCVJHCSWsx5j4Mh2CDnA31kbRPsOrauBps=
X-Received: by 2002:a05:6512:3c8c:b0:539:8f3c:457c with SMTP id
 2adb3069b0e04-53b23e9d130mr2447127e87.53.1729842026517; Fri, 25 Oct 2024
 00:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241021002935.325878-1-ebiggers@kernel.org>
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
Date: Fri, 25 Oct 2024 09:40:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHDo8dijRbSVuHzTddMhp4A+nc1t8AgvoENmS=DZ-kAOQ@mail.gmail.com>
Message-ID: <CAMj1kXHDo8dijRbSVuHzTddMhp4A+nc1t8AgvoENmS=DZ-kAOQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 21 Oct 2024 at 02:29,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > This patchset is also available in git via: > > git fetch
 https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 [...] Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4Ew3-0005w3-Av
Subject: Re: [f2fs-dev] [PATCH 00/15] Wire up CRC32 library functions to
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
From: Ard Biesheuvel via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 21 Oct 2024 at 02:29, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This patchset is also available in git via:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib-v1
>
> CRC32 is a family of common non-cryptographic integrity check algorithms
> that are fairly fast with a portable C implementation and become far
> faster still with the CRC32 or carryless multiplication instructions
> that most CPUs have.  9 architectures already have optimized code for at
> least some CRC32 variants; however, except for arm64 this optimized code
> was only accessible through the crypto API, not the library functions.
>
> This patchset fixes that so that the CRC32 library functions use the
> optimized code.  This allows users to just use the library instead of
> the crypto API.  This is much simpler and also improves performance due
> to eliminating the crypto API overhead including an indirect call.  Some
> examples of updating users are included at the end of the patchset.
>
> Note: crc32c() was a weird case.  It was a library function layered on
> top of the crypto API, which in turn is layered on top of the real
> library functions.  So while it was easy to use, it was still subject to
> the crypto API overhead.  This patchset provides CRC32C acceleration in
> the real library functions directly.
>
> The updated CRC32 library design is:
>
> - Each arch's CRC32 code (all variants) is in arch/$ARCH/lib/crc32*.
>   This adopts what arm64 and riscv already did.  Note, the crypto
>   directory is not used because CRC32 is not a cryptographic algorithm.
>
> - Weak symbols are no longer used.  Instead there are crc32*_base() and
>   crc32*_arch(), and the appropriate ones are called based on the
>   kconfig.  This is similar to how the ChaCha20 library code works.
>
> - Each arch's CRC32 code is enabled by default when CRC32 is enabled,
>   but it can now be disabled, controlled by the choice that previously
>   controlled the base implementation only.  It can also now be built as
>   a module if CRC32 is a module too.
>
> - Instead of lots of pointless glue code that wires up each CRC32
>   variant to the crypto API for each architecture, we now just rely on
>   the existing shash algorithms that use the library functions.
>
> - As before, the library functions don't provide access to off-CPU
>   crypto accelerators.  But these appear to have very little, if any,
>   real-world relevance for CRC32 which is very fast on CPUs.
>
> Future work should apply a similar cleanup to crct10dif which is a
> variant of CRC16.
>
> I tested all arches in QEMU using CONFIG_CRC32_SELFTEST and the crypto
> self-tests, except for mips which I couldn't figure out how to do.
>
> This patchset has the following dependencies on recent patches:
>
> - "crypto - move crypto_simd_disabled_for_test to lib"
>   (https://lore.kernel.org/linux-crypto/20241018235343.425758-1-ebiggers@kernel.org/)
> - "crypto: x86/crc32c - jump table elimination and other cleanups"
>   (https://lore.kernel.org/linux-crypto/20241014042447.50197-1-ebiggers@kernel.org/)
> - "arm64: Speed up CRC-32 using PMULL instructions"
>   (https://lore.kernel.org/linux-crypto/20241018075347.2821102-5-ardb+git@google.com/)
> - "crypto: Enable fuzz testing for arch code"
>   (https://lore.kernel.org/linux-crypto/20241016185722.400643-4-ardb+git@google.com/)
> - "crypto: mips/crc32 - fix the CRC32C implementation"
>   (https://lore.kernel.org/linux-crypto/20241020180258.8060-1-ebiggers@kernel.org/)
>
> Everything can be retrieved from git using the command given earlier.
>
> Since this patchset touches many areas, getting it merged may be
> difficult.  One option is a pull request with the whole patchset
> directly to Linus.  Another is to have at least patches 1-2 and the
> above dependencies taken through the crypto tree in v6.13; then the arch
> patches can land separately afterwards, followed by the rest.
>
> Eric Biggers (15):
>   lib/crc32: drop leading underscores from __crc32c_le_base
>   lib/crc32: improve support for arch-specific overrides
>   arm/crc32: expose CRC32 functions through lib
>   loongarch/crc32: expose CRC32 functions through lib
>   mips/crc32: expose CRC32 functions through lib
>   powerpc/crc32: expose CRC32 functions through lib
>   s390/crc32: expose CRC32 functions through lib
>   sparc/crc32: expose CRC32 functions through lib
>   x86/crc32: update prototype for crc_pcl()
>   x86/crc32: update prototype for crc32_pclmul_le_16()
>   x86/crc32: expose CRC32 functions through lib
>   lib/crc32: make crc32c() go directly to lib
>   ext4: switch to using the crc32c library
>   jbd2: switch to using the crc32c library
>   f2fs: switch to using the crc32 library
>
...
>  89 files changed, 1002 insertions(+), 2455 deletions(-)

Very nice cleanup!

For the series:

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
