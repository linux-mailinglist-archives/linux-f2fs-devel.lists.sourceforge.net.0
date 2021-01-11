Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1965B2F191C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 16:05:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyylF-00040r-F8; Mon, 11 Jan 2021 15:05:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyylE-00040j-12
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QdrSOzf48JmiCfgqTz753bXASYsjBUI5seG7kvRylD8=; b=SNJ8I6kvJ3ZSfD/lEqW8/wc7d+
 crikmLtFnjKdiov3m6SMtrKJxtUOcZ12dGw5N134SOAyE5IL++JkY65I/A+Alq8V1lbjEMZPvOOxf
 Lm9XcCfiIdUpG5XP35ocxKo9hqc2Z5PEDnnddYoQtNMErWiajFOdXhrQ7/Ir7YKKJO28=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QdrSOzf48JmiCfgqTz753bXASYsjBUI5seG7kvRylD8=; b=O3Ur0wmFcmorolpGsoKlOUBAhZ
 4bEXuUD/9VSQhv442nP0D3yDsJHGr097UIio44gdI+8UpZUwAZbVTN17P8fee+SnkyUCHN0XMkC79
 sTvASFC+LZfQK8jpe8HGk69ezUP/gy+LgX5Wq29Fz8pHl6RSjrXJvr/aAvxZwPiJsYeY=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyl7-001O45-Pt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:05:35 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A52CAFE2;
 Mon, 11 Jan 2021 15:05:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 39E501E0807; Mon, 11 Jan 2021 16:05:23 +0100 (CET)
Date: Mon, 11 Jan 2021 16:05:23 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111150523.GH18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-10-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-10-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyl7-001O45-Pt
Subject: Re: [f2fs-dev] [PATCH v2 09/12] fs: improve comments for
 writeback_single_inode()
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

On Fri 08-01-21 23:59:00, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Some comments for writeback_single_inode() and
> __writeback_single_inode() are outdated or not very helpful, especially
> with regards to writeback list handling.  Update them.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Yeah, looks more comprehensible :). Thanks for the cleanup. Feel free to
add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/fs-writeback.c | 57 +++++++++++++++++++++++++++--------------------
>  1 file changed, 33 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index cee1df6e3bd43..e91980f493884 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -1442,9 +1442,15 @@ static void requeue_inode(struct inode *inode, struct bdi_writeback *wb,
>  }
>  
>  /*
> - * Write out an inode and its dirty pages. Do not update the writeback list
> - * linkage. That is left to the caller. The caller is also responsible for
> - * setting I_SYNC flag and calling inode_sync_complete() to clear it.
> + * Write out an inode and its dirty pages (or some of its dirty pages, depending
> + * on @wbc->nr_to_write), and clear the relevant dirty flags from i_state.
> + *
> + * This doesn't remove the inode from the writeback list it is on, except
> + * potentially to move it from b_dirty_time to b_dirty due to timestamp
> + * expiration.  The caller is otherwise responsible for writeback list handling.
> + *
> + * The caller is also responsible for setting the I_SYNC flag beforehand and
> + * calling inode_sync_complete() to clear it afterwards.
>   */
>  static int
>  __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
> @@ -1487,9 +1493,10 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  	}
>  
>  	/*
> -	 * Some filesystems may redirty the inode during the writeback
> -	 * due to delalloc, clear dirty metadata flags right before
> -	 * write_inode()
> +	 * Get and clear the dirty flags from i_state.  This needs to be done
> +	 * after calling writepages because some filesystems may redirty the
> +	 * inode during writepages due to delalloc.  It also needs to be done
> +	 * after handling timestamp expiration, as that may dirty the inode too.
>  	 */
>  	spin_lock(&inode->i_lock);
>  	dirty = inode->i_state & I_DIRTY;
> @@ -1524,12 +1531,13 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
>  }
>  
>  /*
> - * Write out an inode's dirty pages. Either the caller has an active reference
> - * on the inode or the inode has I_WILL_FREE set.
> + * Write out an inode's dirty data and metadata on-demand, i.e. separately from
> + * the regular batched writeback done by the flusher threads in
> + * writeback_sb_inodes().  @wbc controls various aspects of the write, such as
> + * whether it is a data-integrity sync (%WB_SYNC_ALL) or not (%WB_SYNC_NONE).
>   *
> - * This function is designed to be called for writing back one inode which
> - * we go e.g. from filesystem. Flusher thread uses __writeback_single_inode()
> - * and does more profound writeback list handling in writeback_sb_inodes().
> + * To prevent the inode from going away, either the caller must have a reference
> + * to the inode, or the inode must have I_WILL_FREE or I_FREEING set.
>   */
>  static int writeback_single_inode(struct inode *inode,
>  				  struct writeback_control *wbc)
> @@ -1544,23 +1552,23 @@ static int writeback_single_inode(struct inode *inode,
>  		WARN_ON(inode->i_state & I_WILL_FREE);
>  
>  	if (inode->i_state & I_SYNC) {
> -		if (wbc->sync_mode != WB_SYNC_ALL)
> -			goto out;
>  		/*
> -		 * It's a data-integrity sync. We must wait. Since callers hold
> -		 * inode reference or inode has I_WILL_FREE set, it cannot go
> -		 * away under us.
> +		 * Writeback is already running on the inode.  For WB_SYNC_NONE,
> +		 * that's enough and we can just return.  For WB_SYNC_ALL, we
> +		 * must wait for the existing writeback to complete, then do
> +		 * writeback again if there's anything left.
>  		 */
> +		if (wbc->sync_mode != WB_SYNC_ALL)
> +			goto out;
>  		__inode_wait_for_writeback(inode);
>  	}
>  	WARN_ON(inode->i_state & I_SYNC);
>  	/*
> -	 * Skip inode if it is clean and we have no outstanding writeback in
> -	 * WB_SYNC_ALL mode. We don't want to mess with writeback lists in this
> -	 * function since flusher thread may be doing for example sync in
> -	 * parallel and if we move the inode, it could get skipped. So here we
> -	 * make sure inode is on some writeback list and leave it there unless
> -	 * we have completely cleaned the inode.
> +	 * If the inode is already fully clean, then there's nothing to do.
> +	 *
> +	 * For data-integrity syncs we also need to check whether any pages are
> +	 * still under writeback, e.g. due to prior WB_SYNC_NONE writeback.  If
> +	 * there are any such pages, we'll need to wait for them.
>  	 */
>  	if (!(inode->i_state & I_DIRTY_ALL) &&
>  	    (wbc->sync_mode != WB_SYNC_ALL ||
> @@ -1576,8 +1584,9 @@ static int writeback_single_inode(struct inode *inode,
>  	wb = inode_to_wb_and_lock_list(inode);
>  	spin_lock(&inode->i_lock);
>  	/*
> -	 * If inode is clean, remove it from writeback lists. Otherwise don't
> -	 * touch it. See comment above for explanation.
> +	 * If the inode is now fully clean, then it can be safely removed from
> +	 * its writeback list (if any).  Otherwise the flusher threads are
> +	 * responsible for the writeback lists.
>  	 */
>  	if (!(inode->i_state & I_DIRTY_ALL))
>  		inode_io_list_del_locked(inode, wb);
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
