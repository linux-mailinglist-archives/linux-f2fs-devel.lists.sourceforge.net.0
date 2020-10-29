Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF3929E40B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Oct 2020 08:29:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kY2Na-0005bg-Ng; Thu, 29 Oct 2020 07:29:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kY2NX-0005bX-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 07:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fcQyQfC453agDfC0vScETEotxZinmRa3YZiXfd9dbeU=; b=eO1LYkuawV5f+CMNn+i2mEUex7
 nUqNGAcetS9h2lO8CL4YRjxvVqw+b1yzO/VQWvs05AwZwTGLRtBdu5pEV0cznq2p9X+YHrfbP+T8t
 L2AF2vp3BBm6uIIMuo58/tnPZddr3/lnUiTI9URUzMpkuiF7pSZdRPf5d+rgl3jr2xFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fcQyQfC453agDfC0vScETEotxZinmRa3YZiXfd9dbeU=; b=D7+VdMtqcf53Lgajv2QlKI3gDi
 9NUkCHguliC8tU2b/HQJ2HqW32mU0g6QoQqBGnixMLetwA15w5vYKOL7Kd6sdkpmTja2BTzHPVmwk
 REUb0Us0XQrFaAm6QTadgmnyZDTYrKkSq+nSuvwky+Ya69hwZqT2xD9VD1wDj7LZrmRw=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kY2NJ-00BIgN-Mj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 07:29:46 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMHBX5jqSzLr0g;
 Thu, 29 Oct 2020 15:29:24 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 29 Oct
 2020 15:29:17 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201029041538.4165209-1-daeho43@gmail.com>
 <20201029041538.4165209-2-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <92f4da8e-27a1-7577-84f9-39038eaa88cb@huawei.com>
Date: Thu, 29 Oct 2020 15:29:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201029041538.4165209-2-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kY2NJ-00BIgN-Mj
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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

On 2020/10/29 12:15, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new F2FS_IOC_SET_COMPRESS_OPTION ioctl to change file
> compression option of a file.
> 
> struct f2fs_comp_option {
>      u8 algorithm;         => compression algorithm
>                            => 0:lzo, 1:lz4, 2:zstd, 3:lzorle
>      u8 log_cluster_size;  => log scale cluster size
>                            => 2 ~ 8
> };
> 
> struct f2fs_comp_option option;
> 
> option.algorithm = 1;
> option.log_cluster_size = 7;
> 
> ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION, &option);
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> 
> v5: allowed to set algorithm which is not currently enabled by kernel
> v4: changed commit message.
> v3: changed the error number more specific.
>      folded in fix for build breakage reported by kernel test robot
>      <lkp@intel.com> and Dan Carpenter <dan.carpenter@oracle.com>.
> v2: added ioctl description.
> ---
>   fs/f2fs/compress.c |  5 +++++
>   fs/f2fs/f2fs.h     |  7 ++++++
>   fs/f2fs/file.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 66 insertions(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7895186cc765..816d7adc914c 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -514,6 +514,11 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>   	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
>   }
>   
> +bool f2fs_is_compress_algorithm_ready(unsigned char algorithm)
> +{
> +	return algorithm < COMPRESS_MAX && f2fs_cops[algorithm] != NULL;
> +}
> +
>   static mempool_t *compress_page_pool;
>   static int num_compress_pages = 512;
>   module_param(num_compress_pages, uint, 0444);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index a33c90cf979b..cc38afde6c04 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -435,6 +435,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>   						struct f2fs_sectrim_range)
>   #define F2FS_IOC_GET_COMPRESS_OPTION	_IOR(F2FS_IOCTL_MAGIC, 21,	\
>   						struct f2fs_comp_option)
> +#define F2FS_IOC_SET_COMPRESS_OPTION	_IOW(F2FS_IOCTL_MAGIC, 22,	\
> +						struct f2fs_comp_option)
>   
>   /*
>    * should be same as XFS_IOC_GOINGDOWN.
> @@ -3915,6 +3917,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>   int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
>   void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>   bool f2fs_is_compress_backend_ready(struct inode *inode);
> +bool f2fs_is_compress_algorithm_ready(unsigned char algorithm);
>   int f2fs_init_compress_mempool(void);
>   void f2fs_destroy_compress_mempool(void);
>   void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
> @@ -3945,6 +3948,10 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
>   	/* not support compression */
>   	return false;
>   }
> +static inline bool f2fs_is_compress_algorithm_ready(unsigned char algorithm)
> +{
> +	return false;
> +}
>   static inline struct page *f2fs_compress_control_page(struct page *page)
>   {
>   	WARN_ON_ONCE(1);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8922ab191a9d..a0f31d8ebcfd 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3963,6 +3963,57 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
>   	return 0;
>   }
>   
> +static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_comp_option option;
> +	int ret = 0;
> +
> +	if (!f2fs_sb_has_compression(sbi))
> +		return -EOPNOTSUPP;
> +
> +	if (!(filp->f_mode & FMODE_WRITE))
> +		return -EBADF;
> +
> +	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
> +				sizeof(option)))
> +		return -EFAULT;
> +
> +	if (!f2fs_compressed_file(inode) ||
> +			option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> +			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
> +			option.algorithm >= COMPRESS_MAX)
> +		return -EINVAL;
> +
> +	file_start_write(filp);
> +	inode_lock(inode);
> +
> +	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
> +		ret = -EBUSY;
> +		goto out;
> +	}
> +
> +	if (inode->i_size != 0) {
> +		ret = -EFBIG;
> +		goto out;
> +	}

Hmm...

Shouldn't it be:

if (algorithm >= COMPRESS_MAX) {
	ret = -ENOPKG;
	goto out;
}

if (!f2fs_cops[algorithm])
	f2fs_warn(...);

> +
> +	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
> +	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
> +	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
> +	f2fs_mark_inode_dirty_sync(inode, true);
> +
> +	if (!f2fs_is_compress_algorithm_ready(option.algorithm))
> +		f2fs_warn(sbi, "compression algorithm is successfully set, "
> +			"but current kernel doesn't support this algorithm.");
> +out:
> +	inode_unlock(inode);
> +	file_end_write(filp);
> +
> +	return ret;
> +}
> +
>   long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   {
>   	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
> @@ -4053,6 +4104,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   		return f2fs_sec_trim_file(filp, arg);
>   	case F2FS_IOC_GET_COMPRESS_OPTION:
>   		return f2fs_ioc_get_compress_option(filp, arg);
> +	case F2FS_IOC_SET_COMPRESS_OPTION:
> +		return f2fs_ioc_set_compress_option(filp, arg);
>   	default:
>   		return -ENOTTY;
>   	}
> @@ -4224,6 +4277,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
>   	case F2FS_IOC_SEC_TRIM_FILE:
>   	case F2FS_IOC_GET_COMPRESS_OPTION:
> +	case F2FS_IOC_SET_COMPRESS_OPTION:
>   		break;
>   	default:
>   		return -ENOIOCTLCMD;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
