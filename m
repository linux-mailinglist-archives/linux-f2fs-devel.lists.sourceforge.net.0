Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9DB67F726
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Jan 2023 11:34:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pLiXT-0005e3-6l;
	Sat, 28 Jan 2023 10:34:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pLiXN-0005dn-Nz
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 10:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TF9IrdBMya3CMMkuimZxECoagcOBbIcUPqapEZ9zTLo=; b=lXe1uFVlQnePXxU0euSaF85WCV
 c/JClhKn6KHudcFRnmsRRURc8LVfxo6NdmQ0D6Z/+/2Ofd6+P+azTFoGSyvZUzB+dgAoaOlryRH7c
 kG3gFYd1m/93fDtrV3m9rlqRf476PmoG0pdEbDkIBF3l2sBbYXHOigootTd+/OkPMCZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TF9IrdBMya3CMMkuimZxECoagcOBbIcUPqapEZ9zTLo=; b=Pf2VCXV4PmHSIVAWH8qnCY1pj0
 56RqGX17h0Ngf+xEJyhwvN0AXOPsqdzodF2+Kh9ZV/3FVTyeC8HtPLgvlCljeIzt1rxULAEKOlwKW
 NJp1Ja6RGUO97//l/Yea4mxdt+T3YXrKCD36OGk7SC/PB/7fNfTqr/oMD08TmkA0SeJI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pLiXK-001acV-RC for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Jan 2023 10:34:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9278EB80689;
 Sat, 28 Jan 2023 10:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA69AC433EF;
 Sat, 28 Jan 2023 10:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674902051;
 bh=MWBgHjqmJ5UVKw/d5uDkFlf3VaHDM1hciuxJKXsxf1U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jftSoJ6k2kx555974z7u8JSWnHrUYLp0CVc7nh4R6WBo2nIsx8NUbHve7YEE5ed/H
 nJycIw4+QtInWFvsRlJpEojmW6IbtXKaln7IR8qlOODnQlGQNErYWhQGqIDxwhttvo
 jZifC+TyfAw+mDcR10m/k7Zy6Y8oFw8wFdI09oDvBZHO24SHyJ2qXSkE0ArkKP2HNb
 EPJeCJo3zs4VDF8oSkXKwUN2Afvnlgl3B6nbS8UaqOOVaYYZb40qhQyMnutfB9esty
 76A1jLnBxOT024eG8H5p+lO6V6acyK6RXlQ6oIK0Eh7rh2UXLsuy/FFTuL/88HfPDm
 /tz6pMOBe7fbQ==
