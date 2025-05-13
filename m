Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348FAB4EB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 10:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leHYzqd4oS/y/h574CQ6ea0ScQwiUxZCguQI7BPj8cU=; b=SBbgii5AiF0gxpfTswCNVGlYNN
	P4/BgA46Hyb3+UuMt6WKrxz06PWWiIF0owCR+de3FiC38AWW7da13uQzxLyeq6Hgfsbu6dvq62M5C
	jynAqt2lqOJqI9Jpq/TEIuPtT2/XxRk1+leVOJjCpB695wynpz00DyyDMiFLw3MjvfUM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uElTv-0001xm-Il;
	Tue, 13 May 2025 08:59:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uElTt-0001xX-ME
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 08:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jdy4VPZAkPrBcpOZpFnod1DpI+URtHUw9cDeJNe1c8U=; b=b5Wh1owl132T/gj4gYlbZAKedR
 qqm0O+LwsV7tOtX4xwfFd8agGQQZZj7cpBoyd9PibxJFzYqtuC2Qpuq5EvzNSZ3VyjddSyfVNFUl5
 ywJffjEhvZsLVGVve+JLhydJXC2rtwwnZuU6oCSbe5dvX0diGQEs3JqL3A0/tAshWuJE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jdy4VPZAkPrBcpOZpFnod1DpI+URtHUw9cDeJNe1c8U=; b=YsOnvwn8ggZLRjyZ5Id0BBaJB9
 ocd23tgD0mGH6/5OYkKh5PARO3Vj0wiGyQ1mUNOc6SuCPvnkMw3V2j1xS5dN0Yc27AFYxPUSDGn0M
 xJ8B6M2SGL0Gx6SRwiWTLF88qEW/X/1Rci1bWZwPZEtJNaDRHx7U7kQRsnnCDZD3BJe4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uElTs-0000vP-Rq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 08:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 073F75C5D08;
 Tue, 13 May 2025 08:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BE2C4CEE4;
 Tue, 13 May 2025 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747126750;
 bh=M1pfAsGhou5UB5zT8mffy8A21sjDYWZ/ys4BfrXkxbI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Ujb5VArWZGswzPmf5Tnw9tke24bhf7UJqVGvvBgz8q3tAIcP/DWp0K79pCMfWaVQG
 +9Vhz3O6X82fonbD01zOs4cIOn7aQl3IpbANlofVQ8lruijGrB3l3kQxtjhnUbfrPp
 hjqijEMfvTu7D5xxtCezf4b2V2s6q1P45HytE0PFxgsNxcD+p4bG1eDVn9dfdxBHJu
 2qjByAhzfGG/UM/V9ia5W4hdAzXOGsUo9heeTtk1FHefB2MI0aU5ZzVyTVZsvo40FA
 pgh48yD7gmAb8EImJIswxnwH8sDlJcBc0NIOgy3LG7UWtlVEFQUwaUAsst5HCeyjfW
 m4lQYs0aazBHg==
