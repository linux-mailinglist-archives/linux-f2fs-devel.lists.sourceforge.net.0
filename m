Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D53C1C5F74
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 19:59:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW1qn-0000iy-Tf; Tue, 05 May 2020 17:59:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jW1ql-0000ij-Tw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 17:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0RyJjZmN5ab63n2/skA2THvBL78N4ZhP8TG4vIvQQG0=; b=humWHe2JhbQ9tx9yKXBYW9htvT
 oYqqj9kRn/OQoG0E6jsgG2u25Wn0DDZ/VbDJft2ceYEIhX1YlNh3wYNhdB+QaOwNZv6gwT83OUq03
 OLkR55ACxllecPciu7wTWWYfCl3wWGFs8ogUV4NVvuXQpr1w9lX/EzkV440vw0CvQQcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0RyJjZmN5ab63n2/skA2THvBL78N4ZhP8TG4vIvQQG0=; b=KxLH0COYWik4eAqRA/l6FIa0F8
 QwZK4S0ihhFG+ZswDPBEKuZ/pwQVb3J4HA2P1c9zq3tiURjL2aqujZzq2JCdYJQevLEMW1j+8B+CJ
 flcXB6K3jLStRjLWvwMLB6KeRqwO0Z6uXdD+lg8vqSqqFIVHMH36dgUEVtLRlPT6RSDo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jW1qc-00BccD-MX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 17:59:23 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 087B1206B8;
 Tue,  5 May 2020 17:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588701549;
 bh=0x7iqbFSynCom3RG2vdz4/c2M4DD2sIIWB2WCjFu2iQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZGVlIeFj3wCCtSNeLmdjQArtitcehSpGtNv7FAO+I6CO8r2EqEtBe601I1+Puzarn
 XF/raACUlARDMJXhC9+siFCPYaGiQGIjFBmLAGLfnoAnZ4lGhMDrTVnxacdQHLqlCC
 2B8cP6Aes4oc9+LraO/fQC7v+4Z3JAi3SSiK5+ss=
Date: Tue, 5 May 2020 10:59:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200505175907.GB98848@gmail.com>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505165847.GA98848@gmail.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jW1qc-00BccD-MX
Subject: Re: [f2fs-dev] [PATCH] f2fs: get parent inode when recovering pino
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, May 05, 2020 at 09:58:47AM -0700, Eric Biggers wrote:
> On Tue, May 05, 2020 at 08:31:39AM -0700, Jaegeuk Kim wrote:
> > We had to grab the inode before retrieving i_ino.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/file.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index a0a4413d6083b..9d4c3e3503567 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -168,6 +168,7 @@ static const struct vm_operations_struct f2fs_file_vm_ops = {
> >  static int get_parent_ino(struct inode *inode, nid_t *pino)
> >  {
> >  	struct dentry *dentry;
> > +	struct inode *parent;
> >  
> >  	inode = igrab(inode);
> >  	dentry = d_find_any_alias(inode);
> > @@ -175,8 +176,13 @@ static int get_parent_ino(struct inode *inode, nid_t *pino)
> >  	if (!dentry)
> >  		return 0;
> >  
> > -	*pino = parent_ino(dentry);
> > +	parent = igrab(d_inode(dentry->d_parent));
> >  	dput(dentry);
> > +	if (!parent)
> > +		return 0;
> > +
> > +	*pino = parent->i_ino;
> > +	iput(parent);
> >  	return 1;
> 
> This doesn't appear to be necessary.  parent_ino() is:
> 
> 	spin_lock(&dentry->d_lock);
> 	res = dentry->d_parent->d_inode->i_ino;
> 	spin_unlock(&dentry->d_lock);
> 
> Since dentry is locked and referenced, ->d_parent is stable and positive.
> 
> In the encrypt+casefold patch I was reviewing, it's indeed necessary, but only
> because there was a check of inode->i_flags added outside the locked region.
> The following would be simpler:
> 
>         spin_lock(&dentry->d_lock);
>         dir = dentry->d_parent->d_inode;
>         *pino = dir->i_ino;
>         needs_recovery = IS_ENCRYPTED(dir) && IS_CASEFOLDED(dir);
>         spin_unlock(&dentry->d_lock);
> 
> BTW, d_find_any_alias() is unnecessary too.  This code should just be using
> file_dentry(file) from f2fs_do_sync_file().
> 

Also, what is this code trying to accomplish?  If it's trying to find the parent
directory of an inode with i_nlink == 1, this isn't the correct way to do it.
The fsync could be done via a deleted file, which would make the wrong p_ino be
set.  I think the correct approach would be to iterate through all the dentry's
aliases, and choose the parent directory that's !IS_DEADDIR().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
