Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F14322683
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Feb 2021 08:43:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lESLN-0006DF-9S; Tue, 23 Feb 2021 07:42:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1lESLM-0006D8-2b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Feb 2021 07:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WJFI5RyzuifHOR96lwKCSFonlTIiLRUIGVDJn5EnP2g=; b=m46+kJP45UVQpT7RGS+T+OMehz
 37HTSkuMa4RzSSTun//RP8BZUfRKWWHTdD00fVh7l5mXdufoEP7GSih0Ov+DJY/QcqCmX3+QG5fjj
 35Bhw19uPH/qm73VA/fvUNYvhOBpaRUkr+32f2LhKsGzie8u7TpdyOCEXp+SZNNM8Ez4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WJFI5RyzuifHOR96lwKCSFonlTIiLRUIGVDJn5EnP2g=; b=YLaYs8kfg8Ouc9HAjScEhW1gzU
 DBXgQlD6fVu4LM+wnbx71Js3AfqU2aBdP3TLk5cAMn6AijANF6buG48GI5wkM/nM/Jmuwxw0+hS9M
 ZsnG7CB/Z5Re+FVZxv5o+FkIhB5tVIfjSDqobRwtfg7GsrI/fG/D2V7SnuwYvY+OS0G0=;
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lESLD-0001aR-BA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Feb 2021 07:42:51 +0000
Received: by mail-oi1-f178.google.com with SMTP id d20so16759509oiw.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Feb 2021 23:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WJFI5RyzuifHOR96lwKCSFonlTIiLRUIGVDJn5EnP2g=;
 b=DZaU1+l9qvAu3m6nfrgq97IDgppuLkqp6i8DsFnGjqMB1P/aRqWwXauRb9X8+6nlXt
 n1hz7EgTkdcLY/ISAltz6N1Zn9/mUI8MgNQyYZYw7/TXJWRA3MmSDmR2cxroUrYRPB8N
 PIgqEGcd91Fp2QA74kCXcFBja0fQeK9VV5VG9sJpXJ7TGplooFM33VL6A2baJPgT3ns/
 irtPSNFPS7sEz/ok4Sc325PGZYMmWhuRe816aMNJ3lm3iH8dNpR7ofOCSwSIVIC1IVF5
 GfPWBVhpeDMGfUAitzBk3WtJSq9jDZeAk2ZPsZnbpECa3GJvH3vMUUfd0nDLDqW1SLqJ
 8ylA==
X-Gm-Message-State: AOAM530B0aRoJrzTZYbZmDZEC3eIclHXjzy9sDBNUvXgoa3pEoFJKmic
 7L1PLMqL9T4iOdIoiaWknL4GcP6aSnpXUxXbqMI=
X-Google-Smtp-Source: ABdhPJxwLA+IJ2oFZ0i1C36eBSf9oCeHNZMyyblRWQXyCdK6Xd17NBm7c6MpnurOGmZ/pbWEvX+1HBvWalN3LSvmV8U=
X-Received: by 2002:aca:d908:: with SMTP id q8mr17857257oig.148.1614066157844; 
 Mon, 22 Feb 2021 23:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20210222125916.4168804-1-geert@linux-m68k.org>
 <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
In-Reply-To: <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Feb 2021 08:42:26 +0100
Message-ID: <CAMuHMdX-t4Z27RnWn0Sp1AoO3A=+aT8GXkcGC5gSArtm+W9w1Q@mail.gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.178 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1lESLD-0001aR-BA
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: Allow modular
 (de)compression algorithms
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
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Yamada-san,

On Tue, Feb 23, 2021 at 7:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Mon, Feb 22, 2021 at 9:59 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > If F2FS_FS is modular, enabling the compressions options
> > F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
> > algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
> > modular, as the former depend on an intermediate boolean
> > F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.
> >
> > Indeed, if a boolean symbol A depends directly on a tristate symbol B
> > and selects another tristate symbol C:
> >
> >     tristate B
> >
> >     tristate C
> >
> >     bool A
> >       depends on B
> >       select C
> >
> > and B is modular, then C will also be modular.
> >
> > However, if there is an intermediate boolean D in the dependency chain
> > between A and B:
> >
> >     tristate B
> >
> >     tristate C
> >
> >     bool D
> >       depends on B
> >
> >     bool A
> >       depends on D
> >       select C
> >
> > then the modular state won't propagate from B to C, and C will be
> > builtin instead of modular.
> >
> > Fix this by making the various compression options depend directly on
> > F2FS_FS using a big if/endif block.  Drop the now superfluous
> > dependencies on F2FS_FS from individual symbols.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Perhaps the propagation logic in Kconfig should be fixed instead?
> > Else people may reintroduce this issue when removing seemingly-unneeded
> > dependencies.
>
> I checked the code in menu_finalize(), and this seems to work like this.
>
> I discussed the oddity of the select behavior before
> (https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/),
> but I was not confident about what the right direction was.
>
>
> Anyway, the behavior is obscure from the current code.
>
> If you want to make this more robust,
> you can write as follows:
>
> config F2FS_FS
>         tristate "F2FS filesystem support"
>         depends on BLOCK
>         select NLS
>         select CRYPTO
>         select CRYPTO_CRC32
>         select F2FS_FS_XATTR if FS_ENCRYPTION
>         select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
>         select LZO_COMPRESS if F2FS_FS_LZO
>         select LZO_DECOMPRESS if F2FS_FS_LZO
>         select LZ4_COMPRESS if F2FS_FS_LZ4
>         select LZ4_DECOMPRESS if F2FS_FS_LZ4
>         select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
>         select ZSTD_COMPRESS if F2FS_FS_ZSTD
>         select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>
> The code is a bit clumsy, but it is clear
> that the module (F2FS_FS) is selecting the
> compress/decompress libraries.

Actually the above is what I tried first ;-)  Works fine.

Then I started to look for similar cases in other file systems (e.g.
EROFS_FS_ZIP), and discovered the issue doesn't happen there, which
sparked my investigation.  So I settled on the direct dependency,
because it keeps all compression-related logic together.

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
