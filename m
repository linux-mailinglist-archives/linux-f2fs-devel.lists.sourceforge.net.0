Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 301417266C9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jun 2023 19:10:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q6wfe-0007zC-NK;
	Wed, 07 Jun 2023 17:10:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q6wfd-0007y8-D0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vSyvho8J2sPt2eYH7Py2ueq897YNDXFlfTdYaPkzCIA=; b=koyy1q163RlzbAuX9ghDBBm2Q4
 1JyKBMxuHqQZv7VT5K3FnQ35hCKwrIAE+lBLSw/on6I9OGmEbpTk+R/F9uQpG6ajsCUyohdh0wqGH
 pwA1yfjqFjBX8yiDeQ38wzaVMmGMf1/U1xnpwtMpxD3fSvIa5KJy3WNTqlH221v0EWYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vSyvho8J2sPt2eYH7Py2ueq897YNDXFlfTdYaPkzCIA=; b=ls4ZdBZAwL7oM/rk3FMi1ULHNj
 PC+o1Mj9u4G1Vi7DlmswANka/oQOFaUZYf8BZsHIQL9WhojZ7m/WpvHoaOyPTuHZ90WNuG47BZY67
 ztqWfRYUNZ1Pgl+Cwxz+Y6DyByU6Igxb4V4ED83PHCX7kpM9P9QLGF1w8GaUXgEgtvxQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q6wfa-00Dv0y-Ow for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jun 2023 17:10:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48F42641B5;
 Wed,  7 Jun 2023 17:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71480C433EF;
 Wed,  7 Jun 2023 17:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686157796;
 bh=41c6+5dBRu3WliHfxWom9vmj1ZVIB62OorQIgielB+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sKubU+eyu4ghmCvGo6eW9pqorXjjxBS4Dh0lXBXVCuW74gSMTHwmF29cv1uc6sxR/
 fpTyPpN70UxgAe2G5lxmcWItQcjcZEcONWKuxMf5JlnGLZL1QAQHpD/sLbmPUkmwRQ
 BdEqdNyc7RZ/g4QhTofsbyHuyYdaveGZ0Z7w997axU4biz0SIHN/QwZCZoSWD+ald4
 rEkFF4F7gVOxUbe0yfLUbk1RgyO7kt1QHhVSVwtTTIyy+y2wKByDdI36AVJdU3nwxe
 x+Z6YSQRiO5PioLQnECNKGgwJ+mD1oEwJhTf3ZHm2wGAn6vCfzBjZqdEqjWA0ukJrr
 lbMC9ho10q80Q==