Message-ID: <c179d808-66ee-a4b5-b3f1-91ba336a68ca@kernel.org>
Date: Sat, 28 Jan 2023 18:34:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230112133503.16802-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230112133503.16802-1-frank.li@vivo.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/1/12 21:35,
 Yangtao Li wrote: > Added a new F2FS_IOC_SET_COMPRESS_OPTION_V2
 ioctl to change file > compression option of a file. > > struct
 f2fs_comp_option_v2 { > union { > struct { > __u8 al [...] 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pLiXK-001acV-RC
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/1/12 21:35, Yangtao Li wrote:
> Added a new F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl to change file
> compression option of a file.
> 
> struct f2fs_comp_option_v2 {
> 	union {
> 		struct {
> 			__u8 algorithm;
> 			__u8 log_cluster_size;
> 			__u16 compress_flag;
> 		};
> 		struct f2fs_comp_option option;
> 	};
> };
> 
> struct f2fs_comp_option_v2 option;
> 
> option.algorithm = 2;
> option.log_cluster_size = 2;
> option.compress_flag = (5 << COMPRESS_LEVEL_OFFSET) | BIT(COMPRESS_CHKSUM);
> 
> ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION_V2, &option);
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/f2fs.h            |  8 +-------
>   fs/f2fs/file.c            | 41 ++++++++++++++++++++++++++++++++-------
>   include/uapi/linux/f2fs.h | 21 ++++++++++++++++++++
>   3 files changed, 56 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index f3c5f7740c1a..c2267f44bcf8 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -25,6 +25,7 @@
>   #include <linux/quotaops.h>
>   #include <linux/part_stat.h>
>   #include <crypto/hash.h>
> +#include <uapi/linux/f2fs.h>
>   
>   #include <linux/fscrypt.h>
>   #include <linux/fsverity.h>
> @@ -1501,11 +1502,6 @@ enum compress_algorithm_type {
>   	COMPRESS_MAX,
>   };
>   
> -enum compress_flag {
> -	COMPRESS_CHKSUM,
> -	COMPRESS_MAX_FLAG,
> -};
> -
>   #define	COMPRESS_WATERMARK			20
>   #define	COMPRESS_PERCENT			20
>   
> @@ -1521,8 +1517,6 @@ struct compress_data {
>   
>   #define F2FS_COMPRESSED_PAGE_MAGIC	0xF5F2C000
>   
> -#define	COMPRESS_LEVEL_OFFSET	8
> -
>   /* compress context */
>   struct compress_ctx {
>   	struct inode *inode;		/* inode the context belong to */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f5c1b7814954..719706ef0d46 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -25,6 +25,8 @@
>   #include <linux/fileattr.h>
>   #include <linux/fadvise.h>
>   #include <linux/iomap.h>
> +#include <linux/zstd.h>
> +#include <linux/lz4.h>
>   
>   #include "f2fs.h"
>   #include "node.h"
> @@ -3910,12 +3912,13 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
>   	return 0;
>   }
>   
> -static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> +static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg,
> +										unsigned int cmd)
>   {
>   	struct inode *inode = file_inode(filp);
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct f2fs_comp_option option;
> -	int ret = 0;
> +	struct f2fs_comp_option_v2 option;
> +	int ret = 0, len;
>   
>   	if (!f2fs_sb_has_compression(sbi))
>   		return -EOPNOTSUPP;
> @@ -3923,8 +3926,12 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>   	if (!(filp->f_mode & FMODE_WRITE))
>   		return -EBADF;
>   
> -	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
> -				sizeof(option)))
> +	if (cmd == F2FS_IOC_SET_COMPRESS_OPTION_V2)
> +		len = sizeof(struct f2fs_comp_option_v2);
> +	else
> +		len = sizeof(struct f2fs_comp_option);
> +
> +	if (copy_from_user(&option, (void __user *)arg, len))
>   		return -EFAULT;
>   
>   	if (!f2fs_compressed_file(inode) ||
> @@ -3933,6 +3940,21 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>   			option.algorithm >= COMPRESS_MAX)
>   		return -EINVAL;
>   
> +	if (cmd == F2FS_IOC_SET_COMPRESS_OPTION_V2) {
> +		unsigned int level = GET_COMPRESS_LEVEL(option.compress_flag);
> +
> +		switch (option.algorithm) {
> +		case COMPRESS_LZ4:
> +			if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL)
> +				return -EINVAL;
> +			break;

level=0 indicates lz4, so it's allowed?

> +		case COMPRESS_ZSTD:
> +			if (!level || level > zstd_max_clevel())
> +				return -EINVAL;
> +			break;

default:
	return -EINVAL;

> +		}
> +	}
> +
>   	file_start_write(filp);
>   	inode_lock(inode);
>   
> @@ -3948,7 +3970,10 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>   
>   	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
>   	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
> -	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
> +	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
> +
> +	if (cmd == F2FS_IOC_SET_COMPRESS_OPTION_V2)
> +		F2FS_I(inode)->i_compress_flag = option.compress_flag & COMPRESS_OPTION_MASK;
>   	f2fs_mark_inode_dirty_sync(inode, true);
>   
>   	if (!f2fs_is_compress_backend_ready(inode))
> @@ -4221,7 +4246,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>   	case F2FS_IOC_GET_COMPRESS_OPTION:
>   		return f2fs_ioc_get_compress_option(filp, arg);
>   	case F2FS_IOC_SET_COMPRESS_OPTION:
> -		return f2fs_ioc_set_compress_option(filp, arg);
> +		return f2fs_ioc_set_compress_option(filp, arg, F2FS_IOC_SET_COMPRESS_OPTION);
> +	case F2FS_IOC_SET_COMPRESS_OPTION_V2:
> +		return f2fs_ioc_set_compress_option(filp, arg, F2FS_IOC_SET_COMPRESS_OPTION_V2);

It needs to adapt f2fs_compat_ioctl() as well.

>   	case F2FS_IOC_DECOMPRESS_FILE:
>   		return f2fs_ioc_decompress_file(filp, arg);
>   	case F2FS_IOC_COMPRESS_FILE:
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index 955d440be104..aaf7f55273fb 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -43,6 +43,8 @@
>   #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
>   #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
>   #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
> +#define F2FS_IOC_SET_COMPRESS_OPTION_V2	_IOW(F2FS_IOCTL_MAGIC, 26,	\
> +						struct f2fs_comp_option_v2)
>   
>   /*
>    * should be same as XFS_IOC_GOINGDOWN.
> @@ -62,6 +64,15 @@
>   #define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
>   #define F2FS_TRIM_FILE_MASK		0x3
>   
> +/*
> + * Flags used by F2FS_IOC_SET_COMPRESS_OPTION_V2
> + */
> +#define COMPRESS_CHKSUM				0x0 /* enable chksum for compress file */
> +#define COMPRESS_LEVEL_OFFSET	8
> +#define COMPRESS_LEVEL_MASK		GENMASK(15, COMPRESS_LEVEL_OFFSET)
> +#define COMPRESS_OPTION_MASK	(COMPRESS_LEVEL_MASK | BIT(COMPRESS_CHKSUM))
> +#define GET_COMPRESS_LEVEL(x)	(((x) & COMPRESS_LEVEL_MASK) >> COMPRESS_LEVEL_OFFSET)
> +
>   struct f2fs_gc_range {
>   	__u32 sync;
>   	__u64 start;
> @@ -96,4 +107,14 @@ struct f2fs_comp_option {
>   	__u8 log_cluster_size;
>   };
>   
> +struct f2fs_comp_option_v2 {
> +	union {
> +		struct {
> +			__u8 algorithm;
> +			__u8 log_cluster_size;
> +			__u16 compress_flag;
> +		};
> +		struct f2fs_comp_option option;
> +	};
> +};

It looks using union may simply the implementation, but readability of new structure
becomes worse, since this structure will be exposed to user as an uapi interface, I
guess we'd better to consider more about its readability, thought?

Thanks,

>   #endif /* _UAPI_LINUX_F2FS_H */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
