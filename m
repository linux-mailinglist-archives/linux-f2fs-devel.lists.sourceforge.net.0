Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24204ECA0B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 21:57:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQdzS-00068s-Pn; Fri, 01 Nov 2019 20:57:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1iQdzS-00068m-0G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 20:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B2Wo++qvCAWopO2MVN1SxMuOaw9O5ooxGYbXrtTGoLc=; b=Dxvs8r/Ht7csxHNiFS+QVsrU/X
 qUlWfCmt9z67404bpLAnl2dAOKI2WDVaceVmU5Q+jvLLpMvUBBqOm8KIkd5OlFNkvEp9K6LYWYPY8
 Oy10zxEybe0ua4lA3DX+2Q95ZVoK6K1idf9YeSUI7oPH8XvimbU0pAqr44wAljRb4zL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B2Wo++qvCAWopO2MVN1SxMuOaw9O5ooxGYbXrtTGoLc=; b=SZvwiXLODiQT1RUIsQpFHUQWvJ
 JfVXAXjl/NxyEjknUdPKMCIG5N1+djqjn42v5hJU1k7jfKwEaa6jY8CoWW12u9EUcvhAFIs9oQNkA
 I8QGlB6M6Py4KmVcWJNY7PTE4XwPXTwLAj0wU2xXdEwSO4lvR0dGdJdXNBUMZTuH6bak=;
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iQdzQ-00D8U6-ID
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 20:57:49 +0000
Received: by mail-oi1-f194.google.com with SMTP id r27so9294664oij.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 01 Nov 2019 13:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2Wo++qvCAWopO2MVN1SxMuOaw9O5ooxGYbXrtTGoLc=;
 b=KZhfPv4W/1/1QVZT+ysHXDCRkzpDTMdRZlF0CD/Nz+rzaC1mGZ303moBebEpBgYvLx
 ENj6NcAQv/sjCv5/pLMMzejrig4BfXbsFFhdlkM9M7hOrgiCCKm0e2JjRZXv75lo45AI
 pYbmrzSDO/4roq473IGmVPsbfN2ISRi9fnpLhXT/ng47w81H/bMtu3GFds1QgehBt6Sd
 CSfs+RChJl66qR3E5TjPFVpAEYI+uv7WPpBT7xre0DnXzL/YnzHLZutfVT1lk7jQwBfB
 xDoSJrBtH73xNdOsaRV0429kZzu1lxLTYk/P4RRU62aadNPB4PNFvtz0JIQDfJGZhIx+
 2eDQ==
X-Gm-Message-State: APjAAAWDQ4ULUem0x8yWyRpiwcK02U3F0pUPmpkhoiawGFeWTUrtgu8W
 luS1UWuuPrMdI5gqIDZyjJMvMFi919bbrdTvtbM=
X-Google-Smtp-Source: APXvYqyMPGVgSghm8B6Z8BliWMbf63SJMtQqkLmxrpCWnOLjhSTH18y22Nnv6Mk4zTGM1EgQgPb5eF27WcBVRETo4XE=
X-Received: by 2002:a05:6808:60a:: with SMTP id
 y10mr3730740oih.102.1572641862721; 
 Fri, 01 Nov 2019 13:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191031010736.113783-1-Valdis.Kletnieks@vt.edu>
In-Reply-To: <20191031010736.113783-1-Valdis.Kletnieks@vt.edu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Nov 2019 21:57:31 +0100
Message-ID: <CAMuHMdXzyVBa4TZEc5eRaBzu50thgJ2TrHJLZqwhbQ=JASgWOA@mail.gmail.com>
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.194 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
X-Headers-End: 1iQdzQ-00D8U6-ID
Subject: Re: [f2fs-dev] [RFC] errno.h: Provide EFSCORRUPTED for everybody
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Gao Xiang <xiang@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-erofs@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Valdis,

On Thu, Oct 31, 2019 at 2:11 AM Valdis Kletnieks
<valdis.kletnieks@vt.edu> wrote:
> Three questions: (a) ACK/NAK on this patch, (b) should it be all in one
> patch, or one to add to errno.h and 6 patches for 6 filesystems?), and
> (c) if one patch, who gets to shepherd it through?
>
> There's currently 6 filesystems that have the same #define. Move it
> into errno.h so it's defined in just one place.
>
> Signed-off-by: Valdis Kletnieks <Valdis.Kletnieks@vt.edu>

Thanks for your patch!

> --- a/include/uapi/asm-generic/errno.h
> +++ b/include/uapi/asm-generic/errno.h
> @@ -98,6 +98,7 @@
>  #define        EINPROGRESS     115     /* Operation now in progress */
>  #define        ESTALE          116     /* Stale file handle */
>  #define        EUCLEAN         117     /* Structure needs cleaning */
> +#define        EFSCORRUPTED    EUCLEAN

I have two questions:
a) Why not use EUCLEAN everywhere instead?
    Having two different names for the same errno complicates grepping.
b) Perhaps both errors should use different values? Do they have the
   same semantics? I'm not a fs developer, so this is a bit fuzzy to me.
   According to Documentation/, one seems to originate in mtd, the
   other in xfs.

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
