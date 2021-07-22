Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D737F3D2772
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 18:18:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6bOh-0006n4-Rd; Thu, 22 Jul 2021 16:18:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m6bOg-0006mr-1w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YJ+hk9xfvxLj+xaR5cBEKGLVvKZtH0YGFB7tAWKUo3s=; b=fdYDawY3zQNIxEkJ+DV2bYSmh/
 dXiIvMhajWwNqP9mDGqPywzkKgsuO2zRs7idrtbr8x5BOMYjT/5C1dqUttBZLjzkLhqdLQirtkMll
 26XSQNrTuwCGUJ6SFJCPhVatOXIZCD1xyhWP/CrUV2bOjcjzqOktGpCH2laQy3Isnz1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YJ+hk9xfvxLj+xaR5cBEKGLVvKZtH0YGFB7tAWKUo3s=; b=Wyv0W1YAirLSk/5ilFKTjusH49
 1G8OhXIsIHCEx7W9OrVhCYThyejm5s1o7kJay6PH4e2/yv3ouzKcn5/yLexz+9ATiEoAy1a0ncEVb
 VKnTZtcyn93BHKQS5nuzehXUpKu1G6tijwpTzNhBYG1whGW8MlWBuKqiUg6FmQyZefIk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6bOZ-0008JW-Nc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:18:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F4FE6128C;
 Thu, 22 Jul 2021 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626970674;
 bh=8RPljMvuIHC9OdMU5UQztXYxj+1YwADI2GumQzH1ZbA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WleB4vjzxzJyjSPOYo8qvDzaEXHB6aGN07sfNcDCKqPu5p/rWH1Dl75pmMwE/ePv2
 /ZUF7tE/2SNynY89XRCPRqOwGAf27tMekiMLGLwBB6RTwnBMiUrIkXfdBXvQNmIj01
 xKfEtS2lk2ezMlF8nhympCk+WuCtbkWszVQTxYYbhG3A+YQ+2DknQvYmQtWsomVWSr
 FQhQHpeZSgkQXtqNKRiFymcDK5obOvRiC03hM4+1pEBkttqorq54esRXEuZlBdGRBm
 eMBDTntQfN/TYsofGQciFrOL1VfHHPtODYQQ2wkZ0hWFIAUCnjqp4V0OIrZrlECFsR
 Ou1PEPhJbwkYQ==
