Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF0912F58
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2024 23:19:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKlf5-0003HU-J7;
	Fri, 21 Jun 2024 21:19:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1sKlex-000360-M1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 21:19:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hvq9h6mabFYXfd0UKQQOAJjmhnw2i9mdwqhg3VpUv+E=; b=KnWGpA4F8ykDi+2O1d2t71odAk
 JdDa/7cfCyLZIyvv+v9oA0VD+S+atTqb+Z5jh6cnTx3tVrCMSvKC6eC1T1YgrFmLJbKamBKf4IC67
 wXYZHjbu+CC5rpe733oFEPjRr1Phv5S8kqwTC2yIGWRbAYhnKTyvzCIcSYTrWiXNrhNU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hvq9h6mabFYXfd0UKQQOAJjmhnw2i9mdwqhg3VpUv+E=; b=Gn/F58AURQ1tOiA8o8ICLNensJ
 rILqkiooHjO8ncGqgPvsZ91Wk06CwmhieDoKCw/ViagRm9pydqdTAC5FRFJZVFIiCD5ER2h3M/dGs
 HnP01zK6avstywXm3/3KRlxNK9WxHucdm4Fw/5HQ4swPf/83RtQPcQDgN+mDV3uvK+KA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKley-0002j3-Ao for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jun 2024 21:19:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B6804CE2D14;
 Fri, 21 Jun 2024 21:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A1AC2BBFC;
 Fri, 21 Jun 2024 21:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719004736;
 bh=sdtBjsr+XiHzFFwJkoRXFeC0FXv2NWldnm0I6mueIIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C2j0J7XYnglGPEiEziaR5oJH2YSHKc+/x1SlIkP213F7Ne1JnvVZgZz9tuky+Aasy
 6MZy17hsxxBt4Ba+DYJAqIhtz2nV+WGetvSA99yPiipqs9cjZNMOxbYaCNY3YcsAG0
 HiAHxsFtoKEI2Y+6IAExVu2LiF4RYYYqYVlTUskJEAe4ESUa+1W9M2nNkrGtq8huU5
 KngZUgVIh3zUgw0al2QnLAYMhYAn5jMED5Q0x25hq0a8LUy6zpZhsowQHWaCrSTxOb
 cM3OxhmkgUB0Xa8k/tYmqM7nB8FdZQtkPANImh5zh6pzmGKxfm6QB5LJGB/XggKl0D
 ynjuqanOQhjkg==
Date: Fri, 21 Jun 2024 14:18:55 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: John Garry <john.g.garry@oracle.com>
Message-ID: <20240621211855.GY3058325@frogsfrogsfrogs>
References: <20240607143919.2622319-1-john.g.garry@oracle.com>
 <20240607143919.2622319-3-john.g.garry@oracle.com>
 <20240612213235.GK2764752@frogsfrogsfrogs>
 <59255aa1-a769-437b-8fbb-71f53fd7920f@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59255aa1-a769-437b-8fbb-71f53fd7920f@oracle.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 13, 2024 at 11:31:35AM +0100, John Garry wrote:
 > On 12/06/2024 22:32, Darrick J. Wong wrote: > > > unsigned int fs_block_size
 = i_blocksize(inode), pad; > > > + u64 io_block_size = iomap- [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKley-0002j3-Ao
Subject: Re: [f2fs-dev] [PATCH v4 02/22] iomap: Allow filesystems set IO
 block zeroing size
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
Cc: ritesh.list@gmail.com, gfs2@lists.linux.dev,
 mikulas@artax.karlin.mff.cuni.cz, hch@lst.de, agruenba@redhat.com,
 miklos@szeredi.hu, linux-ext4@vger.kernel.org, catherine.hoang@oracle.com,
 linux-block@vger.kernel.org, viro@zeniv.linux.org.uk, dchinner@redhat.com,
 axboe@kernel.dk, brauner@kernel.org, tytso@mit.edu, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, mcgrof@kernel.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, chandan.babu@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 13, 2024 at 11:31:35AM +0100, John Garry wrote:
> On 12/06/2024 22:32, Darrick J. Wong wrote:
> > > unsigned int fs_block_size = i_blocksize(inode), pad;
> > > +	u64 io_block_size = iomap->io_block_size;
> > I wonder, should iomap be nice and not require filesystems to set
> > io_block_size themselves unless they really need it?
> 
> That's what I had in v3, like:
> 
> if (iomap->io_block_size)
> 	io_block_size = iomap->io_block_size;
> else
> 	io_block_size = i_block_size(inode)
> 
> but it was suggested to change that (to like what I have here).

oh, ok.  Ignore that comment, then. :)

