Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5C1C60CB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 21:08:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW2vs-0004wH-8J; Tue, 05 May 2020 19:08:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jW2vq-0004vi-Hg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 19:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jD6qkxVpMOOTs4zUHxXmbDys2ThbOwGFDqRL1J1ilpw=; b=bSGtaYHI3G0UJbwAS14qgQTsiz
 UrfFe7N5v8ztWiUeNlyzyMGaxYkFAgl7cltw1memf0sfKAJ3rDNQHZRaGTfPIhfkTVlB68M8vAirA
 snXpy4K33cS5aMvLJ0YU9FegW99h/brzlKwfkw2CQNVhyh1CahW+9Y+OzN12V0PSMEZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jD6qkxVpMOOTs4zUHxXmbDys2ThbOwGFDqRL1J1ilpw=; b=muWbi3wIQEvgW4I5T1eteoYaC1
 7bVBbgbGIMZHlU4gzq1IN7TXLNEHk56Lijgq1Ok40kGfR0wHKP5bMfnc5xEPwm5U9XB1J8GlqMmKo
 AD5R7LxBo+MAnUBqlDp3eDBDjZXh1qv6qIbiNbNbSEagQKYNLl1+YGiLSiUPRt/N8jNQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jW2vp-00Bhse-E6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 19:08:42 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD2D8206B9;
 Tue,  5 May 2020 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588705711;
 bh=mVzsMafczB2qs5W4j7HW8BQBAAFyRC6PAqX0Q2mK0f0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RU4+H/3k94TUb+vRJxvUd8LSDzIgogLbrBNFDkfR3mygf+YHJmSZMOf+B+YiBYuNy
 1wG0m+djLQeonwmVQbvpOrvhow9qHKFDC45NJzjo4/v0QI/fVWF3fc0opCi9eht0R9
 RiOUZpZAAL3vMsupVogRK1IKdHnQvjZgpCQQyPtg=
Date: Tue, 5 May 2020 12:08:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200505190830.GD55221@google.com>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
 <20200505181941.GC98848@gmail.com>
 <20200505184932.GC55221@google.com>
 <20200505190108.GB128280@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505190108.GB128280@sol.localdomain>
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
X-Headers-End: 1jW2vp-00Bhse-E6
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
> On Tue, May 05, 2020 at 11:49:32AM -0700, Jaegeuk Kim wrote:
> > How about this?
> > 
> > From 2a6b0e53e592854306062a2dc35db2d8f79062f2 Mon Sep 17 00:00:00 2001
> > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > Date: Tue, 5 May 2020 11:33:29 -0700
> > Subject: [PATCH] f2fs: find a living dentry when finding parent ino
> > 
> > We need to check any dentry still alive to get parent inode number.
> > 
> > Suggested-by: Eric Biggers <ebiggers@kernel.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/file.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index a0a4413d6083b..95139cb85faca 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -169,9 +169,8 @@ static int get_parent_ino(struct inode *inode, nid_t *pino)
> >  {
> >  	struct dentry *dentry;
> >  
> > -	inode = igrab(inode);
> > -	dentry = d_find_any_alias(inode);
> > -	iput(inode);
> > +	/* Need to check if valid dentry still exists. */
> > +	dentry = d_find_alias(inode);
> >  	if (!dentry)
> >  		return 0;
> >  
> 
> It's fine, but it could use some more explanation.  (What's a "valid dentry"?)
> How about the following?

Cool, I took this. Thanks,

> 
> >From f8fe7d57eead1423e8548ac7a5ec881d701466a5 Mon Sep 17 00:00:00 2001
> From: Eric Biggers <ebiggers@google.com>
> Date: Tue, 5 May 2020 11:41:11 -0700
> Subject: [PATCH] f2fs: correctly fix the parent inode number during fsync()
> 
> fsync() may be called on a deleted file that's still open.  So when
> fsync() tries to set the parent inode number when the inode has
> LOST_PINO and i_nlink == 1 (to avoid later checkpoints), it needs to
> make sure to get the parent directory via a non-deleted alias.
> 
> Also remove the unnecessary igrab() and iput(), as the caller already
> holds a reference to the inode.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/file.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6ab8f621a3c5a2..b3069188fd3478 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -165,9 +165,11 @@ static int get_parent_ino(struct inode *inode, nid_t *pino)
>  {
>  	struct dentry *dentry;
>  
> -	inode = igrab(inode);
> -	dentry = d_find_any_alias(inode);
> -	iput(inode);
> +	/*
> +	 * Make sure to get the non-deleted alias.  The alias associated with
> +	 * the open file descriptor being fsync()'ed may be deleted already.
> +	 */
> +	dentry = d_find_alias(inode);
>  	if (!dentry)
>  		return 0;
>  
> -- 
> 2.26.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
