Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AFB22A33A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jul 2020 01:43:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyOOP-0000rq-T9; Wed, 22 Jul 2020 23:43:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jyOOO-0000rj-7k
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wKRm1HO0GVmh6x30OI+wRBTuWrH/Roiftg0d9Qae3Y=; b=C0PaC/axbLwnotVcKBFTeBxGLu
 S9uPZMDap6E/p5NRQm+JE5HTpC6pyMyK+aiwzrKc+ICinGRpV5sc0mAyQJj3BlKKUQ+Iz3VaKfmRg
 JnaYFglA3WK4NMluNkLaqcpuSYeWxpt4lgl3PpHoIX0L21qCcfvMw5p64t9gqw9MiKMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7wKRm1HO0GVmh6x30OI+wRBTuWrH/Roiftg0d9Qae3Y=; b=kRDXn75N/6E9UatzoIUe+WbMMd
 peAfUm5CO9IHO39Em7YmKpZW7W3CB05NGCZrqT1sdf+kV81XcXA5i2XGcizdR0rZIz/gwdsmhBPLr
 D4PCFhn9bjz6BwmYpEt0SITz4/AMYfM5vEOuAncctYoqx2Bdizl5qf0c2r0k6ZA3XDgI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyOON-005WVN-1T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 23:43:20 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D4D02086A;
 Wed, 22 Jul 2020 23:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595461393;
 bh=jF4qtHjIeuPOhSQlnQYYxpnx0gFWKePcCre3aK7+Bgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KRJUfI/0Hdt5WoH8m0SRilChyMTwZKEfF3exTbXmO3eZp0Q7tW+XG6cF1yT78SV6H
 /wRKvBIXl0GVQPL+lU9V4Z7wsy+1Y0YUj9rSQsSLISAPkfUnYYE5zZbu7uXqYUUPT9
 nUkWzfow49BJMqirOVydfh2/OJiOVl5ST37Zmm54=
Date: Wed, 22 Jul 2020 16:43:12 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20200722234312.GC83434@sol.localdomain>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
 <20200722211629.GE2005@dread.disaster.area>
 <20200722223404.GA76479@sol.localdomain>
 <20200722232625.GB83434@sol.localdomain>
 <20200722233247.GO3151642@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722233247.GO3151642@magnolia>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyOON-005WVN-1T
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
 fscrypt using blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 22, 2020 at 04:32:47PM -0700, Darrick J. Wong wrote:
> On Wed, Jul 22, 2020 at 04:26:25PM -0700, Eric Biggers wrote:
> > On Wed, Jul 22, 2020 at 03:34:04PM -0700, Eric Biggers wrote:
> > > So, something like this:
> > > =

> > > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > > index 44bad4bb8831..2816194db46c 100644
> > > --- a/fs/ext4/inode.c
> > > +++ b/fs/ext4/inode.c
> > > @@ -3437,6 +3437,15 @@ static int ext4_iomap_begin(struct inode *inod=
e, loff_t offset, loff_t length,
> > >  	map.m_len =3D min_t(loff_t, (offset + length - 1) >> blkbits,
> > >  			  EXT4_MAX_LOGICAL_BLOCK) - map.m_lblk + 1;
> > >  =

> > > +	/*
> > > +	 * When inline encryption is enabled, sometimes I/O to an encrypted=
 file
> > > +	 * has to be broken up to guarantee DUN contiguity.  Handle this by
> > > +	 * limiting the length of the mapping returned.
> > > +	 */
> > > +	if (!(flags & IOMAP_REPORT))
> > > +		map.m_len =3D fscrypt_limit_io_blocks(inode, map.m_lblk,
> > > +						    map.m_len);
> > > +
> > >  	if (flags & IOMAP_WRITE)
> > >  		ret =3D ext4_iomap_alloc(inode, &map, flags);
> > >  	else
> > > =

> > > =

> > > That also avoids any confusion between pages and blocks, which is nic=
e.
> > =

> > Correction: for fiemap, ext4 actually uses ext4_iomap_begin_report() in=
stead of
> > ext4_iomap_begin().  So we don't need to check for !IOMAP_REPORT.
> > =

> > Also it could make sense to limit map.m_len after ext4_iomap_alloc() ra=
ther than
> > before, so that we don't limit the length of the extent that gets alloc=
ated but
> > rather just the length that gets returned to iomap.
> =

> Na=EFve question here -- if the decision to truncate the bio depends on
> the file block offset, can you achieve the same thing by capping the
> length of the iovec prior to iomap_dio_rw?
> =

> Granted that probably only makes sense if the LBLK IV thing is only
> supposed to be used infrequently, and having to opencode a silly loop
> might be more hassle than it's worth...
> =


We *could* do the truncation there, but that would truncate the actual read=
() or
write().  So, userspace would see a short read or write.  And I understand =
that
while applications are *supposed* to handle short reads and writes, many do=
n't.

I think Dave's suggestion makes more sense, since it would make this case be
treated just like normal fragmentation of the file.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
