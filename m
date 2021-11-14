Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AF44FA13
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Nov 2021 20:11:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mmKub-0007u3-6S; Sun, 14 Nov 2021 19:11:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1mmKuY-0007ts-50; Sun, 14 Nov 2021 19:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Sknt59G7NNuQ4Eiu1wyh6p23EFcYGDA0b1KDBZyFXw=; b=iV90YwyszmbwJ/RfaS8tPkEDDW
 s/8DxqJHapS56GOdexlz9VQjLhk1oV4uG91B3Fy0tb5O45NDLb8mkx/ZtA+YOtR8jxxjV4wXPJ0ia
 mgrFJozp2mbtDVrRq9bpYMNJFdZYpHrbv4XTerP1TrY8hfBx2hBcQmurH3qfSV6OmQGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Sknt59G7NNuQ4Eiu1wyh6p23EFcYGDA0b1KDBZyFXw=; b=Q8Dnv1UXv2mmWxNrC3BnQCEGz3
 jT4jv5J7EbrIIH4biWdEYNj5BPlJ/Iue7jat52jxNo6dPG7XoEDQzkbqi8JozEBcJiM0/y7LA3KTH
 SsWrc0390dQGs2F79Zj9GI0rUFkEwHmhc5WIonrgOsdFxSecHPEKlzKnWfHPkDEEqeU4=;
