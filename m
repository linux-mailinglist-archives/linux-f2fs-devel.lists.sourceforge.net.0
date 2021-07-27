Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 083CB3D6BB0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 04:01:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8COr-0004Op-MI; Tue, 27 Jul 2021 02:00:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m8COq-0004Oh-5m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 02:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vcy0b5L4blxn8rsG5yC3DeCEvvvxSH/7U1pNo99w9eU=; b=WcTUO5ZhpY7MY0R0wyYtKpNYDf
 pbD0fhGMKcGTUIiMWTlrGpFdJ1G0ivvOnWg3TfExxHRustqOyWk4tdgk/bfit71RFU3hdS+JENIeJ
 RYDUEmt8RoEDka6N1bRh2CmqknQDVOnl/xIZe2txXkBb7TfIYK67TXrtJIRRi8DgfcxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vcy0b5L4blxn8rsG5yC3DeCEvvvxSH/7U1pNo99w9eU=; b=ewSMrmnypSnpXURmxYGiVdYJuH
 ahZKrU3Z/b6TpC3W3YAYR3yOvQ0lDTXVqxUQphPXHWMy9ImLpPCYRQv3RF0z4NsSucqYUTnqR6P+Q
 li/0dHPCk27Vkk7hcYyq/pyQX1J8FPE0I1mY6OIfgtgRgZKfDFHX8jF6fRLCQH7AF8n4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8COE-0005pc-9H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 02:00:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF4396044F;
 Tue, 27 Jul 2021 02:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627351203;
 bh=CYY5a6sXIUbXvvfmh1fGeu1HRzHcSsYfC7Nc5x16e70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pItbtAATkfk4wHGbbuFmHFmL9idsCNcWp3oQZtLKut2gzqJ3yKMVfusToCb1jnPl3
 dIAVq7L0wtLtmbmKAhFso9RFDQyE2phgvh1YvDGOdh2d42gX1Hhoay+UN+uRruMXP2
 tH1BlMXGrEcmrN3e8Luks14d6Dk4Q5B684dNC6wHArjXcH1xspCOgacuX9nS1NuLB6
 aYQFWgqkA966lhvCyvzdWgKwnS8BWTQAN+1sC1TGGkOArU3gLYN/c2CvOB9wO59/In
 obrTifawxMcYLOYfNa24jOekdgZqLgjazIGA5dFItMMFkxOoeyGBxRU8m651lU6kWa
 luJ38w87JD5hg==
Date: Mon, 26 Jul 2021 19:00:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YP9oou9sx4oJF1sc@google.com>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <14782036-f6a5-878a-d21f-e7dd7008a285@kernel.org>
 <YP2l+1umf9ct/4Sp@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YP2l+1umf9ct/4Sp@sol.localdomain>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1m8COE-0005pc-9H
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/25, Eric Biggers wrote:
> On Sun, Jul 25, 2021 at 06:50:51PM +0800, Chao Yu wrote:
> > On 2021/7/16 22:39, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > =

> > > f2fs_write_begin() assumes that all blocks were preallocated by
> > > default unless FI_NO_PREALLOC is explicitly set.  This invites data
> > > corruption, as there are cases in which not all blocks are preallocat=
ed.
> > > Commit 47501f87c61a ("f2fs: preallocate DIO blocks when forcing
> > > buffered_io") fixed one case, but there are others remaining.
> > =

> > Could you please explain which cases we missed to handle previously?
> > then I can check those related logic before and after the rework.
> =

> Any case where a buffered write happens while not all blocks were preallo=
cated
> but FI_NO_PREALLOC wasn't set.  For example when ENOSPC was hit in the mi=
ddle of
> the preallocations for a direct write that will fall back to a buffered w=
rite,
> e.g. due to f2fs_force_buffered_io() or page cache invalidation failure.
> =

> > =

> > > -			/*
> > > -			 * If force_buffere_io() is true, we have to allocate
> > > -			 * blocks all the time, since f2fs_direct_IO will fall
> > > -			 * back to buffered IO.
> > > -			 */
> > > -			if (!f2fs_force_buffered_io(inode, iocb, from) &&
> > > -					f2fs_lfs_mode(F2FS_I_SB(inode)))
> > > -				goto write;
> > =

> > We should keep this OPU DIO logic, otherwise, in lfs mode, write dio
> > will always allocate two block addresses for each 4k append IO.
> > =

> > I jsut test based on codes of last f2fs dev-test branch.
> =

> Yes, I had misread that due to the weird goto and misleading comment and
> translated it into:
> =

>         /* If it will be an in-place direct write, don't bother. */
>         if (dio && !f2fs_lfs_mode(sbi))
>                 return 0;
> =

> It should be:
> =

>         if (dio && f2fs_lfs_mode(sbi))
>                 return 0;

Hmm, this addresses my 250 failure. And, I think the below commit can expla=
in
the case.

commit 47501f87c61ad2aa234add63e1ae231521dbc3f5
Author: Jaegeuk Kim <jaegeuk@kernel.org>
Date:   Tue Nov 26 15:01:42 2019 -0800

    f2fs: preallocate DIO blocks when forcing buffered_io

    The previous preallocation and DIO decision like below.

                             allow_outplace_dio              !allow_outplac=
e_dio
    f2fs_force_buffered_io   (*) No_Prealloc / Buffered_IO   Prealloc / Buf=
fered_IO
    !f2fs_force_buffered_io  No_Prealloc / DIO               Prealloc / DIO

    But, Javier reported Case (*) where zoned device bypassed preallocation=
 but
    fell back to buffered writes in f2fs_direct_IO(), resulting in stale da=
ta
    being read.

    In order to fix the issue, actually we need to preallocate blocks whene=
ver
    we fall back to buffered IO like this. No change is made in the other c=
ases.

                             allow_outplace_dio              !allow_outplac=
e_dio
    f2fs_force_buffered_io   (*) Prealloc / Buffered_IO      Prealloc / Buf=
fered_IO
    !f2fs_force_buffered_io  No_Prealloc / DIO               Prealloc / DIO

    Reported-and-tested-by: Javier Gonzalez <javier@javigon.com>
    Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
    Tested-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
    Reviewed-by: Chao Yu <yuchao0@huawei.com>
    Reviewed-by: Javier Gonz=E1lez <javier@javigon.com>
    Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>


> =

> Do you have a proper explanation for why preallocations shouldn't be done=
 in
> this case?  Note that preallocations are still done for buffered writes, =
which
> may be out-of-place as well; how are those different?
> =

> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
