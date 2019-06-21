Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B004A4E52D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 11:56:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heGHG-00082j-Qa; Fri, 21 Jun 2019 09:56:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1heGHE-000828-LF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 09:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zoSCQQgDyqdNTKrY/BA7yRe6rgMh4ABI0Zse4HOFW8I=; b=jaN8paFP3OI0qMbX4idvDtICHc
 zVKJvLTsO7AtsCkZv7Twst6cCPHk4sgO1BUWZrw0hQKD+mzd2xG0G8+U9NbsrvlcOlj7PMUPpkqqM
 qICITG7RfCQCTeAgRGqLEUUmuC3r+jbgyWSmvcarBg35stcn8zkR/7WojGVs+wblh0ic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zoSCQQgDyqdNTKrY/BA7yRe6rgMh4ABI0Zse4HOFW8I=; b=ADZYRPx0eLLD30TXhc+D7d3MCT
 rs598jVneTUfWaAvkKFQXsCwuEyaUuzZwxzrViB+BGURAV6f/96zqCFnX34nG1fNasYNrbpLjlxsU
 F90T/H9skZTPT7HNF5XQe7xibj3jw1L7w++6hafj1V63KEdWO0DmmNzL9GeKpeBWENEY=;
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1heGHG-002hcl-0d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 09:56:16 +0000
Received: by mail-qt1-f196.google.com with SMTP id a15so6273925qtn.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Jun 2019 02:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zoSCQQgDyqdNTKrY/BA7yRe6rgMh4ABI0Zse4HOFW8I=;
 b=ptvUWt2dYfnoqMV8Pj+MCWwWP5r4vKO5s+gq+2MmOZ09KDc2iLq0S1SQIOUtg2aHAV
 9kM3d1g7Gj5xl+QUwgV4SHvSlGNyaYXGG9bc+nhxjliSy/hXdJUH0yRpPerk/DeIfQlt
 z3fHiGNlDhZQOZ90JcJ7MkiiJ1a5sKfV2mJJ7GQCHLfBjwOUCVR7pWGH1UL4zoMoK8XH
 bx9FvwH/9Pw/aGBXn6444uKRS2K6HxBrf8I6j8TxMskrre9j8SlHWj0xiLT0zMXUXVkY
 +ZZqH4bNSSN9P9w+VCgIlnSAfFRGlPRjxzroI/P2fFXlkGlOuR0mgRkePv5+fb6uUCUn
 n9BA==
X-Gm-Message-State: APjAAAWqwxmURIijc4lyOfZfu8DggaTTZQqn23MYpwNCHpVwNILNijT3
 FRuZrBxawxtHfNLl/d7EHbmlIRaJ39TN6m/BiIU=
X-Google-Smtp-Source: APXvYqxw7aZjDgZ7ucZwG6IV1T0CZcfI+f0WlXd3bEKJ5eJl95/WgLNK/53xguy0PsbHRE0STqxRzd1MrkBr3wNBVjI=
X-Received: by 2002:ac8:2379:: with SMTP id b54mr56769954qtb.168.1561110967884; 
 Fri, 21 Jun 2019 02:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190620143800.20640-1-geert@linux-m68k.org>
 <dd980fec-d507-6969-cd86-971bafb401c2@huawei.com>
In-Reply-To: <dd980fec-d507-6969-cd86-971bafb401c2@huawei.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Jun 2019 11:55:56 +0200
Message-ID: <CAMuHMdUHi3z5xmLyut2XqOPf9XFMF3AJiTnkwOAL-GQ6Ck_1ow@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.196 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heGHG-002hcl-0d
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Linux-Next <linux-next@vger.kernel.org>,
 Qiuyang Sun <sunqiuyang@huawei.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Chao,

On Fri, Jun 21, 2019 at 11:54 AM Chao Yu <yuchao0@huawei.com> wrote:
> Since the original patch hasn't been merged to upstream, I think we can merge
> this into original patch, how do you think?

Thanks, that's fine for me.

> On 2019/6/20 22:38, Geert Uytterhoeven wrote:
> > On 32-bit (e.g. m68k):
> >
> >     fs/f2fs/gc.o: In function `f2fs_resize_fs':
> >     gc.c:(.text+0x3056): undefined reference to `__umoddi3'
> >     gc.c:(.text+0x30c4): undefined reference to `__udivdi3'
> >
> > Fix this by using div_u64_rem() and div_u64() for 64-by-32 modulo resp.
> > division operations.
> >
> > Reported-by: noreply@ellerman.id.au
> > Fixes: d2ae7494d043bfaf ("f2fs: ioctl for removing a range from F2FS")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > This assumes BLKS_PER_SEC(sbi) is 32-bit.
> >
> >     #define BLKS_PER_SEC(sbi)                                       \
> >           ((sbi)->segs_per_sec * (sbi)->blocks_per_seg)
> >
> > Notes:
> >   1. f2fs_sb_info.segs_per_sec and f2fs_sb_info.blocks_per_seg are both
> >      unsigned int,
> >   2. The multiplication is done in 32-bit arithmetic, hence the result
> >      is of type unsigned int.
> >   3. Is it guaranteed that the result will always fit in 32-bit, or can
> >      this overflow?
> >   4. fs/f2fs/debug.c:update_sit_info() assigns BLKS_PER_SEC(sbi) to
> >      unsigned long long blks_per_sec, anticipating a 64-bit value.
> > ---
> >  fs/f2fs/gc.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index 5b1076505ade9f84..c65f87f11de029f4 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -1438,13 +1438,15 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> >       unsigned int secs;
> >       int gc_mode, gc_type;
> >       int err = 0;
> > +     __u32 rem;
> >
> >       old_block_count = le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count);
> >       if (block_count > old_block_count)
> >               return -EINVAL;
> >
> >       /* new fs size should align to section size */
> > -     if (block_count % BLKS_PER_SEC(sbi))
> > +     div_u64_rem(block_count, BLKS_PER_SEC(sbi), &rem);
> > +     if (rem)
> >               return -EINVAL;
> >
> >       if (block_count == old_block_count)
> > @@ -1463,7 +1465,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
> >       freeze_bdev(sbi->sb->s_bdev);
> >
> >       shrunk_blocks = old_block_count - block_count;
> > -     secs = shrunk_blocks / BLKS_PER_SEC(sbi);
> > +     secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
> >       spin_lock(&sbi->stat_lock);
> >       if (shrunk_blocks + valid_user_blocks(sbi) +
> >               sbi->current_reserved_blocks + sbi->unusable_block_count +

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
