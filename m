Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8CB2F1903
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:59:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyyfa-0006hR-OM; Mon, 11 Jan 2021 14:59:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyyfZ-0006hK-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpf0oVhDqoXcgY4ra3WLZbLcSMugjBMzl8DWT6tUjLY=; b=VtWnKKs6NQ8UXHuIWNHhDxtieB
 mC0tVx49K29ECIIeTyX3XEHZTWG3G17FDv2FUflNhfE62LsWLmPysgci06gltCR0T7xGsMA2fj5z7
 dcFoEw/3hBk8qkpoMQWEjXX2RauZjpkJ0sMvOnosZQ4OLjrrtg4yoTShzGfqdi+6kCtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jpf0oVhDqoXcgY4ra3WLZbLcSMugjBMzl8DWT6tUjLY=; b=OGebHIecirrerFk6Sog0+UUCvf
 w6WQImUPEcQkoKEKKCs6xUk2jtgl4MrV8GZbGDen86XzD7zGU9E/cpvhC1Gl/CowVi/2/lTVojG/G
 jcqaq5ePCwAlvXWw/ycCCnKKm5brnXqViAWcuhtCfOqdo+iT+LUcL6uQ8uBAea0h+GY4=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyfP-009bHW-Rd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:59:45 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85BC0AD1E;
 Mon, 11 Jan 2021 14:59:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4933C1E0807; Mon, 11 Jan 2021 15:59:29 +0100 (CET)
Date: Mon, 11 Jan 2021 15:59:29 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111145929.GF18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-8-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-8-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyfP-009bHW-Rd
Subject: Re: [f2fs-dev] [PATCH v2 07/12] fs: clean up __mark_inode_dirty() a
 bit
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 08-01-21 23:58:58, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Improve some comments, and don't bother checking for the I_DIRTY_TIME
> flag in the case where we just cleared it.
> 
> Also, warn if I_DIRTY_TIME and I_DIRTY_PAGES are passed to
> __mark_inode_dirty() at the same time, as this case isn't handled.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fs-writeback.c | 49 +++++++++++++++++++++++++++++------------------
>  1 file changed, 30 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index 2e6064012f7d3..80ee9816d9df5 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -2219,23 +2219,24 @@ static noinline void block_dump___mark_inode_dirty(struct inode *inode)
>  }
>  
>  /**
> - * __mark_inode_dirty -	internal function
> + * __mark_inode_dirty -	internal function to mark an inode dirty
>   *
>   * @inode: inode to mark
> - * @flags: what kind of dirty (i.e. I_DIRTY_SYNC)
> + * @flags: what kind of dirty, e.g. I_DIRTY_SYNC.  This can be a combination of
> + *	   multiple I_DIRTY_* flags, except that I_DIRTY_TIME can't be combined
> + *	   with I_DIRTY_PAGES.
>   *
> - * Mark an inode as dirty. Callers should use mark_inode_dirty or
> - * mark_inode_dirty_sync.
> + * Mark an inode as dirty.  We notify the filesystem, then update the inode's
> + * dirty flags.  Then, if needed we add the inode to the appropriate dirty list.
>   *
> - * Put the inode on the super block's dirty list.
> + * Most callers should use mark_inode_dirty() or mark_inode_dirty_sync()
> + * instead of calling this directly.
>   *
> - * CAREFUL! We mark it dirty unconditionally, but move it onto the
> - * dirty list only if it is hashed or if it refers to a blockdev.
> - * If it was not hashed, it will never be added to the dirty list
> - * even if it is later hashed, as it will have been marked dirty already.
> + * CAREFUL!  We only add the inode to the dirty list if it is hashed or if it
> + * refers to a blockdev.  Unhashed inodes will never be added to the dirty list
> + * even if they are later hashed, as they will have been marked dirty already.
>   *
> - * In short, make sure you hash any inodes _before_ you start marking
> - * them dirty.
> + * In short, ensure you hash any inodes _before_ you start marking them dirty.
>   *
>   * Note that for blockdevs, inode->dirtied_when represents the dirtying time of
>   * the block-special inode (/dev/hda1) itself.  And the ->dirtied_when field of
> @@ -2247,25 +2248,34 @@ static noinline void block_dump___mark_inode_dirty(struct inode *inode)
>  void __mark_inode_dirty(struct inode *inode, int flags)
>  {
>  	struct super_block *sb = inode->i_sb;
> -	int dirtytime;
> +	int dirtytime = 0;
>  
>  	trace_writeback_mark_inode_dirty(inode, flags);
>  
> -	/*
> -	 * Don't do this for I_DIRTY_PAGES - that doesn't actually
> -	 * dirty the inode itself
> -	 */
>  	if (flags & I_DIRTY_INODE) {
> +		/*
> +		 * Notify the filesystem about the inode being dirtied, so that
> +		 * (if needed) it can update on-disk fields and journal the
> +		 * inode.  This is only needed when the inode itself is being
> +		 * dirtied now.  I.e. it's only needed for I_DIRTY_INODE, not
> +		 * for just I_DIRTY_PAGES or I_DIRTY_TIME.
> +		 */
>  		trace_writeback_dirty_inode_start(inode, flags);
> -
>  		if (sb->s_op->dirty_inode)
>  			sb->s_op->dirty_inode(inode, flags & I_DIRTY_INODE);
> -
>  		trace_writeback_dirty_inode(inode, flags);
>  
> +		/* I_DIRTY_INODE supersedes I_DIRTY_TIME. */
>  		flags &= ~I_DIRTY_TIME;
> +	} else {
> +		/*
> +		 * Else it's either I_DIRTY_PAGES, I_DIRTY_TIME, or nothing.
> +		 * (We don't support setting both I_DIRTY_PAGES and I_DIRTY_TIME
> +		 * in one call to __mark_inode_dirty().)
> +		 */
> +		dirtytime = flags & I_DIRTY_TIME;
> +		WARN_ON_ONCE(dirtytime && flags != I_DIRTY_TIME);
>  	}
> -	dirtytime = flags & I_DIRTY_TIME;
>  
>  	/*
>  	 * Paired with smp_mb() in __writeback_single_inode() for the
> @@ -2288,6 +2298,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>  
>  		inode_attach_wb(inode, NULL);
>  
> +		/* I_DIRTY_INODE supersedes I_DIRTY_TIME. */
>  		if (flags & I_DIRTY_INODE)
>  			inode->i_state &= ~I_DIRTY_TIME;
>  		inode->i_state |= flags;
> -- 
> 2.30.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
