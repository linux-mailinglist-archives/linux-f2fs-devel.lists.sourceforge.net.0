Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D6D2CB525
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 07:40:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkLoS-0002Pb-JM; Wed, 02 Dec 2020 06:40:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkLoQ-0002PU-GI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 06:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CffFUFSHh9TVKwGy/jbGmqNuHu/vV/RuUstKA7PvnlM=; b=VAlkAjCeIieL8I8LN/218NJ6SA
 HgmuiwqTUebzyB3MBEHb5AjSBHdfvrMp2L2yypJ96dyMU2m5HZ/jkk02NVhM5CYpybwlp0YM1UVcl
 SvjcUxTtAq0SFUgGDH2gDOj5wkj5BPL7mWkCNkBTPulFRP0CX/2uQoxusfJEE50IAPUM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CffFUFSHh9TVKwGy/jbGmqNuHu/vV/RuUstKA7PvnlM=; b=FvISpms5NWgnXWXKH6Y2vrNgKu
 b6jGPtxRJORseJXROCsL58lWoT8xS7pRJET2sZvxAWMDadBe67jSZaz/C2AP8fONE8AVpfmwleh9S
 MRqj/nxsKQOuWEqvk4vV2o9vrH4/vWVdrVxaP9ve/Xq2o4mhB19PzAwA0vvOpJYpsB4E=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkLoF-00FQcE-Mn
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 06:40:26 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cm8TY6L6jzhglk;
 Wed,  2 Dec 2020 14:39:45 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 2 Dec 2020
 14:40:04 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201201040803.3590442-1-daeho43@gmail.com>
 <20201201040803.3590442-2-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b60eeb13-225a-55dd-42bd-2ca197b0d416@huawei.com>
Date: Wed, 2 Dec 2020 14:40:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201201040803.3590442-2-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkLoF-00FQcE-Mn
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: add F2FS_IOC_DECOMPRESS_FILE
 and F2FS_IOC_COMPRESS_FILE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/1 12:08, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added two ioctl to decompress/compress explicitly the compression
> enabled file in "compress_mode=user" mount option.
> 
> Using these two ioctls, the users can make a control of compression
> and decompression of their files.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: reformed codes based on comments and put gradual flush routine
> ---
>   fs/f2fs/file.c            | 185 ++++++++++++++++++++++++++++++++++++++
>   include/uapi/linux/f2fs.h |   2 +
>   2 files changed, 187 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index be8db06aca27..300355fe25f0 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4026,6 +4026,185 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>   	return ret;
>   }
>   
> +static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> +{
> +	DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, page_idx);
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
> +			break;
> +		}
> +		page_len++;
> +	}
> +
> +	for (i = 0; i < page_len; i++, redirty_idx++) {
> +		page = find_lock_page(mapping, redirty_idx);
> +		if (!page)
> +			ret = -ENOENT;
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
> +	unsigned int blk_per_seg = sbi->blocks_per_seg, dirtied = 0;
> +	int cluster_size = F2FS_I(inode)->i_cluster_size;
> +	int count, ret;
> +
> +	if (!f2fs_sb_has_compression(sbi) ||
> +			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
> +		return -EOPNOTSUPP;
> +
> +	if (!(filp->f_mode & FMODE_WRITE))
> +		return -EBADF;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return -ENOPKG;

Oh, it looks there will be a race case with f2fs_ioc_set_compress_option(),
it needs to relocate this condition under inode lock.

In all other places, it will return -EOPNOTSUPP, how about keeping in line with
them?

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
> +		if (ret < 0)
> +			break;
> +
> +		count -= len;
> +		page_idx += len;
> +		dirtied += len;

use get_dirty_pages(inode) will be a little bit more accurate? as kworker is
running to writeback dirty pages in background.

> +		if (dirtied >= blk_per_seg) {
> +			filemap_fdatawrite(inode->i_mapping);
> +			dirtied = 0;
> +		}
> +	}
> +
> +	if (!ret)
> +		ret = filemap_write_and_wait_range(inode->i_mapping, 0,
> +							LLONG_MAX);
> +
> +	if (ret)
> +		f2fs_warn(sbi, "%s: The file might be partially decompressed "
> +				"(errno=%d). Please delete the file.\n",
> +				__func__, ret);
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
> +	unsigned int blk_per_seg = sbi->blocks_per_seg, dirtied = 0;
> +	int cluster_size = F2FS_I(inode)->i_cluster_size;
> +	int count, ret;
> +
> +	if (!f2fs_sb_has_compression(sbi) ||
> +			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
> +		return -EOPNOTSUPP;
> +
> +	if (!(filp->f_mode & FMODE_WRITE))
> +		return -EBADF;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return -EINVAL;
> +
> +	if (!f2fs_is_compress_backend_ready(inode))
> +		return -ENOPKG;

Ditto,

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
> +		if (ret < 0)
> +			break;
> +
> +		count -= len;
> +		page_idx += len;
> +		dirtied += len;

Ditto,

> +		if (dirtied >= blk_per_seg) {
> +			filemap_fdatawrite(inode->i_mapping);
> +			dirtied = 0;
> +		}
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
>   static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   {
>   	switch (cmd) {
> @@ -4113,6 +4292,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   		return f2fs_ioc_get_compress_option(filp, arg);
>   	case F2FS_IOC_SET_COMPRESS_OPTION:
>   		return f2fs_ioc_set_compress_option(filp, arg);
> +	case F2FS_IOC_DECOMPRESS_FILE:
> +		return f2fs_ioc_decompress_file(filp, arg);
> +	case F2FS_IOC_COMPRESS_FILE:
> +		return f2fs_ioc_compress_file(filp, arg);
>   	default:
>   		return -ENOTTY;
>   	}
> @@ -4352,6 +4535,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   	case F2FS_IOC_SEC_TRIM_FILE:
>   	case F2FS_IOC_GET_COMPRESS_OPTION:
>   	case F2FS_IOC_SET_COMPRESS_OPTION:
> +	case F2FS_IOC_DECOMPRESS_FILE:
> +	case F2FS_IOC_COMPRESS_FILE:
>   		break;
>   	default:
>   		return -ENOIOCTLCMD;
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index f00199a2e38b..352a822d4370 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -40,6 +40,8 @@
>   						struct f2fs_comp_option)
>   #define F2FS_IOC_SET_COMPRESS_OPTION	_IOW(F2FS_IOCTL_MAGIC, 22,	\
>   						struct f2fs_comp_option)
> +#define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
> +#define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
>   
>   /*
>    * should be same as XFS_IOC_GOINGDOWN.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
