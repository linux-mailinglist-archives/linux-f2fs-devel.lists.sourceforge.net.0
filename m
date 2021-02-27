Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6098326C84
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Feb 2021 10:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DB394cfROYJT2iFa+fYtBLiHzHg207PDQvbGit80FeA=; b=DZ7M8vddim60qL+vRTT3R2fhc
	qZFtyovuQIVuve3yGj0MxG3EfnYRyp3rB+WSm3qmgkHVD4SfTdeHs9Q5Y1Kl7Xz8GcMeMGw+tYOPM
	ipPOJIoAcNt3z1w7qz1Atajk1lnH5ZGfaJCQcMy08kWD514jkMsbU0kOJs3aDz/6fnQMQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFvz0-0007Fx-K0; Sat, 27 Feb 2021 09:33:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <oleksandr@natalenko.name>)
 id 1lFvyx-0007Fh-VZ; Sat, 27 Feb 2021 09:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QcJypWcCuL78hRHAlISMRw7nAhYWTCY5Lq3ma6FxYuY=; b=FYmaDRkxqwjvIK6cs/ma1o03rG
 XP2w+N4kRVskagEXp0LHyD/ohL1eiAHTLt16E3e9ge9UMb+X1+m/ZZup4tFoN0mXjgQ8mmCIuUktK
 dmaf6F+lGA/Y1dL8HCsKXDGs2VkGi33k4aMoTQeXmij0Y3F9LqvWcQouZZk/HwX9pidg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QcJypWcCuL78hRHAlISMRw7nAhYWTCY5Lq3ma6FxYuY=; b=PCiYdTkx2V7Nn7y82R/AwRQKBE
 ZvbDk0xq39rTgzhc100y2sJm8XdjzOtRalg2uKrhapPy3blvU7VjUEk3dqO1eDlDcnV2522TBl+2j
 gOfef9fyMYRv+GsA3kLNoqzBFvRGIJt9/RNqw0VNvtO92COzFTNQgUufqpvmjCyYWbUg=;
Received: from vulcan.natalenko.name ([104.207.131.136])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lFvye-007LkT-Hy; Sat, 27 Feb 2021 09:33:51 +0000
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 644429B230D;
 Sat, 27 Feb 2021 10:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1614418400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QcJypWcCuL78hRHAlISMRw7nAhYWTCY5Lq3ma6FxYuY=;
 b=UUMOWHs8CzeAE9y8ezxkJdta0INmCZwf82IXv8Mrqyy04Ldo4H5tfmOBDP7uHvMoQwbveJ
 X6a9Pd5sFOTuoaFzuInmL1+sPmSnN4Xw7ovyxlu3+560Jq6QnliKVKfDiyLKzcuMOv/sa/
 v2kqphQQQQ9GIIeDfoXPoX/lHZxXarA=
Date: Sat, 27 Feb 2021 10:33:19 +0100
To: Nick Terrell <nickrterrell@gmail.com>
Message-ID: <20210227093319.tgzmg6di5zlmrnik@spock.localdomain>
References: <20201203205114.1395668-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201203205114.1395668-1-nickrterrell@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lkml.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFvye-007LkT-Hy
Subject: Re: [f2fs-dev] [PATCH v7 0/3] Update to zstd-1.4.6
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
From: Oleksandr Natalenko via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Christoph Hellwig <hch@infradead.org>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi.

