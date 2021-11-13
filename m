Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F5A44F55D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Nov 2021 22:08:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mm0Fi-0001Ap-45; Sat, 13 Nov 2021 21:07:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sedat.dilek@gmail.com>)
 id 1mm0Fg-0001Af-AP; Sat, 13 Nov 2021 21:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 Reply-To:In-Reply-To:References:MIME-Version:Sender:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HtiOMD2c302gZLxYqB1jakRHNl6lirZlt307lFFBKWs=; b=fBCrh7Oz06rA+wWePvug423rSr
 PE6O5EkITzJV8IHgxgw35keFbAKb/TgiNAbqpl6PZF+EVMOoBBq6yLW21e2RmPzIcG6TiGdCZJrCK
 BKiqBIqcZJJSyoPxbIYrD0jpbAx7hcBASNCIOtAN0/l7Ie/4vKV3LStOpCarlErGP15k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:
 References:MIME-Version:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HtiOMD2c302gZLxYqB1jakRHNl6lirZlt307lFFBKWs=; b=T653sbh5VU/HtF0VojrmBlX/r1
 pEwXgOdxsZlBd2OijO5cozMVqGD5PxlLgi2SMdbcr/O3KlN6MnojTvC+9GJq8wXL8iwQbnMLHtoKP
 //Xt2Amlaf4X8/vd5/DHzOqCbtdvUzLWjmmc7BwRW01A9GgEgjGoZOeTeNfaJqoRCYcE=;
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mm0Fc-00C3zz-FO; Sat, 13 Nov 2021 21:07:56 +0000
Received: by mail-io1-f50.google.com with SMTP id w22so15856130ioa.1;
 Sat, 13 Nov 2021 13:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=HtiOMD2c302gZLxYqB1jakRHNl6lirZlt307lFFBKWs=;
 b=RCyG8qCH67GyrKrG/yFhDp22PJgvCOlbjZhzqHcV178hp/JgQNywLJDNyAVGJXYb4O
 Nc2ClKjBlAhZd/HdERZVcGunT5tE9V9SugSM9Rwld2Nsb0Ov2lqV5EverDOXcCXZAYcy
 Sh0vThuJyMmXW6AbNSHOnw94SP6mjbPUfy/T0xg/GOU58VpOvAcEFbarsIwx38KwPu3B
 mIcOvwZETJk/7RWla5BrfxLQRt9GukWZsReMrrawWBB6XKLWnal1FpLopNJRsApXIhak
 vRWxdVAsU9bDCQQZQTa0DfuLPCJkt2w+BlO5+L+kdp4cseDPmbQlTIzPn1S52H/QEhJ2
 t1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=HtiOMD2c302gZLxYqB1jakRHNl6lirZlt307lFFBKWs=;
 b=BrXGA5TFMHsrTx2tHfsC5TVPpXhSkpjHGmV/RzV1TUocUiAi76Ud5Qvn0vTxkOh3CL
 EZLpum1wy9DNrdZgRWB7XXZiVo4AGoSBdd1MMK1uQkozkc3bnhbunStoA+0ciTHtkskg
 R+MJ+KptTIHnNEWyUnspmRukLN22H7t2zunB3iKvekToZfixJ4O6U9VxN1WZdKI388nn
 m21O4RdS5Dm5B1L/5+7qHo50aEl8PrPNG8TGQDd3MSUDPMidL5ptu4ghqj8UYQa2Rhtj
 1FJWo/dN7m44GaGkhVBnfcazDjSImHrqlGoyvwO/sWCYLBNfRfypVCvSIfXRmKA/91mo
 UZwg==
X-Gm-Message-State: AOAM530OQHZrt0paqRDQXxIYQ5H4GzL6aTenHBY1vNxV0JW6Axp/66PV
 qyTU7S+IzxC9p1XzAWc6TZSquCmvdoHBRqWMG4o=
X-Google-Smtp-Source: ABdhPJy73352dPp8570im8OpZyvuCAG7mRYcOZaZ6MiaaopU9zSnnpqnYmcXoGIFsITV2+syZVePMkxoYor+0mEw2nc=
X-Received: by 2002:a6b:440f:: with SMTP id r15mr17139525ioa.128.1636837666668; 
 Sat, 13 Nov 2021 13:07:46 -0800 (PST)
