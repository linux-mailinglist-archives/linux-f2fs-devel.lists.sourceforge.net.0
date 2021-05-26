Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5E391C14
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 17:33:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llvWn-0001Ve-Dw; Wed, 26 May 2021 15:33:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1llvWm-0001VX-Gh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 15:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BNkDrlewdBn1lE+2W6CNw20hM92axKpKEMjNiP7/mEk=; b=kA5yOe1a7Xl+dqcw3yy7rbs8gv
 +VJwBY6oCXb8Gr9aB4qmeEr5AdLU+3UQxj/3I+ZB5FHFIzERK0f2+v/tUl8XengkTaO9OOTAt4g6S
 IBFKA2DxuJi5UjsQOjT4PV5bN5V0RQjYZpHGpFwNkvx95pqC8ECSV9KZTtOcWK9r8aI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BNkDrlewdBn1lE+2W6CNw20hM92axKpKEMjNiP7/mEk=; b=Ris28Fn26Ag35cR2OMNcYZN6Os
 KWb7anqG87q2klEAqW0/O5WKmaAy5W2+QVtq0xLlvXztnvgr+4uWgKCKuhErKS04p1xhSQkGVcIKb
 7aka7z7MZYS0qo3M/e/vpD57vXnvrfKus2qNwSKIizwxQsi/nL443j4ZczcQ8hj+jk4E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1llvWj-006gU1-R3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 15:33:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E70560FEB;
 Wed, 26 May 2021 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622043172;
 bh=V5vCXBefwn7ATI2q09Zc6Pyr3lgUwNBruf3selAP4x4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jbwHAkWFow3o+pBkhghb3kHEKwUgkNydGv3mNOmncX52Qoz1jR2s3vJbxA6JPcd88
 tab4+/Gep3cvFcm3cZMlAQxOOmHOWF86MNOlkpXVV0n2emp7yBv++bsf9Zail+czZ/
 4AwrVtxdw45GdYyGip8v1vFDbPEI1l6/GKxPDVKUAz97lejoC/GIypyNOFV2/7orn9
 AwoGrXmEstbTzqHVdZQadJZX+Kld/lh1w/YQ+Oi1d9U5EtitGuZAvULQN/GbfIBQkf
 Lsq/rxD2moQfCmv6WNsXnHOKeGsJ5R+L0/D6492eq6NGD7sDKAYmg4SAWgQZh3H+UD
 3oYe04vxFLyHQ==
Date: Wed, 26 May 2021 08:32:51 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210526153251.GZ202121@locust>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-7-jack@suse.cz>
 <20210525213729.GC202144@locust>
 <20210526101840.GC30369@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526101840.GC30369@quack2.suse.cz>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1llvWj-006gU1-R3
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
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 26, 2021 at 12:18:40PM +0200, Jan Kara wrote:
> On Tue 25-05-21 14:37:29, Darrick J. Wong wrote:
> > On Tue, May 25, 2021 at 03:50:44PM +0200, Jan Kara wrote:
> > > Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
> > > purpose of invalidate_lock is exactly the same. Note that the locking in
> > > __xfs_filemap_fault() slightly changes as filemap_fault() already takes
> > > invalidate_lock.
> > > 
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > CC: <linux-xfs@vger.kernel.org>
> > > CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> > 
> > It's djwong@kernel.org now.
> 
> OK, updated.
> 
> > > @@ -355,8 +358,11 @@ xfs_isilocked(
> > >  
> > >  	if (lock_flags & (XFS_MMAPLOCK_EXCL|XFS_MMAPLOCK_SHARED)) {
> > >  		if (!(lock_flags & XFS_MMAPLOCK_SHARED))
> > > -			return !!ip->i_mmaplock.mr_writer;
> > > -		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
> > > +			return !debug_locks ||
> > > +				lockdep_is_held_type(
> > > +					&VFS_I(ip)->i_mapping->invalidate_lock,
> > > +					0);
> > > +		return rwsem_is_locked(&VFS_I(ip)->i_mapping->invalidate_lock);
> > 
> > This doesn't look right...
> > 
> > If lockdep is disabled, we always return true for
> > xfs_isilocked(ip, XFS_MMAPLOCK_EXCL) even if nobody holds the lock?
> > 
> > Granted, you probably just copy-pasted from the IOLOCK_SHARED clause
> > beneath it.  Er... oh right, preichl was messing with all that...
> > 
> > https://lore.kernel.org/linux-xfs/20201016021005.548850-2-preichl@redhat.com/
> 
> Indeed copy-paste programming ;) It certainly makes the assertions happy
> but useless. Should I pull the patch you reference into the series? It
> seems to have been uncontroversial and reviewed. Or will you pull the
> series to xfs tree so I can just rebase on top?

The full conversion series introduced assertion failures because lockdep
can't handle some of the ILOCK usage patterns, specifically the fact
that a thread sometimes takes the ILOCK but then hands the inode to a
workqueue to avoid overflowing the first thread's stack.  That's why it
never got merged into the xfs tree.

However, that kind of switcheroo isn't done with the
MMAPLOCK/invalidate_lock, so you could simply pull the patch I linked
above into your series.

--D

> 
> 								Honza
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
