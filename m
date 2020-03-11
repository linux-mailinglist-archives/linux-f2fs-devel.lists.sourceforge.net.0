Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D588180E5F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 04:20:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBrut-0002qO-Ke; Wed, 11 Mar 2020 03:20:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jBrus-0002qH-A8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 03:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fXdC9ZzQ8mYm9keGp7kmNFnko3rMAO5OqVV6byk79Q=; b=NWzT74RVnYKp1xWRC7EEh5mJyN
 4tYN5QH6uZJI7Ar+lNHOs36+GMfwSDu5Ih20OqDgyBozcRbwy8fMx/DaJTeyS1EPj/TJSNXMSy1ok
 PvaIUYobdpYejDWukUIqJsqdEwejrLEDvw5Udtwx85stGtJfOTguDSw/hD0Rpe+7iEfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5fXdC9ZzQ8mYm9keGp7kmNFnko3rMAO5OqVV6byk79Q=; b=beZzr7IQ9Gj4cEFz7xPpU6zYQp
 urPw4bewxiyCqJndEEoKWo6wVYStTJ41jimSzWxECHMcmfwjBsHy7MpRTa9aI6Ncsi2lkOGsh2dfK
 8/uOm1rZi9wKMljVbrk4NZSP0EUfgPoRTeSTXVdK2jdvrew6BjKO0ZXefDc2bvh3TcQA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBruq-004SJA-EC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 03:20:18 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B946F21927;
 Wed, 11 Mar 2020 03:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583896810;
 bh=B7xgBQEUb/r+AEoKXzPSxZbf08c/Z+iCpPzEuSoE/F8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z6Mh5X93gscC3R5GBKJqrSbWul9Y2vkMh+xBH9F34D44D8YlNg+pXwc0LaVkf1rjn
 tywYLH1vl5MiQyJdfJXVSlWtd7GnAL/2lT4PPMK5zccVN8blmwdUm4mobS8hLJxqJy
 use+h+rMW+C8MRrzdDS/MdS017PzI8vhdfcHoDTg=
Date: Tue, 10 Mar 2020 20:20:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20200311032009.GC46757@gmail.com>
References: <20200306004555.GB225345@gmail.com>
 <20200307020043.60118-1-tytso@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200307020043.60118-1-tytso@mit.edu>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.9 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jBruq-004SJA-EC
Subject: Re: [f2fs-dev] [PATCH] writeback: avoid double-writing the inode on
 a lazytime expiration
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
Cc: Linux Filesystem Development List <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 06, 2020 at 09:00:43PM -0500, Theodore Ts'o wrote:
> In the case that an inode has dirty timestamp for longer than the
> lazytime expiration timeout (or if all such inodes are being flushed
> out due to a sync or syncfs system call), we need to inform the file
> system that the inode is dirty so that the inode's timestamps can be
> copied out to the on-disk data structures.  That's because if the file
> system supports lazytime, it will have ignored the dirty_inode(inode,
> I_DIRTY_TIME) notification when the timestamp was modified in memory.q
> 
> Previously, this was accomplished by calling mark_inode_dirty_sync(),
> but that has the unfortunate side effect of also putting the inode the
> writeback list, and that's not necessary in this case, since we will
> immediately call write_inode() afterwards.
> 
> Eric Biggers noticed that this was causing problems for fscrypt after
> the key was removed[1].
> 
> [1] https://lore.kernel.org/r/20200306004555.GB225345@gmail.com
> 
> Reported-by: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> ---
>  fs/fs-writeback.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index 76ac9c7d32ec..32101349ba97 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1504,8 +1504,9 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  
>  	spin_unlock(&inode->i_lock);
>  
> -	if (dirty & I_DIRTY_TIME)
> -		mark_inode_dirty_sync(inode);
> +	/* This was a lazytime expiration; we need to tell the file system */
> +	if (dirty & I_DIRTY_TIME_EXPIRED && inode->i_sb->s_op->dirty_inode)
> +		inode->i_sb->s_op->dirty_inode(inode, I_DIRTY_TIME_EXPIRED);
>  	/* Don't write the inode if only I_DIRTY_PAGES was set */
>  	if (dirty & ~I_DIRTY_PAGES) {
>  		int err = write_inode(inode, wbc);
> -- 

Thanks Ted!  This fixes the fscrypt test failure.

However, are you sure this works correctly on all filesystems?  I'm not sure
about XFS.  XFS only implements ->dirty_inode(), not ->write_inode(), and in its
->dirty_inode() it does:

	static void
	xfs_fs_dirty_inode(
		struct inode                    *inode,
		int                             flag)
	{
		struct xfs_inode                *ip = XFS_I(inode);
		struct xfs_mount                *mp = ip->i_mount;
		struct xfs_trans                *tp;

		if (!(inode->i_sb->s_flags & SB_LAZYTIME))
			return;
		if (flag != I_DIRTY_SYNC || !(inode->i_state & I_DIRTY_TIME))
			return;

		if (xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp))
			return;
		xfs_ilock(ip, XFS_ILOCK_EXCL);
		xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
		xfs_trans_log_inode(tp, ip, XFS_ILOG_TIMESTAMP);
		xfs_trans_commit(tp);
	}


So flag=I_DIRTY_TIME_EXPIRED will be a no-op.

Maybe you should be using I_DIRTY_SYNC instead?  Or perhaps XFS should be
checking for either I_DIRTY_TIME_EXPIRED or I_DIRTY_SYNC?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
