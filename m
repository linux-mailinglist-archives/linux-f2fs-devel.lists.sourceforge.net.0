Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F83571A382
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 17:59:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4kiA-00011S-Ih;
	Thu, 01 Jun 2023 15:59:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1q4ki8-00011M-O2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFcq/Eb7r45HNo6dleB0AAFbS7BGbj7ZZE0LhKNSIgY=; b=a+aWMFgesA8BW6LwDfSA9z/FgP
 tbWLS2hazsj5ruiPyAywBKRShQROhTtcPQX0+O/G62IOyEzTqLZJZ1NmwoHaJ/xbY8mr7t6b1pM6/
 dfwrbHw4RnvFF2lMOOvrpUBYyUx7X0v3e7cBMs083y7MXIPGjOHALbrGKGRdg9MssMyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zFcq/Eb7r45HNo6dleB0AAFbS7BGbj7ZZE0LhKNSIgY=; b=COrV4+t03My+j2ftLE72xwQp1i
 eZeOQLltFzYYVg/vIp6B2K/dV6I56qEKVuZ94OeMi+3mxCuYUADA0xDaWSXBJvujexyesX5xLJAZr
 sy/uIvraZ17lA6vvZROeDA7bq1n5v/W2vrJL0NaSpZQSC7lB1X/Z7UThgY2sA2n77YkA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4ki2-0001Wp-Ij for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 15:59:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 335916471F;
 Thu,  1 Jun 2023 15:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37EF3C4339B;
 Thu,  1 Jun 2023 15:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685635164;
 bh=v6Me0Vi0OPMjC4Nwo6IILVCGNcxNvRB+M3qtqySEtLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2nxWuMGbsdaBc/My2KiKfzRvTPW51vmdYdTMrRn94G3k+0Q33JsvISp8r4BMAnlt
 UEcpP/g+vfFU5G6PKwaNiMED3A57qys/JWvTwvDrwjkfEKd1h9RQ5dJRaC6nHX8n1B
 Kswoql+MByzej5ONv+dxgUOpeIZmhQHhxhq174OGKozqyTzQ3wG38mMhJW6vJoORDK
 Mmizpps1cxv8LaU/pN6OGDLUSSpK84xNw/CBS5sYJtrTf4l/rZXT6hcRjMt2iecuc0
 xEtMUwQvXFY9QvlYGYPIIiGFUECaSR/S0iv51Jd2zl5PIqCx6rj8bc+ujPd706f586
 gPb3KXAU+/vlA==
Date: Thu, 1 Jun 2023 17:59:19 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <20230601-laube-golfball-c31fb218a534@brauner>
References: <20230601104525.27897-1-jack@suse.cz>
 <20230601105830.13168-4-jack@suse.cz>
 <20230601-gebracht-gesehen-c779a56b3bf3@brauner>
 <20230601152449.h4ur5zrfqjqygujd@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230601152449.h4ur5zrfqjqygujd@quack3>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 01, 2023 at 05:24:49PM +0200, Jan Kara wrote:
 > On Thu 01-06-23 15:58:58, Christian Brauner wrote: > > On Thu, Jun 01, 2023
 at 12:58:24PM +0200, Jan Kara wrote: > > > Currently the locking [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4ki2-0001Wp-Ij
Subject: Re: [f2fs-dev] [PATCH v2 4/6] fs: Establish locking order for
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

On Thu, Jun 01, 2023 at 05:24:49PM +0200, Jan Kara wrote:
> On Thu 01-06-23 15:58:58, Christian Brauner wrote:
> > On Thu, Jun 01, 2023 at 12:58:24PM +0200, Jan Kara wrote:
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
> > >  fs/inode.c    | 42 ++++++++++++++++++++++++++++++++++++++++++
> > >  fs/internal.h |  2 ++
> > >  fs/namei.c    |  4 ++--
> > >  3 files changed, 46 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/inode.c b/fs/inode.c
> > > index 577799b7855f..4000ab08bbc0 100644
> > > --- a/fs/inode.c
> > > +++ b/fs/inode.c
> > > @@ -1103,6 +1103,48 @@ void discard_new_inode(struct inode *inode)
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
> > 
> > I think you forgot the opening bracket...
> > I can just fix this up for you though.
> 
> Oh, yes. Apparently I forgot to rerun git-format-patch after fixing up this
> bit. I'm sorry for that. The patch series has survived full ext4 fstests

No problem at all!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