Date: Thu, 22 Jul 2021 09:17:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPmaMFlR6/tJTmpQ@gmail.com>
References: <YPiTLwB3d8BWSKje@gmail.com>
 <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
 <YPi4rRg2ZPFBWaTZ@sol.localdomain>
 <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
 <YPjGsSEdsoSsCJlB@sol.localdomain>
 <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
 <YPjQQTjJ6rO2sx/o@sol.localdomain>
 <CACOAw_yfG494AK=XH_xzeTDWn-a1mYF+537=VTT6oX6RgLGxnw@mail.gmail.com>
 <YPmB8etJZ+vN0fDT@gmail.com>
 <CACOAw_y7vabxw6Ena4FSuA2bfA_Unq2bEpQq1pSJ0-zi3YCa8w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_y7vabxw6Ena4FSuA2bfA_Unq2bEpQq1pSJ0-zi3YCa8w@mail.gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6bOZ-0008JW-Nc
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 22, 2021 at 09:10:23AM -0700, Daeho Jeong wrote:
> On Thu, Jul 22, 2021 at 7:34 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Thu, Jul 22, 2021 at 01:42:05AM -0700, Daeho Jeong wrote:
> > > On Wed, Jul 21, 2021 at 6:56 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > On Wed, Jul 21, 2021 at 06:40:00PM -0700, Daeho Jeong wrote:
> > > > > On Wed, Jul 21, 2021 at 6:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > > > > >
> > > > > > On Wed, Jul 21, 2021 at 06:04:22PM -0700, Daeho Jeong wrote:
> > > > > > > >
> > > > > > > > How f2fs stores the mapping information doesn't matter.  That's an
> > > > > > > > implementation detail that shouldn't be exposed to userspace.  The only thing
> > > > > > > > that should be exposed is the actual mapping, and for that it seems natural to
> > > > > > > > report the physical blocks first.
> > > > > > > >
> > > > > > > > There is no perfect solution for how to handle the remaining logical blocks,
> > > > > > > > given that the fiemap API was not designed for compressed files, but I think we
> > > > > > > > should just go with extending the length of the last compressed extent in the
> > > > > > > > cluster to cover the remaining logical blocks, i.e.:
> > > > > > > >
> > > > > > > >   [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > > > > > >
> > > > > > > > That's what btrfs does on compressed files.
> > > > > > > >
> > > > > > > > - Eric
> > > > > > >
> > > > > > > I also agree that that's an implementation detail that shouldn't be
> > > > > > > exposed to userspace.
> > > > > > >
> > > > > > > I want to make it more clear for better appearance.
> > > > > > >
> > > > > > > Do you think we have to remove "unwritten" information below? I also
> > > > > > > think it might be unnecessary information for the user.
> > > > > > > [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > > > > > (unwritten?)
> > > > > >
> > > > > > FIEMAP_EXTENT_UNWRITTEN already has a specific meaning; see
> > > > > > Documentation/filesystems/fiemap.rst.  It means that the data is all zeroes, and
> > > > > > the disk space is preallocated but the data hasn't been written to disk yet.
> > > > > >
> > > > > > In this case, the data is *not* necessarily all zeroes.  So I think
> > > > > > FIEMAP_EXTENT_UNWRITTEN shouldn't be used here.
> > > > > >
> > > > > > > Do you want f2fs to print out the info on a cluster basis, even when
> > > > > > > the user asks for one block information?
> > > > > > > Like
> > > > > > > If the user asks for the info of [8..15], f2fs will return the info of [0..31]?
> > > > > >
> > > > > > Yes, since that's how FS_IOC_FIEMAP is supposed to work; see
> > > > > > Documentation/filesystems/fiemap.rst:
> > > > > >
> > > > > >         All offsets and lengths are in bytes and mirror those on disk.  It is
> > > > > >         valid for an extents logical offset to start before the request or its
> > > > > >         logical length to extend past the request.
> > > > > >
> > > > > > (That being said, the f2fs compression+encryption tests I've written don't
> > > > > > exercise this case; they only map the whole file at once.)
> > > > > >
> > > > > > - Eric
> > > > >
> > > > > My last question is.
> > > > > How about a discontinuous cluster like [0..31] maps to discontinuous
> > > > > three blocks like physical address 0x4, 0x14 and 0x24.
> > > > > I think we have to return three extents for the one logical region
> > > > > like the below. What do you think?
> > > > > [0..31] -> 0x4 (merged, encoded)
> > > > > [0..31] -> 0x14 (merged, encoded)
> > > > > [0..31] -> 0x24 (merged, encoded, last_extent)
> > > >
> > > > No, please don't do that.  struct fiemap_extent only has a single length field,
> > > > not separate lengths for fe_logical and fe_physical, so with your proposal there
> > > > would be no way to know how many physical blocks to take from each extent.  It
> > > > would be reporting the same part of the file in contradictory ways.
> > > >
> > > > Like I suggested originally, I think this case should be reported like:
> > > >
> > > >        fe_logical=0    fe_physical=16384  length=4096
> > > >        fe_logical=4096 fe_physical=81920  length=4096
> > > >        fe_logical=8192 fe_physical=147456 length=8192
> > > >
> > >
> > > Hi Eric,
> > >
> > > I think we need to separate one more extent in the example to figure
> > > out that the 4 block cluster turned into 3 compressed blocks.
> > >
> > >        fe_logical=0    fe_physical=16384  length=4096
> > >        fe_logical=4096 fe_physical=81920  length=4096
> > >        fe_logical=8192 fe_physical=147456 length=4096
> > >        fe_logical=12288 fe_physical=0 length=4096
> > >
> > > What do you think?
> > >
> >
> > [+linux-f2fs-devel, not sure why the list was dropped...]
> >
> > I think that would work too, but what flags would you use in the last entry?
> >
> > - Eric
> 
> I think it matches with FIEMAP_EXTENT_UNWRITTEN. Otherwise, we should
> shorten the last extent like below.
> 
>         fe_logical=0    fe_physical=16384  length=4096
>         fe_logical=4096 fe_physical=81920  length=4096
>         fe_logical=8192 fe_physical=147456 length=4096
> 
> 
>   Unwritten extent - the extent is allocated but its data has not been
>   initialized.  This indicates the extent's data will be all zero if read
>   through the filesystem but the contents are undefined if read directly from
>   the device.

Well, as I said before, using UNWRITTEN isn't appropriate because it indicates
that the data is all zeroes, which in this case it is not.  Similarly, reporting
a hole isn't appropriate because it also indicates that the data is all zeroes
and also that it has no space allocated on-disk at all.

I think we should just over-report the physical length of the last extent in the
cluster, which is what btrfs does...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
