Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB0445474A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Nov 2021 14:32:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mnL2v-0002ri-5k; Wed, 17 Nov 2021 13:32:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mnL2t-0002rb-1M
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Nov 2021 13:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T6AqMKt71Aq9FAut+tm83mtpbIxTyOCP/CPItVlcDEA=; b=W1LwVI5Zx9PSzNWq7nLzKMosgv
 1OsG7nYGEOTL7pjEXBboWJ9ut3LWUJ12jxTNQE7feeeivWeZJEuEimTWjo6aCtb89wwSsIuTytgmB
 sY6sRwRn++tpiQcMY12T233JOUAGRBz0uc+RwynacqN4e4EkwAduu7EZDLut8xEJrGT0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T6AqMKt71Aq9FAut+tm83mtpbIxTyOCP/CPItVlcDEA=; b=a5D6D7AbOA1mCZwE9hIxAR8M9c
 VTvAa42gh8/Oq5lZdVrz7cPc9U6rIy3Hm1ndLJMzSkzQqs/i4Jfn8hT/KoVWzx+t72uWaBeXQN8S2
 Gz5Rm03macMoE5xEQkROsBiAEPVaiOOEm05W+vHJvWTgH74owAiqcgdgUOLr9Q4DWN08=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mnL2p-00GMnn-RT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Nov 2021 13:32:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2043D61B1B;
 Wed, 17 Nov 2021 13:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637155920;
 bh=FAKUH17O41y0Ipu1xudnI1GYFTVLohaAW24egYbmMPo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GGxU1AVkcOF4zPH7qCV4px7+ZueeyWHReH3Zwlwp/rwaNdJ0SxqArFjapfju4Qdzt
 FGHdL3DdnOOD06nuPYA2wzBTVCfgkiNz1DSXsGeMY/mxCtgQpvrn4+4B9m3a2DpRQH
 AVwQ/YSO8Z1z+PDdP8WIm5sWG2d0AVr7IPvb6guP9VB4ZqS70Kafu7nI4zhFdvaxaz
 ka0ciHeyW7KoBCQtAC5k3rcA2d+Zwo5O8Cx52/+A9EXGsa4V8sLjDpvdGrHm6CBRt2
 0QBD/lvbCncTPvuuslecYVq8J7urXP4G+g+gwSpbmLfZndqBrcrah658dlJVvC13mu
 blGZ1r+AvKz5A==
