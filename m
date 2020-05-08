Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5FE1CB136
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 15:58:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jX3WR-0005D8-Hc; Fri, 08 May 2020 13:58:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jX3WP-0005Cf-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 13:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Y05BmAddQ9gRMP3JIqyVTMufkDOqm92tAcpUgLTWeM=; b=nBeq8E3zedDiZoJaWOUWdgk6qb
 o2F2WTbJ0UcrX9UNRJXYN76q1tVUhK7B3gEyADvEBoVsHBp4Mxbcx82fSt2qbeKUR7UmSj3V25mYa
 MiGc5gYawXBH/ta9zvy0K/ELlmbyCsp+ZntFHIcwZ+gJNVc1g1JcTTrF2SheY2HOtq7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/Y05BmAddQ9gRMP3JIqyVTMufkDOqm92tAcpUgLTWeM=; b=ObLsxpvgnUP+VBoC00Lc7jNiCO
 cb7mi/3HXlyc+6/EknBdBb92nx309J3SiGBdSbq7QYc9qxyGW0/BxFU3W12wMng5bF7HuZWf+pLOV
 r69EC9UrSpjMieYEqkylduHRVUXkeFoof3iaqz5kqKFmoyxCesvVfB6JQl4tiAIWWpO8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jX3WO-001uVs-5D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 13:58:37 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 894CC20708;
 Fri,  8 May 2020 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588946310;
 bh=75BmgCekDDypHYhl8o0x+TB4D5woIZ1Ys7LUl8vhFAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HewYAn1MgOghlslV5NEvlvRIrxjL6i/gdFStGYGfAXyRB4D2xL9derTW0LsYUs55M
 ifD71YM0bSU0y1i6il2Ridf6DQpnFY0buL3Sj0liYRv8/kocrJaj6OBxI7tNvuu2Cb
 bR2y0R+9DttltXTV9dKLdNnfiUcdqtPF66s/5l8k=
Date: Fri, 8 May 2020 06:58:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200508135830.GC88927@google.com>
References: <20200508115652.226158-1-daeho43@gmail.com>
 <20200508134831.GB88927@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508134831.GB88927@google.com>
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1jX3WO-001uVs-5D
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove race condition in releasing
 cblocks
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
Cc: kernel@vger.kernel.org, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/08, Jaegeuk Kim wrote:
> Is this v2?

nvm. it seems the same version.

> 
> On 05/08, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > Now, if writing pages and releasing compress blocks occur
> > simultaneously, and releasing cblocks is executed more than one time
> > to a file, then total block count of filesystem and block count of the
> > file could be incorrect and damaged.
> > 
> > We have to execute releasing compress blocks only one time for a file
> > without being interfered by writepages path.
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fs/f2fs/file.c | 34 ++++++++++++++++++++++++----------
> >  1 file changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 4aab4b42d8ba..f7de2a1da528 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -3488,6 +3488,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
> >  	pgoff_t page_idx = 0, last_idx;
> >  	unsigned int released_blocks = 0;
> >  	int ret;
> > +	int writecount;
> >  
> >  	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
> >  		return -EOPNOTSUPP;
> > @@ -3502,20 +3503,33 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
> >  	if (ret)
> >  		return ret;
> >  
> > -	if (!F2FS_I(inode)->i_compr_blocks)
> > -		goto out;
> > -
> >  	f2fs_balance_fs(F2FS_I_SB(inode), true);
> >  
> >  	inode_lock(inode);
> >  
> > -	if (!IS_IMMUTABLE(inode)) {
> > -		F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
> > -		f2fs_set_inode_flags(inode);
> > -		inode->i_ctime = current_time(inode);
> > -		f2fs_mark_inode_dirty_sync(inode, true);
> > +	writecount = atomic_read(&inode->i_writecount);
> > +	if ((filp->f_mode & FMODE_WRITE && writecount != 1) || writecount) {
> > +		ret = -EBUSY;
> > +		goto out;
> >  	}
> >  
> > +	if (IS_IMMUTABLE(inode)) {
> > +		ret = -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> > +	if (ret)
> > +		goto out;
> > +
> > +	if (!F2FS_I(inode)->i_compr_blocks)
> > +		goto out;
> > +
> > +	F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
> > +	f2fs_set_inode_flags(inode);
> > +	inode->i_ctime = current_time(inode);
> > +	f2fs_mark_inode_dirty_sync(inode, true);
> > +
> >  	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >  	down_write(&F2FS_I(inode)->i_mmap_sem);
> >  
> > @@ -3554,9 +3568,9 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
> >  
> >  	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >  	up_write(&F2FS_I(inode)->i_mmap_sem);
> > -
> > -	inode_unlock(inode);
> >  out:
> > +	inode_unlock(inode);
> > +
> >  	mnt_drop_write_file(filp);
> >  
> >  	if (ret >= 0) {
> > -- 
> > 2.26.2.645.ge9eca65c58-goog
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