> > Anyone working on
> > an iomap port while this patchset is in progress may or may not remember
> > to add this bit if they get their port merged after atomicwrites is
> > merged; and you might not remember to prevent the bitrot if the reverse
> > order happens.
> 
> Sure, I get your point.
> 
> However, OTOH, if we check xfs_bmbt_to_iomap(), it does set all or close to
> all members of struct iomap, so we are just continuing that trend, i.e. it
> is the job of the FS callback to set all these members.
> 
> > 
> > 	u64 io_block_size = iomap->io_block_size ?: i_blocksize(inode);
> > 
> > >   	loff_t length = iomap_length(iter);
> > >   	loff_t pos = iter->pos;
> > >   	blk_opf_t bio_opf;
> > > @@ -287,6 +287,7 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
> > >   	int nr_pages, ret = 0;
> > >   	size_t copied = 0;
> > >   	size_t orig_count;
> > > +	unsigned int pad;
> > >   	if ((pos | length) & (bdev_logical_block_size(iomap->bdev) - 1) ||
> > >   	    !bdev_iter_is_aligned(iomap->bdev, dio->submit.iter))
> > > @@ -355,7 +356,14 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
> > >   	if (need_zeroout) {
> > >   		/* zero out from the start of the block to the write offset */
> > > -		pad = pos & (fs_block_size - 1);
> > > +		if (is_power_of_2(io_block_size)) {
> > > +			pad = pos & (io_block_size - 1);
> > > +		} else {
> > > +			loff_t _pos = pos;
> > > +
> > > +			pad = do_div(_pos, io_block_size);
> > > +		}
> > Please don't opencode this twice.
> > 
> > static unsigned int offset_in_block(loff_t pos, u64 blocksize)
> > {
> > 	if (likely(is_power_of_2(blocksize)))
> > 		return pos & (blocksize - 1);
> > 	return do_div(pos, blocksize);
> > }
> 
> ok, fine
> 
> > 
> > 		pad = offset_in_block(pos, io_block_size);
> > 		if (pad)
> > 			...
> > 
> > Also, what happens if pos-pad points to a byte before the mapping?
> 
> It's the job of the FS to map in something aligned to io_block_size. Having
> said that, I don't think we are doing that for XFS (which sets io_block_size
> > i_block_size(inode)), so I need to check that.

<nod>  You can only play with the mapping that the fs gave you.
If xfs doesn't give you a big enough mapping, then that's a programming
bug to WARN_ON_ONCE about and return EIO.

I hadn't realized that the ->iomap_begin function is required to
provide mappings that are aligned to io_block_size.