Message-ID: <e9cad692-148b-2d4b-2017-fd0a2ebd2833@kernel.org>
Date: Wed, 17 Nov 2021 21:31:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211116214510.2934905-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/17 5:45, Jaegeuk Kim wrote: > From: Eric Biggers
 <ebiggers@google.com> > > f2fs_write_begin() assumes that all blocks were
 preallocated by > default unless FI_NO_PREALLOC is explicitly set. [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mnL2p-00GMnn-RT
Subject: Re: [f2fs-dev] [PATCH 1/6] f2fs: rework write preallocations
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
Cc: Eric Biggers <ebiggers@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/17 5:45, Jaegeuk Kim wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> f2fs_write_begin() assumes that all blocks were preallocated by
> default unless FI_NO_PREALLOC is explicitly set.  This invites data
> corruption, as there are cases in which not all blocks are preallocated.
> Commit 47501f87c61a ("f2fs: preallocate DIO blocks when forcing
> buffered_io") fixed one case, but there are others remaining.
> 
> Fix up this logic by replacing this flag with FI_PREALLOCATED_ALL, which
> only gets set if all blocks for the current write were preallocated.
> 
> Also clean up f2fs_preallocate_blocks(), move it to file.c, and make it
> handle some of the logic that was previously in write_iter() directly.
> 
> Jaegeuk:
> DIO to holes are turning into buffered IO in f2fs_direct_IO, so we should
> not preallocate blocks.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/data.c |  55 ++-------------------
>   fs/f2fs/f2fs.h |   3 +-
>   fs/f2fs/file.c | 130 +++++++++++++++++++++++++++++++------------------
>   3 files changed, 87 insertions(+), 101 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9f754aaef558..3b27fb7daa8b 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1384,53 +1384,6 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
>   	return 0;
>   }
>   
> -int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from)
> -{
> -	struct inode *inode = file_inode(iocb->ki_filp);
> -	struct f2fs_map_blocks map;
> -	int flag;
> -	int err = 0;
> -	bool direct_io = iocb->ki_flags & IOCB_DIRECT;
> -
> -	map.m_lblk = F2FS_BLK_ALIGN(iocb->ki_pos);
> -	map.m_len = F2FS_BYTES_TO_BLK(iocb->ki_pos + iov_iter_count(from));
> -	if (map.m_len > map.m_lblk)
> -		map.m_len -= map.m_lblk;
> -	else
> -		map.m_len = 0;
> -
> -	map.m_next_pgofs = NULL;
> -	map.m_next_extent = NULL;
> -	map.m_seg_type = NO_CHECK_TYPE;
> -	map.m_may_create = true;
> -
> -	if (direct_io) {
> -		map.m_seg_type = f2fs_rw_hint_to_seg_type(iocb->ki_hint);
> -		flag = f2fs_force_buffered_io(inode, iocb, from) ?
> -					F2FS_GET_BLOCK_PRE_AIO :
> -					F2FS_GET_BLOCK_PRE_DIO;
> -		goto map_blocks;
> -	}
> -	if (iocb->ki_pos + iov_iter_count(from) > MAX_INLINE_DATA(inode)) {
> -		err = f2fs_convert_inline_inode(inode);
> -		if (err)
> -			return err;
> -	}
> -	if (f2fs_has_inline_data(inode))
> -		return err;
> -
> -	flag = F2FS_GET_BLOCK_PRE_AIO;
> -
> -map_blocks:
> -	err = f2fs_map_blocks(inode, &map, 1, flag);
> -	if (map.m_len > 0 && err == -ENOSPC) {
> -		if (!direct_io)
> -			set_inode_flag(inode, FI_NO_PREALLOC);
> -		err = 0;
> -	}
> -	return err;
> -}
> -
>   void f2fs_do_map_lock(struct f2fs_sb_info *sbi, int flag, bool lock)
>   {
>   	if (flag == F2FS_GET_BLOCK_PRE_AIO) {
> @@ -3339,12 +3292,10 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
>   	int flag;
>   
>   	/*
> -	 * we already allocated all the blocks, so we don't need to get
> -	 * the block addresses when there is no need to fill the page.
> +	 * If a whole page is being written and we already preallocated all the
> +	 * blocks, then there is no need to get a block address now.
>   	 */
> -	if (!f2fs_has_inline_data(inode) && len == PAGE_SIZE &&
> -	    !is_inode_flag_set(inode, FI_NO_PREALLOC) &&
> -	    !f2fs_verity_in_progress(inode))
> +	if (len == PAGE_SIZE && is_inode_flag_set(inode, FI_PREALLOCATED_ALL))
>   		return 0;
>   
>   	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ce9fc9f13000..be871a79c634 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -715,7 +715,7 @@ enum {
>   	FI_INLINE_DOTS,		/* indicate inline dot dentries */
>   	FI_DO_DEFRAG,		/* indicate defragment is running */
>   	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
> -	FI_NO_PREALLOC,		/* indicate skipped preallocated blocks */
> +	FI_PREALLOCATED_ALL,	/* all blocks for write were preallocated */
>   	FI_HOT_DATA,		/* indicate file is hot */
>   	FI_EXTRA_ATTR,		/* indicate file has extra attribute */
>   	FI_PROJ_INHERIT,	/* indicate file inherits projectid */
> @@ -3614,7 +3614,6 @@ void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
>   int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count);
>   int f2fs_reserve_new_block(struct dnode_of_data *dn);
>   int f2fs_get_block(struct dnode_of_data *dn, pgoff_t index);
> -int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *from);
>   int f2fs_reserve_block(struct dnode_of_data *dn, pgoff_t index);
>   struct page *f2fs_get_read_data_page(struct inode *inode, pgoff_t index,
>   			int op_flags, bool for_write);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 92ec2699bc85..4bf77a5bf998 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4235,10 +4235,76 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
>   	return ret;
>   }
>   
> +/*
> + * Preallocate blocks for a write request, if it is possible and helpful to do
> + * so.  Returns a positive number if blocks may have been preallocated, 0 if no
> + * blocks were preallocated, or a negative errno value if something went
> + * seriously wrong.  Also sets FI_PREALLOCATED_ALL on the inode if *all* the
> + * requested blocks (not just some of them) have been allocated.
> + */
> +static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
> +{
> +	struct inode *inode = file_inode(iocb->ki_filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	const loff_t pos = iocb->ki_pos;
> +	const size_t count = iov_iter_count(iter);
> +	struct f2fs_map_blocks map = {};
> +	bool dio = (iocb->ki_flags & IOCB_DIRECT) &&
> +		   !f2fs_force_buffered_io(inode, iocb, iter);
> +	int flag;
> +	int ret;
> +
> +	/* If it will be an out-of-place direct write, don't bother. */
> +	if (dio && f2fs_lfs_mode(sbi))
> +		return 0;
> +
> +	/* No-wait I/O can't allocate blocks. */
> +	if (iocb->ki_flags & IOCB_NOWAIT)
> +		return 0;
> +
> +	/* If it will be a short write, don't bother. */
> +	if (fault_in_iov_iter_readable(iter, count))
> +		return 0;
> +
> +	if (f2fs_has_inline_data(inode)) {
> +		/* If the data will fit inline, don't bother. */
> +		if (pos + count <= MAX_INLINE_DATA(inode))
> +			return 0;
> +		ret = f2fs_convert_inline_inode(inode);
> +		if (ret)
> +			return ret;
> +	}
> +

/* do not preallocate block which is partially written */

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> +	map.m_lblk = F2FS_BLK_ALIGN(pos);
> +	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
> +	if (map.m_len > map.m_lblk)
> +		map.m_len -= map.m_lblk;
> +	else
> +		map.m_len = 0;
> +	map.m_may_create = true;
> +	if (dio) {
> +		map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
> +		flag = F2FS_GET_BLOCK_PRE_DIO;
> +	} else {
> +		map.m_seg_type = NO_CHECK_TYPE;
> +		flag = F2FS_GET_BLOCK_PRE_AIO;
> +	}
> +
> +	ret = f2fs_map_blocks(inode, &map, 1, flag);
> +	/* -ENOSPC is only a fatal error if no blocks could be allocated. */
> +	if (ret < 0 && !(ret == -ENOSPC && map.m_len > 0))
> +		return ret;
> +	if (ret == 0)
> +		set_inode_flag(inode, FI_PREALLOCATED_ALL);
> +	return map.m_len;
> +}
> +
>   static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   {
>   	struct file *file = iocb->ki_filp;
>   	struct inode *inode = file_inode(file);
> +	loff_t target_size;
> +	int preallocated;
>   	ssize_t ret;
>   
>   	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode)))) {
> @@ -4262,84 +4328,54 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   
>   	if (unlikely(IS_IMMUTABLE(inode))) {
>   		ret = -EPERM;
> -		goto unlock;
> +		goto out_unlock;
>   	}
>   
>   	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
>   		ret = -EPERM;
> -		goto unlock;
> +		goto out_unlock;
>   	}
>   
>   	ret = generic_write_checks(iocb, from);
>   	if (ret > 0) {
> -		bool preallocated = false;
> -		size_t target_size = 0;
> -		int err;
> -
> -		if (fault_in_iov_iter_readable(from, iov_iter_count(from)))
> -			set_inode_flag(inode, FI_NO_PREALLOC);
> -
> -		if ((iocb->ki_flags & IOCB_NOWAIT)) {
> +		if (iocb->ki_flags & IOCB_NOWAIT) {
>   			if (!f2fs_overwrite_io(inode, iocb->ki_pos,
>   						iov_iter_count(from)) ||
>   				f2fs_has_inline_data(inode) ||
>   				f2fs_force_buffered_io(inode, iocb, from)) {
> -				clear_inode_flag(inode, FI_NO_PREALLOC);
> -				inode_unlock(inode);
>   				ret = -EAGAIN;
> -				goto out;
> +				goto out_unlock;
>   			}
> -			goto write;
>   		}
> -
> -		if (is_inode_flag_set(inode, FI_NO_PREALLOC))
> -			goto write;
> -
>   		if (iocb->ki_flags & IOCB_DIRECT) {
> -			/*
> -			 * Convert inline data for Direct I/O before entering
> -			 * f2fs_direct_IO().
> -			 */
> -			err = f2fs_convert_inline_inode(inode);
> -			if (err)
> -				goto out_err;
> -			/*
> -			 * If force_buffere_io() is true, we have to allocate
> -			 * blocks all the time, since f2fs_direct_IO will fall
> -			 * back to buffered IO.
> -			 */
> -			if (!f2fs_force_buffered_io(inode, iocb, from) &&
> -					f2fs_lfs_mode(F2FS_I_SB(inode)))
> -				goto write;
> +			ret = f2fs_convert_inline_inode(inode);
> +			if (ret)
> +				goto out_unlock;
>   		}
> -		preallocated = true;
> +		/* Possibly preallocate the blocks for the write. */
>   		target_size = iocb->ki_pos + iov_iter_count(from);
> -
> -		err = f2fs_preallocate_blocks(iocb, from);
> -		if (err) {
> -out_err:
> -			clear_inode_flag(inode, FI_NO_PREALLOC);
> -			inode_unlock(inode);
> -			ret = err;
> -			goto out;
> +		preallocated = f2fs_preallocate_blocks(iocb, from);
> +		if (preallocated < 0) {
> +			ret = preallocated;
> +			goto out_unlock;
>   		}
> -write:
> +
>   		ret = __generic_file_write_iter(iocb, from);
> -		clear_inode_flag(inode, FI_NO_PREALLOC);
>   
> -		/* if we couldn't write data, we should deallocate blocks. */
> -		if (preallocated && i_size_read(inode) < target_size) {
> +		/* Don't leave any preallocated blocks around past i_size. */
> +		if (preallocated > 0 && i_size_read(inode) < target_size) {
>   			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   			filemap_invalidate_lock(inode->i_mapping);
>   			f2fs_truncate(inode);
>   			filemap_invalidate_unlock(inode->i_mapping);
>   			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>   		}
> +		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
>   
>   		if (ret > 0)
>   			f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
>   	}
> -unlock:
> +out_unlock:
>   	inode_unlock(inode);
>   out:
>   	trace_f2fs_file_write_iter(inode, iocb->ki_pos,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
