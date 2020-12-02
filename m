Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6F52CB50A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Dec 2020 07:31:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkLg3-0001iM-Tw; Wed, 02 Dec 2020 06:31:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkLg2-0001iA-Rc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 06:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7p8XQmv2Ss9X3NYQPEflcIXv50ydNQdeGpBG0M0yT4s=; b=RFu1xh4tTT1VCMpn/NTc5jT6gO
 ZRTv2fJkeD+ScuOW+LYBYwW7QET0ytPeEMxAcpBUffxPeM8QL1rqO4yr4XOq29U8SYosv91JZ+s+w
 k5qUhJ2hQ0P2KeKS4xQZ0n/ySjjBfI8HSvzMEgEt/GxsKV6dRtMTxkWU6We3NLD1W/Nk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7p8XQmv2Ss9X3NYQPEflcIXv50ydNQdeGpBG0M0yT4s=; b=cb4H3W2qKfcxlVG+84E3adxP/3
 9MC4NTUomyuNK1KGh2pS6KpUkFNRTFdV/kGymDwhRKZMzjoatVY+wgR0LOik42PaCSIee6w8LaapP
 aR+9iSBZ1reZclYouZRO3a5fH3ayXFzaqY2nIpv02QpTcWgiz+A8e+T3VCHYpuj1A9vA=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkLfv-00Ak7S-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 06:31:46 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cm8HC5b21zLxqH;
 Wed,  2 Dec 2020 14:30:47 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 2 Dec 2020
 14:31:16 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201201040803.3590442-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b8d99522-f63a-1866-9bb4-1a4d640d7495@huawei.com>
