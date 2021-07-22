Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FAD3D1B93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 03:56:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6Nwu-0003AF-U1; Thu, 22 Jul 2021 01:56:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m6Nwt-0003A6-80
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 01:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2G1UCFJRW5q/Isdt/gVBdKTaGw2QXIaZax0Ol3tFt0=; b=bTR/7vIUZLjBPpjsHVKmRnTTcD
 9qKjpC9ekXZSI11xdzNdZTBNtjIEvXaWJNSoouthgAsqmzMdu0MgZMmEj3/+hDIZPE9QStdQAYZbW
 yke4khPlqaMsCsgJ96m/Nq+3s80ksryHTsLNeTAR+N/tdEPlJP6DC0apZ1bnO3UsYpxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l2G1UCFJRW5q/Isdt/gVBdKTaGw2QXIaZax0Ol3tFt0=; b=fMX40FMo8bmT1Tr9I6kzVROMlH
 Ncw72WZHMXFXwxETBZIs3t8e1l6TVUnsNkcFUqnNnAj2YNv6xXu6wgmxBzSERR+/SdGljS0F/O4fu
 MfRYDJiQZzh8zEMdjT6u+HrJ2bDaBTdWy2wykyg+quH+AflrYIJE0KgOG4aeG3XvZxVQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6Nws-00GJJA-0o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 01:56:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1921361260;
 Thu, 22 Jul 2021 01:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626918979;
 bh=FSLbacg+yZg/KWrRL8YrdLF2CLDJeeioxFUFB3VTb4Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qL16FUTiljQErZIDeG5m6UuVLE/F065GBDgJlDiZwOHPp4hvips3yWZdUgQLoZjvF
 OlTyB/qp1p5MXs2DRxoEEIY/am0gabqBik7KZDBNp9k6Vs+IyH7+YgDfYl/ivwIfF2
 seicmSE8+ewt7GsrctnAmdTg05cMxysjjFICZzBPDGM7N3mrJwGQhUpfwsdUfNlN1M
 JeH5J7nnGgUV4qmLsNnzllRCcN35roJaKPrYexb1OPcOxWtYA5mWutkx9IntVu6tLk
 hCP/B7HRlHvM5ebGQABd4Q/CkPATp4vvLmb/bk1WJGZcLKV1eFoddCX1emxF4hFxGn
 DJPqTSgtt+o6g==
Date: Wed, 21 Jul 2021 18:56:17 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPjQQTjJ6rO2sx/o@sol.localdomain>
References: <20210721072048.3035928-1-daeho43@gmail.com>
 <YPiTLwB3d8BWSKje@gmail.com>
 <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
 <YPi4rRg2ZPFBWaTZ@sol.localdomain>
 <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
 <YPjGsSEdsoSsCJlB@sol.localdomain>
 <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6Nws-00GJJA-0o
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

On Wed, Jul 21, 2021 at 06:40:00PM -0700, Daeho Jeong wrote:
> On Wed, Jul 21, 2021 at 6:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Wed, Jul 21, 2021 at 06:04:22PM -0700, Daeho Jeong wrote:
> > > >
> > > > How f2fs stores the mapping information doesn't matter.  That's an
> > > > implementation detail that shouldn't be exposed to userspace.  The only thing
> > > > that should be exposed is the actual mapping, and for that it seems natural to
> > > > report the physical blocks first.
> > > >
> > > > There is no perfect solution for how to handle the remaining logical blocks,
> > > > given that the fiemap API was not designed for compressed files, but I think we
> > > > should just go with extending the length of the last compressed extent in the
> > > > cluster to cover the remaining logical blocks, i.e.:
> > > >
> > > >   [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > >
> > > > That's what btrfs does on compressed files.
> > > >
> > > > - Eric
> > >
> > > I also agree that that's an implementation detail that shouldn't be
> > > exposed to userspace.
> > >
> > > I want to make it more clear for better appearance.
> > >
> > > Do you think we have to remove "unwritten" information below? I also
> > > think it might be unnecessary information for the user.
> > > [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > (unwritten?)
> >
> > FIEMAP_EXTENT_UNWRITTEN already has a specific meaning; see
> > Documentation/filesystems/fiemap.rst.  It means that the data is all zeroes, and
> > the disk space is preallocated but the data hasn't been written to disk yet.
> >
> > In this case, the data is *not* necessarily all zeroes.  So I think
> > FIEMAP_EXTENT_UNWRITTEN shouldn't be used here.
> >
> > > Do you want f2fs to print out the info on a cluster basis, even when
> > > the user asks for one block information?
> > > Like
> > > If the user asks for the info of [8..15], f2fs will return the info of [0..31]?
> >
> > Yes, since that's how FS_IOC_FIEMAP is supposed to work; see
> > Documentation/filesystems/fiemap.rst:
> >
> >         All offsets and lengths are in bytes and mirror those on disk.  It is
> >         valid for an extents logical offset to start before the request or its
> >         logical length to extend past the request.
> >
> > (That being said, the f2fs compression+encryption tests I've written don't
> > exercise this case; they only map the whole file at once.)
> >
> > - Eric
> 
> My last question is.
> How about a discontinuous cluster like [0..31] maps to discontinuous
> three blocks like physical address 0x4, 0x14 and 0x24.
> I think we have to return three extents for the one logical region
> like the below. What do you think?
> [0..31] -> 0x4 (merged, encoded)
> [0..31] -> 0x14 (merged, encoded)
> [0..31] -> 0x24 (merged, encoded, last_extent)

No, please don't do that.  struct fiemap_extent only has a single length field,
not separate lengths for fe_logical and fe_physical, so with your proposal there
would be no way to know how many physical blocks to take from each extent.  It
would be reporting the same part of the file in contradictory ways.

Like I suggested originally, I think this case should be reported like:

       fe_logical=0    fe_physical=16384  length=4096
       fe_logical=4096 fe_physical=81920  length=4096
       fe_logical=8192 fe_physical=147456 length=8192

It's not perfect, but I think it's the least bad option, for the reasons I've
explained previously...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
