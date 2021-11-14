Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA77C44FB98
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Nov 2021 21:34:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mmMCQ-0003mV-A4; Sun, 14 Nov 2021 20:34:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <nickrterrell@gmail.com>)
 id 1mmMCM-0003lw-Fe; Sun, 14 Nov 2021 20:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iACvn6MK1LO2lB6vFyhNu2ydwbSkNnulX+sOko7Bz0A=; b=WIwxvMuRxF3g2icB2jDh6X9OM1
 mjAsD6qUwxrRisq7o+hR9iDU5SQNyqIyestvRhMAio8TNC9nKhhaNsr/KYsKYB/Dc1AwaY1wlfhBe
 uj9FW4jd9FLVApvd2m1+fH/f5hUkQ94VvXJY4VO7a8rAegoEOJjReb2R9JX/GQigALVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iACvn6MK1LO2lB6vFyhNu2ydwbSkNnulX+sOko7Bz0A=; b=b5L9pJqIAXWoCFPRz7u5+9dn2J
 GOeLWQLEA/uPMa8UI5CLgL40LDlWakWsL8M0gbgCJrZneoYGSK9W0ULVGCSUkjToZ8gqDGx4+MCxl
 6C+/W5s5DoMyXeBYZyix3eFTw2NgUhZyWfNxvvaw8BoSzSHvT2UMtf2MO9WTRZTik5jE=;
