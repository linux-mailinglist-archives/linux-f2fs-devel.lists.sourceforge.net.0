Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3733732260F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Feb 2021 07:51:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lERXO-0005RV-IQ; Tue, 23 Feb 2021 06:51:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <masahiroy@kernel.org>) id 1lERXN-0005RJ-12
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Feb 2021 06:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i56WdVsWktzkTtf2ykDokTjRmIRG0eQTLJqtolZ9vCE=; b=ZFfjDdm64rudRJJ94fZdmqqhl5
 xdx6A8QcrkbsxRLnYrUbimZTw2OKpOpvlES44l3DqANgAWit9Ti5sHRlDQ6tJGrYAM62UA9aL1yvM
 zlTa5Zwf8P0jg7hhvrHD4hPvfjmKwJggZSPr+QKaOhjq6t7WE8C6zLlEP9FqCilfcm3Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i56WdVsWktzkTtf2ykDokTjRmIRG0eQTLJqtolZ9vCE=; b=N6naDdd3HaZaReIkAWLgrlYrzx
 C0coGNeRaOGeQpNkMFe+b34nXEj/EImwejEXw1nKhwp3hVogYYsC1LVNRMPVpd4FjNTL63LjsrwiE
 gLzQOnOo9ehVsap5v/4/TNKOczNOldM5CjZrMpghr3R5gQXg/6BWeAoWM1u3bb8Wde88=;
