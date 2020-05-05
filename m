Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D5F1C5FF3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 20:20:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW2BX-0001gW-8i; Tue, 05 May 2020 18:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jW2BV-0001gN-Fw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 18:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bNaxx0yuaf2UkfknBkRZsPaRG1HO/OXT517qn9PJ93w=; b=aQCA2aSHF2prjWJpgLrEQ3Z2Um
 1s5lJoWDqHG4uLfPxY/4cy9cnRyzt2hdHYSoE0+in+o1d2Eqh5VEBX0rdPXdTvt90tnwT6m2ql6QA
 OZnEWwKGle00YFTywzuubCyLPah55LpQOvD9W+bxrP69nTZxO1e7GqUw0gOAqadpuwfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bNaxx0yuaf2UkfknBkRZsPaRG1HO/OXT517qn9PJ93w=; b=Wt7+VrbbFBnXcx4xphD5ct+gzb
 z5v0JOxEbZGN6gwNxi/ZlBPYzm/d2gL/yfl7z7IoUVyUxu3rNS3WGiJG+MAhNkqFx8iQ7/n7iuQR9
 psG8rJd2ER8GGv5NRC8DDDw7rrNkAsECN8i1SqGfjG+I8zxIeqzWwjn08thYZXjFcowk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jW2BU-00Eivl-CR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 18:20:49 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF34120663;
 Tue,  5 May 2020 18:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588702842;
 bh=ZeZCawDZUxiAGh0E3Qdw7+DHNfklBHHQq4cW7/Bml1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qr8sn+d/XkZ7CgQ1XtQVpjFRuDwIcGITLQPkbrbVzG5PSjG6JGHdc/ShQxFBdAV5V
 gw2WRMZ5iN+VkVXnZ3C7AfsCUyVLU8TGOQrOTGHeE4P9FPT/TTS59GUv94ZIqMIABI
 MbmoyN8KRbxCwflXMmYOETX6jNAL3NCyNirFJkk8=
Date: Tue, 5 May 2020 11:20:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200505182042.GB55221@google.com>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505175907.GB98848@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505175907.GB98848@gmail.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jW2BU-00Eivl-CR
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

On 05/05, Eric Biggers wrote:
> On Tue, May 05, 2020 at 09:58:47AM -0700, Eric Biggers wrote:
> > On Tue, May 05, 2020 at 08:31:39AM -0700, Jaegeuk Kim wrote:
> > > We had to grab the inode before retrieving i_ino.
> > > 
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > >  fs/f2fs/file.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index a0a4413d6083b..9d4c3e3503567 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -168,6 +168,7 @@ static const struct vm_operations_struct f2fs_file_vm_ops = {
> > >  static int get_parent_ino(struct inode *inode, nid_t *pino)
> > >  {
> > >  	struct dentry *dentry;
> > > +	struct inode *parent;
> > >  
> > >  	inode = igrab(inode);
> > >  	dentry = d_find_any_alias(inode);
> > > @@ -175,8 +176,13 @@ static int get_parent_ino(struct inode *inode, nid_t *pino)
> > >  	if (!dentry)
> > >  		return 0;
> > >  
> > > -	*pino = parent_ino(dentry);
> > > +	parent = igrab(d_inode(dentry->d_parent));
> > >  	dput(dentry);
> > > +	if (!parent)
> > > +		return 0;
> > > +
> > > +	*pino = parent->i_ino;
> > > +	iput(parent);
> > >  	return 1;
> > 
> > This doesn't appear to be necessary.  parent_ino() is:
> > 
> > 	spin_lock(&dentry->d_lock);
> > 	res = dentry->d_parent->d_inode->i_ino;
> > 	spin_unlock(&dentry->d_lock);
> > 
> > Since dentry is locked and referenced, ->d_parent is stable and positive.
> > 
> > In the encrypt+casefold patch I was reviewing, it's indeed necessary, but only
> > because there was a check of inode->i_flags added outside the locked region.
> > The following would be simpler:
> > 
> >         spin_lock(&dentry->d_lock);
> >         dir = dentry->d_parent->d_inode;
> >         *pino = dir->i_ino;
> >         needs_recovery = IS_ENCRYPTED(dir) && IS_CASEFOLDED(dir);
> >         spin_unlock(&dentry->d_lock);
> > 
> > BTW, d_find_any_alias() is unnecessary too.  This code should just be using
> > file_dentry(file) from f2fs_do_sync_file().
> > 
> 
> Also, what is this code trying to accomplish?  If it's trying to find the parent
> directory of an inode with i_nlink == 1, this isn't the correct way to do it.
> The fsync could be done via a deleted file, which would make the wrong p_ino be
> set.  I think the correct approach would be to iterate through all the dentry's
> aliases, and choose the parent directory that's !IS_DEADDIR().

The intention is to give a chance to recover the pino to avoid performance
drop on fsync() by avoiding checkpoint(). And the purpose of this is to
find a file having single linked file. Otherwise, we'll do checkpoint().

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
