Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D66B2F18CB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:55:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyybD-0003dZ-Ou; Mon, 11 Jan 2021 14:55:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyybC-0003dT-Rd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BIkuCl2X9XBRz45w+qASVk1j89ruoQVSHTm+LRuKVwY=; b=if3SC36zAmXSjLqA4aF+ANSK83
 ehtYGeDgrDYrRTsuMDh+eXRteW6DJ+jW1U9Dzf4rZgeWXTnkKdDBv2/9UhgCit1NAvOZ1678ye7ux
 EAQ6vHGOB6I1PrYvATzRVqiyXz7i8pfkICB9qDm3xznVkTgbRJBe3hmu9LXfO8jKTcbA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BIkuCl2X9XBRz45w+qASVk1j89ruoQVSHTm+LRuKVwY=; b=Zeqol6fRxNbPtNt0DmaGFx1IEF
 hP1UqzkffWEM40Omk3hddS1zLJCIuPPXjYV4N2My7dCogbdpvZXaIifo4pbSbEbWROtjBLoC8Yc1W
 X4t+TFgj4zIJ2eLaZmIfZayDp0Urezn7RJEvZDPVkDPqLpmUeqUIacK3wxIQ6GU1tXZE=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyay-009aEv-Ll
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:55:14 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 598DDAB7A;
 Mon, 11 Jan 2021 14:54:54 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2460A1E0807; Mon, 11 Jan 2021 15:54:54 +0100 (CET)
Date: Mon, 11 Jan 2021 15:54:54 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111145454.GD18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-6-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyay-009aEv-Ll
Subject: Re: [f2fs-dev] [PATCH v2 05/12] fs: don't call ->dirty_inode for
 lazytime timestamp updates
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

On Fri 08-01-21 23:58:56, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> There is no need to call ->dirty_inode for lazytime timestamp updates
> (i.e. for __mark_inode_dirty(I_DIRTY_TIME)), since by the definition of
> lazytime, filesystems must ignore these updates.  Filesystems only need
> to care about the updated timestamps when they expire.
> 
> Therefore, only call ->dirty_inode when I_DIRTY_INODE is set.
> 
> Based on a patch from Christoph Hellwig:
> https://lore.kernel.org/r/20200325122825.1086872-4-hch@lst.de
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/ext4/inode.c   | 12 +-----------
>  fs/f2fs/super.c   |  3 ---
>  fs/fs-writeback.c |  6 +++---
>  fs/gfs2/super.c   |  2 --
>  4 files changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 27946882d4ce4..4cc6c7834312f 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -5933,26 +5933,16 @@ int __ext4_mark_inode_dirty(handle_t *handle, struct inode *inode,
>   * If the inode is marked synchronous, we don't honour that here - doing
>   * so would cause a commit on atime updates, which we don't bother doing.
>   * We handle synchronous inodes at the highest possible level.
> - *
> - * If only the I_DIRTY_TIME flag is set, we can skip everything.  If
> - * I_DIRTY_TIME and I_DIRTY_SYNC is set, the only inode fields we need
> - * to copy into the on-disk inode structure are the timestamp files.
>   */
>  void ext4_dirty_inode(struct inode *inode, int flags)
>  {
>  	handle_t *handle;
>  
> -	if (flags == I_DIRTY_TIME)
> -		return;
>  	handle = ext4_journal_start(inode, EXT4_HT_INODE, 2);
>  	if (IS_ERR(handle))
> -		goto out;
> -
> +		return;
>  	ext4_mark_inode_dirty(handle, inode);
> -
>  	ext4_journal_stop(handle);
> -out:
> -	return;
>  }
>  
>  int ext4_change_inode_journal_flag(struct inode *inode, int val)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b4a07fe62d1a5..cc98dc49f4a26 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1196,9 +1196,6 @@ static void f2fs_dirty_inode(struct inode *inode, int flags)
>  			inode->i_ino == F2FS_META_INO(sbi))
>  		return;
>  
> -	if (flags == I_DIRTY_TIME)
> -		return;
> -
>  	if (is_inode_flag_set(inode, FI_AUTO_RECOVER))
>  		clear_inode_flag(inode, FI_AUTO_RECOVER);
>  
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index c41cb887eb7d3..b7616bbd55336 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -2255,16 +2255,16 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>  	 * Don't do this for I_DIRTY_PAGES - that doesn't actually
>  	 * dirty the inode itself
>  	 */
> -	if (flags & (I_DIRTY_INODE | I_DIRTY_TIME)) {
> +	if (flags & I_DIRTY_INODE) {
>  		trace_writeback_dirty_inode_start(inode, flags);
>  
>  		if (sb->s_op->dirty_inode)
>  			sb->s_op->dirty_inode(inode, flags);
>  
>  		trace_writeback_dirty_inode(inode, flags);
> -	}
> -	if (flags & I_DIRTY_INODE)
> +
>  		flags &= ~I_DIRTY_TIME;
> +	}
>  	dirtytime = flags & I_DIRTY_TIME;
>  
>  	/*
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 2f56acc41c049..042b94288ff11 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -562,8 +562,6 @@ static void gfs2_dirty_inode(struct inode *inode, int flags)
>  	int need_endtrans = 0;
>  	int ret;
>  
> -	if (!(flags & I_DIRTY_INODE))
> -		return;
>  	if (unlikely(gfs2_withdrawn(sdp)))
>  		return;
>  	if (!gfs2_glock_is_locked_by_me(ip->i_gl)) {
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
