Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EBC36F381
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Apr 2021 03:26:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lcHv9-00022K-8G; Fri, 30 Apr 2021 01:26:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lcHv7-000224-9D; Fri, 30 Apr 2021 01:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CESk6cm7e0xOu7jgRR+DK8PlMr98aNAPGHACxZhq29U=; b=LiY5fG3pv/YG/y0NuQweDvW59T
 CCNPxKZO1wnLuOBjNJHQs7j8ZJN42Iwj/MQC88JeEe3W0+8gqK/h7G3cguhxe7uqoWQ9N4Pm9FsgN
 25uYwlAc4YzhoGZ1dlz/xvtRa5HcJ3n3Y1XRSSJXhYbOzJD7RB31k/TXOVzvR6q4u+wU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CESk6cm7e0xOu7jgRR+DK8PlMr98aNAPGHACxZhq29U=; b=V
 x5+e6Muj0jEDBlYA2m/sd9D0GEeP7zdPdy5xmfsIpJTpFGIqmCmMRIR7sXTuz0FdvfxgR7X1+g0qn
 PMjCSi30fEwegFj7Ebk/v+7u7WSAq8+7kl1ItpSCRIMeInu9hRitrbvcyGWZpmqe0KzvfESfyZ/ga
 xy+zZRTCJkRpQnzY=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lcHv3-0002UO-Pk; Fri, 30 Apr 2021 01:26:18 +0000
Received: by mail-pf1-f182.google.com with SMTP id i190so7793487pfc.12;
 Thu, 29 Apr 2021 18:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CESk6cm7e0xOu7jgRR+DK8PlMr98aNAPGHACxZhq29U=;
 b=Q880LhVw6Eo6KNT4ongeXYw9zB9o7joenT/MiosCFZ+dV7SF7ZI5gyRsd2aKezHrk/
 dy5s2/kRFrRf4NcMDIriv4Xv7E8cp1GW36tR/bMPLNl3EnO7o1vafUsMpXwBbv7ib/Wz
 pQuCwJy8VjO3hq2jv99jhChHE7LUm57Bw/No6W/G47RszDLX9AfpfCyiEc/4yYkJ4QT6
 GjwuTvhA2jRccbJXYZqhDyiN72Rl2BpmcsDKdeBoZZaIUXAA6iSXeuQy6ujI6pxzLsIG
 ws+UaWQs0Jp7OXvC+bbZUu6N3MFvU6ifYBg5Td54Z+TaiVeawOWxQcFdFSeyau38FOKY
 4HaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CESk6cm7e0xOu7jgRR+DK8PlMr98aNAPGHACxZhq29U=;
 b=TtpJy2gW34J+Yi0/4/1bQoBLZ0dl4joNQm3fPkYkwa8UgThOYWgiCvM0q4BuZb28Lt
 7j/J2LSrxMpiP2Cr94YjwYS+yki1/ubtrSBDN+/LEHtpke6CTykKkyn/YhiVBMBnopZf
 JsXzFZZSyRacwEUZD32T+QbGcTbkTvN7ioklHWdMKqSCGbUZAKR4j6gNClNe7UGIqBWR
 6bMDK5tAwbCEVG8yvRjQXoK03+37w165SbC6GWlAS3ndoicRCdhvAVM71Zt4Uh7kgnom
 E9LoczGWy6QGzXIDb+uNNSB2KrqLrYEhJsGlWYr7ZvgF9khososlWNRmGcXqjvQ4UTyg
 u6eQ==
X-Gm-Message-State: AOAM531yEnsqv5o5KAn5CzeTaVZ3BA4cEyk+5fFobJA5PvCxvTK3Xz8f
 VCj1yMWRVtk1Ezyn+K6Nj01m7YLIYWr4S3F1
X-Google-Smtp-Source: ABdhPJyealUXoBrY7bwJB3ZcuhWoc3SjQRTsfwKFg37bTISwAOifyKXbZCZX2pTHnWc/J7JoYWPAXg==
X-Received: by 2002:a62:3787:0:b029:25a:d5da:27a9 with SMTP id
 e129-20020a6237870000b029025ad5da27a9mr2524214pfa.81.1619745968196; 
 Thu, 29 Apr 2021 18:26:08 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id b186sm311004pfb.27.2021.04.29.18.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:26:07 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 29 Apr 2021 18:31:53 -0700
