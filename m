Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEFB39F677
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 14:23:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqalt-0004sY-TP; Tue, 08 Jun 2021 12:23:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lqalt-0004sG-EH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 12:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9bGY+Cp/pA/h7guRE2vnnzMhgDr7PUBan0gj2Iw/ofI=; b=SflJFbiiZN2FlRAJvQC8SbxZEH
 RCSuo55Lg8IXlEwHT7C2ePri6cyNS3rJ843Cu+l49SLnNQO4jKAgb5gILBe18gnTJN0gmPDDfP2Nn
 qsb4m+zn7bqeL1grGeXrFdUyt5feSmPI2QFGWIjBZKqQ/Ex90NqfjtGTqKDdxwqqBqxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9bGY+Cp/pA/h7guRE2vnnzMhgDr7PUBan0gj2Iw/ofI=; b=NonBnbKeuOh/s9g6MXs1FGP+NQ
 mxPDW+6O9zDMhsHZMjQS7TU6tDveMolQTbRnRc8pRjzef9B4Ati1xdo4fppzDdjE+C3N3d6q5RRR0
 sPen+bTYXhg8x5NmulXk0Rx7uiVLElhd1VzF2dJ/VDYsrTu1HSI7OV6ksJsUR1+Lbfxw=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lqaln-000pSo-98
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Jun 2021 12:23:54 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 068C71FD4B;
 Tue,  8 Jun 2021 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623155021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9bGY+Cp/pA/h7guRE2vnnzMhgDr7PUBan0gj2Iw/ofI=;
 b=u+SJezkNd+Hoy4TfHmq/mbbx5D8h6raNCIe+MwxggDuvtCqz7pVcD7eM1nbJHaQgq+I3my
 3i7vDVPXx6oHV/Keus/sL+hjeAgtO00KSyTNORn8Zw+1sEM7AY7JmeY5qIvsBhEF5NtDj8
 Srd1wuy2dHheynxeRqlgPZLBXH5MniY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623155021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9bGY+Cp/pA/h7guRE2vnnzMhgDr7PUBan0gj2Iw/ofI=;
 b=NgBZQfRqJnI6VvgsU0Gc4V+xB5uFCK0ttkDE0YMGzDaZvCRCGQg4CZC2NzMIJNyad41SHa
 +dBP2rSIDB0nPdAw==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id E3E48A3B81;
 Tue,  8 Jun 2021 12:23:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CFD9C1F2C94; Tue,  8 Jun 2021 14:23:40 +0200 (CEST)
Date: Tue, 8 Jun 2021 14:23:40 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20210608122340.GH5562@quack2.suse.cz>
References: <20210607144631.8717-1-jack@suse.cz>
 <20210607145236.31852-8-jack@suse.cz>
 <20210607155633.GI2945738@locust>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607155633.GI2945738@locust>
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lqaln-000pSo-98
Subject: Re: [f2fs-dev] [PATCH 08/14] xfs: Convert to use invalidate_lock
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

On Mon 07-06-21 08:56:33, Darrick J. Wong wrote:
> On Mon, Jun 07, 2021 at 04:52:18PM +0200, Jan Kara wrote:
> > Use invalidate_lock instead of XFS internal i_mmap_lock. The intended
> > purpose of invalidate_lock is exactly the same. Note that the locking in
> > __xfs_filemap_fault() slightly changes as filemap_fault() already takes
> > invalidate_lock.
> > 
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > CC: <linux-xfs@vger.kernel.org>
> > CC: "Darrick J. Wong" <djwong@kernel.org>
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > ---
> >  fs/xfs/xfs_file.c  | 13 +++++++-----
> >  fs/xfs/xfs_inode.c | 50 ++++++++++++++++++++++++----------------------
> >  fs/xfs/xfs_inode.h |  1 -
> >  fs/xfs/xfs_super.c |  2 --
> >  4 files changed, 34 insertions(+), 32 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > index 396ef36dcd0a..7cb7703c2209 100644
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
> > @@ -1303,24 +1303,27 @@ __xfs_filemap_fault(
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
> 
> I've been wondering if iomap_page_mkwrite and dax_iomap_fault should be
> taking these locks?  I guess that would violate the premise that iomap
> requires that callers arrange for concurrency control (i.e. iomap
> doesn't take locks).

Well, iomap does take page locks but I agree that generally it stays away
from high-level locks. So keeping invalidate_lock out of it makes more
sense to me as well.

> Code changes look fine, though.
> 
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>

Thanks!

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
