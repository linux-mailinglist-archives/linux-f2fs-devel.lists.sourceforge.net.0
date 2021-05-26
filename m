Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 860323914CB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 12:21:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llqf4-0001lG-Rv; Wed, 26 May 2021 10:21:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1llqf3-0001kk-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 10:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KNXtYbX9PoD7HWobCfGe506uRcOdWxiA8Gr7nrDFogA=; b=W81Fs20f8EbTop6MVSu12cj+z5
 XfpJEegbn/kBQqoTTbd9eFgeTqxR/yYtnB7wytb4h48Fsj3iTO/EVrPWDrv1A0I6RuiT/GWP8yZc1
 TOcaddBc2U4eMMyWJ9X+qjn1LFxa0oCC6/MMIQPeVC6sHz6nbdf0ga8S1EcdqSVVdRuQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KNXtYbX9PoD7HWobCfGe506uRcOdWxiA8Gr7nrDFogA=; b=RIGYxrV79WYtdqYeQPBDCyYES2
 PAFPU6b+brg3m0L8CbCC4iefPH2PfpT+U2HvpWWaJY3IFlLIfehS5uplPItG//xjE1C1A3q4v7WuK
 vb+tvDav9qSZJqKviXg3/DKBFhmIRPNl+s0Kym/SRW7/B1spMmCxfLLfS4Dd7bCYdOTA=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1llqex-0007dO-1c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 10:21:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622024462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNXtYbX9PoD7HWobCfGe506uRcOdWxiA8Gr7nrDFogA=;
 b=2urB98NmE/jP6mSICb3YhJoU3CNmVA3jsTPkDf7uho1D8U4aLvX/lEIJbpI3lzu6DI90cx
 2tW3Ki9mRLc2S7rBmkdiGaAABLeduUVN5U6+vxKaHtuTRR9ubsJronVXiVU/Mr1KlGAcCl
 37efE24YmVwNASTk4LKCY08gWwFykkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622024462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNXtYbX9PoD7HWobCfGe506uRcOdWxiA8Gr7nrDFogA=;
 b=7FeQ1oYTjy3dESOA3v95EZt/vKI8f9cxYKZTi5iS4eZ6729GTgdeaYfZCfXLAK5U9i4RIo
 5mD2xUxmmobGLpAg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57F18B25F;
 Wed, 26 May 2021 10:21:01 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id DE7451F2CAC; Wed, 26 May 2021 12:20:59 +0200 (CEST)
Date: Wed, 26 May 2021 12:20:59 +0200
From: Jan Kara <jack@suse.cz>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20210526102059.GD30369@quack2.suse.cz>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-7-jack@suse.cz>
 <20210525214041.GJ664593@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210525214041.GJ664593@dread.disaster.area>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1llqex-0007dO-1c
Subject: Re: [f2fs-dev] [PATCH 07/13] xfs: Convert to use invalidate_lock
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Jan Kara <jack@suse.cz>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Steve French <sfrench@samba.org>,
 Jeff Layton <jlayton@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Ted Tso <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 26-05-21 07:40:41, Dave Chinner wrote:
> On Tue, May 25, 2021 at 03:50:44PM +0200, Jan Kara wrote:
> > Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
> > purpose of invalidate_lock is exactly the same. Note that the locking in
> > __xfs_filemap_fault() slightly changes as filemap_fault() already takes
> > invalidate_lock.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > CC: <linux-xfs@vger.kernel.org>
> > CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  fs/xfs/xfs_file.c  | 12 ++++++-----
> >  fs/xfs/xfs_inode.c | 52 ++++++++++++++++++++++++++--------------------
> >  fs/xfs/xfs_inode.h |  1 -
> >  fs/xfs/xfs_super.c |  2 --
> >  4 files changed, 36 insertions(+), 31 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 396ef36dcd0a..dc9cb5c20549 100644
> > --- a/fs/xfs/xfs_file.c
> > +++ b/fs/xfs/xfs_file.c
> > @@ -1282,7 +1282,7 @@ xfs_file_llseek(
> >   *
> >   * mmap_lock (MM)
> >   *   sb_start_pagefault(vfs, freeze)
> > - *     i_mmaplock (XFS - truncate serialisation)
> > + *     invalidate_lock (vfs/XFS_MMAPLOCK - truncate serialisation)
> >   *       page_lock (MM)
> >   *         i_lock (XFS - extent map serialisation)
> >   */
> > @@ -1303,24 +1303,26 @@ __xfs_filemap_fault(
> >  		file_update_time(vmf->vma->vm_file);
> >  	}
> >  
> > -	xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
> >  	if (IS_DAX(inode)) {
> >  		pfn_t pfn;
> >  
> > +		xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
> >  		ret = dax_iomap_fault(vmf, pe_size, &pfn, NULL,
> >  				(write_fault && !vmf->cow_page) ?
> >  				 &xfs_direct_write_iomap_ops :
> >  				 &xfs_read_iomap_ops);
> >  		if (ret & VM_FAULT_NEEDDSYNC)
> >  			ret = dax_finish_sync_fault(vmf, pe_size, pfn);
> > +		xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
> >  	} else {
> > -		if (write_fault)
> > +		if (write_fault) {
> > +			xfs_ilock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
> >  			ret = iomap_page_mkwrite(vmf,
> >  					&xfs_buffered_write_iomap_ops);
> > -		else
> > +			xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
> > +		} else
> >  			ret = filemap_fault(vmf);
> >  	}
> > -	xfs_iunlock(XFS_I(inode), XFS_MMAPLOCK_SHARED);
> 
> This seems kinda messy. filemap_fault() basically takes the
> invalidate lock around the entire operation, it runs, so maybe it
> would be cleaner to implement it as:
> 
> filemap_fault_locked(vmf)
> {
> 	/* does the filemap fault work */
> }
> 
> filemap_fault(vmf)
> {
> 	filemap_invalidate_down_read(...)
> 	ret = filemap_fault_locked(vmf)
> 	filemap_invalidate_up_read(...)
> 	return ret;
> }
> 
> And that means XFS could just call filemap_fault_locked() and not 
> have to do all this messy locking just to avoid holding the lock
> that filemap_fault has now internalised.

Sure, I can do that.

> > @@ -355,8 +358,11 @@ xfs_isilocked(
> >  
> >  	if (lock_flags & (XFS_MMAPLOCK_EXCL|XFS_MMAPLOCK_SHARED)) {
> >  		if (!(lock_flags & XFS_MMAPLOCK_SHARED))
> > -			return !!ip->i_mmaplock.mr_writer;
> > -		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
> > +			return !debug_locks ||
> > +				lockdep_is_held_type(
> > +					&VFS_I(ip)->i_mapping->invalidate_lock,
> > +					0);
> > +		return rwsem_is_locked(&VFS_I(ip)->i_mapping->invalidate_lock);
> >  	}
> 
> <sigh>
> 
> And so here we are again, losing more of our read vs write debug
> checks on debug kernels when lockdep is not enabled....
> 
> Can we please add rwsem_is_locked_read() and rwsem_is_locked_write()
> wrappers that just look at the rwsem counter value to determine how
> the lock is held? Then the mrlock_t can go away entirely....

Apparently someone already did that for XFS as Darrick pointed out. So we
just have to sort out how to merge it.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