Message-Id: <20210430013157.747152-1-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lcHv3-0002UO-Pk
Subject: [f2fs-dev] [GIT PULL][PATCH v11 0/4] Update to zstd-1.4.10
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
Cc: squashfs-devel@lists.sourceforge.net, Randy Dunlap <rdunlap@infradead.org>,
 Eric Biggers <ebiggers@kernel.org>, Johannes Weiner <jweiner@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Felix Handte <felixh@fb.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

Please pull from

  git@github.com:terrelln/linux.git tags/v11-zstd-1.4.10

to get these changes. Alternatively the patchset is included.

This patchset lists me as the maintainer for zstd and upgrades the zstd library
to the latest upstream release. The current zstd version in the kernel is a
modified version of upstream zstd-1.3.1. At the time it was integrated, zstd
wasn't ready to be used in the kernel as-is. But, it is now possible to use
upstream zstd directly in the kernel.

I have not yet released zstd-1.4.10 upstream. I want the zstd version in the
kernel to match up with a known upstream release, so we know exactly what code
is running. Whenever this patchset is ready for merge, I will cut a release at
the upstream commit that gets merged. This should not be necessary for future
releases.

The kernel zstd library is automatically generated from upstream zstd. A script
makes the necessary changes and imports it into the kernel. The changes are:

1. Replace all libc dependencies with kernel replacements and rewrite includes.
2. Remove unncessary portability macros like: #if defined(_MSC_VER).
3. Use the kernel xxhash instead of bundling it.

This automation gets tested every commit by upstream's continuous integration.
When we cut a new zstd release, we will submit a patch to the kernel to update
the zstd version in the kernel.

I've updated zstd to upstream with one big patch because every commit must build,
so that precludes partial updates. Since the commit is 100% generated, I hope the
review burden is lightened. I considered replaying upstream commits, but that is
not possible because there have been ~3500 upstream commits since the last zstd
import, and the commits don't all build individually. The bulk update preserves
bisectablity because bugs can be bisected to the zstd version update. At that
point the update can be reverted, and we can work with upstream to find and fix
the bug. After this big switch in how the kernel consumes zstd, future patches
will be smaller, because they will only have one upstream release worth of
changes each.

This patchset adds a new kernel-style wrapper around zstd. This wrapper API is
functionally equivalent to the subset of the current zstd API that is currently
used. The wrapper API changes to be kernel style so that the symbols don't
collide with zstd's symbols. The update to zstd-1.4.6 maintains the same API
and preserves the semantics, so that none of the callers need to be updated.

This patchset comes in 2 parts:
1. The first 2 patches prepare for the zstd upgrade. The first patch adds the
   new kernel style API so zstd can be upgraded without modifying any callers.
   The second patch adds an indirection for the lib/decompress_unzstd.c
   including of all decompression source files.
2. Import zstd-1.4.10. This patch is completely generated from upstream using
   automated tooling.

I tested every caller of zstd on x86_64. I tested both after the 1.4.10 upgrade
using the compatibility wrapper, and after the final patch in this series.

I tested kernel and initramfs decompression in i386 and arm.

I ran benchmarks to compare the current zstd in the kernel with zstd-1.4.6.
I benchmarked on x86_64 using QEMU with KVM enabled on an Intel i9-9900k.
I found:
* BtrFS zstd compression at levels 1 and 3 is 5% faster
* BtrFS zstd decompression+read is 15% faster
* SquashFS zstd decompression+read is 15% faster
* F2FS zstd compression+write at level 3 is 8% faster
* F2FS zstd decompression+read is 20% faster
* ZRAM decompression+read is 30% faster
* Kernel zstd decompression is 35% faster
* Initramfs zstd decompression+build is 5% faster

The latest zstd also offers bug fixes. For example the problem with large kernel
decompression has been fixed upstream for over 2 years
https://lkml.org/lkml/2020/9/29/27.

Please let me know if there is anything that I can do to ease the way for these
patches. I think it is important because it gets large performance improvements,
contains bug fixes, and is switching to a more maintainable model of consuming
upstream zstd directly, making it easy to keep up to date.

Best,
Nick Terrell

v1 -> v2:
* Successfully tested F2FS with help from Chao Yu to fix my test.
* (1/9) Fix ZSTD_initCStream() wrapper to handle pledged_src_size=0 means unknown.
  This fixes F2FS with the zstd-1.4.6 compatibility wrapper, exposed by the test.

