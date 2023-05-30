Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2787E71602C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 May 2023 14:42:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3ygD-0008MR-ND;
	Tue, 30 May 2023 12:42:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q3ygC-0008MD-1Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 12:42:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lixrQWP3ePzK7zF6oDcDJMIYN7GfVRwlswmfib+co7o=; b=LZab4lfCJTVuj/yRVrkycixH86
 Rqnmxj05XPjvOswlcR+7LuXAuRpvBNSfAEwdvIS3qrRO/k3UzyeIPu68Dn08HgIWcfOZS7PjdFR6u
 OTMisxdn4Vn7X+Bc/5ztba46/rtVjSniZirsTLYHA/rf7whNf76yOia1N+zhEXw4cqIk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lixrQWP3ePzK7zF6oDcDJMIYN7GfVRwlswmfib+co7o=; b=lIZ2KeEa1zEFMbovU4ivRnMQ6Q
 fyiD+Va9ih18hc2WIaXSsxxd1Y0XHGb5b1ontvbVfElgw02yR0GCTQC/DkYKlYpTVKz2fUDoyiVNu
 xdWB+jmqWh7F7MgC5wKAwKIZRtNSaHvWZAdIqmZUMeWfrpVfDnUbGBb3YJFkGHKaK2GM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3ygC-006YMQ-42 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 12:42:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B761762F7C;
 Tue, 30 May 2023 12:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B3CC433D2;
 Tue, 30 May 2023 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685450538;
 bh=AjbhKWnLkbzSGImSCtxRr31JpRn/bFy4QpGd/SOJtsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U+6p+TL98fxRHUAbLkCHzfVMO5xsp5WqmINUupyMMLssUcIgc7Kmxv+V5Kds/fS0N
 yzdgl57dIZFTnAnMYhyai0TY9oiFNDAeL90OBvAgWMy8D7OVhPQfEttMLr8iPJCiJa
 PdOkheBNknMRnIRgb67UOyGSZX4jrtc6jAD6hFbXNk9vZfqEQi6Jkd/SIVZf0VVWcY
 TDax/ezF+3aGAVkJzc+V/S2laopkDQr19jiOqZOAfD6tWfhr9herMBemtwqsN43Oyk
 fqM1pNJGwLAhDlCQ0WyBCzAlWxBBawRN6NTDWgG2e5AfzdYsZQ/b1Bkm6gyqiAMOp9
 Gg6KXHzh3jOkQ==
Date: Tue, 30 May 2023 14:42:07 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230530-darauf-nordost-4e631cd8f1d0@brauner>
References: <20230525100654.15069-1-jack@suse.cz>
 <20230525101624.15814-4-jack@suse.cz>
 <20230526-polarstern-herrichten-32fc46c63bfc@brauner>
 <20230529124131.gbb3fmhrspl332i6@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230529124131.gbb3fmhrspl332i6@quack3>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, May 29, 2023 at 02:41:31PM +0200, Jan Kara wrote:
 > On Fri 26-05-23 11:45:15, Christian Brauner wrote: > > On Thu, May 25, 2023
 at 12:16:10PM +0200, Jan Kara wrote: > > > Currently the locking [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q3ygC-006YMQ-42
Subject: Re: [f2fs-dev] [PATCH 4/6] fs: Establish locking order for
 unrelated directories
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
Cc: Ted Tso <tytso@mit.edu>, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Al Viro <viro@ZenIV.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 29, 2023 at 02:41:31PM +0200, Jan Kara wrote:
> On Fri 26-05-23 11:45:15, Christian Brauner wrote:
> > On Thu, May 25, 2023 at 12:16:10PM +0200, Jan Kara wrote:
> > > Currently the locking order of inode locks for directories that are not
> > > in ancestor relationship is not defined because all operations that
> > > needed to lock two directories like this were serialized by
> > > sb->s_vfs_rename_mutex. However some filesystems need to lock two
> > > subdirectories for RENAME_EXCHANGE operations and for this we need the
> > > locking order established even for two tree-unrelated directories.
> > > Provide a helper function lock_two_inodes() that establishes lock
> > > ordering for any two inodes and use it in lock_two_directories().
> > > 
> > > CC: stable@vger.kernel.org
> > > Signed-off-by: Jan Kara <jack@suse.cz>
> > > ---
> > >  fs/inode.c    | 34 ++++++++++++++++++++++++++++++++++
> > >  fs/internal.h |  2 ++
> > >  fs/namei.c    |  4 ++--
> > >  3 files changed, 38 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/inode.c b/fs/inode.c
> > > index 577799b7855f..2015fa50d34a 100644
> > > --- a/fs/inode.c
> > > +++ b/fs/inode.c
> > > @@ -1103,6 +1103,40 @@ void discard_new_inode(struct inode *inode)
> > >  }
> > >  EXPORT_SYMBOL(discard_new_inode);
> > >  
> > > +/**
> > > + * lock_two_inodes - lock two inodes (may be regular files but also dirs)
> > > + *
> > > + * Lock any non-NULL argument. The caller must make sure that if he is passing
> > > + * in two directories, one is not ancestor of the other.  Zero, one or two
> > > + * objects may be locked by this function.
> > > + *
> > > + * @inode1: first inode to lock
> > > + * @inode2: second inode to lock
> > > + * @subclass1: inode lock subclass for the first lock obtained
> > > + * @subclass2: inode lock subclass for the second lock obtained
> > > + */
> > > +void lock_two_inodes(struct inode *inode1, struct inode *inode2,
> > > +		     unsigned subclass1, unsigned subclass2)
> > > +{
> > > +	if (!inode1 || !inode2)
> > > +		goto lock;
> > 
> > Before this change in
> > 
> > lock_two_nondirectories(struct inode *inode1, struct inode *inode2)
> > 
> > the swap() would cause the non-NULL inode to always be locked with
> > I_MUTEX_NONDIR2. Now it can be either I_MUTEX_NORMAL or I_MUTEX_NONDIR2.
> > Is that change intentional?
> 
> Kind of. I don't think we really care so I didn't bother to complicate the
> code for this. If you think keeping the lockdep class consistent is worth
> it, I can modify the patch...

Either a short comment or consistent lockdep class would be nice. I know
it probably doesn't matter much but otherwise someone may end up
wondering whether that's ok or not.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
