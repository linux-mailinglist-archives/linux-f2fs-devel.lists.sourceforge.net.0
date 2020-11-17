Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D43D2B6B6D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 18:13:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf4Xt-0007F2-Sv; Tue, 17 Nov 2020 17:13:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kf4Xs-0007Eu-0b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b+NrjH8p0cnRv9TTGjADv7C9ZV3sStRVHC2gCZf1GTo=; b=Tbp6y3gkWJrE0VvCHZfnvs04ng
 o/LrRSom0aB1LuvPeuBJiSfI9lICfMzlBbepwVryEL75xDarnrfHqw3qmcwaZKf613wTVeTfWf55j
 kcPsB5fHII62A2Wcw98dCILvy/VTpHvfGUbO0D9QU5AbWhZTT7mXJukGFyd6pN3TxRHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b+NrjH8p0cnRv9TTGjADv7C9ZV3sStRVHC2gCZf1GTo=; b=fuWdIjUJ8ZlJB94ofSk5JzmFR4
 5xr3ALSBD49E1oHhnT98TFHFD7mjdWB7FF4h/VvnebIKUBpgsY6yzVjKv6QH+8AHV6J9BSxrz/e9p
 SQ4OR7OWXtt7w8NEEviuzRlRmrsI0iGzlbZWhjd6BYJs4hvDxr7averJEH6XhiSP0OtA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf4Xk-001AZ6-K5
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 17:13:31 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 81AD4238E6;
 Tue, 17 Nov 2020 17:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605633191;
 bh=mIVA1fs7nl40nzaZYo7waKORB23nQYtbCh0SR3E8gz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xTCyTMoZH+Jse9X1iob5LC79sGQZZPhVJGi1+oD3/Iq7F5bhpVlXAX38APh6WeOn5
 5BSBXYuwxX2nrqtZYAok8jWZubLDbwefWeHA/FClkSrwmh0H6+VNJ5cPBuvw9QXt2j
 aYdpgsa5b13WyLqvrm2E751Fa7az4vzeDWW7hVYo=
Date: Tue, 17 Nov 2020 09:13:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201117171309.GA1645652@google.com>
References: <20201117040223.858979-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040223.858979-1-daeho43@gmail.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.4 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kf4Xk-001AZ6-K5
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add disable_auto_compr mount option
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

On 11/17, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> We will add a new disable_auto_compr mount option to turn off the
> automaic compression on the compression enabled file, in order to
> give discretion of choosing the target file and the timing of
> compression to the user.