Received: from condef-06.nifty.com ([202.248.20.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lERX9-0008VZ-GY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Feb 2021 06:51:09 +0000
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-06.nifty.com
 with ESMTP id 11N6W1A8010206
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 23 Feb 2021 15:32:01 +0900
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id 11N6VW6o018149
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 23 Feb 2021 15:31:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11N6VW6o018149
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1614061893;
 bh=i56WdVsWktzkTtf2ykDokTjRmIRG0eQTLJqtolZ9vCE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bMn+O73XeUcdtVzazgQOUUnCFTGNoqzHO52G1fKU3AYcFPdoMsa+SnBAGYFJXxBuU
 joDOSwDC05qeFq+/GBvV8oHx54neFXmw7x89GndwmpSvh+RMmRFPBZ2vOGbh0W0Vqi
 9rwhsHury3Ddln67IDWvZiErLJEy4brOZNST5Jxtis00zaC2UWk4rMeJWDR15KtZFk
 +omPGxc1ph4wZu2YwYlzOwDOcvi9XoLD2fc3LEQCqu7e1U5PmLQVuh4OB4MMJJQPju
 i1x0T09RmZItk1TOq0mVFcUI8m4ZlTWU6tvAcJFmsg38HwfgjGng/e7orF7EMnToP4
 F2EcuBSr+EBLQ==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id w18so6078523plc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Feb 2021 22:31:32 -0800 (PST)
X-Gm-Message-State: AOAM533gCm3N4f4fFgSKAI3658LEQppO/wFlax90KzDDODG9C1m0xp/u
 m0sC+DXgU8NFjvxk/WHuaqercNDEeiRnztPBveE=
X-Google-Smtp-Source: ABdhPJx8LCxSkJhDZ9fEucr6DWMc5kde3IXJe9NZMo9kEKJtiYNWeidCR1G8RePwZm8NFIXjoBOzcFv1N8CRuKMGY38=
X-Received: by 2002:a17:90a:5510:: with SMTP id
 b16mr27655654pji.87.1614061891643; 
 Mon, 22 Feb 2021 22:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20210222125916.4168804-1-geert@linux-m68k.org>
In-Reply-To: <20210222125916.4168804-1-geert@linux-m68k.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 23 Feb 2021 15:30:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
Message-ID: <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.248.20.71 listed in list.dnswl.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lERX9-0008VZ-GY
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

On Mon, Feb 22, 2021 at 9:59 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> If F2FS_FS is modular, enabling the compressions options
> F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
> algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
> modular, as the former depend on an intermediate boolean
> F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.
>
> Indeed, if a boolean symbol A depends directly on a tristate symbol B
> and selects another tristate symbol C:
>
>     tristate B
>
>     tristate C
>
>     bool A
>       depends on B
>       select C
>
> and B is modular, then C will also be modular.
>
> However, if there is an intermediate boolean D in the dependency chain
> between A and B:
>
>     tristate B
>
>     tristate C
>
>     bool D
>       depends on B
>
>     bool A
>       depends on D
>       select C
>
> then the modular state won't propagate from B to C, and C will be
> builtin instead of modular.
>
> Fix this by making the various compression options depend directly on
> F2FS_FS using a big if/endif block.  Drop the now superfluous
> dependencies on F2FS_FS from individual symbols.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Perhaps the propagation logic in Kconfig should be fixed instead?
> Else people may reintroduce this issue when removing seemingly-unneeded
> dependencies.

I checked the code in menu_finalize(), and this seems to work like this.

I discussed the oddity of the select behavior before
(https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/),
but I was not confident about what the right direction was.


Anyway, the behavior is obscure from the current code.

If you want to make this more robust,
you can write as follows:

config F2FS_FS
        tristate "F2FS filesystem support"
        depends on BLOCK
        select NLS
        select CRYPTO
        select CRYPTO_CRC32
        select F2FS_FS_XATTR if FS_ENCRYPTION
        select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
        select LZO_COMPRESS if F2FS_FS_LZO
        select LZO_DECOMPRESS if F2FS_FS_LZO
        select LZ4_COMPRESS if F2FS_FS_LZ4
        select LZ4_DECOMPRESS if F2FS_FS_LZ4
        select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
        select ZSTD_COMPRESS if F2FS_FS_ZSTD
        select ZSTD_DECOMPRESS if F2FS_FS_ZSTD

The code is a bit clumsy, but it is clear
that the module (F2FS_FS) is selecting the
compress/decompress libraries.






> ---
>  fs/f2fs/Kconfig | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 62e638a49bbf089a..20a82ecb72b42f84 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -20,9 +20,10 @@ config F2FS_FS
>
>           If unsure, say N.
>
> +if F2FS_FS
> +
>  config F2FS_STAT_FS
>         bool "F2FS Status Information"
> -       depends on F2FS_FS
>         default y
>         help
>           /sys/kernel/debug/f2fs/ contains information about all the partitions
> @@ -35,7 +36,6 @@ config F2FS_STAT_FS
>
>  config F2FS_FS_XATTR
>         bool "F2FS extended attributes"
> -       depends on F2FS_FS
>         default y
>         help
>           Extended attributes are name:value pairs associated with inodes by
> @@ -70,7 +70,6 @@ config F2FS_FS_SECURITY
>
>  config F2FS_CHECK_FS
>         bool "F2FS consistency checking feature"
> -       depends on F2FS_FS
>         help
>           Enables BUG_ONs which check the filesystem consistency in runtime.
>
> @@ -78,7 +77,6 @@ config F2FS_CHECK_FS
>
>  config F2FS_FAULT_INJECTION
>         bool "F2FS fault injection facility"
> -       depends on F2FS_FS
>         help
>           Test F2FS to inject faults such as ENOMEM, ENOSPC, and so on.
>
> @@ -86,7 +84,6 @@ config F2FS_FAULT_INJECTION
>
>  config F2FS_FS_COMPRESSION
>         bool "F2FS compression feature"
> -       depends on F2FS_FS
>         help
>           Enable filesystem-level compression on f2fs regular files,
>           multiple back-end compression algorithms are supported.
> @@ -137,3 +134,5 @@ config F2FS_FS_LZORLE
>         default y
>         help
>           Support LZO-RLE compress algorithm, if unsure, say Y.
> +
> +endif
> --
> 2.25.1
>


--
Best Regards
Masahiro Yamada


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
