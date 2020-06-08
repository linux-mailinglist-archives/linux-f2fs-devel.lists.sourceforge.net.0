Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA011F1178
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jun 2020 04:46:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ji7nv-0003gX-NA; Mon, 08 Jun 2020 02:46:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ji7nu-0003gO-1b
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 02:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RTTaRQhmAJbrMZUmT6BtyPI6jOiIeG53/PFkKOxxOaM=; b=nGL+H+Y3NBUI6jy+ODLzj3u3v/
 lWYturaOz6fZzt8FIgbcqchvZnQ7mEoQCLZlm4d5hdbFBfB9Ib1DEezYQEYrFzDVkrao7pNvPSGK1
 cKiQy7Qn4MwYvdM4VLhwsdvcs8RgqAUBOIqGkRJ3qsy/wrOR0Fo0TIpLvfmT0pAmLPN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RTTaRQhmAJbrMZUmT6BtyPI6jOiIeG53/PFkKOxxOaM=; b=lmn7oKx+jJKUZh+89Z7EYGBHO0
 7idGrbShzpYivKF9sWX7nB4LQWAxHsqUcJCUVQEmBZ+2cuC6UnSKDJx4VlCeLyV01COV0qe/IjdRY
 iN9MJoKAxQdlmUtnvRHZ0S2sW3DYt/ZsQDYq648PH7W5t2mSITNzszdsM/3/7cUP5Wlw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ji7nr-00APCx-L5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 02:46:25 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 60D6635DC1AD4DCFF537;
 Mon,  8 Jun 2020 10:46:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 8 Jun 2020
 10:46:06 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200605042746.201180-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fd9bd76c-1864-2cfc-bf86-ef705c8a407d@huawei.com>
Date: Mon, 8 Jun 2020 10:46:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200605042746.201180-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ji7nr-00APCx-L5
Subject: Re: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/5 12:27, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new ioctl to send discard commands to whole data area of
> a regular file for security reason.

I guess this interface is introduced for security key destruction, if I'm
right, however, IIRC, discard(erase) semantics in eMMC/UFS spec won't
guarantee that data which was discard could be zeroed out, so after discard,
the key still have risk of exposure. So instead, should we use sb_issue_zeroout()?

Thanks,

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h |   1 +
>  fs/f2fs/file.c | 129 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 130 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c812fb8e2d9c..9ae81d0fefa0 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -434,6 +434,7 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>  					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
>  #define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
>  					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
> +#define F2FS_IOC_TRIM_FILE		_IO(F2FS_IOCTL_MAGIC, 20)
>  
>  #define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
>  #define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index dfa1ac2d751a..58507bb5649c 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3749,6 +3749,132 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> +static int f2fs_trim_file(struct file *filp)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct address_space *mapping = inode->i_mapping;
> +	struct bio *bio = NULL;
> +	struct block_device *prev_bdev = NULL;
> +	loff_t file_size;
> +	pgoff_t index, pg_start = 0, pg_end;
> +	block_t prev_block = 0, len = 0;
> +	int ret = 0;
> +
> +	if (!f2fs_hw_support_discard(sbi))
> +		return -EOPNOTSUPP;
> +
> +	if (!S_ISREG(inode->i_mode) || f2fs_is_atomic_file(inode) ||
> +			f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	if (f2fs_readonly(sbi->sb))
> +		return -EROFS;
> +
> +	ret = mnt_want_write_file(filp);
> +	if (ret)
> +		return ret;
> +
> +	inode_lock(inode);
> +
> +	file_size = i_size_read(inode);
> +	if (!file_size)
> +		goto err;
> +	pg_end = (pgoff_t)round_up(file_size, PAGE_SIZE) >> PAGE_SHIFT;
> +
> +	ret = f2fs_convert_inline_inode(inode);
> +	if (ret)
> +		goto err;
> +
> +	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	down_write(&F2FS_I(inode)->i_mmap_sem);
> +
> +	ret = filemap_write_and_wait(mapping);
> +	if (ret)
> +		goto out;
> +
> +	truncate_inode_pages(mapping, 0);
> +
> +	for (index = pg_start; index < pg_end;) {
> +		struct dnode_of_data dn;
> +		unsigned int end_offset;
> +
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		ret = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> +		if (ret)
> +			goto out;
> +
> +		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> +		if (pg_end < end_offset + index)
> +			end_offset = pg_end - index;
> +
> +		for (; dn.ofs_in_node < end_offset;
> +				dn.ofs_in_node++, index++) {
> +			struct block_device *cur_bdev;
> +			block_t blkaddr = f2fs_data_blkaddr(&dn);
> +
> +			if (__is_valid_data_blkaddr(blkaddr)) {
> +				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
> +					blkaddr, DATA_GENERIC_ENHANCE)) {
> +					ret = -EFSCORRUPTED;
> +					goto out;
> +				}
> +			} else
> +				continue;
> +
> +			cur_bdev = f2fs_target_device(sbi, blkaddr, NULL);
> +			if (f2fs_is_multi_device(sbi)) {
> +				int i = f2fs_target_device_index(sbi, blkaddr);
> +
> +				blkaddr -= FDEV(i).start_blk;
> +			}
> +
> +			if (len) {
> +				if (prev_bdev == cur_bdev &&
> +					blkaddr == prev_block + len) {
> +					len++;
> +				} else {
> +					ret = __blkdev_issue_discard(prev_bdev,
> +						SECTOR_FROM_BLOCK(prev_block),
> +						SECTOR_FROM_BLOCK(len),
> +						GFP_NOFS, 0, &bio);
> +					if (ret)
> +						goto out;
> +> +					len = 0;
> +				}
> +			}
> +
> +			if (!len) {
> +				prev_bdev = cur_bdev;
> +				prev_block = blkaddr;
> +				len = 1;
> +			}
> +		}
> +
> +		f2fs_put_dnode(&dn);
> +	}
> +
> +	if (len)
> +		ret = __blkdev_issue_discard(prev_bdev,
> +					SECTOR_FROM_BLOCK(prev_block),
> +					SECTOR_FROM_BLOCK(len),
> +					GFP_NOFS, 0, &bio);
> +out:
> +	if (bio) {
> +		ret = submit_bio_wait(bio);
> +		bio_put(bio);
> +	}
> +
> +	up_write(&F2FS_I(inode)->i_mmap_sem);
> +	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +err:
> +	inode_unlock(inode);
> +	mnt_drop_write_file(filp);
> +
> +	return ret;
> +}
> +
>  long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
> @@ -3835,6 +3961,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_release_compress_blocks(filp, arg);
>  	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
>  		return f2fs_reserve_compress_blocks(filp, arg);
> +	case F2FS_IOC_TRIM_FILE:
> +		return f2fs_trim_file(filp);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -4004,6 +4132,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_GET_COMPRESS_BLOCKS:
>  	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
>  	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
> +	case F2FS_IOC_TRIM_FILE:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
