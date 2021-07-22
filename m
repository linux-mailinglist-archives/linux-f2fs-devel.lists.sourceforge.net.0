Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AC33D1C93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 06:00:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6PsM-0001J4-10; Thu, 22 Jul 2021 03:59:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m6PsL-0001Iy-7Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wlgo+HDD4XVGLL4+0YFLCCYhPxqOV8dpTaeF7KubZV8=; b=gF4lAX80hAiYm/1HuSjEE1IFiD
 Mv4h/4YdjecIIJ/8/SG8mNa+pdRt4nliUtfmS8x88Qi32h1DieOdy3IpIBwYMrGwCTqEjD3fWjXw2
 B1VjOsZVdBnPLkkFxw0B3rfSyOlEsDujGC2/zzD4QikrttFAvO/kXcBd2VJBsTms1864=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wlgo+HDD4XVGLL4+0YFLCCYhPxqOV8dpTaeF7KubZV8=; b=mhqziOGbvRQpiWX0mQ30BsBL3I
 qWWeApwQ8o2vjdcGrFm/VY4MMYLu3EdmxP+S8NHK+Ltun0vNc7kt+iVYfWIxPHLladEl4NCO6Ui41
 TK/R5NHCBOeO5SxQd/8Ayfbb2daC2vJF7CaEqx6vHECp7UDdhDDcUrX/ylDauml8K1eA=;