Received: from mail-vk1-f175.google.com ([209.85.221.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mmKuX-00CxYB-DK; Sun, 14 Nov 2021 19:11:31 +0000
Received: by mail-vk1-f175.google.com with SMTP id j1so598838vkr.1;
 Sun, 14 Nov 2021 11:11:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Sknt59G7NNuQ4Eiu1wyh6p23EFcYGDA0b1KDBZyFXw=;
 b=xAZY4FOgxWki84LrPX951eEAJEhyXrI7T3QugsmDt5+qPgp2q6wATlC1mgYVBl6Eti
 HNQ7EXqlCFI7m8ifD4gOKWpLcOzHw7oKpY/+9GwuCQsUnniWqQO0ZvF+jR1B8kudfpbV
 wpAZcUjCF92patyxPiqcTjGIxPNPEhd+ErLL2bD4DxVTur1s4psT4mIyw255Q1a0+8Aa
 pZdTtVeXRmAwAEiPyAxqeK+rGPh7ojneoh/DQOCEcATxg1TmRy1d8vnBLH8/Bn6JzG0Q
 2Zsjfkdp/T2gjMcBKFmLrQE0oRVnUMrgCDVo3fecI0a20B8KuiwxcQEGuSSuEMNOHHzu
 epfw==
X-Gm-Message-State: AOAM532v7h8Il8lk4/ulGEy17BEYv14KxD1bRsac6KXXOHjoyFWKwp06
 965VcYr88HAqphuf7vbW1KbJ33NCqkvimg==
X-Google-Smtp-Source: ABdhPJzSBXoDfEZQKHJ+M4JZwUUlZQqtbi9yfuFX17dwAepFQYnTJm2AhMWyzc9X0Ie52bQZBZ+L4w==
X-Received: by 2002:a1f:a857:: with SMTP id r84mr49843073vke.0.1636917083158; 
 Sun, 14 Nov 2021 11:11:23 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id s22sm7607792vkm.28.2021.11.14.11.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 11:11:22 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id e64so7977657vke.4;
 Sun, 14 Nov 2021 11:11:21 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr49851846vkh.11.1636917081468; 
 Sun, 14 Nov 2021 11:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20211109013058.22224-1-nickrterrell@gmail.com>
 <CA+icZUVV+RfrW__qvT04Rigx1dTeDT4ah+KdAVhXWMab=13t_g@mail.gmail.com>
In-Reply-To: <CA+icZUVV+RfrW__qvT04Rigx1dTeDT4ah+KdAVhXWMab=13t_g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 14 Nov 2021 20:11:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqBAwVnfuwmonT1hESB4P+EH0p0dtszdrZLJGxBbU2gw@mail.gmail.com>
Message-ID: <CAMuHMdWqBAwVnfuwmonT1hESB4P+EH0p0dtszdrZLJGxBbU2gw@mail.gmail.com>
To: Sedat Dilek <sedat.dilek@gmail.com>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Nov 13,
 2021 at 10:12 PM Sedat Dilek <sedat.dilek@gmail.com>
 wrote: > On Tue, Nov 9, 2021 at 2:24 AM Nick Terrell <nickrterrell@gmail.com>
 wrote: > > I am sending you a pull request to add mys [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.175 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [geert.uytterhoeven[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1mmKuX-00CxYB-DK
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
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Kernel Team <Kernel-team@fb.com>,
 Eric Biggers <ebiggers@kernel.org>, squashfs-devel@lists.sourceforge.net,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Nick Terrell <terrelln@fb.com>, Randy Dunlap <rdunlap@infradead.org>,
 David Sterba <dsterba@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Felix Handte <felixh@fb.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 13, 2021 at 10:12 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Tue, Nov 9, 2021 at 2:24 AM Nick Terrell <nickrterrell@gmail.com> wrote:
> > I am sending you a pull request to add myself as the maintainer of zstd and
> > update the zstd version in the kernel, which is now 4 years out of date,
> > to the latest zstd release. This includes bug fixes, much more extensive fuzzing,
> > and performance improvements. And generates the kernel zstd automatically
> > from upstream zstd, so it is easier to keep the zstd verison up to date, and we
> > don't fall so far out of date again.

> is it possible to have an adapted version of your work for Linux
> v5.15.y which is a new kernel with LongTerm Support (see [1])?

Let's wait a bit before porting this to stable...

bloat-o-meter output for an atari_defconfig build with the old/new zstd
code (i.e. before/after commit e0c1b49f5b674cca ("lib: zstd: Upgrade to
latest upstream zstd version 1.4.10"):

vmlinux:

    add/remove: 96/28 grow/shrink: 28/29 up/down: 51766/-38162 (13604)
    CONFIG_ZSTD_DECOMPRESS=y due to CONFIG_RD_ZSTD=y (which is the default)

    Not a small increase, but acceptable, I guess?

lib/zstd/zstd_compress.ko:

    CONFIG_ZSTD_COMPRESS=m

    add/remove: 183/38 grow/shrink: 58/37 up/down: 346620/-51074 (295546)
    Function                                     old     new   delta
    ZSTD_compressBlock_btultra_dictMatchState       -   27802  +27802
    ZSTD_compressBlock_btopt_dictMatchState        -   27614  +27614
    ZSTD_compressBlock_doubleFast_dictMatchState       -   24420  +24420
    ZSTD_compressBlock_btultra_extDict             -   24376  +24376
    ZSTD_compressBlock_fast_dictMatchState         -   16712  +16712
    ZSTD_compressBlock_btultra2                    -   15432  +15432
    ZSTD_compressBlock_btopt_extDict            9052   24096  +15044
    ZSTD_initStats_ultra                           -   15040  +15040
    ZSTD_compressBlock_btultra                     -   14802  +14802
    ZSTD_compressBlock_doubleFast_extDict_generic    2432   12216   +9784
    ZSTD_compressBlock_doubleFast               8846   16342   +7496
    ZSTD_compressBlock_fast_extDict_generic     1254    8556   +7302
    ZSTD_compressBlock_btopt                    8826   15184   +6358
    ZSTD_compressBlock_fast                     3896    9532   +5636
    ZSTD_compressBlock_lazy2_extDict            6940   11578   +4638
    ZSTD_compressSuperBlock                        -    4440   +4440
    ZSTD_resetCCtx_internal                        -    3736   +3736
    ZSTD_HcFindBestMatch_dedicatedDictSearch_selectMLS.constprop
-    3706   +3706
    ...

    An increase of 288 KiB?
    My first thought was bloat-a-meter doesn't handle modules correctly.
    So I enabled CONFIG_CRYPTO_ZSTD=y, which made CONFIG_ZSTD_COMPRESS=y,
    and the impact on vmlinux is:

        add/remove: 288/0 grow/shrink: 5/0 up/down: 432712/0 (432712)

    Whoops...

    All of the top functions above just call ZSTD_compressBlock_opt_generic()
    with different parameters. Looks like the forced inlining

        FORCE_INLINE_TEMPLATE size_t
        ZSTD_compressBlock_opt_generic(ZSTD_matchState_t* ms,
                                       seqStore_t* seqStore,
                                       U32 rep[ZSTD_REP_NUM],
                                 const void* src, size_t srcSize,
                                 const int optLevel,
                                 const ZSTD_dictMode_e dictMode)

    is not that suitable for the kernel...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
