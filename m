Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F2E2C1B5C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 03:16:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khNsv-0004mE-US; Tue, 24 Nov 2020 02:16:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1khNsu-0004lz-DO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 02:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/T/pxLL5D7lsGFOURJc0WCdVEbGb9urXc0KKwmH7Yv0=; b=Y4E7Y3812qRgsRwNF5pv2RyiKU
 6au8t1Bngj7sd1AzCKPPpfWJGGiyGUywiMEk16oQz06pTBMur+EuIgFZBw1Ziy+maGWZxM6NhKibo
 VQAYvMGFV2+ABwQxzUu3gTd2IHw/FTKUUjRUXfQpa6X1nC9l8Dx6Mzp5nRLkTo7Ebdv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/T/pxLL5D7lsGFOURJc0WCdVEbGb9urXc0KKwmH7Yv0=; b=NeqoDp2tQo4lv26ENLhfY0AzFk
 n7Q+Dy5Tmquerxd3xo3kiUhNVBvCkUFiylgetnOiGlNodAdB97iW1/8CH8yPbKo7lg1BGuuX16VBL
 yrq0uMu5Y2lsGshSaSPmC3KGEkjvuUzrIAlzU/KKtbBRIjM3lh0vMPZYt8t1aCnUXDm4=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1khNsm-00CTIO-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Nov 2020 02:16:48 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cg7196TV8zhfvV;
 Tue, 24 Nov 2020 10:16:13 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 24 Nov
 2020 10:16:25 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201123031751.36811-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fe62d93b-e76f-3d79-322e-1d16332c86aa@huawei.com>
Date: Tue, 24 Nov 2020 10:16:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201123031751.36811-1-daeho43@gmail.com>
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
X-Headers-End: 1khNsm-00CTIO-Rz
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add compress_mode mount option
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

On 2020/11/23 11:17, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We will add a new "compress_mode" mount option to control file
> compression mode. This supports "fs-based" and "user-based".
> In "fs-based" mode (default), f2fs does automatic compression on
> the compression enabled files. In "user-based" mode, f2fs disables
> the automaic compression and gives the user discretion of choosing
> the target file and the timing. It means the user can do manual
> compression/decompression on the compression enabled files using ioctls.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/filesystems/f2fs.rst |  7 +++++++
>   fs/f2fs/data.c                     | 10 +++++-----
>   fs/f2fs/f2fs.h                     | 30 ++++++++++++++++++++++++++++++
>   fs/f2fs/segment.c                  |  2 +-
>   fs/f2fs/super.c                    | 23 +++++++++++++++++++++++
>   5 files changed, 66 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index b8ee761c9922..0679c53d5012 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -260,6 +260,13 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
>   			 For other files, we can still enable compression via ioctl.
>   			 Note that, there is one reserved special extension '*', it
>   			 can be set to enable compression for all files.
> +compress_mode=%s	 Control file compression mode. This supports "fs-based" and
> +			 "user-based". In "fs-based" mode (default), f2fs does
> +			 automatic compression on the compression enabled files.
> +			 In "user-based" mode, f2fs disables the automaic compression
> +			 and gives the user discretion of choosing the target file and
> +			 the timing. The user can do manual compression/decompression
> +			 on the compression enabled files using ioctls.
>   inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
>   			 files using the blk-crypto framework rather than
>   			 filesystem-layer encryption. This allows the use of
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index be4da52604ed..69370f0073dd 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2896,7 +2896,7 @@ static int f2fs_write_data_page(struct page *page,
>   	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>   		goto out;
>   
> -	if (f2fs_compressed_file(inode)) {
> +	if (f2fs_need_compress_write(inode)) {
>   		if (f2fs_is_compressed_cluster(inode, page->index)) {
>   			redirty_page_for_writepage(wbc, page);
>   			return AOP_WRITEPAGE_ACTIVATE;
> @@ -2988,7 +2988,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   readd:
>   			need_readd = false;
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> -			if (f2fs_compressed_file(inode)) {
> +			if (f2fs_need_compress_write(inode)) {
>   				ret = f2fs_init_compress_ctx(&cc);
>   				if (ret) {
>   					done = 1;
> @@ -3067,7 +3067,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   				goto continue_unlock;
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> -			if (f2fs_compressed_file(inode)) {
> +			if (f2fs_need_compress_write(inode)) {
>   				get_page(page);
>   				f2fs_compress_ctx_add_page(&cc, page);
>   				continue;
> @@ -3120,7 +3120,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	}
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   	/* flush remained pages in compress cluster */
> -	if (f2fs_compressed_file(inode) && !f2fs_cluster_is_empty(&cc)) {
> +	if (f2fs_need_compress_write(inode) && !f2fs_cluster_is_empty(&cc)) {
>   		ret = f2fs_write_multi_pages(&cc, &submitted, wbc, io_type);
>   		nwritten += submitted;
>   		wbc->nr_to_write -= submitted;
> @@ -3164,7 +3164,7 @@ static inline bool __should_serialize_io(struct inode *inode,
>   	if (IS_NOQUOTA(inode))
>   		return false;
>   
> -	if (f2fs_compressed_file(inode))
> +	if (f2fs_need_compress_write(inode))
>   		return true;
>   	if (wbc->sync_mode != WB_SYNC_ALL)
>   		return true;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e0826779a101..88e012d07ad5 100644
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
> +	FI_ENABLE_COMPRESS,	/* enable compression in user-based compression mode */
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
> +static inline int f2fs_need_compress_write(struct inode *inode)

f2fs_need_compress_data() will be more suitable?

> +{
> +	int compress_mode = F2FS_OPTION(F2FS_I_SB(inode)).compress_mode;
> +
> +	if (!f2fs_compressed_file(inode))
> +		return 0;
> +
> +	if (compress_mode == COMPR_MODE_FS)
> +		return 1;
> +	else if (compress_mode == COMPR_MODE_USER &&
> +			is_inode_flag_set(inode, FI_ENABLE_COMPRESS))
> +		return 1;
> +
> +	return 0;

Can we use bool type for return value?

Thanks,

> +}
> +
>   static inline unsigned int addrs_per_inode(struct inode *inode)
>   {
>   	unsigned int addrs = CUR_ADDRS_PER_INODE(inode) -
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 1596502f7375..652ca049bb7e 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3254,7 +3254,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>   			else
>   				return CURSEG_COLD_DATA;
>   		}
> -		if (file_is_cold(inode) || f2fs_compressed_file(inode))
> +		if (file_is_cold(inode) || f2fs_need_compress_write(inode))
>   			return CURSEG_COLD_DATA;
>   		if (file_is_hot(inode) ||
>   				is_inode_flag_set(inode, FI_HOT_DATA) ||
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 87f7a6e86370..ea2385aa7f48 100644
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
> +			if (!strcmp(name, "fs-based")) {
> +				F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
> +			} else if (!strcmp(name, "user-based")) {
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
> +		seq_printf(seq, ",compress_mode=%s", "fs-based");
> +	else if (F2FS_OPTION(sbi).compress_mode == COMPR_MODE_USER)
> +		seq_printf(seq, ",compress_mode=%s", "user-based");
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