v2 -> v3:
* (3/9) Silence warnings by Kernel Test Robot:
  https://github.com/facebook/zstd/pull/2324
  Stack size warnings remain, but these aren't new, and the functions it warns on
  are either unused or not in the maximum stack path. This patchset reduces zstd
  compression stack usage by 1 KB overall. I've gotten the low hanging fruit, and
  more stack reduction would require significant changes that have the potential
  to introduce new bugs. However, I do hope to continue to reduce zstd stack
  usage in future versions.

v3 -> v4:
* (3/9) Fix errors and warnings reported by Kernel Test Robot:
  https://github.com/facebook/zstd/pull/2326
  - Replace mem.h with a custom kernel implementation that matches the current
    lib/zstd/mem.h in the kernel. This avoids calls to __builtin_bswap*() which
    don't work on certain architectures, as exposed by the Kernel Test Robot.
  - Remove ASAN/MSAN (un)poisoning code which doesn't work in the kernel, as
    exposed by the Kernel Test Robot.
  - I've fixed all of the valid cppcheck warnings reported, but there were many
    false positives, where cppcheck was incorrectly analyzing the situation,
    which I did not fix. I don't believe it is reasonable to expect that upstream
    zstd silences all the static analyzer false positives. Upstream zstd uses
    clang scan-build for its static analysis. We find that supporting multiple
    static analysis tools multiplies the burden of silencing false positives,
    without providing enough marginal value over running a single static analysis
    tool.

v4 -> v5:
* Rebase onto v5.10-rc2
* (6/9) Merge with other F2FS changes (no functional change in patch).

v5 -> v6:
* Rebase onto v5.10-rc6.
* Switch to using a kernel style wrapper API as suggested by Cristoph.

v6 -> v7:
* Expose the upstream library header as `include/linux/zstd_lib.h`.
  Instead of creating new structs mirroring the upstream zstd structs
  use upstream's structs directly with a typedef to get a kernel style name.
  This removes the memcpy cruft.
* (1/3) Undo ZSTD_WINDOWLOG_MAX and handle_zstd_error changes.
* (3/3) Expose zstd_errors.h as `include/linux/zstd_errors.h` because it
  is needed by the kernel wrapper API.

v7 -> v8:
* (1/3) Fix typo in EXPORT_SYMBOL().
* (1/3) Fix typo in zstd.h comments.
* (3/3) Update to latest zstd release: 1.4.6 -> 1.4.10
        This includes ~1KB of stack space reductions.

v8 -> v9:
* (1/3) Rebase onto v5.12-rc5
* (1/3) Add zstd_min_clevel() & zstd_max_clevel() and use in f2fs.
        Thanks to Oleksandr Natalenko for spotting it!
* (1/3) Move lib/decompress_unzstd.c usage of ZSTD_getErrorCode()
        to zstd_get_error_code().
* (1/3) Update modified zstd headers to yearless copyright.
* (2/3) Add copyright/license header to decompress_sources.h for consistency.
* (3/3) Update to yearless copyright for all zstd files. Thanks to
        Mike Dolan for spotting it!

v9 -> v10:
* Add a 4th patch in the series which adds an entry for zstd to MAINTAINERS.

v10 -> v11:
* Rebase cleanly onto v5.12-rc8
* (3/4) Replace invalid kernel style comments in zstd with regular comments.
  Thanks to Randy Dunlap for the suggestion.

