Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D498132652F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 17:03:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFfaF-0005Bd-MO; Fri, 26 Feb 2021 16:03:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <masahiroy@kernel.org>) id 1lFfaE-0005BQ-BH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 16:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8j0Ze921wbGXQAuaG7gMVtTKBTCVeH8BFJy61xBEP9Y=; b=j/4j07cPlO3jQkD8DQSjELfpPd
 QI+/NgGy4nUCbuXWrujBzHqdqJFomsssMdJ0yzlKrV+BIdSiZ4wS61DXf8YPtV9IzwgjBtwBW3Bmi
 tRjevSV4fANMdGwE3BPz0hYlUIbY0PzGKvOHDBclAXR5zWHCcpZb2Liy9l5vfA/2CE4Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8j0Ze921wbGXQAuaG7gMVtTKBTCVeH8BFJy61xBEP9Y=; b=b1HZRtGXYZHA5G/CBEirJW8flM
 8uF2l83rpKX9bpd9vBEIoLypPVmDHb6trY7Wfgt67hiI6rMYvk0nCKxupIVE9/yUTXwYTHztb719E
 DEWbwIx8PfYB4evp3Hz6FkJlJMDErs5lE4G4Cbiqm+doH+K22OcFAeTI8Px+9cF94WR8=;
Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lFfa4-006Sv4-7n
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 16:03:14 +0000
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 11QG2sgq023709
 for <linux-f2fs-devel@lists.sourceforge.net>; Sat, 27 Feb 2021 01:02:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11QG2sgq023709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1614355374;
 bh=8j0Ze921wbGXQAuaG7gMVtTKBTCVeH8BFJy61xBEP9Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=yC7QfbdJL4RvCbfcH6x2bmrqvKBX9nG/yZqDg1GBr44c+iirLCaWFc/Ouahmk/j1x
 sFYvJXxo0vEqY0orXcjJ5WQbBkw4GYHqvr/OPYaJXcpUpTxK8kO4yohovzvK8NIKGS
 mgjtDZbrPK+6H3tc30WtW6EQC8GpozqCLM/cNTNjzdtA8fY/Pm9ZK1IQuTtbmDaLc+
 g69nYP4XQ5wyjJlA9X+H27upRIjg63pAHgRxdx+mfY6UubYebM3hUMrCfs2jFZ5Dob
 9I6tbFlJROm4ozvfKVKttsoy8q13u80iUYRiIiWpfqdCVhA7rK5vWiQOKmxo3pe6Vp
 Fo7EGnM22yOBg==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id 201so6541240pfw.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Feb 2021 08:02:54 -0800 (PST)
X-Gm-Message-State: AOAM532tHT1YkCY4Z1Fzie6TsD3iQ7qQdLtIwMJO0gWZgCGIG49lCBnc
 gBZkywHu/fPAaMGlDkvhZRMOTIA5Eri5qjM5IYs=
X-Google-Smtp-Source: ABdhPJzagjyLLC9CISdik0AnO1ynuPjXffY/Np8yFsTj0zTkuff9TXl1Xy8eVL5XmDvuPnwjrACT4EqJYQvX6yNg07E=
X-Received: by 2002:a63:dd49:: with SMTP id g9mr3546859pgj.175.1614355373895; 
 Fri, 26 Feb 2021 08:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20210226155142.2909545-1-geert@linux-m68k.org>
In-Reply-To: <20210226155142.2909545-1-geert@linux-m68k.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 27 Feb 2021 01:02:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQnk2=4e_A0qd5Ke43DCMbpLRv45ydu81CGxr=JGc7s+g@mail.gmail.com>
Message-ID: <CAK7LNAQnk2=4e_A0qd5Ke43DCMbpLRv45ydu81CGxr=JGc7s+g@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [210.131.2.83 listed in list.dnswl.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFfa4-006Sv4-7n
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: Allow modular
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

On Sat, Feb 27, 2021 at 12:51 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
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
> As modular dependency propagation through intermediate symbols is
> obscure, fix this in a robust way by moving the selection of tristate
> (de)compression algorithms from the boolean compression options to the
> tristate main F2FS_FS option.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



> ---
> v3:
>   - Drop redundant selects (F2FS_FS_LZORLE depends on F2FS_FS_LZO),
>
> v2:
>   - Move the selects to F2FS_FS instead of adding direct dependencies
>     on F2FS_FS.
> ---
>  fs/f2fs/Kconfig | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 62e638a49bbf089a..7669de7b49cea189 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -7,6 +7,13 @@ config F2FS_FS
>         select CRYPTO_CRC32
>         select F2FS_FS_XATTR if FS_ENCRYPTION
>         select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
> +       select LZ4_COMPRESS if F2FS_FS_LZ4
> +       select LZ4_DECOMPRESS if F2FS_FS_LZ4
> +       select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
> +       select LZO_COMPRESS if F2FS_FS_LZO
> +       select LZO_DECOMPRESS if F2FS_FS_LZO
> +       select ZSTD_COMPRESS if F2FS_FS_ZSTD
> +       select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>         help
>           F2FS is based on Log-structured File System (LFS), which supports
>           versatile "flash-friendly" features. The design has been focused on
> @@ -94,8 +101,6 @@ config F2FS_FS_COMPRESSION
>  config F2FS_FS_LZO
>         bool "LZO compression support"
>         depends on F2FS_FS_COMPRESSION
> -       select LZO_COMPRESS
> -       select LZO_DECOMPRESS
>         default y
>         help
>           Support LZO compress algorithm, if unsure, say Y.
> @@ -103,8 +108,6 @@ config F2FS_FS_LZO
>  config F2FS_FS_LZ4
>         bool "LZ4 compression support"
>         depends on F2FS_FS_COMPRESSION
> -       select LZ4_COMPRESS
> -       select LZ4_DECOMPRESS
>         default y
>         help
>           Support LZ4 compress algorithm, if unsure, say Y.
> @@ -113,7 +116,6 @@ config F2FS_FS_LZ4HC
>         bool "LZ4HC compression support"
>         depends on F2FS_FS_COMPRESSION
>         depends on F2FS_FS_LZ4
> -       select LZ4HC_COMPRESS
>         default y
>         help
>           Support LZ4HC compress algorithm, LZ4HC has compatible on-disk
> @@ -122,8 +124,6 @@ config F2FS_FS_LZ4HC
>  config F2FS_FS_ZSTD
>         bool "ZSTD compression support"
>         depends on F2FS_FS_COMPRESSION
> -       select ZSTD_COMPRESS
> -       select ZSTD_DECOMPRESS
>         default y
>         help
>           Support ZSTD compress algorithm, if unsure, say Y.
> @@ -132,8 +132,6 @@ config F2FS_FS_LZORLE
>         bool "LZO-RLE compression support"
>         depends on F2FS_FS_COMPRESSION
>         depends on F2FS_FS_LZO
> -       select LZO_COMPRESS
> -       select LZO_DECOMPRESS
>         default y
>         help
>           Support LZO-RLE compress algorithm, if unsure, say Y.
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