Message-ID: <ff2c9a74-f359-4bcc-9792-46af946c70ad@kernel.org>
Date: Tue, 13 May 2025 16:59:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, lihongbo22@huawei.com
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250423170926.76007-8-sandeen@redhat.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/25 01:08,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > The new mount api will execute .parse_param, .init_fs_context, .get_tree
 > and will call .remount if remount happene [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uElTs-0000vP-Rq
Subject: Re: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/24/25 01:08, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> The new mount api will execute .parse_param, .init_fs_context, .get_tree
> and will call .remount if remount happened. So we add the necessary
> functions for the fs_context_operations. If .init_fs_context is added,
> the old .mount should remove.
> 
> See Documentation/filesystems/mount_api.rst for more information.

mkfs.f2fs -f -O extra_attr,flexible_inline_xattr /dev/vdb
mount -o inline_xattr_size=512 /dev/vdb /mnt/f2fs
mount: /mnt/f2fs: wrong fs type, bad option, bad superblock on /dev/vdb, missing codepage or helper program, or other error.
       dmesg(1) may have more information after failed mount system call.
dmesg
[ 1758.202282] F2FS-fs (vdb): Image doesn't support compression
[ 1758.202286] F2FS-fs (vdb): inline_xattr_size option should be set with inline_xattr option

Eric, Hongbo, can you please take a look at this issue?

Thanks,

> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> ---
>  fs/f2fs/super.c | 156 +++++++++++++++++++-----------------------------
>  1 file changed, 62 insertions(+), 94 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 37497fd80bb9..041bd6c482a0 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1141,47 +1141,6 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
>  	return 0;
>  }
>  
> -static int parse_options(struct fs_context *fc, char *options)
> -{
> -	struct fs_parameter param;
> -	char *key;
> -	int ret;
> -
> -	if (!options)
> -		return 0;
> -
> -	while ((key = strsep(&options, ",")) != NULL) {
> -		if (*key) {
> -			size_t v_len = 0;
> -			char *value = strchr(key, '=');
> -
> -			param.type = fs_value_is_flag;
> -			param.string = NULL;
> -
> -			if (value) {
> -				if (value == key)
> -					continue;
> -
> -				*value++ = 0;
> -				v_len = strlen(value);
> -				param.string = kmemdup_nul(value, v_len, GFP_KERNEL);
> -				if (!param.string)
> -					return -ENOMEM;
> -				param.type = fs_value_is_string;
> -			}
> -
> -			param.key = key;
> -			param.size = v_len;
> -
> -			ret = f2fs_parse_param(fc, &param);
> -			kfree(param.string);
> -			if (ret < 0)
> -				return ret;
> -		}
> -	}
> -	return 0;
> -}
> -
>  /*
>   * Check quota settings consistency.
>   */
> @@ -2583,13 +2542,12 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
>  	f2fs_flush_ckpt_thread(sbi);
>  }
>  
> -static int f2fs_remount(struct super_block *sb, int *flags, char *data)
> +static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	struct f2fs_mount_info org_mount_opt;
> -	struct f2fs_fs_context ctx;
> -	struct fs_context fc;
>  	unsigned long old_sb_flags;
> +	unsigned int flags = fc->sb_flags;
>  	int err;
>  	bool need_restart_gc = false, need_stop_gc = false;
>  	bool need_restart_flush = false, need_stop_flush = false;
> @@ -2635,7 +2593,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  #endif
>  
>  	/* recover superblocks we couldn't write due to previous RO mount */
> -	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
> +	if (!(flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
>  		err = f2fs_commit_super(sbi, false);
>  		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
>  			  err);
> @@ -2645,21 +2603,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  
>  	default_options(sbi, true);
>  
> -	memset(&fc, 0, sizeof(fc));
> -	memset(&ctx, 0, sizeof(ctx));
> -	fc.fs_private = &ctx;
> -	fc.purpose = FS_CONTEXT_FOR_RECONFIGURE;
> -
> -	/* parse mount options */
> -	err = parse_options(&fc, data);
> -	if (err)
> -		goto restore_opts;
> -
> -	err = f2fs_check_opt_consistency(&fc, sb);
> +	err = f2fs_check_opt_consistency(fc, sb);
>  	if (err < 0)
>  		goto restore_opts;
>  
> -	f2fs_apply_options(&fc, sb);
> +	f2fs_apply_options(fc, sb);
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
>  	if (f2fs_sb_has_blkzoned(sbi) &&
> @@ -2678,20 +2626,20 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	 * Previous and new state of filesystem is RO,
>  	 * so skip checking GC and FLUSH_MERGE conditions.
>  	 */
> -	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
> +	if (f2fs_readonly(sb) && (flags & SB_RDONLY))
>  		goto skip;
>  
> -	if (f2fs_dev_is_readonly(sbi) && !(*flags & SB_RDONLY)) {
> +	if (f2fs_dev_is_readonly(sbi) && !(flags & SB_RDONLY)) {
>  		err = -EROFS;
>  		goto restore_opts;
>  	}
>  
>  #ifdef CONFIG_QUOTA
> -	if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
> +	if (!f2fs_readonly(sb) && (flags & SB_RDONLY)) {
>  		err = dquot_suspend(sb, -1);
>  		if (err < 0)
>  			goto restore_opts;
> -	} else if (f2fs_readonly(sb) && !(*flags & SB_RDONLY)) {
> +	} else if (f2fs_readonly(sb) && !(flags & SB_RDONLY)) {
>  		/* dquot_resume needs RW */
>  		sb->s_flags &= ~SB_RDONLY;
>  		if (sb_any_quota_suspended(sb)) {
> @@ -2747,7 +2695,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  		goto restore_opts;
>  	}
>  
> -	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
> +	if ((flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
>  		err = -EINVAL;
>  		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
>  		goto restore_opts;
> @@ -2758,7 +2706,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	 * or if background_gc = off is passed in mount
>  	 * option. Also sync the filesystem.
>  	 */
> -	if ((*flags & SB_RDONLY) ||
> +	if ((flags & SB_RDONLY) ||
>  			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
>  			!test_opt(sbi, GC_MERGE))) {
>  		if (sbi->gc_thread) {
> @@ -2772,7 +2720,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  		need_stop_gc = true;
>  	}
>  
> -	if (*flags & SB_RDONLY) {
> +	if (flags & SB_RDONLY) {
>  		sync_inodes_sb(sb);
>  
>  		set_sbi_flag(sbi, SBI_IS_DIRTY);
> @@ -2785,7 +2733,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	 * We stop issue flush thread if FS is mounted as RO
>  	 * or if flush_merge is not passed in mount option.
>  	 */
> -	if ((*flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)) {
> +	if ((flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)) {
>  		clear_opt(sbi, FLUSH_MERGE);
>  		f2fs_destroy_flush_cmd_control(sbi, false);
>  		need_restart_flush = true;
> @@ -2827,7 +2775,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	 * triggered while remount and we need to take care of it before
>  	 * returning from remount.
>  	 */
> -	if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
> +	if ((flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
>  			!test_opt(sbi, MERGE_CHECKPOINT)) {
>  		f2fs_stop_ckpt_thread(sbi);
>  	} else {
> @@ -2854,7 +2802,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
>  
>  	limit_reserve_root(sbi);
> -	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
> +	fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
>  
>  	sbi->umount_lock_holder = NULL;
>  	return 0;
> @@ -3523,7 +3471,6 @@ static const struct super_operations f2fs_sops = {
>  	.freeze_fs	= f2fs_freeze,
>  	.unfreeze_fs	= f2fs_unfreeze,
>  	.statfs		= f2fs_statfs,
> -	.remount_fs	= f2fs_remount,
>  	.shutdown	= f2fs_shutdown,
>  };
>  
> @@ -4745,16 +4692,13 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
>  	sbi->readdir_ra = true;
>  }
>  
> -static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> +static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>  {
>  	struct f2fs_sb_info *sbi;
>  	struct f2fs_super_block *raw_super;
> -	struct f2fs_fs_context ctx;
> -	struct fs_context fc;
>  	struct inode *root;
>  	int err;
>  	bool skip_recovery = false, need_fsck = false;
> -	char *options = NULL;
>  	int recovery, i, valid_super_block;
>  	struct curseg_info *seg_i;
>  	int retry_cnt = 1;
> @@ -4767,9 +4711,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	raw_super = NULL;
>  	valid_super_block = -1;
>  	recovery = 0;
> -	memset(&fc, 0, sizeof(fc));
> -	memset(&ctx, 0, sizeof(ctx));
> -	fc.fs_private = &ctx;
>  
>  	/* allocate memory for f2fs-specific super block info */
>  	sbi = kzalloc(sizeof(struct f2fs_sb_info), GFP_KERNEL);
> @@ -4820,22 +4761,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  						sizeof(raw_super->uuid));
>  
>  	default_options(sbi, false);
> -	/* parse mount options */
> -	options = kstrdup((const char *)data, GFP_KERNEL);
> -	if (data && !options) {
> -		err = -ENOMEM;
> -		goto free_sb_buf;
> -	}
> -
> -	err = parse_options(&fc, options);
> -	if (err)
> -		goto free_options;
>  
> -	err = f2fs_check_opt_consistency(&fc, sb);
> +	err = f2fs_check_opt_consistency(fc, sb);
>  	if (err < 0)
> -		goto free_options;
> +		goto free_sb_buf;
>  
> -	f2fs_apply_options(&fc, sb);
> +	f2fs_apply_options(fc, sb);
>  
>  	sb->s_maxbytes = max_file_blocks(NULL) <<
>  				le32_to_cpu(raw_super->log_blocksize);
> @@ -5160,7 +5091,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		if (err)
>  			goto sync_free_meta;
>  	}
> -	kvfree(options);
>  
>  	/* recover broken superblock */
>  	if (recovery) {
> @@ -5255,7 +5185,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
>  #endif
>  	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
> -	kvfree(options);
>  free_sb_buf:
>  	kfree(raw_super);
>  free_sbi:
> @@ -5271,14 +5200,39 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	return err;
>  }
>  
> -static struct dentry *f2fs_mount(struct file_system_type *fs_type, int flags,
> -			const char *dev_name, void *data)
> +static int f2fs_get_tree(struct fs_context *fc)
>  {
> -	return mount_bdev(fs_type, flags, dev_name, data, f2fs_fill_super);
> +	return get_tree_bdev(fc, f2fs_fill_super);
> +}
> +
> +static int f2fs_reconfigure(struct fs_context *fc)
> +{
> +	struct super_block *sb = fc->root->d_sb;
> +
> +	return __f2fs_remount(fc, sb);
> +}
> +
> +static void f2fs_fc_free(struct fs_context *fc)
> +{
> +	struct f2fs_fs_context *ctx = fc->fs_private;
> +	int i;
> +
> +	if (!ctx)
> +		return;
> +
> +#ifdef CONFIG_QUOTA
> +	for (i = 0; i < MAXQUOTAS; i++)
> +		kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
> +#endif
> +	fscrypt_free_dummy_policy(&F2FS_CTX_INFO(ctx).dummy_enc_policy);
> +	kfree(ctx);
>  }
>  
>  static const struct fs_context_operations f2fs_context_ops = {
>  	.parse_param	= f2fs_parse_param,
> +	.get_tree	= f2fs_get_tree,
> +	.reconfigure = f2fs_reconfigure,
> +	.free	= f2fs_fc_free,
>  };
>  
>  static void kill_f2fs_super(struct super_block *sb)
> @@ -5322,10 +5276,24 @@ static void kill_f2fs_super(struct super_block *sb)
>  	}
>  }
>  
> +static int f2fs_init_fs_context(struct fs_context *fc)
> +{
> +	struct f2fs_fs_context *ctx;
> +
> +	ctx = kzalloc(sizeof(struct f2fs_fs_context), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	fc->fs_private = ctx;
> +	fc->ops = &f2fs_context_ops;
> +
> +	return 0;
> +}
> +
>  static struct file_system_type f2fs_fs_type = {
>  	.owner		= THIS_MODULE,
>  	.name		= "f2fs",
> -	.mount		= f2fs_mount,
> +	.init_fs_context = f2fs_init_fs_context,
>  	.kill_sb	= kill_f2fs_super,
>  	.fs_flags	= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
>  };



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