> 
> > 
> > > +
> > >   		if (pad)
> > >   			iomap_dio_zero(iter, dio, pos - pad, pad);
> > >   	}
> > > @@ -429,9 +437,16 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
> > >   	if (need_zeroout ||
> > >   	    ((dio->flags & IOMAP_DIO_WRITE) && pos >= i_size_read(inode))) {
> > >   		/* zero out from the end of the write to the end of the block */
> > > -		pad = pos & (fs_block_size - 1);
> > > +		if (is_power_of_2(io_block_size)) {
> > > +			pad = pos & (io_block_size - 1);
> > > +		} else {
> > > +			loff_t _pos = pos;
> > > +
> > > +			pad = do_div(_pos, io_block_size);
> > > +		}
> > > +
> > >   		if (pad)
> > > -			iomap_dio_zero(iter, dio, pos, fs_block_size - pad);
> > > +			iomap_dio_zero(iter, dio, pos, io_block_size - pad);
> > What if pos + io_block_size - pad points to a byte after the end of the
> > mapping?
> 
> as above, we expect this to be mapped in (so ok to zero)
> 
> > 
> > >   	}
> > >   out:
> > >   	/* Undo iter limitation to current extent */
> > > diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> > > index 378342673925..ecb4cae88248 100644
> > > --- a/fs/xfs/xfs_iomap.c
> > > +++ b/fs/xfs/xfs_iomap.c
> > > @@ -127,6 +127,7 @@ xfs_bmbt_to_iomap(
> > >   	}
> > >   	iomap->offset = XFS_FSB_TO_B(mp, imap->br_startoff);
> > >   	iomap->length = XFS_FSB_TO_B(mp, imap->br_blockcount);
> > > +	iomap->io_block_size = i_blocksize(VFS_I(ip));
> > >   	if (mapping_flags & IOMAP_DAX)
> > >   		iomap->dax_dev = target->bt_daxdev;
> > >   	else
> > > diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
> > > index 3b103715acc9..bf2cc4bee309 100644
> > > --- a/fs/zonefs/file.c
> > > +++ b/fs/zonefs/file.c
> > > @@ -50,6 +50,7 @@ static int zonefs_read_iomap_begin(struct inode *inode, loff_t offset,
> > >   		iomap->addr = (z->z_sector << SECTOR_SHIFT) + iomap->offset;
> > >   		iomap->length = isize - iomap->offset;
> > >   	}
> > > +	iomap->io_block_size = i_blocksize(inode);
> > >   	mutex_unlock(&zi->i_truncate_mutex);
> > >   	trace_zonefs_iomap_begin(inode, iomap);
> > > @@ -99,6 +100,7 @@ static int zonefs_write_iomap_begin(struct inode *inode, loff_t offset,
> > >   		iomap->type = IOMAP_MAPPED;
> > >   		iomap->length = isize - iomap->offset;
> > >   	}
> > > +	iomap->io_block_size = i_blocksize(inode);
> > >   	mutex_unlock(&zi->i_truncate_mutex);
> > >   	trace_zonefs_iomap_begin(inode, iomap);
> > > diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> > > index 6fc1c858013d..d63a35b77907 100644
> > > --- a/include/linux/iomap.h
> > > +++ b/include/linux/iomap.h
> > > @@ -103,6 +103,8 @@ struct iomap {
> > >   	void			*private; /* filesystem private */
> > >   	const struct iomap_folio_ops *folio_ops;
> > >   	u64			validity_cookie; /* used with .iomap_valid() */
> > > +	/* io block zeroing size, not necessarily a power-of-2  */
> > size in bytes?
> > 
> > I'm not sure what "io block zeroing" means.
> 
> Naming is hard. Essentally we are trying to reuse the sub-fs block zeroing
> code for sub-extent granule writes. More below.

Yeah.  For sub-fsblock zeroing we issue (chained) bios to write zeroes
to the sectors surrounding the part we're actually writing, then we're
issuing the write itself, and finally the ioend converts the mapping to
unwritten.

For untorn writes we're doing the same thing, but now on the level of
multiple fsblocks.  I guess this is all going to support a 


<nod> "IO granularity" ?  For untorn writes I guess you want mappings
that are aligned to a supported untorn write granularity; for bs > ps
filesystems I guess the IO granularity is 

> > What are you trying to
> > accomplish here?  Let's say the fsblock size is 4k and the allocation
> > unit (aka the atomic write size) is 16k.
> 
> ok, so I say here that the extent granule is 16k
> 
> > Userspace wants a direct write
> > to file offset 8192-12287, and that space is unwritten:
> > 
> > uuuu
> >    ^
> > 
> > Currently we'd just write the 4k and run the io completion handler, so
> > the final state is:
> > 
> > uuWu
> > 
> > Instead, if the fs sets io_block_size to 16384, does this direct write
> > now amplify into a full 16k write?
> 
> Yes, but only when the extent is newly allocated and we require zeroing.
> 
> > With the end result being:
> > ZZWZ
> 
> Yes
> 
> > 
> > only.... I don't see the unwritten areas being converted to written?
> 
> See xfs_iomap_write_unwritten() change in the next patch
> 
> > I guess for an atomic write you'd require the user to write 0-16383?
> 
> Not exactly
> 
> > 
> > <still confused about why we need to do this, maybe i'll figure it out
> > as I go along>
> 
> This zeroing is just really required for atomic writes. The purpose is to
> zero the extent granule for any write within a newly allocated granule.
> 
> Consider we have uuWu, above. If the user then attempts to write the full
> 16K as an atomic write, the iomap iter code would generate writes for sizes
> 8k, 4k, and 4k, i.e. not a single 16K write. This is not acceptable. So the
> idea is to zero the full extent granule when allocated, so we have ZZWZ
> after the 4k write at offset 8192, above. As such, if we then attempt this
> 16K atomic write, we get a single 16K BIO, i.e. there is no unwritten extent
> conversion.

Wait, are we issuing zeroing writes for 0-8191 and 12288-16383, then
issuing a single atomic write for 0-16383?  That won't work, because all
the bios attached to an iomap_dio are submitted and execute
asynchronously.  I think you need ->iomap_begin to do XFS_BMAPI_ZERO
allocations if the writes aren't aligned to the minimum untorn write
granularity.

> I am not sure if we should be doing this only for atomic writes inodes, or
> also forcealign only or RT.

I think it only applies to untorn writes because the default behavior
everywhere is is that writes can tear.

--D

> Thanks,
> John
> 
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
