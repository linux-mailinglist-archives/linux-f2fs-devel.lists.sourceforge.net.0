Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D34125EB9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Dec 2019 11:18:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihst3-00063U-T0; Thu, 19 Dec 2019 10:18:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1ihst2-00063N-Lf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 10:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gBfpTXVpKERfPCUf14OHD25gfpTFwcw7s5JiNlGDUoM=; b=ju0EQN+NQsY24e30L1k4a42sSN
 RnD3NmKEmsM0OGsRfLzV6eGvqhnAenO9fnsQjGC7VqrsYpMyPEe0oP+rNP8lMEEcc+YnpWgEcMtWf
 1Nht87vYC0taufyLSio/NzghccdajebhnWctyA7fVuZCB4KmyLm2ae5TBSl8soRVsDJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gBfpTXVpKERfPCUf14OHD25gfpTFwcw7s5JiNlGDUoM=; b=agNmHwngPnmnRh1WP8nZnu+cNG
 1nr8CRApKww/J0FRhCJW3B7fBuYDcBGG6D2mjiS4c7ALe/BV/tRj9Q+VHlG5PcDyPhSEXogNJBsGL
 ETVvPpxlpm8xdF2olijlniCzIhPpfKsj7CB6k6tdGw59z5B+ihEgIaHTuEAaqZ8p6Svo=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ihst1-006xh1-2X
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Dec 2019 10:18:28 +0000
Received: by mail-oi1-f194.google.com with SMTP id c77so1990986oib.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Dec 2019 02:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gBfpTXVpKERfPCUf14OHD25gfpTFwcw7s5JiNlGDUoM=;
 b=mFHOhrEa2eI/owK+f8cKdJtDXW/d/g7mFKTOAqs5zQcdESx4pu8wUrLCBHGyx1jzcr
 AOw8vSZwR3eU15WE2e9ZZbJY44xyv+XkLhDotJ4XI3+c1NuXSdkfnfwZYPRKTA92CJjR
 F2nX0M0ZmKdpQooP5hLzoi7MAx/xmJXoMdPHAIEKmAUca8bT5/ETe50oHP3PzN0dTnc4
 Y4DYuRLUQ7glULKUuK3xfSutrXWDyD9TLtdOhNP9CJV8877VGXyOuctsCcejNpvwbrMl
 QfxCJ9t04M+AtXhyudTzQo9YEYiZwn/zMyAVGEWlsKFW4VsT38nTl1s+wgvtVkdFvfBn
 2hew==
X-Gm-Message-State: APjAAAXtzfL8h+Lva6wBoXnEsw2flsE6fr6Wwg/3G+lsv9FtHjuc00hA
 ezHRive+Tq+lOzE5yZu+kgorbqZHdlKORzz566g=
X-Google-Smtp-Source: APXvYqxKyRNwS6QLwpbYAjN8wwj1dZAiLECzHCQK8knRk73UYUPRCuTuK604XVYYJwKviWnSLi3BYVdg9nHjYIsqjaM=
X-Received: by 2002:a05:6808:8ec:: with SMTP id
 d12mr1714729oic.131.1576750701225; 
 Thu, 19 Dec 2019 02:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20191216062806.112361-1-yuchao0@huawei.com>
In-Reply-To: <20191216062806.112361-1-yuchao0@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Dec 2019 11:18:09 +0100
Message-ID: <CAMuHMdWnOCOqNCNnrsdNw4q3vG-Htm3bPBngqFJ8Frk8m13ytQ@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihst1-006xh1-2X
Subject: Re: [f2fs-dev] [RFC PATCH v5] f2fs: support data compression
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
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On Mon, Dec 16, 2019 at 7:29 AM Chao Yu <yuchao0@huawei.com> wrote:
> This patch tries to support compression in f2fs.

> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -92,3 +92,26 @@ config F2FS_FAULT_INJECTION
>           Test F2FS to inject faults such as ENOMEM, ENOSPC, and so on.
>
>           If unsure, say N.
> +
> +config F2FS_FS_COMPRESSION
> +       bool "F2FS compression feature"
> +       depends on F2FS_FS
> +       help
> +         Enable filesystem-level compression on f2fs regular files,
> +         multiple back-end compression algorithms are supported.
> +
> +config F2FS_FS_LZO
> +       bool "LZO compression support" if F2FS_FS_COMPRESSION

This should depend on F2FS_FS_COMPRESSION, instead of just hiding
the question, to avoid the option always being enabled when
F2FS_FS_COMPRESSION is not set:

        bool "LZO compression support"
        depends on F2FS_FS_COMPRESSION

> +       select LZO_COMPRESS
> +       select LZO_DECOMPRESS
> +       default y
> +       help
> +         Support LZO compress algorithm, if unsure, say Y.
> +
> +config F2FS_FS_LZ4
> +       bool "LZ4 compression support" if F2FS_FS_COMPRESSION

Likewise.

> +       select LZ4_COMPRESS
> +       select LZ4_DECOMPRESS
> +       default y
> +       help
> +         Support LZ4 compress algorithm, if unsure, say Y.

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