On Thu, Dec 03, 2020 at 12:51:11PM -0800, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Please pull from
> 
>   git@github.com:terrelln/linux.git tags/v7-zstd-1.4.6
> 
> to get these changes. Alternatively the patchset is included.
> 
> This patchset upgrades the zstd library to the latest upstream release. The
> current zstd version in the kernel is a modified version of upstream zstd-1.3.1.
> At the time it was integrated, zstd wasn't ready to be used in the kernel as-is.
> But, it is now possible to use upstream zstd directly in the kernel.
> 
> I have not yet released zstd-1.4.6 upstream. I want the zstd version in the
> kernel to match up with a known upstream release, so we know exactly what code
> is running. Whenever this patchset is ready for merge, I will cut a release at
> the upstream commit that gets merged. This should not be necessary for future
> releases.
> 
> The kernel zstd library is automatically generated from upstream zstd. A script
> makes the necessary changes and imports it into the kernel. The changes are:
> 
> 1. Replace all libc dependencies with kernel replacements and rewrite includes.
> 2. Remove unncessary portability macros like: #if defined(_MSC_VER).
> 3. Use the kernel xxhash instead of bundling it.
> 
> This automation gets tested every commit by upstream's continuous integration.
> When we cut a new zstd release, we will submit a patch to the kernel to update
> the zstd version in the kernel.
> 
> I've updated zstd to upstream with one big patch because every commit must build,
> so that precludes partial updates. Since the commit is 100% generated, I hope the
> review burden is lightened. I considered replaying upstream commits, but that is
> not possible because there have been ~3500 upstream commits since the last zstd
> import, and the commits don't all build individually. The bulk update preserves
> bisectablity because bugs can be bisected to the zstd version update. At that
> point the update can be reverted, and we can work with upstream to find and fix
> the bug. After this big switch in how the kernel consumes zstd, future patches
> will be smaller, because they will only have one upstream release worth of
> changes each.
> 
> This patchset adds a new kernel-style wrapper around zstd. This wrapper API is
> functionally equivalent to the subset of the current zstd API that is currently
> used. The wrapper API changes to be kernel style so that the symbols don't
> collide with zstd's symbols. The update to zstd-1.4.6 maintains the same API
> and preserves the semantics, so that none of the callers need to be updated.
> 
> This patchset comes in 2 parts:
> 1. The first 2 patches prepare for the zstd upgrade. The first patch adds the
>    new kernel style API so zstd can be upgraded without modifying any callers.
>    The second patch adds an indirection for the lib/decompress_unzstd.c
>    including of all decompression source files.
> 2. Import zstd-1.4.6. This patch is completely generated from upstream using
>    automated tooling.
> 
> I tested every caller of zstd on x86_64. I tested both after the 1.4.6 upgrade
> using the compatibility wrapper, and after the final patch in this series. 
> 
> I tested kernel and initramfs decompression in i386 and arm.
> 
> I ran benchmarks to compare the current zstd in the kernel with zstd-1.4.6.
> I benchmarked on x86_64 using QEMU with KVM enabled on an Intel i9-9900k.
> I found:
> * BtrFS zstd compression at levels 1 and 3 is 5% faster
> * BtrFS zstd decompression+read is 15% faster
> * SquashFS zstd decompression+read is 15% faster
> * F2FS zstd compression+write at level 3 is 8% faster
> * F2FS zstd decompression+read is 20% faster
> * ZRAM decompression+read is 30% faster
> * Kernel zstd decompression is 35% faster
> * Initramfs zstd decompression+build is 5% faster
> 
> The latest zstd also offers bug fixes and a 1 KB reduction in stack uage during
> compression. For example the recent problem with large kernel decompression has
> been fixed upstream for over 2 years https://lkml.org/lkml/2020/9/29/27.
> 
> Please let me know if there is anything that I can do to ease the way for these
> patches. I think it is important because it gets large performance improvements,
> contains bug fixes, and is switching to a more maintainable model of consuming
> upstream zstd directly, making it easy to keep up to date.
> 
> Best,
> Nick Terrell
> 
> v1 -> v2:
> * Successfully tested F2FS with help from Chao Yu to fix my test.
> * (1/9) Fix ZSTD_initCStream() wrapper to handle pledged_src_size=0 means unknown.
>   This fixes F2FS with the zstd-1.4.6 compatibility wrapper, exposed by the test.
> 
> v2 -> v3:
> * (3/9) Silence warnings by Kernel Test Robot:
>   https://github.com/facebook/zstd/pull/2324
>   Stack size warnings remain, but these aren't new, and the functions it warns on
>   are either unused or not in the maximum stack path. This patchset reduces zstd
>   compression stack usage by 1 KB overall. I've gotten the low hanging fruit, and
>   more stack reduction would require significant changes that have the potential
>   to introduce new bugs. However, I do hope to continue to reduce zstd stack
>   usage in future versions.
> 
> v3 -> v4:
> * (3/9) Fix errors and warnings reported by Kernel Test Robot:
>   https://github.com/facebook/zstd/pull/2326
>   - Replace mem.h with a custom kernel implementation that matches the current
>     lib/zstd/mem.h in the kernel. This avoids calls to __builtin_bswap*() which
>     don't work on certain architectures, as exposed by the Kernel Test Robot.
>   - Remove ASAN/MSAN (un)poisoning code which doesn't work in the kernel, as
>     exposed by the Kernel Test Robot.
>   - I've fixed all of the valid cppcheck warnings reported, but there were many
>     false positives, where cppcheck was incorrectly analyzing the situation,
>     which I did not fix. I don't believe it is reasonable to expect that upstream
>     zstd silences all the static analyzer false positives. Upstream zstd uses
>     clang scan-build for its static analysis. We find that supporting multiple
>     static analysis tools multiplies the burden of silencing false positives,
>     without providing enough marginal value over running a single static analysis
>     tool.
> 
> v4 -> v5:
> * Rebase onto v5.10-rc2
> * (6/9) Merge with other F2FS changes (no functional change in patch).
> 
> v5 -> v6:
> * Rebase onto v5.10-rc6.
> * Switch to using a kernel style wrapper API as suggested by Cristoph.
> 
> v6 -> v7:
> * Expose the upstream library header as `include/linux/zstd_lib.h`.
>   Instead of creating new structs mirroring the upstream zstd structs
>   use upstream's structs directly with a typedef to get a kernel style name.
>   This removes the memcpy cruft.
> * (1/3) Undo ZSTD_WINDOWLOG_MAX and handle_zstd_error changes.
> * (3/3) Expose zstd_errors.h as `include/linux/zstd_errors.h` because it
>   is needed by the kernel wrapper API.
> 
> 
> Nick Terrell (3):
>   lib: zstd: Add kernel-specific API
>   lib: zstd: Add decompress_sources.h for decompress_unzstd
>   lib: zstd: Upgrade to latest upstream zstd version 1.4.6
> 
>  crypto/zstd.c                                 |   28 +-
>  fs/btrfs/zstd.c                               |   68 +-
>  fs/f2fs/compress.c                            |   56 +-
>  fs/pstore/platform.c                          |    2 +-
>  fs/squashfs/zstd_wrapper.c                    |   16 +-
>  include/linux/zstd.h                          | 1225 +----
>  include/linux/zstd_errors.h                   |   76 +
>  include/linux/zstd_lib.h                      | 2104 +++++++++
>  lib/decompress_unzstd.c                       |   48 +-
>  lib/zstd/Makefile                             |   35 +-
>  lib/zstd/bitstream.h                          |  379 --
>  lib/zstd/common/bitstream.h                   |  437 ++
>  lib/zstd/common/compiler.h                    |  150 +
>  lib/zstd/common/cpu.h                         |  194 +
>  lib/zstd/common/debug.c                       |   24 +
>  lib/zstd/common/debug.h                       |  101 +
>  lib/zstd/common/entropy_common.c              |  355 ++
>  lib/zstd/common/error_private.c               |   55 +
>  lib/zstd/common/error_private.h               |   66 +
>  lib/zstd/common/fse.h                         |  709 +++
>  lib/zstd/common/fse_decompress.c              |  380 ++
>  lib/zstd/common/huf.h                         |  352 ++
>  lib/zstd/common/mem.h                         |  258 +
>  lib/zstd/common/zstd_common.c                 |   83 +
>  lib/zstd/common/zstd_deps.h                   |  124 +
>  lib/zstd/common/zstd_internal.h               |  438 ++
>  lib/zstd/compress.c                           | 3485 --------------
>  lib/zstd/compress/fse_compress.c              |  625 +++
>  lib/zstd/compress/hist.c                      |  165 +
>  lib/zstd/compress/hist.h                      |   75 +
>  lib/zstd/compress/huf_compress.c              |  764 +++
>  lib/zstd/compress/zstd_compress.c             | 4157 +++++++++++++++++
>  lib/zstd/compress/zstd_compress_internal.h    | 1103 +++++
>  lib/zstd/compress/zstd_compress_literals.c    |  158 +
>  lib/zstd/compress/zstd_compress_literals.h    |   29 +
>  lib/zstd/compress/zstd_compress_sequences.c   |  433 ++
>  lib/zstd/compress/zstd_compress_sequences.h   |   54 +
>  lib/zstd/compress/zstd_compress_superblock.c  |  849 ++++
>  lib/zstd/compress/zstd_compress_superblock.h  |   32 +
>  lib/zstd/compress/zstd_cwksp.h                |  465 ++
>  lib/zstd/compress/zstd_double_fast.c          |  521 +++
>  lib/zstd/compress/zstd_double_fast.h          |   32 +
>  lib/zstd/compress/zstd_fast.c                 |  496 ++
>  lib/zstd/compress/zstd_fast.h                 |   31 +
>  lib/zstd/compress/zstd_lazy.c                 | 1138 +++++
>  lib/zstd/compress/zstd_lazy.h                 |   61 +
>  lib/zstd/compress/zstd_ldm.c                  |  619 +++
>  lib/zstd/compress/zstd_ldm.h                  |  104 +
>  lib/zstd/compress/zstd_opt.c                  | 1200 +++++
>  lib/zstd/compress/zstd_opt.h                  |   50 +
>  lib/zstd/decompress.c                         | 2531 ----------
>  lib/zstd/decompress/huf_decompress.c          | 1205 +++++
>  lib/zstd/decompress/zstd_ddict.c              |  241 +
>  lib/zstd/decompress/zstd_ddict.h              |   44 +
>  lib/zstd/decompress/zstd_decompress.c         | 1836 ++++++++
>  lib/zstd/decompress/zstd_decompress_block.c   | 1540 ++++++
>  lib/zstd/decompress/zstd_decompress_block.h   |   62 +
>  .../decompress/zstd_decompress_internal.h     |  195 +
>  lib/zstd/decompress_sources.h                 |   19 +
>  lib/zstd/entropy_common.c                     |  243 -
>  lib/zstd/error_private.h                      |   53 -
>  lib/zstd/fse.h                                |  575 ---
>  lib/zstd/fse_compress.c                       |  795 ----
>  lib/zstd/fse_decompress.c                     |  325 --
>  lib/zstd/huf.h                                |  212 -
>  lib/zstd/huf_compress.c                       |  772 ---
>  lib/zstd/huf_decompress.c                     |  960 ----
>  lib/zstd/mem.h                                |  151 -
>  lib/zstd/zstd_common.c                        |   75 -
>  lib/zstd/zstd_compress_module.c               |  103 +
>  lib/zstd/zstd_decompress_module.c             |   96 +
>  lib/zstd/zstd_internal.h                      |  273 --
>  lib/zstd/zstd_opt.h                           | 1014 ----
>  73 files changed, 24800 insertions(+), 12929 deletions(-)
>  create mode 100644 include/linux/zstd_errors.h
>  create mode 100644 include/linux/zstd_lib.h
>  delete mode 100644 lib/zstd/bitstream.h
>  create mode 100644 lib/zstd/common/bitstream.h
>  create mode 100644 lib/zstd/common/compiler.h
>  create mode 100644 lib/zstd/common/cpu.h
>  create mode 100644 lib/zstd/common/debug.c
>  create mode 100644 lib/zstd/common/debug.h
>  create mode 100644 lib/zstd/common/entropy_common.c
>  create mode 100644 lib/zstd/common/error_private.c
>  create mode 100644 lib/zstd/common/error_private.h
>  create mode 100644 lib/zstd/common/fse.h
>  create mode 100644 lib/zstd/common/fse_decompress.c
>  create mode 100644 lib/zstd/common/huf.h
>  create mode 100644 lib/zstd/common/mem.h
>  create mode 100644 lib/zstd/common/zstd_common.c
>  create mode 100644 lib/zstd/common/zstd_deps.h
>  create mode 100644 lib/zstd/common/zstd_internal.h
>  delete mode 100644 lib/zstd/compress.c
>  create mode 100644 lib/zstd/compress/fse_compress.c
>  create mode 100644 lib/zstd/compress/hist.c
>  create mode 100644 lib/zstd/compress/hist.h
>  create mode 100644 lib/zstd/compress/huf_compress.c
>  create mode 100644 lib/zstd/compress/zstd_compress.c
>  create mode 100644 lib/zstd/compress/zstd_compress_internal.h
>  create mode 100644 lib/zstd/compress/zstd_compress_literals.c
>  create mode 100644 lib/zstd/compress/zstd_compress_literals.h
>  create mode 100644 lib/zstd/compress/zstd_compress_sequences.c
>  create mode 100644 lib/zstd/compress/zstd_compress_sequences.h
>  create mode 100644 lib/zstd/compress/zstd_compress_superblock.c
>  create mode 100644 lib/zstd/compress/zstd_compress_superblock.h
>  create mode 100644 lib/zstd/compress/zstd_cwksp.h
>  create mode 100644 lib/zstd/compress/zstd_double_fast.c
>  create mode 100644 lib/zstd/compress/zstd_double_fast.h
>  create mode 100644 lib/zstd/compress/zstd_fast.c
>  create mode 100644 lib/zstd/compress/zstd_fast.h
>  create mode 100644 lib/zstd/compress/zstd_lazy.c
>  create mode 100644 lib/zstd/compress/zstd_lazy.h
>  create mode 100644 lib/zstd/compress/zstd_ldm.c
>  create mode 100644 lib/zstd/compress/zstd_ldm.h
>  create mode 100644 lib/zstd/compress/zstd_opt.c
>  create mode 100644 lib/zstd/compress/zstd_opt.h
>  delete mode 100644 lib/zstd/decompress.c
>  create mode 100644 lib/zstd/decompress/huf_decompress.c
>  create mode 100644 lib/zstd/decompress/zstd_ddict.c
>  create mode 100644 lib/zstd/decompress/zstd_ddict.h
>  create mode 100644 lib/zstd/decompress/zstd_decompress.c
>  create mode 100644 lib/zstd/decompress/zstd_decompress_block.c
>  create mode 100644 lib/zstd/decompress/zstd_decompress_block.h
>  create mode 100644 lib/zstd/decompress/zstd_decompress_internal.h
>  create mode 100644 lib/zstd/decompress_sources.h
>  delete mode 100644 lib/zstd/entropy_common.c
>  delete mode 100644 lib/zstd/error_private.h
>  delete mode 100644 lib/zstd/fse.h
>  delete mode 100644 lib/zstd/fse_compress.c
>  delete mode 100644 lib/zstd/fse_decompress.c
>  delete mode 100644 lib/zstd/huf.h
>  delete mode 100644 lib/zstd/huf_compress.c
>  delete mode 100644 lib/zstd/huf_decompress.c
>  delete mode 100644 lib/zstd/mem.h
>  delete mode 100644 lib/zstd/zstd_common.c
>  create mode 100644 lib/zstd/zstd_compress_module.c
>  create mode 100644 lib/zstd/zstd_decompress_module.c
>  delete mode 100644 lib/zstd/zstd_internal.h
>  delete mode 100644 lib/zstd/zstd_opt.h
> 
> -- 
> 2.29.2
> 

So, what's the fate of this submission please?

Thanks.

-- 
  Oleksandr Natalenko (post-factum)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
