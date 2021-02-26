Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE393261D2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 12:15:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFb5I-0006yF-V6; Fri, 26 Feb 2021 11:15:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <masahiroy@kernel.org>) id 1lFb5H-0006y8-JN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 11:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFT/oqy9Tdm+9fNoO5+/eHYDaXl4/fLpccymluZSbRk=; b=f1j0t2zqL7o2lywQS+1+WBkVPD
 G7H/QsK1iiBUl2MdvTPfosPB3qU0b/sst+Nwmc9BOusI6NH6ZCP2OYFWWkfS3x8mgL2wma0V/bjRr
 jM1Khm5Cc2oBPLId616j0x8hT5ciUDG6grR/R5iW1sYIzzKwlHEE4yrFwztY2JxI37ec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FFT/oqy9Tdm+9fNoO5+/eHYDaXl4/fLpccymluZSbRk=; b=gxVmPKAQnHDD9j+Lw0cI23liZd
 1KsHFzeEIYoNO6cwFzk25ooub9V40vtAZN6/G97DCRuDzROnHKJBE4x4DTm9NfS9WmOcAVIKRVkWo
 yD601w6+Rp20Eloq+2HuI8/zE8OCfCmLQ7AQdYFZIjyJYCH8TJhf5SJptfOnQ46oI/vk=;
Received: from condef-02.nifty.com ([202.248.20.67])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lFb58-0001FD-VY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 11:14:58 +0000
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-02.nifty.com
 with ESMTP id 11QBA1Dh023706
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 26 Feb 2021 20:10:01 +0900
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 11QB9oQ1020306
 for <linux-f2fs-devel@lists.sourceforge.net>; Fri, 26 Feb 2021 20:09:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11QB9oQ1020306
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1614337791;
 bh=FFT/oqy9Tdm+9fNoO5+/eHYDaXl4/fLpccymluZSbRk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ng2m7mwPpY8FHosFpIjQRL23HwJSs/HPaZn+PfJCJCPFA9TBGv0BUBVq0SYa/uRGO
 PYCM2buRGmWeHmYeKTA7PKdTw2OdwMkTyERzP1LZhTLqbID0NUDJUPj8+XKI9Px/VS
 I4F6hS6Fe8W2Glw6nAtfYG5LAErnIwOfZlCpunX7i7sXDghZvfnA49SAbgPxGwb4O1
 L3/hzRmjUQu1rKGWOcDkUafJJor1XW6IiPgLkL6o9lN6QfihGgwvmUuEHhHRtqfflj
 gr6dgnEQML2r3efkAdt1Tkv51bqOYUJZIGl/dutxoV8PGhHZEx0DaUmyddxayH712U
 kp/RjpWkPf5zg==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id a4so5988087pgc.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Feb 2021 03:09:50 -0800 (PST)
X-Gm-Message-State: AOAM531KTxLEzW3mB3qqg4CU85NsamezB3P0o6PHmwsvcLiTN0cTB8I3
 Kouqh3B8ucWtMMfENc/GG7/1sD0yLkdiwM3FDdU=
X-Google-Smtp-Source: ABdhPJzp2injQKm4gFYlgJXgvIF1/jHRI4vas5sveZg40W3AXUlCM0Pk/VO4QocCGoho8eCkS8NvSM76sVnXor/tDIQ=
X-Received: by 2002:a62:1412:0:b029:1ec:bc11:31fd with SMTP id
 18-20020a6214120000b02901ecbc1131fdmr2623654pfu.76.1614337790138; Fri, 26 Feb
 2021 03:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20210226100640.2827925-1-geert@linux-m68k.org>
In-Reply-To: <20210226100640.2827925-1-geert@linux-m68k.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 26 Feb 2021 20:09:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARG+AU2ZBFEo8+tqEGSuS2_yv2QpSc3kVDKtrAw6PRTpA@mail.gmail.com>
Message-ID: <CAK7LNARG+AU2ZBFEo8+tqEGSuS2_yv2QpSc3kVDKtrAw6PRTpA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.248.20.67 listed in list.dnswl.org]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lFb58-0001FD-VY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: Allow modular
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 26, 2021 at 7:10 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
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
> ---
> v2:
>   - Move the selects to F2FS_FS instead of adding direct dependencies
>     on F2FS_FS.
> ---
>  fs/f2fs/Kconfig | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 62e638a49bbf089a..cca79029a577151c 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -7,6 +7,15 @@ config F2FS_FS
>         select CRYPTO_CRC32
>         select F2FS_FS_XATTR if FS_ENCRYPTION
>         select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
> +       select LZ4_COMPRESS if F2FS_FS_LZ4
> +       select LZ4_DECOMPRESS if F2FS_FS_LZ4
> +       select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
> +       select LZO_COMPRESS if F2FS_FS_LZO
> +       select LZO_COMPRESS if F2FS_FS_LZORLE

This line is redundant because
F2FS_FS_LZORLE depends on F2FS_FS_LZO.


> +       select LZO_DECOMPRESS if F2FS_FS_LZO
> +       select LZO_DECOMPRESS if F2FS_FS_LZORLE

Ditto.


> +       select ZSTD_COMPRESS if F2FS_FS_ZSTD
> +       select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>         help
>           F2FS is based on Log-structured File System (LFS), which supports
>           versatile "flash-friendly" features. The design has been focused on


-- 
Best Regards
Masahiro Yamada


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
