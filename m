Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C895391BDA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 17:25:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llvPY-0001Bm-KM; Wed, 26 May 2021 15:25:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <djwong@kernel.org>) id 1llvPX-0001Bf-CQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 15:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yaK31paB4eVrRy7IeaGP9TvUAcIoqhXW6gG5tL/CumQ=; b=JPjqbXiMrnZC9G596W0eadFTnu
 lX0RoiA5WPlCVaXM9Hb8tOGlCJOJXsTTviZ7PbawrNUEFZlQ5dHFbAAJr0klfbn0YRR7QCfb+DOEg
 FZk2bWd2/l7+hyLJUIPZHLaspOJGRTRxhLlD7hHb804DH6adu1zOAGRIw2cj121vCx5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yaK31paB4eVrRy7IeaGP9TvUAcIoqhXW6gG5tL/CumQ=; b=Kyqzqk2WgDeMRyagM7qNqjctey
 nwWTWW6WWOeMtr14wh6vCDmxZRX32GFQcUGhJUPbdx3arFRZR1vLNUhOHKb8up6CnjQAvEudMwPwE
 yaVTUI2VHjmuw0lbLFqa7XhGBijBE9hFpAhrVLmKiMTOKwCmldJ7AWLdVJxM+98Jd4WU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1llvPV-0006qt-T8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 15:25:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A6FB61378;
 Wed, 26 May 2021 15:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622042725;
 bh=/uzTTNLjF88gVIvVPehwcj9E7+SDKIBIEbe1++RMcCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vQ7xuH3OSvQiH8WTyODIiNgCaa8VPSIlyo23vb9HtCWw7llMRo4A/QjKfRC588iEs
 cvBicODScd+zWU0/qy9HoNnaXPqGqeM7FPRW1d7eD3je2K9aXlvIXMfyoweXztaME1
 I14haJq08cG54aoOyPVUR07m+a8Dp3PTJnGilKvamk99idXs9eZcznD7NKdNQgHXzw
 MCmHriw/JX66+IvWWdkHQ8tSWchzi7nZ3ymLuHxR3qrqa5nDnh77qs3pFVtTGrDfYH
 PdRj3qcJPIWztj+xrh/HZE/cXxl9nVGPOJbQzuoNKF2vnF6COWpAHtFpeZnx4It663
 X4utnX24c9Niw==
Date: Wed, 26 May 2021 08:25:25 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20210526152525.GY202121@locust>
References: <20210525125652.20457-1-jack@suse.cz>
 <20210525135100.11221-4-jack@suse.cz>
 <20210525204805.GM202121@locust>
 <20210526100702.GB30369@quack2.suse.cz>
 <DM6PR04MB7081EBE7CE3404AB53F62795E7249@DM6PR04MB7081.namprd04.prod.outlook.com>
 <20210526134518.GF30369@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210526134518.GF30369@quack2.suse.cz>
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
X-Headers-End: 1llvPV-0006qt-T8
Subject: Re: [f2fs-dev] [PATCH 04/13] mm: Add functions to lock
 invalidate_lock for two mappings
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
Cc: "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Ted Tso <tytso@mit.edu>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "hch@infradead.org" <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Miklos Szeredi <miklos@szeredi.hu>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 26, 2021 at 03:45:18PM +0200, Jan Kara wrote:
> On Wed 26-05-21 12:11:43, Damien Le Moal wrote:
> > On 2021/05/26 19:07, Jan Kara wrote:
> > > On Tue 25-05-21 13:48:05, Darrick J. Wong wrote:
> > >> On Tue, May 25, 2021 at 03:50:41PM +0200, Jan Kara wrote:
> > >>> Some operations such as reflinking blocks among files will need to lock
> > >>> invalidate_lock for two mappings. Add helper functions to do that.
> > >>>
> > >>> Signed-off-by: Jan Kara <jack@suse.cz>
> > >>> ---
> > >>>  include/linux/fs.h |  6 ++++++
> > >>>  mm/filemap.c       | 38 ++++++++++++++++++++++++++++++++++++++
> > >>>  2 files changed, 44 insertions(+)
> > >>>
> > >>> diff --git a/include/linux/fs.h b/include/linux/fs.h
> > >>> index 897238d9f1e0..e6f7447505f5 100644
> > >>> --- a/include/linux/fs.h
> > >>> +++ b/include/linux/fs.h
> > >>> @@ -822,6 +822,12 @@ static inline void inode_lock_shared_nested(struct inode *inode, unsigned subcla
> > >>>  void lock_two_nondirectories(struct inode *, struct inode*);
> > >>>  void unlock_two_nondirectories(struct inode *, struct inode*);
> > >>>  
> > >>> +void filemap_invalidate_down_write_two(struct address_space *mapping1,
> > >>> +				       struct address_space *mapping2);
> > >>> +void filemap_invalidate_up_write_two(struct address_space *mapping1,
> > >>
> > >> TBH I find myself wishing that the invalidate_lock used the same
> > >> lock/unlock style wrappers that we use for i_rwsem.
> > >>
> > >> filemap_invalidate_lock(inode1->mapping);
> > >> filemap_invalidate_lock_two(inode1->i_mapping, inode2->i_mapping);
> > > 
> > > OK, and filemap_invalidate_lock_shared() for down_read()? I guess that
> > > works for me.
> > 
> > What about filemap_invalidate_lock_read() and filemap_invalidate_lock_write() ?
> > That reminds the down_read()/down_write() without the slightly confusing down/up.
> 
> Well, if we go for lock wrappers as Darrick suggested, I'd mirror naming
> used for inode_lock(). That is IMO the least confusing option... And that
> naming has _lock and _lock_shared suffixes.

I'd like filemap_invalidate_lock and filemap_invalidate_lock_shared.

--D

> 
> 								Honza
> 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
