Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F8F2C11D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Nov 2020 18:22:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khFYG-0002DJ-8B; Mon, 23 Nov 2020 17:22:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1khFVC-0001kq-KS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 17:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0sp282q/Smk2mazW3xqG9uiVYPYXEcxLWqkQt3KVbsg=; b=XcxHtVRn741Wc9sR7Z/wAv9flq
 ZIJqUCn3sOrblQN26+U4yEQHHDtM98yYY/9j/CDtAAwGCag/WR68Qtuh9FqJWGpzrt1pfDmFM7RcV
 dVHC+AhAq19SFRN4xhcIhjDLNvbwvoM9+8F57t487idqbO1UKfLEtLRxJ/AqOwbM87Ak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0sp282q/Smk2mazW3xqG9uiVYPYXEcxLWqkQt3KVbsg=; b=JT5BBMcKdsDy3IcoHLHSS2Z7+I
 S19x9AwlAPYOIlkJQ7Y6YfJxcXO5QzCIij+nDMOQLvKzTQimBDwvZzVLrrrSTAMOEqMZWi0vobI+S
 9YBlw4dlwqkU5MZx7SK6cIDBg4s+EpXr7sTPlROu+ZOnytlc3AM3n9fVfHlThkmjQz+M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khFUz-000psm-VF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 17:19:46 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 53A752075A;
 Mon, 23 Nov 2020 17:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606151968;
 bh=mKs1DtKcf8HjLRb0oweQoRlyPQpUSnm6TGBgfwx66+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f35UDnNikB6cfMcAXZ0cTa/GRfC+gO2HW7r6CUe70hCVlbPLPjRc1M8yjUKWekIma
 xmjzmG9A3p3h0ig7OlTncWyjoYbK3t8QX9UyDo7AYP1UTR+p7nIKHYtK22PyZTpwKw
 45SAGi7t9tge+42zJo/unPnc+oQJlvcEvlDMwxoU=
