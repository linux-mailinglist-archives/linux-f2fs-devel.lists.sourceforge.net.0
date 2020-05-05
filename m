Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863A1C5FEE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 May 2020 20:20:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jW2Ai-0001a6-2a; Tue, 05 May 2020 18:20:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jW2Ag-0001Zz-EH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 18:19:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iGbDrwlFd2S5ugc+um9phevaBc9VrrTOyV/oCEz5viY=; b=LJeZsk6yrrNyWQP8FlxXqYBXPw
 GFfKG8Wpk3ZZC3ktUCbtJPyHQfKjB19JEd4Oe6rRIsD+RNR2ctqYgXemRKxMnpQoUBpOWtIh0Rrow
 xWC22tEyZwNvz6JL9XWd9R7TNf0KN9Bn2IM67vDjM/e41n/ULQqD4K8Iiy3LIiB1rYk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iGbDrwlFd2S5ugc+um9phevaBc9VrrTOyV/oCEz5viY=; b=Kp+nTFqFZ6QJ3j5vpoBM7unyve
 XKeTETBBL/5kBD1nWaA3vR8NMF2wXfzn60CmUuodWVTZzy4yky4Xs7KzoonaSp4LbJE34nTbZ+bK7
 n7sPLERQ3xjYy2PR/XGm9XUz7tsqE5fvXYJfKDtfUMgm2XpkbSCzthzNAJBX5FvDQ0n0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jW2Ad-008Yrf-GV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 May 2020 18:19:58 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A218E20663;
 Tue,  5 May 2020 18:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588702782;
 bh=yZzkSmvvKpe0G5yUuD0K6ah1YcmbfcINzZSizvYm2fE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R67Z/lbPtsO5THBxKzX2UlLhSUm2vt0TOUX9sbZh4djBdEvxdDZsZKamROXY/lUDk
 45RwmPjXsu/PJUGCFkivx2adACAXmQgXLE9PpopTyfNZZUgoXkvJRiKgv2s65OjKWz
 ZxQGDWUnKqLxY8xjBuFDHX627MfXB7blez9pNJvE=
Date: Tue, 5 May 2020 11:19:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200505181941.GC98848@gmail.com>
References: <20200505153139.201697-1-jaegeuk@kernel.org>
 <20200505165847.GA98848@gmail.com>
 <20200505181323.GA55221@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505181323.GA55221@google.com>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jW2Ad-008Yrf-GV
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

On Tue, May 05, 2020 at 11:13:23AM -0700, Jaegeuk Kim wrote:
> On 05/05, Eric Biggers wrote:
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
> 
> Hi Eric,
> 
> > 
> > This doesn't appear to be necessary.  parent_ino() is:
> > 
> > 	spin_lock(&dentry->d_lock);
> > 	res = dentry->d_parent->d_inode->i_ino;
> > 	spin_unlock(&dentry->d_lock);
> > 
> > Since dentry is locked and referenced, ->d_parent is stable and positive.
> 
> I see, thanks. :)
> 
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
> 
> Ack.
> 
> > 
> > BTW, d_find_any_alias() is unnecessary too.  This code should just be using
> > file_dentry(file) from f2fs_do_sync_file().
> 
> How about this?
> 
> From 9aee969a413b1ed22b48573071bc93fbb4a2002d Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Tue, 5 May 2020 11:08:58 -0700
> Subject: [PATCH] f2fs: remove unnecessary dentry locks
> 
> As Eric commented, let's kill unnecessary dentry ops when recovering
> parent inode number.
> 
> Suggested-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/file.c | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index a0a4413d6083b..711cebad36fc5 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -165,21 +165,6 @@ static const struct vm_operations_struct f2fs_file_vm_ops = {
>  	.page_mkwrite	= f2fs_vm_page_mkwrite,
>  };
>  
> -static int get_parent_ino(struct inode *inode, nid_t *pino)
> -{
> -	struct dentry *dentry;
> -
> -	inode = igrab(inode);
> -	dentry = d_find_any_alias(inode);
> -	iput(inode);
> -	if (!dentry)
> -		return 0;
> -
> -	*pino = parent_ino(dentry);
> -	dput(dentry);
> -	return 1;
> -}
> -
>  static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> @@ -223,14 +208,15 @@ static bool need_inode_page_update(struct f2fs_sb_info *sbi, nid_t ino)
>  	return ret;
>  }
>  
> -static void try_to_fix_pino(struct inode *inode)
> +static void try_to_fix_pino(struct dentry *dentry)
>  {
> +	struct inode *inode = d_inode(dentry);
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> -	nid_t pino;
>  
>  	down_write(&fi->i_sem);
> -	if (file_wrong_pino(inode) && inode->i_nlink == 1 &&
> -			get_parent_ino(inode, &pino)) {
> +	if (file_wrong_pino(inode) && inode->i_nlink == 1) {
> +		nid_t pino = parent_ino(dentry);
> +
>  		f2fs_i_pino_write(inode, pino);
>  		file_got_pino(inode);
>  	}
> @@ -310,7 +296,7 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>  		 * We've secured consistency through sync_fs. Following pino
>  		 * will be used only for fsynced inodes after checkpoint.
>  		 */
> -		try_to_fix_pino(inode);
> +		try_to_fix_pino(file_dentry(file));
>  		clear_inode_flag(inode, FI_APPEND_WRITE);
>  		clear_inode_flag(inode, FI_UPDATE_WRITE);
>  		goto out;

Actually, I think this is wrong because the fsync can be done via a file
descriptor that was opened to a now-deleted link to the file.

We need to find the dentry whose parent directory is still exists, i.e. the
parent directory that is counting towards 'inode->i_nlink == 1'.

I think d_find_alias() is what we're looking for.

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6ab8f621a3c5..855f27468baa 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -165,13 +165,13 @@ static int get_parent_ino(struct inode *inode, nid_t *pino)
 {
        struct dentry *dentry;

-       inode = igrab(inode);
-       dentry = d_find_any_alias(inode);
-       iput(inode);
+       dentry = d_find_alias(inode);
        if (!dentry)
                return 0;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
