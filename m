Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A14EE4F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 20:02:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heNrZ-0007pc-Mn; Fri, 21 Jun 2019 18:02:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heNrY-0007pU-3B
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 18:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KrN/4zvbMDNzNKRbUOzOL3VD5uHXWiiSKaTL/UiG/NY=; b=WZD5IdPSFKS9O4raLU/SNxrln3
 4Hj0PyiECjQ9ZeeHM6KQUK5KdICN3br6tQZT3JMnIg7pNx+1kOdk6rvhPa9mexcRopM/k/q737z76
 rPAnAsgTltgV0Rl58HFi2PszdGzIo4V60bzgtgfm16HyzifskJUYvbg7uAMpg4BteiD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KrN/4zvbMDNzNKRbUOzOL3VD5uHXWiiSKaTL/UiG/NY=; b=FG48j9ne18vrMwRnGfIGxY2tv2
 G8sFIS0a+MxE9826Ah0Sp2VWCnQ6tqxYilLM4yxYUnUxzwEwSxKs0nl39Iv/boM05a2+p0bJO9t4G
 FVwap9gjQFiFRz++7oqiBf/8HClxQPg9KsYBxg64U1NZXKk2XAt5PIAR4SCwsafNnoOI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heNrY-0081NH-F7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 18:02:13 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1BA22070B;
 Fri, 21 Jun 2019 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561140126;
 bh=g79cNV6mf95ZmNPYnM1FB01DX5LPgZqiGUD7akF6G6E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ox4m1w+PS7vUV8r9TxOITAt1Szi7NPEgyksJHkf2lyp999RYb4j+gqL+htr6gvvTW
 QazJsF8LbXmELHinQXJOlt0BjQSv+FOidYA2eimQ2cMJWFn7R/Qa6tTaSNx+f4o0tA
 wDn4Za7mziYVpYox27i7qI7VGqf3WHjWxwylpif8=
Date: Fri, 21 Jun 2019 11:02:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20190621180206.GD79502@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620143800.20640-1-geert@linux-m68k.org>
 <dd980fec-d507-6969-cd86-971bafb401c2@huawei.com>
 <CAMuHMdUHi3z5xmLyut2XqOPf9XFMF3AJiTnkwOAL-GQ6Ck_1ow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHi3z5xmLyut2XqOPf9XFMF3AJiTnkwOAL-GQ6Ck_1ow@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1heNrY-0081NH-F7
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: Use div_u64*() for 64-bit
 divisions
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
 Qiuyang Sun <sunqiuyang@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/21, Geert Uytterhoeven wrote:
> Hi Chao,
> 
> On Fri, Jun 21, 2019 at 11:54 AM Chao Yu <yuchao0@huawei.com> wrote:
> > Since the original patch hasn't been merged to upstream, I think we can merge
> > this into original patch, how do you think?
> 
> Thanks, that's fine for me.

Merged the fix.
Thank you so much.

> 
> > On 2019/6/20 22:38, Geert Uytterhoeven wrote:
> > > On 32-bit (e.g. m68k):
> > >
> > >     fs/f2fs/gc.o: In function `f2fs_resize_fs':
> > >     gc.c:(.text+0x3056): undefined reference to `__umoddi3'
> > >     gc.c:(.text+0x30c4): undefined reference to `__udivdi3'
> > >
> > > Fix this by using div_u64_rem() and div_u64() for 64-by-32 modulo resp.
> > > division operations.
> > >
> > > Reported-by: noreply@ellerman.id.au
> > > Fixes: d2ae7494d043bfaf ("f2fs: ioctl for removing a range from F2FS")
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > This assumes BLKS_PER_SEC(sbi) is 32-bit.
> > >
> > >     #define BLKS_PER_SEC(sbi)                                       \
> > >           ((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
> > >
> > > Notes:
> > >   1. f2fs_sb_info.segs_per_sec and f2fs_sb_info.blocks_per_seg are both
> > >      unsigned int,
> > >   2. The multiplication is done in 32-bit arithmetic, hence the result
> > >      is of type unsigned int.
> > >   3. Is it guaranteed that the result will always fit in 32-bit, or can
> > >      this overflow?
> > >   4. fs/f2fs/debug.c:update_sit_info() assigns BLKS_PER_SEC(sbi) to
> > >      unsigned long long blks_per_sec, anticipating a 64-bit value.
> > > ---
> > >  fs/f2fs/gc.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > > index 5b1076505ade9f84..c65f87f11de029f4 100644
> > > --- a/fs/f2fs/gc.c
> > > +++ b/fs/f2fs/gc.c
> > > @@ -1438,13 +1438,15 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> > >       unsigned int secs;
> > >       int gc_mode, gc_type;
> > >       int err = 0;
> > > +     __u32 rem;
> > >
> > >       old_block_count = le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count);
> > >       if (block_count > old_block_count)
> > >               return -EINVAL;
> > >
> > >       /* new fs size should align to section size */
> > > -     if (block_count % BLKS_PER_SEC(sbi))
> > > +     div_u64_rem(block_count, BLKS_PER_SEC(sbi), &rem);
> > > +     if (rem)
> > >               return -EINVAL;
> > >
> > >       if (block_count == old_block_count)
> > > @@ -1463,7 +1465,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> > >       freeze_bdev(sbi->sb->s_bdev);
> > >
> > >       shrunk_blocks = old_block_count - block_count;
> > > -     secs = shrunk_blocks / BLKS_PER_SEC(sbi);
> > > +     secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> > >       spin_lock(&sbi->stat_lock);
> > >       if (shrunk_blocks + valid_user_blocks(sbi) +
> > >               sbi->current_reserved_blocks + sbi->unusable_block_count +
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