Received: from mail-lf1-f53.google.com ([209.85.167.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6Ps9-0005LC-Qw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 03:59:57 +0000
Received: by mail-lf1-f53.google.com with SMTP id m16so6379821lfg.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Jul 2021 20:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wlgo+HDD4XVGLL4+0YFLCCYhPxqOV8dpTaeF7KubZV8=;
 b=JQ/huajMzCvVKfzB6aXogb7L836C3TbNsinJ3VRro9HWNGJASIrofApytSysWx4L99
 SN/GyG1XubEsMr0nMeDuu5DDdYmp88OHzfyCvx0gJx3GTlNqBZLKp3E63TK9hkX29xId
 ZXCj6I2h60ZWd4i/7Cy4wIoYBZDUWCA1jqe32KiLFIRFL8hpkHW3k+Q2icTUSuzmuh8G
 24irTrEULS/CB+qFB5HJaBGHDP0TaISr7GRev9KR5LwZ4ZrgB2/9gu57Hoq2aSgKtqFP
 NlGa/7TjcyUpdzWubtvAzQeobWJeePGtUSmA5OSXA8YzMzkOcEdn2xSU2NmPF8PYWNw1
 IWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wlgo+HDD4XVGLL4+0YFLCCYhPxqOV8dpTaeF7KubZV8=;
 b=ZLHcHgizJiN758EqJoCGBEYN5SE5sHxO+Vu18L4rp8qViKalEOjafQbmJmiEQ6PzxH
 uHHVwttBB/ydhHTk5sQqB696DL5vgtdW0wUAq959MZyLUIcUbHmCj5uapggZqGERv+E4
 kt3D//+f7BXolg3qK4AVR66+OwEzgn/V040dbxR+Cop7BT0gqzNMVOS3+wQKmPGuLOU6
 utvfM5KvYmnYNSQSuc3j2KsRrgROhRjxC2YZA84L+Ts6UD26t+gIBzPWPsqdF34l/4Iy
 NCgt65WkBONOJ0ZAPo9puczlavAgG6I6VPR0W/CbwjdissgIzZntmWPFxMctqLzJhQfE
 1O/g==
X-Gm-Message-State: AOAM531638OpAhz7qLyii+audpyOqJgYzuaOAxSxTUjZrly7sBMVJTSi
 L/jOfklgXfNiOnG7M+YN9yhx1vwrGuCC0yRP7N4=
X-Google-Smtp-Source: ABdhPJzwt1i4+o2Og+EX183RIj/YK2dms/vY1DosY/yvxfL/bZmEjt4dhaQvoUjKjaWSgGXYwUkpPS1OBZvGCD6M81A=
X-Received: by 2002:a19:7512:: with SMTP id y18mr28071154lfe.533.1626926379270; 
 Wed, 21 Jul 2021 20:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210721072048.3035928-1-daeho43@gmail.com>
 <YPiTLwB3d8BWSKje@gmail.com>
 <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
 <YPi4rRg2ZPFBWaTZ@sol.localdomain>
 <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
 <YPjGsSEdsoSsCJlB@sol.localdomain>
 <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
 <YPjQQTjJ6rO2sx/o@sol.localdomain>
In-Reply-To: <YPjQQTjJ6rO2sx/o@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 21 Jul 2021 20:59:28 -0700
Message-ID: <CACOAw_w_5YD3GZGrrdMK_hK6KWbyQOfEMo-JwT2CgWLHAMCBrg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6Ps9-0005LC-Qw
Subject: Re: [f2fs-dev] [PATCH] f2fs: change fiemap way in printing
 compression chunk
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 21, 2021 at 6:56 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jul 21, 2021 at 06:40:00PM -0700, Daeho Jeong wrote:
> > On Wed, Jul 21, 2021 at 6:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Wed, Jul 21, 2021 at 06:04:22PM -0700, Daeho Jeong wrote:
> > > > >
> > > > > How f2fs stores the mapping information doesn't matter.  That's an
> > > > > implementation detail that shouldn't be exposed to userspace.  The only thing
> > > > > that should be exposed is the actual mapping, and for that it seems natural to
> > > > > report the physical blocks first.
> > > > >
> > > > > There is no perfect solution for how to handle the remaining logical blocks,
> > > > > given that the fiemap API was not designed for compressed files, but I think we
> > > > > should just go with extending the length of the last compressed extent in the
> > > > > cluster to cover the remaining logical blocks, i.e.:
> > > > >
> > > > >   [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > > >
> > > > > That's what btrfs does on compressed files.
> > > > >
> > > > > - Eric
> > > >
> > > > I also agree that that's an implementation detail that shouldn't be
> > > > exposed to userspace.
> > > >
> > > > I want to make it more clear for better appearance.
> > > >
> > > > Do you think we have to remove "unwritten" information below? I also
> > > > think it might be unnecessary information for the user.
> > > > [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > > (unwritten?)
> > >
> > > FIEMAP_EXTENT_UNWRITTEN already has a specific meaning; see
> > > Documentation/filesystems/fiemap.rst.  It means that the data is all zeroes, and
> > > the disk space is preallocated but the data hasn't been written to disk yet.
> > >
> > > In this case, the data is *not* necessarily all zeroes.  So I think
> > > FIEMAP_EXTENT_UNWRITTEN shouldn't be used here.
> > >
> > > > Do you want f2fs to print out the info on a cluster basis, even when
> > > > the user asks for one block information?
> > > > Like
> > > > If the user asks for the info of [8..15], f2fs will return the info of [0..31]?
> > >
> > > Yes, since that's how FS_IOC_FIEMAP is supposed to work; see
> > > Documentation/filesystems/fiemap.rst:
> > >
> > >         All offsets and lengths are in bytes and mirror those on disk.  It is
> > >         valid for an extents logical offset to start before the request or its
> > >         logical length to extend past the request.
> > >
> > > (That being said, the f2fs compression+encryption tests I've written don't
> > > exercise this case; they only map the whole file at once.)
> > >
> > > - Eric
> >
> > My last question is.
> > How about a discontinuous cluster like [0..31] maps to discontinuous
> > three blocks like physical address 0x4, 0x14 and 0x24.
> > I think we have to return three extents for the one logical region
> > like the below. What do you think?
> > [0..31] -> 0x4 (merged, encoded)
> > [0..31] -> 0x14 (merged, encoded)
> > [0..31] -> 0x24 (merged, encoded, last_extent)
>
> No, please don't do that.  struct fiemap_extent only has a single length field,
> not separate lengths for fe_logical and fe_physical, so with your proposal there
> would be no way to know how many physical blocks to take from each extent.  It
> would be reporting the same part of the file in contradictory ways.
>
> Like I suggested originally, I think this case should be reported like:
>
>        fe_logical=0    fe_physical=16384  length=4096
>        fe_logical=4096 fe_physical=81920  length=4096
>        fe_logical=8192 fe_physical=147456 length=8192
>
> It's not perfect, but I think it's the least bad option, for the reasons I've
> explained previously...
>
> - Eric

Ok, I got your point. Let me try it again.

Thank you,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