Date: Mon, 23 Nov 2020 09:19:26 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201123171926.GC413620@google.com>
References: <20201123031751.36811-1-daeho43@gmail.com>
 <20201123031751.36811-2-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123031751.36811-2-daeho43@gmail.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1khFUz-000psm-VF
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/23, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added two ioctl to decompress/compress explicitly the compression
> enabled file in "compress_mode=user-based" mount option.
> 
> Using these two ioctls, the users can make a control of compression
> and decompression of their files.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/file.c            | 181 +++++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/f2fs.h |   2 +
>  2 files changed, 182 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index be8db06aca27..e8f142470e87 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4026,6 +4026,180 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> +static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> +{
> +	DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, page_idx);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct address_space *mapping = inode->i_mapping;
> +	struct page *page;
> +	pgoff_t redirty_idx = page_idx;
> +	int i, page_len = 0, ret = 0;
> +
> +	page_cache_ra_unbounded(&ractl, len, 0);
> +
> +	for (i = 0; i < len; i++, page_idx++) {
> +		page = read_cache_page(mapping, page_idx, NULL, NULL);
> +		if (IS_ERR(page)) {
> +			ret = PTR_ERR(page);
> +			f2fs_warn(sbi, "%s: inode (%lu) : page_index (%lu) "
> +				"couldn't be read (errno:%d).\n",
> +				__func__, inode->i_ino, page_idx, ret);
> +			break;
> +		}
> +		page_len++;
> +	}
> +
> +	for (i = 0; i < page_len; i++, redirty_idx++) {
> +		page = find_lock_page(mapping, redirty_idx);
> +		if (!page) {
> +			ret = -ENOENT;
> +			f2fs_warn(sbi, "%s: inode (%lu) : page_index (%lu) "
> +				"couldn't be found (errno:%d).\n",
> +				__func__, inode->i_ino, redirty_idx, ret);
> +		}
> +		set_page_dirty(page);
> +		f2fs_put_page(page, 1);
> +		f2fs_put_page(page, 0);
> +	}
> +
> +	return ret;
> +}
> +
> +static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	pgoff_t page_idx = 0, last_idx;
> +	int cluster_size = F2FS_I(inode)->i_cluster_size;
> +	int count, ret;
> +
> +	if (!f2fs_sb_has_compression(sbi))
> +		return -EOPNOTSUPP;
> +
> +	if (!(filp->f_mode & FMODE_WRITE))
> +		return -EBADF;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	f2fs_balance_fs(F2FS_I_SB(inode), true);
> +
> +	file_start_write(filp);
> +	inode_lock(inode);
> +
> +	if (f2fs_is_mmap_file(inode)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> +	if (ret)
> +		goto out;
> +
> +	if (!atomic_read(&fi->i_compr_blocks))
> +		goto out;
> +
> +	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> +
> +	count = last_idx - page_idx;
> +	while (count) {
> +		int len = min(cluster_size, count);
> +
> +		ret = redirty_blocks(inode, page_idx, len);
> +
> +		if (ret < 0)
> +			break;
> +
> +		page_idx += len;
> +		count -= len;
> +	}
> +
> +	if (!ret)
> +		ret = filemap_write_and_wait_range(inode->i_mapping, 0,
> +							LLONG_MAX);
> +
> +	if (!ret) {
> +		stat_sub_compr_blocks(inode, atomic_read(&fi->i_compr_blocks));
> +		atomic_set(&fi->i_compr_blocks, 0);
> +		f2fs_mark_inode_dirty_sync(inode, true);
> +	} else {
> +		f2fs_warn(sbi, "%s: The file might be partially decompressed "
> +				"(errno=%d). Please delete the file.\n",
> +				__func__, ret);
> +	}
> +out:
> +	inode_unlock(inode);
> +	file_end_write(filp);
> +
> +	return ret;
> +}
> +
> +static int f2fs_ioc_compress_file(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	pgoff_t page_idx = 0, last_idx;
> +	int cluster_size = F2FS_I(inode)->i_cluster_size;
> +	int count, ret;
> +
> +	if (!f2fs_sb_has_compression(sbi))
> +		return -EOPNOTSUPP;
> +
> +	if (!(filp->f_mode & FMODE_WRITE))
> +		return -EBADF;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	f2fs_balance_fs(F2FS_I_SB(inode), true);
> +
> +	file_start_write(filp);
> +	inode_lock(inode);
> +
> +	if (f2fs_is_mmap_file(inode)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
> +	if (ret)
> +		goto out;
> +
> +	set_inode_flag(inode, FI_ENABLE_COMPRESS);
> +
> +	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
> +
> +	count = last_idx - page_idx;
> +	while (count) {
> +		int len = min(cluster_size, count);
> +
> +		ret = redirty_blocks(inode, page_idx, len);
> +
> +		if (ret < 0)
> +			break;
> +
> +		page_idx += len;
> +		count -= len;
> +	}
> +
> +	if (!ret)
> +		ret = filemap_write_and_wait_range(inode->i_mapping, 0,
> +							LLONG_MAX);
> +
> +	clear_inode_flag(inode, FI_ENABLE_COMPRESS);
> +
> +	if (ret)
> +		f2fs_warn(sbi, "%s: The file might be partially compressed "
> +				"(errno=%d). Please delete the file.\n",
> +				__func__, ret);
> +out:
> +	inode_unlock(inode);
> +	file_end_write(filp);
> +
> +	return ret;
> +}
> +
>  static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	switch (cmd) {
> @@ -4113,6 +4287,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_get_compress_option(filp, arg);
>  	case F2FS_IOC_SET_COMPRESS_OPTION:
>  		return f2fs_ioc_set_compress_option(filp, arg);
> +	case F2FS_IOC_DECOMPRESS_FILE:
> +		return f2fs_ioc_decompress_file(filp, arg);
> +	case F2FS_IOC_COMPRESS_FILE:
> +		return f2fs_ioc_compress_file(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -4352,7 +4530,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_SEC_TRIM_FILE:
>  	case F2FS_IOC_GET_COMPRESS_OPTION:
>  	case F2FS_IOC_SET_COMPRESS_OPTION:
> -		break;
> +	case F2FS_IOC_DECOMPRESS_FILE:
> +	case F2FS_IOC_COMPRESS_FILE:

		break; ?

>  	default:
>  		return -ENOIOCTLCMD;
>  	}
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index f00199a2e38b..352a822d4370 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -40,6 +40,8 @@
>  						struct f2fs_comp_option)
>  #define F2FS_IOC_SET_COMPRESS_OPTION	_IOW(F2FS_IOCTL_MAGIC, 22,	\
>  						struct f2fs_comp_option)
> +#define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
> +#define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
>  
>  /*
>   * should be same as XFS_IOC_GOINGDOWN.
> -- 
> 2.29.2.454.gaff20da3a2-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
