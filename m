Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A29B516B30D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 22:46:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6LYP-0008S3-8V; Mon, 24 Feb 2020 21:46:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j6LYO-0008Rx-W6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=US0AhW/h5o9jN+O1ZF3eFbRlJP2/vQXbtBNNDn9rB74=; b=MyC+d04uW5nXSHlBSYrkEI/Oze
 92cP4mS30jpDTpkMd1wUvmaGa7VDD2rMsYh6siCNF5bVft9HBtt9avVDXGsliZPBB2JJ0SiX3tqk6
 TSn+7aXrsXmj1yqaGGotI/p9rYIX3Gjzheuzr8waS+oQOadoSfUHYhViahPknuEv5r7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=US0AhW/h5o9jN+O1ZF3eFbRlJP2/vQXbtBNNDn9rB74=; b=MCJ5e49lSWrtbHhBxclk3MyQs1
 9QEHA7A7ndtGn2svpW8BYVRdi5K0PWjLBtWUrPaC6t67qHvc0GONtziRt8gYIp6xf0kxPe+9UQbEF
 r0SmhJg3kSAzOckKZyThT2STihLBCFpYzN+aH0t64MYlUQ4DrnA+ZmP+rrGpMsHYPbHg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6LYJ-005Srt-GN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 21:46:16 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D502C21556;
 Mon, 24 Feb 2020 21:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582580765;
 bh=z1i6mPyjX9QN96QoVDwIkGCue6T+aiaxeFUnXYRrfi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dqP6l2T/2FIUunzolALuF9clQGvFZOXhCelT8Qin4TRHtDwzVCnL79h8bNf3MI8AU
 foTvYmuQ2pzY0ANmkJ4J3BbiF4EeAH/MZvlB2rxTeN4DmiNRs1UOslBfA7XIAArBZj
 p90q6kQ20jKtDJM5rZ19ddYjxYwD5Q+W+ahZLSTM=
Date: Mon, 24 Feb 2020 13:46:05 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200224214605.GA77839@google.com>
References: <20200221100922.16781-1-yuchao0@huawei.com>
 <20200221100922.16781-2-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221100922.16781-2-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-Headers-End: 1j6LYJ-005Srt-GN
Subject: Re: [f2fs-dev] [RFC PATCH 2/2] f2fs: introduce
 F2FS_IOC_RELEASE_COMPRESS_BLOCKS
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/21, Chao Yu wrote:
> There are still reserved blocks on compressed inode, this patch
> introduce a new ioctl to help release reserved blocks back to
> filesystem, so that userspace can reuse those freed space.

I thought we can add compressed_blocks into free space, after converting
the file to immutable one. Otherwise, this patch is able to corrupt the
filesystem very easily.

> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/f2fs.h |   6 +++
>  fs/f2fs/file.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 134 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 15199df5d40a..468f807fd917 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -427,6 +427,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>  #define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
>  #define F2FS_IOC_RESIZE_FS		_IOW(F2FS_IOCTL_MAGIC, 16, __u64)
>  #define F2FS_IOC_GET_COMPRESS_BLOCKS	_IOR(F2FS_IOCTL_MAGIC, 17, __u64)
> +#define F2FS_IOC_RELEASE_COMPRESS_BLOCKS				\
> +					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
>  
>  #define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
>  #define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
> @@ -3957,6 +3959,10 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
>  {
>  	int diff = F2FS_I(inode)->i_cluster_size - blocks;
>  
> +	/* don't update i_compr_blocks if saved blocks were released */
> +	if (!add && !F2FS_I(inode)->i_compr_blocks)
> +		return;
> +
>  	if (add) {
>  		F2FS_I(inode)->i_compr_blocks += diff;
>  		stat_add_compr_blocks(inode, diff);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 235708c892af..613f87151d90 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -557,6 +557,7 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  	bool compressed_cluster = false;
>  	int cluster_index = 0, valid_blocks = 0;
>  	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
> +	bool released = !F2FS_I(dn->inode)->i_compr_blocks;
>  
>  	if (IS_INODE(dn->node_page) && f2fs_has_extra_attr(dn->inode))
>  		base = get_extra_isize(dn->inode);
> @@ -595,7 +596,9 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>  			clear_inode_flag(dn->inode, FI_FIRST_BLOCK_WRITTEN);
>  
>  		f2fs_invalidate_blocks(sbi, blkaddr);
> -		nr_free++;
> +
> +		if (released && blkaddr != COMPRESS_ADDR)
> +			nr_free++;
>  	}
>  
>  	if (compressed_cluster)
> @@ -3416,6 +3419,127 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
>  	return put_user(blocks, (u64 __user *)arg);
>  }
>  
> +static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
> +	unsigned int released_blocks = 0;
> +	int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
> +
> +	while (count) {
> +		int compr_blocks = 0;
> +		block_t blkaddr = f2fs_data_blkaddr(dn);
> +		int i;
> +
> +		if (blkaddr != COMPRESS_ADDR) {
> +			dn->ofs_in_node += cluster_size;
> +			goto next;
> +		}
> +
> +		for (i = 0; i < cluster_size; i++, dn->ofs_in_node++) {
> +			blkaddr = f2fs_data_blkaddr(dn);
> +
> +			if (__is_valid_data_blkaddr(blkaddr)) {
> +				compr_blocks++;
> +				if (unlikely(!f2fs_is_valid_blkaddr(sbi, blkaddr,
> +							DATA_GENERIC_ENHANCE)))
> +					return -EFSCORRUPTED;
> +			}
> +
> +			if (blkaddr != NEW_ADDR)
> +				continue;
> +
> +			dn->data_blkaddr = NULL_ADDR;
> +			f2fs_set_data_blkaddr(dn);
> +		}
> +
> +		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, false);
> +		dec_valid_block_count(sbi, dn->inode,
> +					cluster_size - compr_blocks);
> +
> +		released_blocks += cluster_size - compr_blocks;
> +next:
> +		count -= cluster_size;
> +	}
> +
> +	return released_blocks;
> +}
> +
> +static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	pgoff_t page_idx = 0, last_idx;
> +	unsigned int released_blocks = 0;
> +	int ret;
> +
> +	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
> +		return -EOPNOTSUPP;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;
> +
> +	ret = mnt_want_write_file(filp);
> +	if (ret)
> +		return ret;
> +
> +	if (!F2FS_I(inode)->i_compr_blocks)
> +		goto out;
> +
> +	f2fs_balance_fs(F2FS_I_SB(inode), true);
> +
> +	inode_lock(inode);
> +
> +	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	down_write(&F2FS_I(inode)->i_mmap_sem);
> +
> +	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> +
> +	while (page_idx < last_idx) {
> +		struct dnode_of_data dn;
> +		pgoff_t end_offset, count;
> +
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
> +		if (ret) {
> +			if (ret == -ENOENT) {
> +				page_idx = f2fs_get_next_page_offset(&dn,
> +								page_idx);
> +				ret = 0;
> +				continue;
> +			}
> +			break;
> +		}
> +
> +		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> +		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
> +
> +		ret = release_compress_blocks(&dn, count);
> +
> +		f2fs_put_dnode(&dn);
> +
> +		if (ret < 0)
> +			break;
> +
> +		page_idx += count;
> +		released_blocks += ret;
> +	}
> +
> +	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	up_write(&F2FS_I(inode)->i_mmap_sem);
> +
> +	inode_unlock(inode);
> +out:
> +	mnt_drop_write_file(filp);
> +
> +	if (!ret)
> +		ret = put_user(released_blocks, (u64 __user *)arg);
> +
> +	return ret;
> +}
> +
>  long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
> @@ -3496,6 +3620,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_set_volume_name(filp, arg);
>  	case F2FS_IOC_GET_COMPRESS_BLOCKS:
>  		return f2fs_get_compress_blocks(filp, arg);
> +	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
> +		return f2fs_release_compress_blocks(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -3654,6 +3780,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_GET_VOLUME_NAME:
>  	case F2FS_IOC_SET_VOLUME_NAME:
>  	case F2FS_IOC_GET_COMPRESS_BLOCKS:
> +	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
