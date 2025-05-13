Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF213AB596C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 May 2025 18:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjsmGQKqhzPb+GHKjFr6AnFuQoc7bQh9G24+jcbY1Nc=; b=ByhRpIwzeBV5UlZzjhDMssEXNB
	4tXsRdGgp55pyyIJ1isYoNpDn5rIHoRh4piYKMs/SFzYNKghGgtfSWshQsX6uxe6sqiBo8AnPl481
	r/XYlyHcAerXW6mpUfb4jf583A8z/8nHPV0clREdZ8IwS5ABREpIuT1lPqua0e2ModKs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEsEK-0002UN-Nu;
	Tue, 13 May 2025 16:11:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uEsEI-0002UF-O4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 16:11:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UfQfwrRY+s9nwhOOjkog0jP/GjW8Ld9OM+vA9sE9UKs=; b=SyA+0cbiRHPEdv0p/PndMeAfZY
 ELLZP0tSGWysuWSn3TIibcb+3xgHJ+YEGF4i1GIl+ryW9MemJX6UXRQWjfxhj157hMOrQNDL4pMVC
 ahuUJwdlo6KfUGNjIaaadk+YB7t2+Q3oMTBh6qOveD1IWmzFL6c1Bu+asnobkr5g1BGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UfQfwrRY+s9nwhOOjkog0jP/GjW8Ld9OM+vA9sE9UKs=; b=nS4vaTjYSzduWollX5kpzoRp1g
 Jp/rFPVO//Wuz8ryJs0G4jzbu4iyzXrqLmWqAVDerssmqAe6R16cFhX/NaXDnaxIXBRTL0zYMzdMc
 1ZpNt3VaYy0WLqYm7A751s+rvQVCtVBUxU0SoPc6J8LGO7hOywVh5PYP7PHd1GGKJaL8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEsEH-0001Bf-KV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 May 2025 16:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DBAEE5C6B09;
 Tue, 13 May 2025 16:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0548C4CEE9;
 Tue, 13 May 2025 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747152690;
 bh=O/UOa/QMI6E7dg05hLEJPSwFuFiVjwkcPLIjo7kECPM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IUDQObQQ4BWLtYwHUfpJ/lADTjjNHcZr3j88RWmw6kfG+s4PlqaNavJ/gYJP6acqA
 odr4say9b45R5uHaGZ6fIggEQTr4CYT6DXaiY1oNK9zFXHUpFVPyyPZoy3M2yLAok3
 374EH4rUenfG8qCGzXxJdiHSpgNFB1Z7U1NSJfzA83tqVzIrmXzP7sATYyRzpHzKsx
 OYe7ZhNi594J+iogFrLNU4yWc/Lsl6wTCJkJYRH8vJy4EX/vfWEBijoN/DvR1IVBy1
 FRzC/9LFwlzm2C5YqUSoX3PDDX5yTyykAtqOs3Gm6s+rHtd9zAsZEL4lQVbrN7Cp9Y
 LWsAKNqmaekgQ==
Date: Tue, 13 May 2025 16:11:28 +0000
To: Eric Sandeen <sandeen@redhat.com>
Message-ID: <aCNvMDjawbig4OS1@google.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-8-sandeen@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250423170926.76007-8-sandeen@redhat.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/23,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > The new mount api will execute .parse_param, .init_fs_context, .get_tree
 > and will call .remount if remount happened. So we [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEsEH-0001Bf-KV
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/23, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> The new mount api will execute .parse_param, .init_fs_context, .get_tree
> and will call .remount if remount happened. So we add the necessary
> functions for the fs_context_operations. If .init_fs_context is added,
> the old .mount should remove.
> 
> See Documentation/filesystems/mount_api.rst for more information.
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

Applied the below to include "int i" in CONFIG_QUOTA.

--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -540,6 +540,14 @@ static int f2fs_unnote_qf_name(struct fs_context *fc, int qtype)
        ctx->qname_mask |= 1 << qtype;
        return 0;
 }
+
+static void f2fs_unnote_qf_name_all(struct fs_context *fc)
+{
+       int i;
+
+       for (i = 0; i < MAXQUOTAS; i++)
+               f2fs_unnote_qf_name(fc, i);
+}
 #endif

 static int f2fs_parse_test_dummy_encryption(const struct fs_parameter *param,
@@ -5286,14 +5294,12 @@ static int f2fs_reconfigure(struct fs_context *fc)
 static void f2fs_fc_free(struct fs_context *fc)
 {
        struct f2fs_fs_context *ctx = fc->fs_private;
-       int i;

        if (!ctx)
                return;

 #ifdef CONFIG_QUOTA
-       for (i = 0; i < MAXQUOTAS; i++)
-               kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
+       f2fs_unnote_qf_name_all(fc);
 #endif
        fscrypt_free_dummy_policy(&F2FS_CTX_INFO(ctx).dummy_enc_policy);
        kfree(ctx);



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
> -- 
> 2.49.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
