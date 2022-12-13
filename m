Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4E564ACF6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 02:22:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4u0R-0008VX-78;
	Tue, 13 Dec 2022 01:22:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p4u0P-0008VR-UL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 01:22:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iB7S9GVrCs6FBJ+jwsnHpsQZg3z8vDrIvMm50jy70l8=; b=PsfJOpmlxiS9RFC22ADihY+DJ9
 iHxdJxN8zEQu8lcs/CtbvuDacTFGYxBbuZQ7Y4C7ksB5TU9dvt2Gbl6om2vKiEFYMua0SvbuW3teM
 gdjJhpJmze/q0im42NbtcyiBIW0RIaUaOJ3owT31CcJnLvQThchgo4RdO59eJfheZXBs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iB7S9GVrCs6FBJ+jwsnHpsQZg3z8vDrIvMm50jy70l8=; b=WCaVFOFWePZKvv1nkSUyORudxn
 TYxj8P47pNuIabyQcUb49RBQ67qWfB+sOd5jF7xf5P+RsNK14Su+3iO1eum2Vad4LEES9tk/Ars8e
 0m3WTWLGyxBERZjYR/AiVLjbNkzxT4cwxBs3KgIARAL3FeLKldCcb8yStspvOOpXyojo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4u0P-0004a1-1U for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 01:22:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A3D36612F1;
 Tue, 13 Dec 2022 01:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB859C433EF;
 Tue, 13 Dec 2022 01:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670894563;
 bh=2exxXaZLpar7F1P0JLfPERKySI3qf6nSWoAhEMpCUAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aXFk4zIPqOVVl+LDT+a5R4jbRKIVNuEs01S1EBfD6SbT2dFSwJraNw9zXM18np8Rg
 9H8UDFewYhfztaMYE+09RlhtpeLr0Z/E+AFX9GWkywfS+YQKA7DOhanDdLP4RTdVpJ
 LRuPNPiKNr6Z7FKRREaZmrdGk/oRcZ/4VuAJNAnXYPfV14+DcOkrxOs19bZdiaRIaT
 UszJb8Nlz1kMzz67f0WnfhVIkXKuRs/sK9BHtGPOQcXk7c0I/xzWGvrHZYyPYWPJ7z
 Kqa39sQaqoM6SlW6on3+FCFcnaeA4Cb2iOcd3hFKxZBmIoz2bi+gjAhg8vv5IqTbaL
 lyO6HCyQHN6Fw==
Date: Mon, 12 Dec 2022 17:22:41 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Y5fT4SQ9/vuZeWWB@google.com>
References: <20221128091523.1242584-1-hch@lst.de>
 <20221128091523.1242584-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128091523.1242584-13-hch@lst.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Christoph, On 11/28, Christoph Hellwig wrote: > The create
 argument is always identicaly to map->m_may_create, so use > that consistently.
 > > Signed-off-by: Christoph Hellwig <hch@lst.de> > --- > fs/f2fs/data.c
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4u0P-0004a1-1U
Subject: Re: [f2fs-dev] [PATCH 12/15] f2fs: remove the create argument to
 f2fs_map_blocks
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Christoph,