Date: Wed, 2 Dec 2020 14:31:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201201040803.3590442-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkLfv-00Ak7S-Tv
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add compress_mode mount option
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
> We will add a new "compress_mode" mount option to control file
> compression mode. This supports "fs" and "user". In "fs" mode (default),
> f2fs does automatic compression on the compression enabled files.
> In "user" mode, f2fs disables the automaic compression and gives the
> user discretion of choosing the target file and the timing. It means
> the user can do manual compression/decompression on the compression
> enabled files using ioctls.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: changed mount option name and added more explanation of mount option
> ---
>   Documentation/filesystems/f2fs.rst | 35 ++++++++++++++++++++++++++++++
>   fs/f2fs/compress.c                 |  2 +-
>   fs/f2fs/data.c                     |  2 +-
>   fs/f2fs/f2fs.h                     | 30 +++++++++++++++++++++++++
>   fs/f2fs/segment.c                  |  2 +-
>   fs/f2fs/super.c                    | 23 ++++++++++++++++++++
>   6 files changed, 91 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index b8ee761c9922..5eb8d63439ec 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -260,6 +260,13 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
>   			 For other files, we can still enable compression via ioctl.
>   			 Note that, there is one reserved special extension '*', it
>   			 can be set to enable compression for all files.
> +compress_mode=%s	 Control file compression mode. This supports "fs" and "user"
> +			 modes. In "fs" mode (default), f2fs does automatic compression
> +			 on the compression enabled files. In "user" mode, f2fs disables
> +			 the automaic compression and gives the user discretion of
> +			 choosing the target file and the timing. The user can do manual
> +			 compression/decompression on the compression enabled files using
> +			 ioctls.
>   inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
>   			 files using the blk-crypto framework rather than
>   			 filesystem-layer encryption. This allows the use of
> @@ -810,6 +817,34 @@ Compress metadata layout::
>   	| data length | data chksum | reserved |      compressed data       |
>   	+-------------+-------------+----------+----------------------------+
>   
> +Compression mode
> +--------------------------
> +
> +f2fs supports "fs" and "user" compression modes with "compression_mode" mount option.
> +With this option, f2fs provides a choice to select the way how to compress the
> +compression enabled files (refer to "Compression implementation" section for how to
> +enable compression on a regular inode).
> +
> +1) compress_mode=fs
> +This is the default option. f2fs does automatic compression in the writeback of the
> +compression enabled files.
> +
> +2) compress_mode=user
> +This disables the automaic compression and gives the user discretion of choosing the
> +target file and the timing. The user can do manual compression/decompression on the
> +compression enabled files using F2FS_IOC_DECOMPRESS_FILE and F2FS_IOC_COMPRESS_FILE
> +ioctls like the below.
> +
> +To decompress a file,
> +
> +fd = open(filename, O_WRONLY, 0);
> +ret = ioctl(fd, F2FS_IOC_DECOMPRESS_FILE);
> +
> +To compress a file,
> +
> +fd = open(filename, O_WRONLY, 0);
> +ret = ioctl(fd, F2FS_IOC_COMPRESS_FILE);
> +
>   NVMe Zoned Namespace devices
>   ----------------------------
>   
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 3957a84a185e..87090da8693d 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -926,7 +926,7 @@ int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
>   
>   static bool cluster_may_compress(struct compress_ctx *cc)
>   {
> -	if (!f2fs_compressed_file(cc->inode))
> +	if (!f2fs_need_compress_data(cc->inode))
>   		return false;
>   	if (f2fs_is_atomic_file(cc->inode))
>   		return false;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index be4da52604ed..42254d3859c7 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3164,7 +3164,7 @@ static inline bool __should_serialize_io(struct inode *inode,
>   	if (IS_NOQUOTA(inode))
>   		return false;
>   
> -	if (f2fs_compressed_file(inode))
> +	if (f2fs_need_compress_data(inode))
>   		return true;
>   	if (wbc->sync_mode != WB_SYNC_ALL)
>   		return true;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e0826779a101..94d16bde5e24 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -149,6 +149,7 @@ struct f2fs_mount_info {
>   	unsigned char compress_algorithm;	/* algorithm type */
>   	unsigned compress_log_size;		/* cluster log size */
>   	unsigned char compress_ext_cnt;		/* extension count */
> +	int compress_mode;			/* compression mode */
>   	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
>   };
>   
> @@ -677,6 +678,7 @@ enum {
>   	FI_VERITY_IN_PROGRESS,	/* building fs-verity Merkle tree */
>   	FI_COMPRESSED_FILE,	/* indicate file's data can be compressed */
>   	FI_MMAP_FILE,		/* indicate file was mmapped */
> +	FI_ENABLE_COMPRESS,	/* enable compression in "user" compression mode */
>   	FI_MAX,			/* max flag, never be used */
>   };
>   
> @@ -1243,6 +1245,18 @@ enum fsync_mode {
>   	FSYNC_MODE_NOBARRIER,	/* fsync behaves nobarrier based on posix */
>   };
>   
> +enum {
> +	COMPR_MODE_FS,		/*
> +				 * automatically compress compression
> +				 * enabled files
> +				 */
> +	COMPR_MODE_USER,	/*
> +				 * automatical compression is disabled.
> +				 * user can control the file compression
> +				 * using ioctls
> +				 */
> +};
> +
>   /*
>    * this value is set in page as a private data which indicate that
>    * the page is atomically written, and it is in inmem_pages list.
> @@ -2752,6 +2766,22 @@ static inline int f2fs_compressed_file(struct inode *inode)
>   		is_inode_flag_set(inode, FI_COMPRESSED_FILE);
>   }
>   
> +static inline bool f2fs_need_compress_data(struct inode *inode)
> +{
> +	int compress_mode = F2FS_OPTION(F2FS_I_SB(inode)).compress_mode;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return false;
> +
> +	if (compress_mode == COMPR_MODE_FS)
> +		return true;
> +	else if (compress_mode == COMPR_MODE_USER &&
> +			is_inode_flag_set(inode, FI_ENABLE_COMPRESS))
> +		return true;
> +
> +	return false;
> +}
> +
>   static inline unsigned int addrs_per_inode(struct inode *inode)
>   {
>   	unsigned int addrs = CUR_ADDRS_PER_INODE(inode) -
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1596502f7375..5d6c9d6f237b 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3254,7 +3254,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>   			else
>   				return CURSEG_COLD_DATA;
>   		}
> -		if (file_is_cold(inode) || f2fs_compressed_file(inode))
> +		if (file_is_cold(inode) || f2fs_need_compress_data(inode))

Can we keep consistent about writting compressed file to code data area?

Or there is other concern about this?

Thanks,

>   			return CURSEG_COLD_DATA;
>   		if (file_is_hot(inode) ||
>   				is_inode_flag_set(inode, FI_HOT_DATA) ||
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 87f7a6e86370..cc6eb4ed80a2 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -146,6 +146,7 @@ enum {
>   	Opt_compress_algorithm,
>   	Opt_compress_log_size,
>   	Opt_compress_extension,
> +	Opt_compress_mode,
>   	Opt_atgc,
>   	Opt_err,
>   };
> @@ -214,6 +215,7 @@ static match_table_t f2fs_tokens = {
>   	{Opt_compress_algorithm, "compress_algorithm=%s"},
>   	{Opt_compress_log_size, "compress_log_size=%u"},
>   	{Opt_compress_extension, "compress_extension=%s"},
> +	{Opt_compress_mode, "compress_mode=%s"},
>   	{Opt_atgc, "atgc"},
>   	{Opt_err, NULL},
>   };
> @@ -934,10 +936,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   			F2FS_OPTION(sbi).compress_ext_cnt++;
>   			kfree(name);
>   			break;
> +		case Opt_compress_mode:
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +			if (!strcmp(name, "fs")) {
> +				F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
> +			} else if (!strcmp(name, "user")) {
> +				F2FS_OPTION(sbi).compress_mode = COMPR_MODE_USER;
> +			} else {
> +				kfree(name);
> +				return -EINVAL;
> +			}
> +			kfree(name);
> +			break;
>   #else
>   		case Opt_compress_algorithm:
>   		case Opt_compress_log_size:
>   		case Opt_compress_extension:
> +		case Opt_compress_mode:
>   			f2fs_info(sbi, "compression options not supported");
>   			break;
>   #endif
> @@ -1523,6 +1540,11 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>   		seq_printf(seq, ",compress_extension=%s",
>   			F2FS_OPTION(sbi).extensions[i]);
>   	}
> +
> +	if (F2FS_OPTION(sbi).compress_mode == COMPR_MODE_FS)
> +		seq_printf(seq, ",compress_mode=%s", "fs");
> +	else if (F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER)
> +		seq_printf(seq, ",compress_mode=%s", "user");
>   }
>   
>   static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> @@ -1672,6 +1694,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>   	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
>   	F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
>   	F2FS_OPTION(sbi).compress_ext_cnt = 0;
> +	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
>   	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>   
>   	sbi->sb->s_flags &= ~SB_INLINECRYPT;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
