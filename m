Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2639392D75
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 May 2021 14:02:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lmEiO-0004Ps-PR; Thu, 27 May 2021 12:02:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jack@suse.cz>) id 1lmEiG-0004PH-Ri
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 May 2021 12:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dzbVRZmzFuPYI5poJku3auZPHvmkGSaVp1vMN+///aM=; b=Y0jK+NzDu0xeAnXWCdC+5FHlbR
 phF6zjJJXY8kHIXcr8Dafh7FUk99FzD5hmuWbuCbHApOvm4nJ2Yf0ukD9rvE233ZqcRr60FOpkBvd
 eF3842sRF9S348Odrl4MOENzU6PoDgGddlrghGyffkwPmGruqzsB4pfLf/kFUw10mr3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dzbVRZmzFuPYI5poJku3auZPHvmkGSaVp1vMN+///aM=; b=EvleA7ElgHU0HEO10QAhaP23uV
 G4AiP5+EEYszgxBuum4rdVAXW5z2bx32Du3Wr3/bvsCDceuA7zN1SsDlcKDeCu60GXqiOzjDuzqzU
 Uf1uWSmu3Nm1NNcZFhHj1c/+q3cM6sP6LSkic+Pa7XB3r4g1Ev8jX1UO1AgR6gfJgGSo=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lmEi6-007jLG-Tx
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 May 2021 12:02:09 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622116908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzbVRZmzFuPYI5poJku3auZPHvmkGSaVp1vMN+///aM=;
 b=f2cxEqETTBvEmV4ULoxNaMI1iCVFmFrGue2YsLPhsPaIwuWVWOs+sxiPUa8otMLF+YX0oZ
 uhov743BXdjHMHq4sEArHqsspS7mHteRQKwa0LzGiZVHpqcufpjvdvGhVbTucTMzS1ouxn
 le5Tq6JlMjVPTCeShhV6Fk3X7MaBZg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622116908;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dzbVRZmzFuPYI5poJku3auZPHvmkGSaVp1vMN+///aM=;
 b=7ZmMbPHvotaCLsOpw+GVeU5Zo9oFBCWF89Cqa0I7loV15uebJ80v4o2t67vCmwZ9u62oXn
 kdu5eoF4IBW9prBQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D6CBAD77;
 Thu, 27 May 2021 12:01:48 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 5A1181F2C9A; Thu, 27 May 2021 14:01:47 +0200 (CEST)
Date: Thu, 27 May 2021 14:01:47 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210527120147.GD24486@quack2.suse.cz>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-7-jack@suse.cz>
 <20210525213729.GC202144@locust>
 <20210526101840.GC30369@quack2.suse.cz>
 <20210526153251.GZ202121@locust>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526153251.GZ202121@locust>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
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
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lmEi6-007jLG-Tx
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
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Ted Tso <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 26-05-21 08:32:51, Darrick J. Wong wrote:
> On Wed, May 26, 2021 at 12:18:40PM +0200, Jan Kara wrote:
> > On Tue 25-05-21 14:37:29, Darrick J. Wong wrote:
> > > On Tue, May 25, 2021 at 03:50:44PM +0200, Jan Kara wrote:
> > > > Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
> > > > purpose of invalidate_lock is exactly the same. Note that the locking in
> > > > __xfs_filemap_fault() slightly changes as filemap_fault() already takes
> > > > invalidate_lock.
> > > > 
> > > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > CC: <linux-xfs@vger.kernel.org>
> > > > CC: "Darrick J. Wong" <darrick.wong@oracle.com>
> > > 
> > > It's djwong@kernel.org now.
> > 
> > OK, updated.
> > 
> > > > @@ -355,8 +358,11 @@ xfs_isilocked(
> > > >  
> > > >  	if (lock_flags & (XFS_MMAPLOCK_EXCL|XFS_MMAPLOCK_SHARED)) {
> > > >  		if (!(lock_flags & XFS_MMAPLOCK_SHARED))
> > > > -			return !!ip->i_mmaplock.mr_writer;
> > > > -		return rwsem_is_locked(&ip->i_mmaplock.mr_lock);
> > > > +			return !debug_locks ||
> > > > +				lockdep_is_held_type(
> > > > +					&VFS_I(ip)->i_mapping->invalidate_lock,
> > > > +					0);
> > > > +		return rwsem_is_locked(&VFS_I(ip)->i_mapping->invalidate_lock);
> > > 
> > > This doesn't look right...
> > > 
> > > If lockdep is disabled, we always return true for
> > > xfs_isilocked(ip, XFS_MMAPLOCK_EXCL) even if nobody holds the lock?
> > > 
> > > Granted, you probably just copy-pasted from the IOLOCK_SHARED clause
> > > beneath it.  Er... oh right, preichl was messing with all that...
> > > 
> > > https://lore.kernel.org/linux-xfs/20201016021005.548850-2-preichl@redhat.com/
> > 
> > Indeed copy-paste programming ;) It certainly makes the assertions happy
> > but useless. Should I pull the patch you reference into the series? It
> > seems to have been uncontroversial and reviewed. Or will you pull the
> > series to xfs tree so I can just rebase on top?
> 
> The full conversion series introduced assertion failures because lockdep
> can't handle some of the ILOCK usage patterns, specifically the fact
> that a thread sometimes takes the ILOCK but then hands the inode to a
> workqueue to avoid overflowing the first thread's stack.  That's why it
> never got merged into the xfs tree.

I see. Yeah, we do "interesting" dances around lockdep fs-freezing
annotations for AIO as well where the freeze protection is inherited from
submission to completion context (we effectively generate false release
event for lockdep when exiting submit context and false acquire event in
the completion context). It can be done but it's ugly and error prone.

> However, that kind of switcheroo isn't done with the
> MMAPLOCK/invalidate_lock, so you could simply pull the patch I linked
> above into your series.

OK, will do!

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