On 11/28, Christoph Hellwig wrote:
> The create argument is always identicaly to map->m_may_create, so use
> that consistently.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/f2fs/data.c              | 32 ++++++++++----------------------
>  fs/f2fs/f2fs.h              |  3 +--
>  fs/f2fs/file.c              | 12 ++++++------
>  include/trace/events/f2fs.h | 11 ++++-------
>  4 files changed, 21 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2ae8fcf7cf49f4..730b58ba97c0ae 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1454,8 +1454,7 @@ int f2fs_get_block_locked(struct dnode_of_data *dn, pgoff_t index)
>   * maps continuous logical blocks to physical blocks, and return such
>   * info via f2fs_map_blocks structure.
>   */
> -int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
> -						int create, int flag)
> +int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  {
>  	unsigned int maxblocks = map->m_len;
>  	struct dnode_of_data dn;
> @@ -1484,11 +1483,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  	pgofs =	(pgoff_t)map->m_lblk;
>  	end = pgofs + maxblocks;
>  
> -	if (!create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
> -		if (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&

Any reason to remove this condition?

Thanks,

> -							map->m_may_create)
> -			goto next_dnode;
> -
> +	if (!map->m_may_create && f2fs_lookup_extent_cache(inode, pgofs, &ei)) {
>  		map->m_pblk = ei.blk + pgofs - ei.fofs;
>  		map->m_len = min((pgoff_t)maxblocks, ei.fofs + ei.len - pgofs);
>  		map->m_flags = F2FS_MAP_MAPPED;
> @@ -1501,18 +1496,12 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  						map->m_pblk, map->m_len);
>  
>  		if (map->m_multidev_dio) {
> -			block_t blk_addr = map->m_pblk;
> -
>  			bidx = f2fs_target_device_index(sbi, map->m_pblk);
>  
>  			map->m_bdev = FDEV(bidx).bdev;
>  			map->m_pblk -= FDEV(bidx).start_blk;
>  			map->m_len = min(map->m_len,
>  				FDEV(bidx).end_blk + 1 - map->m_pblk);
> -
> -			if (map->m_may_create)
> -				f2fs_update_device_state(sbi, inode->i_ino,
> -							blk_addr, map->m_len);
>  		}
>  		goto out;
>  	}
> @@ -1579,7 +1568,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  			set_inode_flag(inode, FI_APPEND_WRITE);
>  		}
>  	} else {
> -		if (create) {
> +		if (map->m_may_create) {
>  			if (unlikely(f2fs_cp_error(sbi))) {
>  				err = -EIO;
>  				goto sync_out;
> @@ -1753,7 +1742,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
>  		f2fs_balance_fs(sbi, dn.node_changed);
>  	}
>  out:
> -	trace_f2fs_map_blocks(inode, map, create, flag, err);
> +	trace_f2fs_map_blocks(inode, map, flag, err);
>  	return err;
>  }
>  
> @@ -1775,7 +1764,7 @@ bool f2fs_overwrite_io(struct inode *inode, loff_t pos, size_t len)
>  
>  	while (map.m_lblk < last_lblk) {
>  		map.m_len = last_lblk - map.m_lblk;
> -		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_DEFAULT);
> +		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
>  		if (err || map.m_len == 0)
>  			return false;
>  		map.m_lblk += map.m_len;
> @@ -1949,7 +1938,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		map.m_len = cluster_size - count_in_cluster;
>  	}
>  
> -	ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
> +	ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_FIEMAP);
>  	if (ret)
>  		goto out;
>  
> @@ -2082,7 +2071,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  	map->m_lblk = block_in_file;
>  	map->m_len = last_block - block_in_file;
>  
> -	ret = f2fs_map_blocks(inode, map, 0, F2FS_GET_BLOCK_DEFAULT);
> +	ret = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_DEFAULT);
>  	if (ret)
>  		goto out;
>  got_it:
> @@ -3779,7 +3768,7 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
>  		map.m_next_pgofs = NULL;
>  		map.m_seg_type = NO_CHECK_TYPE;
>  
> -		if (!f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_BMAP))
> +		if (!f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_BMAP))
>  			blknr = map.m_pblk;
>  	}
>  out:
> @@ -3887,7 +3876,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
>  		map.m_seg_type = NO_CHECK_TYPE;
>  		map.m_may_create = false;
>  
> -		ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
> +		ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_FIEMAP);
>  		if (ret)
>  			goto out;
>  
> @@ -4116,8 +4105,7 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  	if (flags & IOMAP_WRITE)
>  		map.m_may_create = true;
>  
> -	err = f2fs_map_blocks(inode, &map, flags & IOMAP_WRITE,
> -			      F2FS_GET_BLOCK_DIO);
> +	err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DIO);
>  	if (err)
>  		return err;
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index a3789dab0aade9..2c49714ac176f3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3801,8 +3801,7 @@ struct page *f2fs_get_lock_data_page(struct inode *inode, pgoff_t index,
>  struct page *f2fs_get_new_data_page(struct inode *inode,
>  			struct page *ipage, pgoff_t index, bool new_i_size);
>  int f2fs_do_write_data_page(struct f2fs_io_info *fio);
> -int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
> -			int create, int flag);
> +int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag);
>  int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  			u64 start, u64 len);
>  int f2fs_encrypt_one_page(struct f2fs_io_info *fio);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cbeb7bd880046e..cb3fce6eec6db9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1742,7 +1742,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  		f2fs_unlock_op(sbi);
>  
>  		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
> -		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
> +		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_DIO);
>  		file_dont_truncate(inode);
>  
>  		f2fs_up_write(&sbi->pin_sem);
> @@ -1755,7 +1755,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>  
>  		map.m_len = expanded;
>  	} else {
> -		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
> +		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_AIO);
>  		expanded = map.m_len;
>  	}
>  out_err:
> @@ -2588,7 +2588,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  	 */
>  	while (map.m_lblk < pg_end) {
>  		map.m_len = pg_end - map.m_lblk;
> -		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_DEFAULT);
> +		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
>  		if (err)
>  			goto out;
>  
> @@ -2635,7 +2635,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  
>  do_map:
>  		map.m_len = pg_end - map.m_lblk;
> -		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_DEFAULT);
> +		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT);
>  		if (err)
>  			goto clear_out;
>  
> @@ -3209,7 +3209,7 @@ int f2fs_precache_extents(struct inode *inode)
>  		map.m_len = end - map.m_lblk;
>  
>  		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
> -		err = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_PRECACHE);
> +		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRECACHE);
>  		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>  		if (err)
>  			return err;
> @@ -4446,7 +4446,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>  		flag = F2FS_GET_BLOCK_PRE_AIO;
>  	}
>  
> -	ret = f2fs_map_blocks(inode, &map, 1, flag);
> +	ret = f2fs_map_blocks(inode, &map, flag);
>  	/* -ENOSPC|-EDQUOT are fine to report the number of allocated blocks. */
>  	if (ret < 0 && !((ret == -ENOSPC || ret == -EDQUOT) && map.m_len > 0))
>  		return ret;
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index c6b372401c2787..cbf7e0d1a22387 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -562,10 +562,10 @@ TRACE_EVENT(f2fs_file_write_iter,
>  );
>  
>  TRACE_EVENT(f2fs_map_blocks,
> -	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map,
> -				int create, int flag, int ret),
> +	TP_PROTO(struct inode *inode, struct f2fs_map_blocks *map, int flag,
> +		 int ret),
>  
> -	TP_ARGS(inode, map, create, flag, ret),
> +	TP_ARGS(inode, map, flag, ret),
>  
>  	TP_STRUCT__entry(
>  		__field(dev_t,	dev)
> @@ -577,7 +577,6 @@ TRACE_EVENT(f2fs_map_blocks,
>  		__field(int,	m_seg_type)
>  		__field(bool,	m_may_create)
>  		__field(bool,	m_multidev_dio)
> -		__field(int,	create)
>  		__field(int,	flag)
>  		__field(int,	ret)
>  	),
> @@ -592,7 +591,6 @@ TRACE_EVENT(f2fs_map_blocks,
>  		__entry->m_seg_type	= map->m_seg_type;
>  		__entry->m_may_create	= map->m_may_create;
>  		__entry->m_multidev_dio	= map->m_multidev_dio;
> -		__entry->create		= create;
>  		__entry->flag		= flag;
>  		__entry->ret		= ret;
>  	),
> @@ -600,7 +598,7 @@ TRACE_EVENT(f2fs_map_blocks,
>  	TP_printk("dev = (%d,%d), ino = %lu, file offset = %llu, "
>  		"start blkaddr = 0x%llx, len = 0x%llx, flags = %u, "
>  		"seg_type = %d, may_create = %d, multidevice = %d, "
> -		"create = %d, flag = %d, err = %d",
> +		"flag = %d, err = %d",
>  		show_dev_ino(__entry),
>  		(unsigned long long)__entry->m_lblk,
>  		(unsigned long long)__entry->m_pblk,
> @@ -609,7 +607,6 @@ TRACE_EVENT(f2fs_map_blocks,
>  		__entry->m_seg_type,
>  		__entry->m_may_create,
>  		__entry->m_multidev_dio,
> -		__entry->create,
>  		__entry->flag,
>  		__entry->ret)
>  );
> -- 
> 2.30.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
