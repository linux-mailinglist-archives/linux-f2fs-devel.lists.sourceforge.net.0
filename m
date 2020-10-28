Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B4829CE5F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Oct 2020 07:38:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXf5n-0001g2-2H; Wed, 28 Oct 2020 06:37:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kXf5m-0001fw-8X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Oct 2020 06:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=90zsnZrxd5/rmGdXBZ0C045OyVa+6j6Slf8cn2vtZnY=; b=enY0oPu9uClqF9jR1RPvADcwYM
 A5Aaf6WGP6F2Ud0qO9LFXmYmfP38t6/iqy5wdKGmZV3LBER39lFt6bsDRvp6b/TQNZmEhRPUde3cs
 sX9UKIM5qT+5A5P0xdsI/JxFf+ZeTUW8TTKeQE0l8tZEllYMgtLtzvo5vnomFbxe7O0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=90zsnZrxd5/rmGdXBZ0C045OyVa+6j6Slf8cn2vtZnY=; b=O2DDCzN9sGYQFY9O/hlg/VdMzz
 0Asv7+WSikUjCaxWBhfw6tf0gpOhOmCLje1PBZtoQsHuPoX73SruE00bowqycBgwkhujHABCgg3T/
 78wU+Jn5XF3eAtrH9mrPQFG6R4W3YCqO3Q97NCBQsDlU8R7lzCK+B436tBQVh+vmEZxA=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXf5a-009jPO-Ny
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Oct 2020 06:37:54 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CLf5C09VYzhbBq;
 Wed, 28 Oct 2020 14:37:35 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 28 Oct
 2020 14:37:29 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201027053818.3291747-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a4d3f116-4090-8699-2973-b5a4933205ed@huawei.com>
Date: Wed, 28 Oct 2020 14:37:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201027053818.3291747-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.9 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kXf5a-009jPO-Ny
Subject: Re: [f2fs-dev] [PATCH v4 1/2] f2fs: add
 F2FS_IOC_GET_COMPRESS_OPTION ioctl
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

On 2020/10/27 13:38, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new F2FS_IOC_GET_COMPRESS_OPTION ioctl to get file compression
> option of a file.
> 
> struct f2fs_comp_option {
>      u8 algorithm;         => compression algorithm
>                            => 0:lzo, 1:lz4, 2:zstd, 3:lzorle
>      u8 log_cluster_size;  => log scale cluster size
>                            => 2 ~ 8

I prepare to change i_padding field to i_cflags, so I guess we need to update
struct f2fs_comp_option as well later.

BTW, i_cflags could be set to support more layout of compress inode, e.g.
like recently developed ckksum feature which need to struct compress_data layout
update.

> };
> 
> struct f2fs_comp_option option;
> 
> ioctl(fd, F2FS_IOC_GET_COMPRESS_OPTION, &option);
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> 
> v4: changed commit message.
> v3: changed the error number more specific.
> v2: added ioctl description.
> ---
>   fs/f2fs/f2fs.h |  7 +++++++
>   fs/f2fs/file.c | 30 ++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 53fe2853579c..a33c90cf979b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -433,6 +433,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>   					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
>   #define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
>   						struct f2fs_sectrim_range)
> +#define F2FS_IOC_GET_COMPRESS_OPTION	_IOR(F2FS_IOCTL_MAGIC, 21,	\
> +						struct f2fs_comp_option)
>   
>   /*
>    * should be same as XFS_IOC_GOINGDOWN.
> @@ -481,6 +483,11 @@ struct f2fs_sectrim_range {
>   	u64 flags;
>   };
>   
> +struct f2fs_comp_option {
> +	u8 algorithm;
> +	u8 log_cluster_size;
> +};
> +
>   /* for inline stuff */
>   #define DEF_INLINE_RESERVED_SIZE	1
>   static inline int get_extra_isize(struct inode *inode);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index ef5a844de53f..8922ab191a9d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3936,6 +3936,33 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>   	return ret;
>   }
>   
> +static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_comp_option option;
> +
> +	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
> +		return -EOPNOTSUPP;
> +
> +	inode_lock(inode);
> +
> +	if (!f2fs_compressed_file(inode)) {
> +		inode_unlock(inode);
> +		return -ENODATA;
> +	}
> +
> +	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
> +	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
> +
> +	inode_unlock(inode);
> +
> +	if (copy_to_user((struct f2fs_comp_option __user *)arg, &option,
> +				sizeof(option)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   {
>   	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
> @@ -4024,6 +4051,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   		return f2fs_reserve_compress_blocks(filp, arg);
>   	case F2FS_IOC_SEC_TRIM_FILE:
>   		return f2fs_sec_trim_file(filp, arg);
> +	case F2FS_IOC_GET_COMPRESS_OPTION:
> +		return f2fs_ioc_get_compress_option(filp, arg);
>   	default:
>   		return -ENOTTY;
>   	}
> @@ -4194,6 +4223,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>   	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
>   	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
>   	case F2FS_IOC_SEC_TRIM_FILE:
> +	case F2FS_IOC_GET_COMPRESS_OPTION:
>   		break;
>   	default:
>   		return -ENOIOCTLCMD;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