Nick Terrell (4):
  lib: zstd: Add kernel-specific API
  lib: zstd: Add decompress_sources.h for decompress_unzstd
  lib: zstd: Upgrade to latest upstream zstd version 1.4.10
  MAINTAINERS: Add maintainer entry for zstd

 MAINTAINERS                                   |   12 +
 crypto/zstd.c                                 |   28 +-
 fs/btrfs/zstd.c                               |   68 +-
 fs/f2fs/compress.c                            |   56 +-
 fs/f2fs/super.c                               |    2 +-
 fs/pstore/platform.c                          |    2 +-
 fs/squashfs/zstd_wrapper.c                    |   16 +-
 include/linux/zstd.h                          | 1252 +---
 include/linux/zstd_errors.h                   |   77 +
 include/linux/zstd_lib.h                      | 2432 ++++++++
 lib/decompress_unzstd.c                       |   48 +-
 lib/zstd/Makefile                             |   44 +-
 lib/zstd/bitstream.h                          |  380 --
 lib/zstd/common/bitstream.h                   |  437 ++
 lib/zstd/common/compiler.h                    |  151 +
 lib/zstd/common/cpu.h                         |  194 +
 lib/zstd/common/debug.c                       |   24 +
 lib/zstd/common/debug.h                       |  101 +
 lib/zstd/common/entropy_common.c              |  357 ++
 lib/zstd/common/error_private.c               |   56 +
 lib/zstd/common/error_private.h               |   66 +
 lib/zstd/common/fse.h                         |  710 +++
 lib/zstd/common/fse_decompress.c              |  390 ++
 lib/zstd/common/huf.h                         |  356 ++
 lib/zstd/common/mem.h                         |  259 +
 lib/zstd/common/zstd_common.c                 |   83 +
 lib/zstd/common/zstd_deps.h                   |  125 +
 lib/zstd/common/zstd_internal.h               |  450 ++
 lib/zstd/compress.c                           | 3485 -----------
 lib/zstd/compress/fse_compress.c              |  625 ++
 lib/zstd/compress/hist.c                      |  165 +
 lib/zstd/compress/hist.h                      |   75 +
 lib/zstd/compress/huf_compress.c              |  902 +++
 lib/zstd/compress/zstd_compress.c             | 5105 +++++++++++++++++
 lib/zstd/compress/zstd_compress_internal.h    | 1188 ++++
 lib/zstd/compress/zstd_compress_literals.c    |  158 +
 lib/zstd/compress/zstd_compress_literals.h    |   29 +
 lib/zstd/compress/zstd_compress_sequences.c   |  439 ++
 lib/zstd/compress/zstd_compress_sequences.h   |   54 +
 lib/zstd/compress/zstd_compress_superblock.c  |  850 +++
 lib/zstd/compress/zstd_compress_superblock.h  |   32 +
 lib/zstd/compress/zstd_cwksp.h                |  482 ++
 lib/zstd/compress/zstd_double_fast.c          |  521 ++
 lib/zstd/compress/zstd_double_fast.h          |   32 +
 lib/zstd/compress/zstd_fast.c                 |  496 ++
 lib/zstd/compress/zstd_fast.h                 |   31 +
 lib/zstd/compress/zstd_lazy.c                 | 1412 +++++
 lib/zstd/compress/zstd_lazy.h                 |   81 +
 lib/zstd/compress/zstd_ldm.c                  |  686 +++
 lib/zstd/compress/zstd_ldm.h                  |  110 +
 lib/zstd/compress/zstd_ldm_geartab.h          |  103 +
 lib/zstd/compress/zstd_opt.c                  | 1345 +++++
 lib/zstd/compress/zstd_opt.h                  |   50 +
 lib/zstd/decompress.c                         | 2531 --------
 lib/zstd/decompress/huf_decompress.c          | 1206 ++++
 lib/zstd/decompress/zstd_ddict.c              |  241 +
 lib/zstd/decompress/zstd_ddict.h              |   44 +
 lib/zstd/decompress/zstd_decompress.c         | 2075 +++++++
 lib/zstd/decompress/zstd_decompress_block.c   | 1540 +++++
 lib/zstd/decompress/zstd_decompress_block.h   |   62 +
 .../decompress/zstd_decompress_internal.h     |  202 +
 lib/zstd/decompress_sources.h                 |   28 +
 lib/zstd/entropy_common.c                     |  243 -
 lib/zstd/error_private.h                      |   53 -
 lib/zstd/fse.h                                |  575 --
 lib/zstd/fse_compress.c                       |  795 ---
 lib/zstd/fse_decompress.c                     |  325 --
 lib/zstd/huf.h                                |  212 -
 lib/zstd/huf_compress.c                       |  773 ---
 lib/zstd/huf_decompress.c                     |  960 ----
 lib/zstd/mem.h                                |  151 -
 lib/zstd/zstd_common.c                        |   75 -
 lib/zstd/zstd_compress_module.c               |  124 +
 lib/zstd/zstd_decompress_module.c             |  105 +
 lib/zstd/zstd_internal.h                      |  273 -
 lib/zstd/zstd_opt.h                           | 1014 ----
 76 files changed, 27299 insertions(+), 12940 deletions(-)
 create mode 100644 include/linux/zstd_errors.h
 create mode 100644 include/linux/zstd_lib.h
 delete mode 100644 lib/zstd/bitstream.h
 create mode 100644 lib/zstd/common/bitstream.h
 create mode 100644 lib/zstd/common/compiler.h
 create mode 100644 lib/zstd/common/cpu.h
 create mode 100644 lib/zstd/common/debug.c
 create mode 100644 lib/zstd/common/debug.h
 create mode 100644 lib/zstd/common/entropy_common.c
 create mode 100644 lib/zstd/common/error_private.c
 create mode 100644 lib/zstd/common/error_private.h
 create mode 100644 lib/zstd/common/fse.h
 create mode 100644 lib/zstd/common/fse_decompress.c
 create mode 100644 lib/zstd/common/huf.h
 create mode 100644 lib/zstd/common/mem.h
 create mode 100644 lib/zstd/common/zstd_common.c
 create mode 100644 lib/zstd/common/zstd_deps.h
 create mode 100644 lib/zstd/common/zstd_internal.h
 delete mode 100644 lib/zstd/compress.c
 create mode 100644 lib/zstd/compress/fse_compress.c
 create mode 100644 lib/zstd/compress/hist.c
 create mode 100644 lib/zstd/compress/hist.h
 create mode 100644 lib/zstd/compress/huf_compress.c
 create mode 100644 lib/zstd/compress/zstd_compress.c
 create mode 100644 lib/zstd/compress/zstd_compress_internal.h
 create mode 100644 lib/zstd/compress/zstd_compress_literals.c
 create mode 100644 lib/zstd/compress/zstd_compress_literals.h
 create mode 100644 lib/zstd/compress/zstd_compress_sequences.c
 create mode 100644 lib/zstd/compress/zstd_compress_sequences.h
 create mode 100644 lib/zstd/compress/zstd_compress_superblock.c
 create mode 100644 lib/zstd/compress/zstd_compress_superblock.h
 create mode 100644 lib/zstd/compress/zstd_cwksp.h
 create mode 100644 lib/zstd/compress/zstd_double_fast.c
 create mode 100644 lib/zstd/compress/zstd_double_fast.h
 create mode 100644 lib/zstd/compress/zstd_fast.c
 create mode 100644 lib/zstd/compress/zstd_fast.h
 create mode 100644 lib/zstd/compress/zstd_lazy.c
 create mode 100644 lib/zstd/compress/zstd_lazy.h
 create mode 100644 lib/zstd/compress/zstd_ldm.c
 create mode 100644 lib/zstd/compress/zstd_ldm.h
 create mode 100644 lib/zstd/compress/zstd_ldm_geartab.h
 create mode 100644 lib/zstd/compress/zstd_opt.c
 create mode 100644 lib/zstd/compress/zstd_opt.h
 delete mode 100644 lib/zstd/decompress.c
 create mode 100644 lib/zstd/decompress/huf_decompress.c
 create mode 100644 lib/zstd/decompress/zstd_ddict.c
 create mode 100644 lib/zstd/decompress/zstd_ddict.h
 create mode 100644 lib/zstd/decompress/zstd_decompress.c
 create mode 100644 lib/zstd/decompress/zstd_decompress_block.c
 create mode 100644 lib/zstd/decompress/zstd_decompress_block.h
 create mode 100644 lib/zstd/decompress/zstd_decompress_internal.h
 create mode 100644 lib/zstd/decompress_sources.h
 delete mode 100644 lib/zstd/entropy_common.c
 delete mode 100644 lib/zstd/error_private.h
 delete mode 100644 lib/zstd/fse.h
 delete mode 100644 lib/zstd/fse_compress.c
 delete mode 100644 lib/zstd/fse_decompress.c
 delete mode 100644 lib/zstd/huf.h
 delete mode 100644 lib/zstd/huf_compress.c
 delete mode 100644 lib/zstd/huf_decompress.c
 delete mode 100644 lib/zstd/mem.h
 delete mode 100644 lib/zstd/zstd_common.c
 create mode 100644 lib/zstd/zstd_compress_module.c
 create mode 100644 lib/zstd/zstd_decompress_module.c
 delete mode 100644 lib/zstd/zstd_internal.h
 delete mode 100644 lib/zstd/zstd_opt.h

-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
