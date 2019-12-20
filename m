Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8027F1283DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Dec 2019 22:27:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iiPnZ-0007nx-Gr; Fri, 20 Dec 2019 21:27:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iiPnY-0007nh-KK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 21:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mSlQpjOpp1k0pL8XUloQQ9l41kEOOcPuuaJ6qBTNo7A=; b=SSW8PwMmM0RFq+qODeddMyvTVH
 a0oZ2VmgBWQbARpd9GVhPFmiixioNOjoYjqddaXstaYNUuKM0mLHIq/stwRDenefU/1Mrq3kg+NS6
 6jmWi5ttkWIIOvLFpcBF8vnrKBNW6MOIYbIURRLFFM51W4RMBEXiPqGGdTja6gJUoD0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mSlQpjOpp1k0pL8XUloQQ9l41kEOOcPuuaJ6qBTNo7A=; b=B664uM8yBANu/E5UIERnv3ETLg
 /6gv8Ri39ghlApsnEYVE/LiLVCII+85i4bIVh8rD4tHTGxGu9+03CeL26XYY1Wsmcj+JwaXdAc3iK
 yKCc81ii7Wc3WV8CvSktTvS3cZM8MAoPiWT0vj7EbbYCd6qHXL+plyugKo6p+19B9pOQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iiPnU-009Bb1-Uo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Dec 2019 21:27:00 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82FDE206DA;
 Fri, 20 Dec 2019 21:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576877206;
 bh=GB0uH5v3CIKNR642grWZ0+CyMiDRyZ1gPbwQP4C+Aw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mnD/cqIsY2DEGGEQjd5GSK4d6ltKJg8qF/7HVUf0RdCncfWQz6dCALsQSlUt4WWO5
 GQjczmmQeTpmisqGhWEcfBC3ePvP11TPVHCEOxmgXyYC8Kd+cni1wpwfewiyQapBan
 bbci6tmLpqU1uq5xNWdo1u7EofBgHvoVgC/xCiTQ=
Date: Fri, 20 Dec 2019 13:26:45 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20191220212645.GA14042@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191216062806.112361-1-yuchao0@huawei.com>
 <CAMuHMdUDURUQJjJU+2QQgY1hXN8ndJ6dwc-PF1CWc-HAio0sKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUDURUQJjJU+2QQgY1hXN8ndJ6dwc-PF1CWc-HAio0sKA@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iiPnU-009Bb1-Uo
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
Cc: Linux-Next <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/19, Geert Uytterhoeven wrote:
> Hi,
> 
> On Mon, Dec 16, 2019 at 7:29 AM Chao Yu <yuchao0@huawei.com> wrote:
> >
> > This patch tries to support compression in f2fs.
> 
> 
> 
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> 
> > @@ -667,6 +719,24 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> >         return err;
> >  }
> >
> > +int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
> > +{
> > +       u64 free_from = from;
> > +
> > +       /*
> > +        * for compressed file, only support cluster size
> > +        * aligned truncation.
> > +        */
> > +       if (f2fs_compressed_file(inode)) {
> > +               size_t cluster_size = PAGE_SIZE <<
> > +                                       F2FS_I(inode)->i_log_cluster_size;
> > +
> > +               free_from = roundup(from, cluster_size);
> 
> This is a 64-by-32 or 64-by-64 division, causing a link failure on
> 32-bit platforms:
> 
>     fs/f2fs/file.o: In function `f2fs_truncate_blocks':
>     file.c:(.text+0x1db4): undefined reference to `__udivdi3'
> 
> Please use DIV_ROUND_UP_ULL() instead.

Thanks, I applied it in:
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev

> 
> Reported-by: <noreply@ellerman.id.au>
> 
> > +       }
> > +
> > +       return do_truncate_blocks(inode, free_from, lock);
> > +}
> 
> 
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