Received: from mail-yb1-f169.google.com ([209.85.219.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mmMCM-00D1IJ-NU; Sun, 14 Nov 2021 20:33:59 +0000
Received: by mail-yb1-f169.google.com with SMTP id y68so35382153ybe.1;
 Sun, 14 Nov 2021 12:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iACvn6MK1LO2lB6vFyhNu2ydwbSkNnulX+sOko7Bz0A=;
 b=Myh33ShzDDC1kEzySEO8tnbMKLfdT2xBxjDtl0FaBbh9V3MCdME75Vo9TsP444FIBq
 YtbumvvbtyXIJsc/TJ6NlhTXCPlA1KbFjfswCre2vNxOo/vnIjJC+mOTNZckIugq2VNs
 M60szxnYCTS2nS/91bGQYs3nPvi4JuSzeUr993YaE9CwJgI+aMOYnbBJqs/GdKchIh8y
 YVua+Dt4wah3xkvdNrocRLASZvocD3eJoS+rat/04wMDWXAT86Fz7p7S2XcuRq/dKiZx
 PUNO73A1PVqARtgd7ZgKhtZuqZDH7tl3h0C0YdE4T1vnoTR/kDVa/45/EVMYLjbt5ZA7
 +v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iACvn6MK1LO2lB6vFyhNu2ydwbSkNnulX+sOko7Bz0A=;
 b=Ziz3NKVuf+qv0fE64kUQ5vZ+UMAdIqFLpL3wmD5nUC9zxyLDl3xZaZyv6s2LcEbgM+
 tVfGxjcJgbJ3u6IaMajG9cy7/ApDnI7PCjnRnF03vWY/uFzuGrIWwenO8ftkWjAwOjCf
 lTHePsRlB3JhHUwhqUJn+JMu9oKMx/tQjcbz9WkwPJbnEbbUqiClJFAl18B7R+xe7veA
 +4tWw9zCUkEGWhYoLNI9BpvwS/1mZhG/QIz6J40sdhbfQCFi3alA/FhBMbGR3E3DTA6J
 JgCvp38A0hJr7B/yGkVzURRHJt9mXVlNh3L4tviIdZwZjJyFz2IGkRti3bMkH0Z8WEl6
 xvAw==
X-Gm-Message-State: AOAM5304oGs1DBvkHJHYZQ8oCiG1md4DbuUOp86jowwEOHSje0pKFwQf
 dCycss7JrtriZfif3ykez6mioljW6uladQNtF/s=
X-Google-Smtp-Source: ABdhPJznee7TMd2ZMaYm26gmU6hWlIBtVQTHY+sIBtV7ExbmuuBQACj/pVfeuW3Q1PsDF/GuMSLuiksWeqv7DUEbLPI=
X-Received: by 2002:a25:ad14:: with SMTP id y20mr34423278ybi.102.1636922032754; 
 Sun, 14 Nov 2021 12:33:52 -0800 (PST)
MIME-Version: 1.0
References: <20211109013058.22224-1-nickrterrell@gmail.com>
 <CA+icZUVV+RfrW__qvT04Rigx1dTeDT4ah+KdAVhXWMab=13t_g@mail.gmail.com>
 <CAMuHMdWqBAwVnfuwmonT1hESB4P+EH0p0dtszdrZLJGxBbU2gw@mail.gmail.com>
In-Reply-To: <CAMuHMdWqBAwVnfuwmonT1hESB4P+EH0p0dtszdrZLJGxBbU2gw@mail.gmail.com>
From: Nick Terrell <nickrterrell@gmail.com>
Date: Sun, 14 Nov 2021 12:33:41 -0800
Message-ID: <CANr2DbfSu9RWv+c8jzj=6r0cRC-R0f_Z2v3gSkJm2dPR8MJi4A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 14, 2021 at 11:11 AM Geert Uytterhoeven wrote:
 > > On Sat, Nov 13, 2021 at 10:12 PM Sedat Dilek wrote: > > On Tue, Nov 9,
 2021 at 2:24 AM Nick Terrell wrote: > > > I am sending you a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.169 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [nickrterrell[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1mmMCM-00D1IJ-NU
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
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tom Seewald <tseewald@gmail.com>, Chris Mason <clm@fb.com>,
 Jean-Denis Girard <jd.girard@sysnux.pf>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Paul Jones <paul@pauljones.id.au>,
 Yann Collet <cyan@fb.com>, Christoph Hellwig <hch@infradead.org>,
 Kernel Team <Kernel-team@fb.com>, Eric Biggers <ebiggers@kernel.org>,
 squashfs-devel@lists.sourceforge.net,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Nick Terrell <terrelln@fb.com>, Sedat Dilek <sedat.dilek@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, David Sterba <dsterba@suse.cz>,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 14, 2021 at 11:11 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Sat, Nov 13, 2021 at 10:12 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > On Tue, Nov 9, 2021 at 2:24 AM Nick Terrell <nickrterrell@gmail.com> wrote:
> > > I am sending you a pull request to add myself as the maintainer of zstd and
> > > update the zstd version in the kernel, which is now 4 years out of date,
> > > to the latest zstd release. This includes bug fixes, much more extensive fuzzing,
> > > and performance improvements. And generates the kernel zstd automatically
> > > from upstream zstd, so it is easier to keep the zstd verison up to date, and we
> > > don't fall so far out of date again.
>
> > is it possible to have an adapted version of your work for Linux
> > v5.15.y which is a new kernel with LongTerm Support (see [1])?
>
> Let's wait a bit before porting this to stable...
>
> bloat-o-meter output for an atari_defconfig build with the old/new zstd
> code (i.e. before/after commit e0c1b49f5b674cca ("lib: zstd: Upgrade to
> latest upstream zstd version 1.4.10"):
>
> vmlinux:
>
>     add/remove: 96/28 grow/shrink: 28/29 up/down: 51766/-38162 (13604)
>     CONFIG_ZSTD_DECOMPRESS=y due to CONFIG_RD_ZSTD=y (which is the default)
>
>     Not a small increase, but acceptable, I guess?
>
> lib/zstd/zstd_compress.ko:
>
>     CONFIG_ZSTD_COMPRESS=m
>
>     add/remove: 183/38 grow/shrink: 58/37 up/down: 346620/-51074 (295546)
>     Function                                     old     new   delta
>     ZSTD_compressBlock_btultra_dictMatchState       -   27802  +27802
>     ZSTD_compressBlock_btopt_dictMatchState        -   27614  +27614
>     ZSTD_compressBlock_doubleFast_dictMatchState       -   24420  +24420
>     ZSTD_compressBlock_btultra_extDict             -   24376  +24376
>     ZSTD_compressBlock_fast_dictMatchState         -   16712  +16712
>     ZSTD_compressBlock_btultra2                    -   15432  +15432
>     ZSTD_compressBlock_btopt_extDict            9052   24096  +15044
>     ZSTD_initStats_ultra                           -   15040  +15040
>     ZSTD_compressBlock_btultra                     -   14802  +14802
>     ZSTD_compressBlock_doubleFast_extDict_generic    2432   12216   +9784
>     ZSTD_compressBlock_doubleFast               8846   16342   +7496
>     ZSTD_compressBlock_fast_extDict_generic     1254    8556   +7302
>     ZSTD_compressBlock_btopt                    8826   15184   +6358
>     ZSTD_compressBlock_fast                     3896    9532   +5636
>     ZSTD_compressBlock_lazy2_extDict            6940   11578   +4638
>     ZSTD_compressSuperBlock                        -    4440   +4440
>     ZSTD_resetCCtx_internal                        -    3736   +3736
>     ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS.constprop
> -    3706   +3706
>     ...
>
>     An increase of 288 KiB?
>     My first thought was bloat-a-meter doesn't handle modules correctly.
>     So I enabled CONFIG_CRYPTO_ZSTD=y, which made CONFIG_ZSTD_COMPRESS=y,
>     and the impact on vmlinux is:
>
>         add/remove: 288/0 grow/shrink: 5/0 up/down: 432712/0 (432712)
>
>     Whoops...
>
>     All of the top functions above just call ZSTD_compressBlock_opt_generic()
>     with different parameters. Looks like the forced inlining
>
>         FORCE_INLINE_TEMPLATE size_t
>         ZSTD_compressBlock_opt_generic(ZSTD_matchState_t* ms,
>                                        seqStore_t* seqStore,
>                                        U32 rep[ZSTD_REP_NUM],
>                                  const void* src, size_t srcSize,
>                                  const int optLevel,
>                                  const ZSTD_dictMode_e dictMode)
>
>     is not that suitable for the kernel...

Thanks for pointing that out! Code size wasn't something I was measuring in my
tests. I'll put up a patch to fix it.

That function is used by the highest compression level, so there
should be little
usage in the kernel. And what usage there is shouldn't be very speed sensitive.
So we should just be able to disable inlining for that file.

Longer term, we have noticed upstream that we had some code size bloat in
the compressor. We aggressively inlined to get better speed, but that tradeoff
went too far in some cases. So we're working on reducing the code size of
our largest translation units for the next release. All that to say
that we can land
a shorter term fix of disabling inlining for
lib/zstd/compress/zstd_opt.c for the
v5.16 kernel, and handle the problem thoroughly upstream in our next release.

Best,
Nick Terrell

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