The aim would be getting compressed inode format but having no compressed
blocks in file contents which will be done by coming ioctls manually by user.

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  Documentation/filesystems/f2fs.rst |  4 ++++
>  fs/f2fs/data.c                     | 10 +++++-----
>  fs/f2fs/f2fs.h                     |  8 ++++++++
>  fs/f2fs/segment.c                  |  2 +-
>  fs/f2fs/super.c                    |  9 +++++++++
>  5 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index b8ee761c9922..c36ca1e0f7ab 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -260,6 +260,10 @@ compress_extension=%s	 Support adding specified extension, so that f2fs can enab
>  			 For other files, we can still enable compression via ioctl.
>  			 Note that, there is one reserved special extension '*', it
>  			 can be set to enable compression for all files.
> +disable_auto_compr       Even if compression feature is enabled, this option can
> +                         disable automaic compression on the compression enabled
> +                         file to give discretion of choosing the target file and
> +                         the timing of compression to the user.
>  inlinecrypt		 When possible, encrypt/decrypt the contents of encrypted
>  			 files using the blk-crypto framework rather than
>  			 filesystem-layer encryption. This allows the use of
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c31ec408bd4f..414c8370ab7e 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2896,7 +2896,7 @@ static int f2fs_write_data_page(struct page *page,
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>  		goto out;
>  
> -	if (f2fs_compressed_file(inode)) {
> +	if (f2fs_need_compress_write(inode)) {
>  		if (f2fs_is_compressed_cluster(inode, page->index)) {
>  			redirty_page_for_writepage(wbc, page);
>  			return AOP_WRITEPAGE_ACTIVATE;
> @@ -2988,7 +2988,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  readd:
>  			need_readd = false;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -			if (f2fs_compressed_file(inode)) {
> +			if (f2fs_need_compress_write(inode)) {
>  				ret = f2fs_init_compress_ctx(&cc);
>  				if (ret) {
>  					done = 1;
> @@ -3067,7 +3067,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  				goto continue_unlock;
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -			if (f2fs_compressed_file(inode)) {
> +			if (f2fs_need_compress_write(inode)) {
>  				get_page(page);
>  				f2fs_compress_ctx_add_page(&cc, page);
>  				continue;
> @@ -3120,7 +3120,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  	}
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	/* flush remained pages in compress cluster */
> -	if (f2fs_compressed_file(inode) && !f2fs_cluster_is_empty(&cc)) {
> +	if (f2fs_need_compress_write(inode) && !f2fs_cluster_is_empty(&cc)) {
>  		ret = f2fs_write_multi_pages(&cc, &submitted, wbc, io_type);
>  		nwritten += submitted;
>  		wbc->nr_to_write -= submitted;
> @@ -3162,7 +3162,7 @@ static inline bool __should_serialize_io(struct inode *inode,
>  	if (IS_NOQUOTA(inode))
>  		return false;
>  
> -	if (f2fs_compressed_file(inode))
> +	if (f2fs_need_compress_write(inode))
>  		return true;
>  	if (wbc->sync_mode != WB_SYNC_ALL)
>  		return true;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index a33c90cf979b..c473c78699bc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -99,6 +99,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
>  #define F2FS_MOUNT_NORECOVERY		0x04000000
>  #define F2FS_MOUNT_ATGC			0x08000000
> +#define F2FS_MOUNT_DISABLE_AUTO_COMPR	0x10000000
>  
>  #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
>  #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
> @@ -2838,6 +2839,13 @@ static inline int f2fs_compressed_file(struct inode *inode)
>  		is_inode_flag_set(inode, FI_COMPRESSED_FILE);
>  }
>  
> +static inline int f2fs_need_compress_write(struct inode *inode)
> +{
> +	if (test_opt(F2FS_I_SB(inode), DISABLE_AUTO_COMPR))
> +		return 0;
> +	return f2fs_compressed_file(inode);
> +}
> +
>  static inline unsigned int addrs_per_inode(struct inode *inode)
>  {
>  	unsigned int addrs = CUR_ADDRS_PER_INODE(inode) -
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a0d7a7e04bc7..f56a8b6bbee7 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3245,7 +3245,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>  			else
>  				return CURSEG_COLD_DATA;
>  		}
> -		if (file_is_cold(inode) || f2fs_compressed_file(inode))
> +		if (file_is_cold(inode) || f2fs_need_compress_write(inode))
>  			return CURSEG_COLD_DATA;
>  		if (file_is_hot(inode) ||
>  				is_inode_flag_set(inode, FI_HOT_DATA) ||
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 5bb523bf32a6..909c1543b282 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -146,6 +146,7 @@ enum {
>  	Opt_compress_algorithm,
>  	Opt_compress_log_size,
>  	Opt_compress_extension,
> +	Opt_disable_auto_compr,
>  	Opt_atgc,
>  	Opt_err,
>  };
> @@ -214,6 +215,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_compress_algorithm, "compress_algorithm=%s"},
>  	{Opt_compress_log_size, "compress_log_size=%u"},
>  	{Opt_compress_extension, "compress_extension=%s"},
> +	{Opt_disable_auto_compr, "disable_auto_compr"},
>  	{Opt_atgc, "atgc"},
>  	{Opt_err, NULL},
>  };
> @@ -934,10 +936,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			F2FS_OPTION(sbi).compress_ext_cnt++;
>  			kfree(name);
>  			break;
> +		case Opt_disable_auto_compr:
> +			set_opt(sbi, DISABLE_AUTO_COMPR);
> +			break;
>  #else
>  		case Opt_compress_algorithm:
>  		case Opt_compress_log_size:
>  		case Opt_compress_extension:
> +		case Opt_disable_auto_compr:
>  			f2fs_info(sbi, "compression options not supported");
>  			break;
>  #endif
> @@ -1511,6 +1517,9 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
>  		seq_printf(seq, ",compress_extension=%s",
>  			F2FS_OPTION(sbi).extensions[i]);
>  	}
> +
> +	if (test_opt(sbi, DISABLE_AUTO_COMPR))
> +		seq_puts(seq, ",disable_auto_compr");
>  }
>  
>  static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> -- 
> 2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