Date: Wed, 7 Jun 2023 10:09:54 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <ZIC54l1cpKp5+s6E@google.com>
References: <bfcb9d94-15a7-3dd7-7e1c-c041e3ee2769@kernel.org>
 <20230604022830.14837-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230604022830.14837-1-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Could you please split the patches to have one topic each?
 I do see - is_level_valid - f2fs_ioc_get_compress_blocks -
 f2fs_get_compress_option_v2
 - f2fs_ioc_get|set_extra_attr Thanks, On 06/04, Sheng Yong wrote: > This
 patch introduces two ioctls: > * f2fs_ioc_get_extra_attr > *
 f2fs_ioc_set_extra_attr
 > to get or modify values in extra attribute area. > > The argument of these
 two [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q6wfa-00Dv0y-Ow
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add f2fs_ioc_[get|set]_extra_attr
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
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Could you please split the patches to have one topic each?
I do see
 - is_level_valid
 - f2fs_ioc_get_compress_blocks
 - f2fs_get_compress_option_v2
 - f2fs_ioc_get|set_extra_attr

Thanks,

On 06/04, Sheng Yong wrote:
> This patch introduces two ioctls:
>   * f2fs_ioc_get_extra_attr
>   * f2fs_ioc_set_extra_attr
> to get or modify values in extra attribute area.
> 
> The argument of these two ioctls is `struct f2fs_extra_attr', which has
> three members:
>   * field: indicates which field in extra attribute area is handled
>   * attr: value or userspace pointer
>   * attr_size: size of `attr'
> 
> The `field' member could help extend functionality of these two ioctls
> without modify or add new interfaces, if more fields are added into
> extra attributes ares in the feture.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
> v3:
>  * setting lz4(hc) level correctly
> v2:
>  * fix compiling error if CONFIG_F2FS_FS_ZSTD is disabled by adding a
>    helper f2fs_is_compress_level_valid()
>  * fix compiling warning for casting unsinged long long to pointer
> 
> ---
>  fs/f2fs/compress.c        |  33 +++++
>  fs/f2fs/f2fs.h            |   4 +
>  fs/f2fs/file.c            | 273 ++++++++++++++++++++++++++++++++++++--
>  fs/f2fs/inode.c           |  21 +++
>  fs/f2fs/super.c           |   2 +-
>  fs/f2fs/xattr.h           |   1 +
>  include/uapi/linux/f2fs.h |  35 +++++
>  7 files changed, 356 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 905b7c39a2b32..3fd804277059d 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -55,6 +55,7 @@ struct f2fs_compress_ops {
>  	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
>  	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
>  	int (*decompress_pages)(struct decompress_io_ctx *dic);
> +	bool (*is_level_valid)(int level);
>  };
>  
>  static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
> @@ -232,6 +233,7 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
>  	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
>  	.compress_pages		= lzo_compress_pages,
>  	.decompress_pages	= lzo_decompress_pages,
> +	.is_level_valid		= NULL,
>  };
>  #endif
>  
> @@ -308,11 +310,23 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
>  	return 0;
>  }
>  
> +static bool lz4_is_level_valid(int level)
> +{
> +	if (level == 0)
> +		return true;
> +#ifdef CONFIG_F2FS_FS_LZ4HC
> +	if (level >= LZ4HC_MIN_CLEVEL && level <= LZ4HC_MAX_CLEVEL)
> +		return true;
> +#endif
> +	return false;
> +}
> +
>  static const struct f2fs_compress_ops f2fs_lz4_ops = {
>  	.init_compress_ctx	= lz4_init_compress_ctx,
>  	.destroy_compress_ctx	= lz4_destroy_compress_ctx,
>  	.compress_pages		= lz4_compress_pages,
>  	.decompress_pages	= lz4_decompress_pages,
> +	.is_level_valid		= lz4_is_level_valid,
>  };
>  #endif
>  
> @@ -477,6 +491,13 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
>  	return 0;
>  }
>  
> +static bool zstd_is_level_valid(int level)
> +{
> +	if (level < zstd_min_clevel() || level > zstd_max_clevel())
> +		return false;
> +	return true;
> +}
> +
>  static const struct f2fs_compress_ops f2fs_zstd_ops = {
>  	.init_compress_ctx	= zstd_init_compress_ctx,
>  	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
> @@ -484,6 +505,7 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
>  	.init_decompress_ctx	= zstd_init_decompress_ctx,
>  	.destroy_decompress_ctx	= zstd_destroy_decompress_ctx,
>  	.decompress_pages	= zstd_decompress_pages,
> +	.is_level_valid		= zstd_is_level_valid,
>  };
>  #endif
>  
> @@ -508,6 +530,7 @@ static const struct f2fs_compress_ops f2fs_lzorle_ops = {
>  	.destroy_compress_ctx	= lzo_destroy_compress_ctx,
>  	.compress_pages		= lzorle_compress_pages,
>  	.decompress_pages	= lzo_decompress_pages,
> +	.is_level_valid		= NULL,
>  };
>  #endif
>  #endif
> @@ -542,6 +565,16 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>  	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
>  }
>  
> +bool f2fs_is_compress_level_valid(int alg, int lvl)
> +{
> +	const struct f2fs_compress_ops *cops = f2fs_cops[alg];
> +
> +	if (cops->is_level_valid)
> +		return cops->is_level_valid(lvl);
> +
> +	return lvl == 0;
> +}
> +
>  static mempool_t *compress_page_pool;
>  static int num_compress_pages = 512;
>  module_param(num_compress_pages, uint, 0444);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index faa27f41f39d4..9fcf8f66c860c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3475,6 +3475,8 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
>  void f2fs_set_inode_flags(struct inode *inode);
>  bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
>  void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
> +int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi, struct inode *inode,
> +			u32 *chksum);
>  struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
>  struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
>  int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
> @@ -4232,6 +4234,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>  int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
>  void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>  bool f2fs_is_compress_backend_ready(struct inode *inode);
> +bool f2fs_is_compress_level_valid(int alg, int lvl);
>  int __init f2fs_init_compress_mempool(void);
>  void f2fs_destroy_compress_mempool(void);
>  void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
> @@ -4296,6 +4299,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
>  	/* not support compression */
>  	return false;
>  }
> +static inline bool f2fs_is_compress_level_valid(int alg, int lvl) { return false; }
>  static inline struct page *f2fs_compress_control_page(struct page *page)
>  {
>  	WARN_ON_ONCE(1);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 78aa8cff4b41d..353a2edacc549 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3376,10 +3376,12 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
>  	return err;
>  }
>  
> -static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
> +static int f2fs_get_compress_blocks(struct file *filp, unsigned int attr_size)
>  {
>  	struct inode *inode = file_inode(filp);
> -	__u64 blocks;
> +
> +	if (attr_size != sizeof(__u64))
> +		return -EINVAL;
>  
>  	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
>  		return -EOPNOTSUPP;
> @@ -3387,7 +3389,14 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
>  	if (!f2fs_compressed_file(inode))
>  		return -EINVAL;
>  
> -	blocks = atomic_read(&F2FS_I(inode)->i_compr_blocks);
> +	return atomic_read(&F2FS_I(inode)->i_compr_blocks);
> +}
> +
> +static int f2fs_ioc_get_compress_blocks(struct file *filp, unsigned long arg)
> +{
> +	__u64 blocks;
> +
> +	blocks = f2fs_get_compress_blocks(filp, sizeof(blocks));
>  	return put_user(blocks, (u64 __user *)arg);
>  }
>  
> @@ -3905,10 +3914,14 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> -static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
> +static int f2fs_get_compress_option_v2(struct file *filp,
> +				       unsigned long attr, __u16 *attr_size)
>  {
>  	struct inode *inode = file_inode(filp);
> -	struct f2fs_comp_option option;
> +	struct f2fs_comp_option_v2 option;
> +
> +	if (sizeof(option) < *attr_size)
> +		*attr_size = sizeof(option);
>  
>  	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
>  		return -EOPNOTSUPP;
> @@ -3922,31 +3935,42 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
>  
>  	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
>  	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
> +	option.level = F2FS_I(inode)->i_compress_level;
> +	option.flag = F2FS_I(inode)->i_compress_flag;
>  
>  	inode_unlock_shared(inode);
>  
> -	if (copy_to_user((struct f2fs_comp_option __user *)arg, &option,
> -				sizeof(option)))
> +	if (copy_to_user((void __user *)attr, &option, *attr_size))
>  		return -EFAULT;
>  
>  	return 0;
>  }
>  
> -static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> +static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
> +{
> +	__u16 size = sizeof(struct f2fs_comp_option);
> +
> +	return f2fs_get_compress_option_v2(filp, arg, &size);
> +}
> +
> +static int f2fs_set_compress_option_v2(struct file *filp,
> +				       unsigned long attr, __u16 *attr_size)
>  {
>  	struct inode *inode = file_inode(filp);
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	struct f2fs_comp_option option;
> +	struct f2fs_comp_option_v2 option;
>  	int ret = 0;
>  
> +	if (sizeof(option) < *attr_size)
> +		*attr_size = sizeof(option);
> +
>  	if (!f2fs_sb_has_compression(sbi))
>  		return -EOPNOTSUPP;
>  
>  	if (!(filp->f_mode & FMODE_WRITE))
>  		return -EBADF;
>  
> -	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
> -				sizeof(option)))
> +	if (copy_from_user(&option, (void __user *)attr, *attr_size))
>  		return -EFAULT;
>  
>  	if (!f2fs_compressed_file(inode) ||
> @@ -3955,6 +3979,14 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>  			option.algorithm >= COMPRESS_MAX)
>  		return -EINVAL;
>  
> +	if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
> +		if (!f2fs_is_compress_level_valid(option.algorithm,
> +						  option.level))
> +			return -EINVAL;
> +		if (option.flag > BIT(COMPRESS_MAX_FLAG) - 1)
> +			return -EINVAL;
> +	}
> +
>  	file_start_write(filp);
>  	inode_lock(inode);
>  
> @@ -3971,6 +4003,10 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>  	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
>  	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
>  	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
> +	if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
> +		F2FS_I(inode)->i_compress_level = option.level;
> +		F2FS_I(inode)->i_compress_flag = option.flag;
> +	}
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  
>  	if (!f2fs_is_compress_backend_ready(inode))
> @@ -3983,6 +4019,13 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> +static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
> +{
> +	__u16 size = sizeof(struct f2fs_comp_option);
> +
> +	return f2fs_set_compress_option_v2(filp, arg, &size);
> +}
> +
>  static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
>  {
>  	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
> @@ -4168,6 +4211,208 @@ static int f2fs_ioc_compress_file(struct file *filp)
>  	return ret;
>  }
>  
> +static bool extra_attr_fits_in_inode(struct inode *inode, int field)
> +{
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_inode *ri;
> +
> +	switch (field) {
> +	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
> +	case F2FS_EXTRA_ATTR_ISIZE:
> +	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
> +		return true;
> +	case F2FS_EXTRA_ATTR_PROJID:
> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid))
> +			return false;
> +		return true;
> +	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
> +			return false;
> +		return true;
> +	case F2FS_EXTRA_ATTR_CRTIME:
> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_crtime))
> +			return false;
> +		return true;
> +	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
> +	case F2FS_EXTRA_ATTR_COMPR_OPTION:
> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_compr_blocks))
> +			return false;
> +		return true;
> +	default:
> +		BUG_ON(1);
> +		return false;
> +	}
> +}
> +
> +static int f2fs_ioc_get_extra_attr(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_extra_attr attr;
> +	u32 chksum;
> +	int ret = 0;
> +
> +	if (!f2fs_has_extra_attr(inode))
> +		return -EOPNOTSUPP;
> +
> +	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
> +		return -EFAULT;
> +
> +	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
> +		return -EINVAL;
> +
> +	if (!extra_attr_fits_in_inode(inode, attr.field))
> +		return -EOPNOTSUPP;
> +
> +	switch (attr.field) {
> +	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
> +		attr.attr = F2FS_TOTAL_EXTRA_ATTR_SIZE;
> +		break;
> +	case F2FS_EXTRA_ATTR_ISIZE:
> +		attr.attr = fi->i_extra_isize;
> +		break;
> +	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
> +		if (!f2fs_has_inline_xattr(inode))
> +			return -EOPNOTSUPP;
> +		attr.attr = get_inline_xattr_addrs(inode);
> +		break;
> +	case F2FS_EXTRA_ATTR_PROJID:
> +		if (!f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
> +			return -EOPNOTSUPP;
> +		attr.attr = from_kprojid(&init_user_ns, fi->i_projid);
> +		break;
> +	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
> +		ret = f2fs_inode_chksum_get(sbi, inode, &chksum);
> +		if (ret)
> +			return ret;
> +		attr.attr = chksum;
> +		break;
> +	case F2FS_EXTRA_ATTR_CRTIME:
> +		if (!f2fs_sb_has_inode_crtime(sbi))
> +			return -EOPNOTSUPP;
> +		if (attr.attr_size == sizeof(struct timespec64)) {
> +			if (put_timespec64(&fi->i_crtime,
> +					(void __user *)(uintptr_t)attr.attr))
> +				return -EFAULT;
> +		} else if (attr.attr_size == sizeof(struct old_timespec32)) {
> +			if (put_old_timespec32(&fi->i_crtime,
> +					(void __user *)(uintptr_t)attr.attr))
> +				return -EFAULT;
> +		} else {
> +			return -EINVAL;
> +		}
> +		break;
> +	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
> +		ret = f2fs_get_compress_blocks(filp, attr.attr_size);
> +		attr.attr = ret;
> +		break;
> +	case F2FS_EXTRA_ATTR_COMPR_OPTION:
> +		ret = f2fs_get_compress_option_v2(filp, attr.attr,
> +						  &attr.attr_size);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (copy_to_user((void __user *)arg, &attr, sizeof(attr)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +static int f2fs_ioc_set_extra_attr(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct f2fs_extra_attr attr;
> +	struct page *ipage;
> +	void *inline_addr;
> +	int ret;
> +
> +	if (!f2fs_has_extra_attr(inode))
> +		return -EOPNOTSUPP;
> +
> +	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
> +		return -EFAULT;
> +
> +	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
> +		return -EINVAL;
> +
> +	if (!extra_attr_fits_in_inode(inode, attr.field))
> +		return -EOPNOTSUPP;
> +
> +	switch (attr.field) {
> +	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
> +	case F2FS_EXTRA_ATTR_ISIZE:
> +	case F2FS_EXTRA_ATTR_PROJID:
> +	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
> +	case F2FS_EXTRA_ATTR_CRTIME:
> +	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
> +		/* read only attribtues */
> +		return -EOPNOTSUPP;
> +	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
> +		if (!f2fs_sb_has_flexible_inline_xattr(sbi) ||
> +		    !f2fs_has_inline_xattr(inode))
> +			return -EOPNOTSUPP;
> +		if (attr.attr < MIN_INLINE_XATTR_SIZE ||
> +		    attr.attr > MAX_INLINE_XATTR_SIZE)
> +			return -EINVAL;
> +		inode_lock(inode);
> +		f2fs_lock_op(sbi);
> +		f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
> +		if (i_size_read(inode) || F2FS_I(inode)->i_xattr_nid) {
> +			/*
> +			 * it is not allowed to set this field if the inode
> +			 * has data or xattr node
> +			 */
> +			ret = -EFBIG;
> +			goto xattr_out_unlock;
> +		}
> +		ipage = f2fs_get_node_page(sbi, inode->i_ino);
> +		if (IS_ERR(ipage)) {
> +			ret = PTR_ERR(ipage);
> +			goto xattr_out_unlock;
> +		}
> +		inline_addr = inline_xattr_addr(inode, ipage);
> +		if (!IS_XATTR_LAST_ENTRY(XATTR_FIRST_ENTRY(inline_addr))) {
> +			ret = -EFBIG;
> +		} else {
> +			struct f2fs_xattr_header *hdr;
> +			struct f2fs_xattr_entry *ent;
> +
> +			F2FS_I(inode)->i_inline_xattr_size = (int)attr.attr;
> +			inline_addr = inline_xattr_addr(inode, ipage);
> +			hdr = XATTR_HDR(inline_addr);
> +			ent = XATTR_FIRST_ENTRY(inline_addr);
> +			hdr->h_magic = cpu_to_le32(F2FS_XATTR_MAGIC);
> +			hdr->h_refcount = cpu_to_le32(1);
> +			memset(ent, 0, attr.attr - sizeof(*hdr));
> +			set_page_dirty(ipage);
> +			ret = 0;
> +		}
> +		f2fs_put_page(ipage, 1);
> +xattr_out_unlock:
> +		f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
> +		f2fs_unlock_op(sbi);
> +		inode_unlock(inode);
> +		if (!ret)
> +			f2fs_balance_fs(sbi, true);
> +		break;
> +	case F2FS_EXTRA_ATTR_COMPR_OPTION:
> +		ret = f2fs_set_compress_option_v2(filp, attr.attr,
> +						  &attr.attr_size);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
>  static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	switch (cmd) {
> @@ -4239,7 +4484,7 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	case FS_IOC_SETFSLABEL:
>  		return f2fs_ioc_setfslabel(filp, arg);
>  	case F2FS_IOC_GET_COMPRESS_BLOCKS:
> -		return f2fs_get_compress_blocks(filp, arg);
> +		return f2fs_ioc_get_compress_blocks(filp, arg);
>  	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
>  		return f2fs_release_compress_blocks(filp, arg);
>  	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
> @@ -4254,6 +4499,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_decompress_file(filp);
>  	case F2FS_IOC_COMPRESS_FILE:
>  		return f2fs_ioc_compress_file(filp);
> +	case F2FS_IOC_GET_EXTRA_ATTR:
> +		return f2fs_ioc_get_extra_attr(filp, arg);
> +	case F2FS_IOC_SET_EXTRA_ATTR:
> +		return f2fs_ioc_set_extra_attr(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 0a17484443299..aef9c1fd37dca 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -204,6 +204,27 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
>  	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
>  }
>  
> +int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi,
> +			  struct inode *inode, u32 *chksum)
> +{
> +	struct page *ipage;
> +	struct f2fs_inode_info *fi = F2FS_I(inode);
> +	struct f2fs_inode *ri;
> +
> +	if (!f2fs_sb_has_inode_chksum(sbi) ||
> +	    !f2fs_has_extra_attr(inode) ||
> +	    !F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
> +		return -EOPNOTSUPP;
> +
> +	ipage = f2fs_get_node_page(sbi, inode->i_ino);
> +	if (IS_ERR(ipage))
> +		return PTR_ERR(ipage);
> +
> +	*chksum = f2fs_inode_chksum(sbi, ipage);
> +	f2fs_put_page(ipage, true);
> +	return 0;
> +}
> +
>  static bool sanity_check_compress_inode(struct inode *inode,
>  			struct f2fs_inode *ri)
>  {
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 374c990810ead..64adaec4e98e0 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1361,7 +1361,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			return -EINVAL;
>  		}
>  
> -		min_size = sizeof(struct f2fs_xattr_header) / sizeof(__le32);
> +		min_size = MIN_INLINE_XATTR_SIZE;
>  		max_size = MAX_INLINE_XATTR_SIZE;
>  
>  		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
> diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
> index 416d652774a33..b1811c392e6f1 100644
> --- a/fs/f2fs/xattr.h
> +++ b/fs/f2fs/xattr.h
> @@ -83,6 +83,7 @@ struct f2fs_xattr_entry {
>  				sizeof(struct f2fs_xattr_header) -	\
>  				sizeof(struct f2fs_xattr_entry))
>  
> +#define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
>  #define MAX_INLINE_XATTR_SIZE						\
>  			(DEF_ADDRS_PER_INODE -				\
>  			F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -	\
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index 955d440be1046..a8fdaa22c7bda 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -44,6 +44,11 @@
>  #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
>  #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
>  
> +#define F2FS_IOC_GET_EXTRA_ATTR		_IOR(F2FS_IOCTL_MAGIC, 26,	\
> +						struct f2fs_extra_attr)
> +#define F2FS_IOC_SET_EXTRA_ATTR		_IOW(F2FS_IOCTL_MAGIC, 27,	\
> +						struct f2fs_extra_attr)
> +
>  /*
>   * should be same as XFS_IOC_GOINGDOWN.
>   * Flags for going down operation used by FS_IOC_GOINGDOWN
> @@ -96,4 +101,34 @@ struct f2fs_comp_option {
>  	__u8 log_cluster_size;
>  };
>  
> +struct f2fs_comp_option_v2 {
> +	__u8 algorithm;
> +	__u8 log_cluster_size;
> +	__u8 level;
> +	__u8 flag;
> +};
> +
> +enum {
> +	F2FS_EXTRA_ATTR_TOTAL_SIZE,		/* ro, size of extra attr area */
> +	F2FS_EXTRA_ATTR_ISIZE,			/* ro, i_extra_isize */
> +	F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE,	/* rw, i_inline_xattr_size */
> +	F2FS_EXTRA_ATTR_PROJID,			/* ro, i_projid */
> +	F2FS_EXTRA_ATTR_INODE_CHKSUM,		/* ro, i_inode_chksum */
> +	F2FS_EXTRA_ATTR_CRTIME,			/* ro, i_crtime, i_crtime_nsec */
> +	F2FS_EXTRA_ATTR_COMPR_BLOCKS,		/* ro, i_compr_blocks */
> +	F2FS_EXTRA_ATTR_COMPR_OPTION,		/* rw, i_compress_algorithm,
> +						 * i_log_cluster_size,
> +						 * i_compress_flag
> +						 */
> +	F2FS_EXTRA_ATTR_MAX,
> +};
> +
> +struct f2fs_extra_attr {
> +	__u8 field;		/* F2FS_EXTRA_ATTR_* */
> +	__u8 rsvd1;
> +	__u16 attr_size;	/* size of @attr */
> +	__u32 rsvd2;
> +	__u64 attr;		/* attr value or pointer */
> +};
> +
>  #endif /* _UAPI_LINUX_F2FS_H */
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