MIME-Version: 1.0
References: <20211109013058.22224-1-nickrterrell@gmail.com>
In-Reply-To: <20211109013058.22224-1-nickrterrell@gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 13 Nov 2021 22:07:10 +0100
Message-ID: <CA+icZUVV+RfrW__qvT04Rigx1dTeDT4ah+KdAVhXWMab=13t_g@mail.gmail.com>
To: Nick Terrell <nickrterrell@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 9, 2021 at 2:24 AM Nick Terrell wrote: > > From:
 Nick Terrell > > Hi Linus, > > I am sending you a pull request to add myself
 as the maintainer of zstd and > update the zstd version in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sedat.dilek[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1mm0Fc-00C3zz-FO
Subject: Re: [f2fs-dev] [GIT PULL] zstd changes for v5.16
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
Reply-To: sedat.dilek@gmail.com
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org, Tom Seewald <tseewald@gmail.com>,
 Chris Mason <clm@fb.com>, Jean-Denis Girard <jd.girard@sysnux.pf>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Paul Jones <paul@pauljones.id.au>,
 Yann Collet <cyan@fb.com>, Christoph Hellwig <hch@infradead.org>,
 Kernel Team <Kernel-team@fb.com>, Eric Biggers <ebiggers@kernel.org>,
 squashfs-devel@lists.sourceforge.net,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Nick Terrell <terrelln@fb.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Sterba <dsterba@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, linux-crypto@vger.kernel.org,
 Felix Handte <felixh@fb.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 9, 2021 at 2:24 AM Nick Terrell <nickrterrell@gmail.com> wrote:
>
> From: Nick Terrell <terrelln@fb.com>
>
> Hi Linus,
>
> I am sending you a pull request to add myself as the maintainer of zstd and
> update the zstd version in the kernel, which is now 4 years out of date,
> to the latest zstd release. This includes bug fixes, much more extensive fuzzing,
> and performance improvements. And generates the kernel zstd automatically
> from upstream zstd, so it is easier to keep the zstd verison up to date, and we
> don't fall so far out of date again.
>

Hi Nick,

is it possible to have an adapted version of your work for Linux
v5.15.y which is a new kernel with LongTerm Support (see [1])?

Thanks.

Regards,
- Sedat -

[1] https://www.kernel.org/category/releases.html

> Thanks,
> Nick Terrell
>
> The following changes since commit d2f38a3c6507b2520101f9a3807ed98f1bdc545a:
>
>   Merge tag 'backlight-next-5.16' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight (2021-11-08 12:21:28 -0800)
>
> are available in the Git repository at:
>
>   git@github.com:terrelln/linux.git tags/zstd-for-linus-v5.16
>
> for you to fetch changes up to 0a8ea235837cc39f27c45689930aa97ae91d5953:
>
>   lib: zstd: Add cast to silence clang's -Wbitwise-instead-of-logical (2021-11-08 16:55:38 -0800)
>
> ----------------------------------------------------------------
> Update to zstd-1.4.10
>
> This PR includes 5 commits that update the zstd library version:
>
> 1. Adds a new kernel-style wrapper around zstd. This wrapper API
>    is functionally equivalent to the subset of the current zstd API that is
>    currently used. The wrapper API changes to be kernel style so that the symbols
>    don't collide with zstd's symbols. The update to zstd-1.4.10 maintains the same
>    API and preserves the semantics, so that none of the callers need to be
>    updated. All callers are updated in the commit, because there are zero
>    functional changes.
> 2. Adds an indirection for `lib/decompress_unzstd.c` so it
>    doesn't depend on the layout of `lib/zstd/` to include every source file.
>    This allows the next patch to be automatically generated.
> 3. Imports the zstd-1.4.10 source code. This commit is automatically generated
>    from upstream zstd (https://github.com/facebook/zstd).
> 4. Adds me (terrelln@fb.com) as the maintainer of `lib/zstd`.
> 5. Fixes a newly added build warning for clang.
>
> The discussion around this patchset has been pretty long, so I've included a
> FAQ-style summary of the history of the patchset, and why we are taking this
> approach.
>
> Why do we need to update?
> -------------------------
>
> The zstd version in the kernel is based off of zstd-1.3.1, which is was released
> August 20, 2017. Since then zstd has seen many bug fixes and performance
> improvements. And, importantly, upstream zstd is continuously fuzzed by OSS-Fuzz,
> and bug fixes aren't backported to older versions. So the only way to sanely get
> these fixes is to keep up to date with upstream zstd. There are no known security
> issues that affect the kernel, but we need to be able to update in case there
> are. And while there are no known security issues, there are relevant bug fixes.
> For example the problem with large kernel decompression has been fixed upstream
> for over 2 years https://lkml.org/lkml/2020/9/29/27.
>
> Additionally the performance improvements for kernel use cases are significant.
> Measured for x86_64 on my Intel i9-9900k @ 3.6 GHz:
>
> - BtrFS zstd compression at levels 1 and 3 is 5% faster
> - BtrFS zstd decompression+read is 15% faster
> - SquashFS zstd decompression+read is 15% faster
> - F2FS zstd compression+write at level 3 is 8% faster
> - F2FS zstd decompression+read is 20% faster
> - ZRAM decompression+read is 30% faster
> - Kernel zstd decompression is 35% faster
> - Initramfs zstd decompression+build is 5% faster
>
> On top of this, there are significant performance improvements coming down the
> line in the next zstd release, and the new automated update patch generation
> will allow us to pull them easily.
>
> How is the update patch generated?
> ----------------------------------
>
> The first two patches are preparation for updating the zstd version. Then the
> 3rd patch in the series imports upstream zstd into the kernel. This patch is
> automatically generated from upstream. A script makes the necessary changes and
> imports it into the kernel. The changes are:
>
> - Replace all libc dependencies with kernel replacements and rewrite includes.
> - Remove unncessary portability macros like: #if defined(_MSC_VER).
> - Use the kernel xxhash instead of bundling it.
>
> This automation gets tested every commit by upstream's continuous integration.
> When we cut a new zstd release, we will submit a patch to the kernel to update
> the zstd version in the kernel.
>
> The automated process makes it easy to keep the kernel version of zstd up to
> date. The current zstd in the kernel shares the guts of the code, but has a lot
> of API and minor changes to work in the kernel. This is because at the time
> upstream zstd was not ready to be used in the kernel envrionment as-is. But,
> since then upstream zstd has evolved to support being used in the kernel as-is.
>
> Why are we updating in one big patch?
> -------------------------------------
>
> The 3rd patch in the series is very large. This is because it is restructuring
> the code, so it both deletes the existing zstd, and re-adds the new structure.
> Future updates will be directly proportional to the changes in upstream zstd
> since the last import. They will admittidly be large, as zstd is an actively
> developed project, and has hundreds of commits between every release. However,
> there is no other great alternative.
>
> One option ruled out is to replay every upstream zstd commit. This is not feasible
> for several reasons:
> - There are over 3500 upstream commits since the zstd version in the kernel.
> - The automation to automatically generate the kernel update was only added recently,
>   so older commits cannot easily be imported.
> - Not every upstream zstd commit builds.
> - Only zstd releases are "supported", and individual commits may have bugs that were
>   fixed before a release.
>
> Another option to reduce the patch size would be to first reorganize to the new
> file structure, and then apply the patch. However, the current kernel zstd is formatted
> with clang-format to be more "kernel-like". But, the new method imports zstd as-is,
> without additional formatting, to allow for closer correlation with upstream, and
> easier debugging. So the patch wouldn't be any smaller.
>
> It also doesn't make sense to import upstream zstd commit by commit going
> forward. Upstream zstd doesn't support production use cases running of the
> development branch. We have a lot of post-commit fuzzing that catches many bugs,
> so indiviudal commits may be buggy, but fixed before a release. So going forward,
> I intend to import every (important) zstd release into the Kernel.
>
> So, while it isn't ideal, updating in one big patch is the only patch I see forward.
>
> Who is responsible for this code?
> ---------------------------------
>
> I am. This patchset adds me as the maintainer for zstd. Previously, there was no tree
> for zstd patches. Because of that, there were several patches that either got ignored,
> or took a long time to merge, since it wasn't clear which tree should pick them up.
> I'm officially stepping up as maintainer, and setting up my tree as the path through
> which zstd patches get merged. I'll make sure that patches to the kernel zstd get
> ported upstream, so they aren't erased when the next version update happens.
>
> How is this code tested?
> ------------------------
>
> I tested every caller of zstd on x86_64 (BtrFS, ZRAM, SquashFS, F2FS, Kernel,
> InitRAMFS). I also tested Kernel & InitRAMFS on i386 and aarch64. I checked both
> performance and correctness.
>
> Also, thanks to many people in the community who have tested these patches locally.
> If you have tested the patches, please reply with a Tested-By so I can collect them
> for the PR I will send to Linus.
>
> Lastly, this code will bake in linux-next before being merged into v5.16.
>
> Why update to zstd-1.4.10 when zstd-1.5.0 has been released?
> ------------------------------------------------------------
>
> This patchset has been outstanding since 2020, and zstd-1.4.10 was the latest
> release when it was created. Since the update patch is automatically generated
> from upstream, I could generate it from zstd-1.5.0. However, there were some
> large stack usage regressions in zstd-1.5.0, and are only fixed in the latest
> development branch. And the latest development branch contains some new code that
> needs to bake in the fuzzer before I would feel comfortable releasing to the
> kernel.
>
> Once this patchset has been merged, and we've released zstd-1.5.1, we can update
> the kernel to zstd-1.5.1, and exercise the update process.
>
> You may notice that zstd-1.4.10 doesn't exist upstream. This release is an
> artifical release based off of zstd-1.4.9, with some fixes for the kernel
> backported from the development branch. I will tag the zstd-1.4.10 release after
> this patchset is merged, so the Linux Kernel is running a known version of zstd
> that can be debugged upstream.
>
> Why was a wrapper API added?
> ----------------------------
>
> The first versions of this patchset migrated the kernel to the upstream zstd
> API. It first added a shim API that supported the new upstream API with the old
> code, then updated callers to use the new shim API, then transitioned to the
> new code and deleted the shim API. However, Cristoph Hellwig suggested that we
> transition to a kernel style API, and hide zstd's upstream API behind that.
> This is because zstd's upstream API is supports many other use cases, and does
> not follow the kernel style guide, while the kernel API is focused on the
> kernel's use cases, and follows the kernel style guide.
>
> Where is the previous discussion?
> ---------------------------------
>
> Links for the discussions of the previous versions of the patch set.
> The largest changes in the design of the patchset are driven by the discussions
> in V11, V5, and V1. Sorry for the mix of links, I couldn't find most of the the
> threads on lkml.org.
>
> V12: https://www.spinics.net/lists/linux-crypto/msg58189.html
> V11: https://lore.kernel.org/linux-btrfs/20210430013157.747152-1-nickrterrell@gmail.com/
> V10: https://lore.kernel.org/lkml/20210426234621.870684-2-nickrterrell@gmail.com/
> V9: https://lore.kernel.org/linux-btrfs/20210330225112.496213-1-nickrterrell@gmail.com/
> V8: https://lore.kernel.org/linux-f2fs-devel/20210326191859.1542272-1-nickrterrell@gmail.com/
> V7: https://lkml.org/lkml/2020/12/3/1195
> V6: https://lkml.org/lkml/2020/12/2/1245
> V5: https://lore.kernel.org/linux-btrfs/20200916034307.2092020-1-nickrterrell@gmail.com/
> V4: https://www.spinics.net/lists/linux-btrfs/msg105783.html
> V3: https://lkml.org/lkml/2020/9/23/1074
> V2: https://www.spinics.net/lists/linux-btrfs/msg105505.html
> V1: https://lore.kernel.org/linux-btrfs/20200916034307.2092020-1-nickrterrell@gmail.com/
>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> Tested By: Paul Jones <paul@pauljones.id.au>
> Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v13.0.0 on x86-64
> Tested-by: Jean-Denis Girard <jd.girard@sysnux.pf>
>
> ----------------------------------------------------------------
> Nathan Chancellor (1):
>       lib: zstd: Add cast to silence clang's -Wbitwise-instead-of-logical
>
> Nick Terrell (4):
>       lib: zstd: Add kernel-specific API
>       lib: zstd: Add decompress_sources.h for decompress_unzstd
>       lib: zstd: Upgrade to latest upstream zstd version 1.4.10
>       MAINTAINERS: Add maintainer entry for zstd
>
>  MAINTAINERS                                    |   12 +
>  crypto/zstd.c                                  |   28 +-
>  fs/btrfs/zstd.c                                |   68 +-
>  fs/f2fs/compress.c                             |   56 +-
>  fs/f2fs/super.c                                |    2 +-
>  fs/pstore/platform.c                           |    2 +-
>  fs/squashfs/zstd_wrapper.c                     |   16 +-
>  include/linux/zstd.h                           | 1252 ++----
>  include/linux/zstd_errors.h                    |   77 +
>  include/linux/zstd_lib.h                       | 2432 +++++++++++
>  lib/decompress_unzstd.c                        |   48 +-
>  lib/zstd/Makefile                              |   46 +-
>  lib/zstd/bitstream.h                           |  380 --
>  lib/zstd/common/bitstream.h                    |  437 ++
>  lib/zstd/common/compiler.h                     |  170 +
>  lib/zstd/common/cpu.h                          |  194 +
>  lib/zstd/common/debug.c                        |   24 +
>  lib/zstd/common/debug.h                        |  101 +
>  lib/zstd/common/entropy_common.c               |  357 ++
>  lib/zstd/common/error_private.c                |   56 +
>  lib/zstd/common/error_private.h                |   66 +
>  lib/zstd/common/fse.h                          |  710 ++++
>  lib/zstd/common/fse_decompress.c               |  390 ++
>  lib/zstd/common/huf.h                          |  356 ++
>  lib/zstd/common/mem.h                          |  259 ++
>  lib/zstd/common/zstd_common.c                  |   83 +
>  lib/zstd/common/zstd_deps.h                    |  125 +
>  lib/zstd/common/zstd_internal.h                |  450 +++
>  lib/zstd/compress.c                            | 3485 ----------------
>  lib/zstd/compress/fse_compress.c               |  625 +++
>  lib/zstd/compress/hist.c                       |  165 +
>  lib/zstd/compress/hist.h                       |   75 +
>  lib/zstd/compress/huf_compress.c               |  905 +++++
>  lib/zstd/compress/zstd_compress.c              | 5109 ++++++++++++++++++++++++
>  lib/zstd/compress/zstd_compress_internal.h     | 1188 ++++++
>  lib/zstd/compress/zstd_compress_literals.c     |  158 +
>  lib/zstd/compress/zstd_compress_literals.h     |   29 +
>  lib/zstd/compress/zstd_compress_sequences.c    |  439 ++
>  lib/zstd/compress/zstd_compress_sequences.h    |   54 +
>  lib/zstd/compress/zstd_compress_superblock.c   |  850 ++++
>  lib/zstd/compress/zstd_compress_superblock.h   |   32 +
>  lib/zstd/compress/zstd_cwksp.h                 |  482 +++
>  lib/zstd/compress/zstd_double_fast.c           |  519 +++
>  lib/zstd/compress/zstd_double_fast.h           |   32 +
>  lib/zstd/compress/zstd_fast.c                  |  496 +++
>  lib/zstd/compress/zstd_fast.h                  |   31 +
>  lib/zstd/compress/zstd_lazy.c                  | 1414 +++++++
>  lib/zstd/compress/zstd_lazy.h                  |   81 +
>  lib/zstd/compress/zstd_ldm.c                   |  686 ++++
>  lib/zstd/compress/zstd_ldm.h                   |  110 +
>  lib/zstd/compress/zstd_ldm_geartab.h           |  103 +
>  lib/zstd/compress/zstd_opt.c                   | 1346 +++++++
>  lib/zstd/compress/zstd_opt.h                   |   50 +
>  lib/zstd/decompress.c                          | 2531 ------------
>  lib/zstd/decompress/huf_decompress.c           | 1206 ++++++
>  lib/zstd/decompress/zstd_ddict.c               |  241 ++
>  lib/zstd/decompress/zstd_ddict.h               |   44 +
>  lib/zstd/decompress/zstd_decompress.c          | 2085 ++++++++++
>  lib/zstd/decompress/zstd_decompress_block.c    | 1540 +++++++
>  lib/zstd/decompress/zstd_decompress_block.h    |   62 +
>  lib/zstd/decompress/zstd_decompress_internal.h |  202 +
>  lib/zstd/decompress_sources.h                  |   28 +
>  lib/zstd/entropy_common.c                      |  243 --
>  lib/zstd/error_private.h                       |   53 -
>  lib/zstd/fse.h                                 |  575 ---
>  lib/zstd/fse_compress.c                        |  795 ----
>  lib/zstd/fse_decompress.c                      |  325 --
>  lib/zstd/huf.h                                 |  212 -
>  lib/zstd/huf_compress.c                        |  773 ----
>  lib/zstd/huf_decompress.c                      |  960 -----
>  lib/zstd/mem.h                                 |  151 -
>  lib/zstd/zstd_common.c                         |   75 -
>  lib/zstd/zstd_compress_module.c                |  160 +
>  lib/zstd/zstd_decompress_module.c              |  105 +
>  lib/zstd/zstd_internal.h                       |  273 --
>  lib/zstd/zstd_opt.h                            | 1014 -----
>  76 files changed, 27373 insertions(+), 12941 deletions(-)
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
>  create mode 100644 lib/zstd/compress/zstd_ldm_geartab.h
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


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
