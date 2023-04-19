Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8E6E71C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 05:41:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poyhX-0004h2-Bs;
	Wed, 19 Apr 2023 03:41:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1poyhV-0004gv-76
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 03:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JHUkX524Zi7+Z+NmV1Z9te5IkDNqbLiGRnp4fZtmMtE=; b=MiwC9DnmG3eZoXjyXW9ObmGuXU
 EdGeKYbsK1xulpjboPK7QzWvkwvtFKASBgzLnqcrP3CT03t0SRrGaHRJyKulHm7WWVmEoNW5G8smv
 KJy6ym8JAsI6g1Gz935xVIkLaWxATAZbw2+IanxFqGgwahLiBr9ARD3Ls2w2slm8A+BI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JHUkX524Zi7+Z+NmV1Z9te5IkDNqbLiGRnp4fZtmMtE=; b=FQ06DL1wvZ2q+/75htGJMMjBJK
 kr2QdPsQrc0Q1zMH/gaK9OOUsrf0zlkoPadbepni3auXPj2oro3bBpskArvfvvFkIPlZMK+eC0i+r
 OqBXK4ElPKunWem0MiCr321CK7aLBvcSbG7Td3ztiqjHnjqAh74A8hvFHK9gRknKk8Ak=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poyhS-00Bzcl-Ng for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 03:41:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D02C363A9F;
 Wed, 19 Apr 2023 03:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45474C433D2;
 Wed, 19 Apr 2023 03:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681875690;
 bh=MaHvEdzgOoHhj3sCEZRc8zq/sSDcJefJUy7GxVdsiH8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EFisXcvXVggw27KVtmxFy2FUKhVKSxBIC9x5z6ceqDBIR3C2mYZUk1wHn3QfxY2mV
 TzPvtKQ2W16G+jg3//xYAc9enDTVVbW1JCQW00ptE28lglPL3WcFKodoWQ0xygNRAN
 Npa9JLI9Xd+3C3RRezKQ7n/qXf0dXa057G06LnOvEgLvwyd7rng5YqF73RE8zqe6WI
 NIxWAb134gpaLtqoTFmzibqA6CEA5+FQuXLR8A1prd0/K2fn7LcRYJllFE2XFzWkp+
 P/wD9n5ZMnR5swlLjPFVCuDyWweo+QuqlBTLXCARalC4p24fHa0aa1Su8q3C1nTswD
 zx5Cghs1a83Ug==
Message-ID: <3653416d-8904-4dd9-6b36-bc438ba8729c@kernel.org>
Date: Wed, 19 Apr 2023 11:41:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: jaegeuk@kernel.org
References: <20230408123153.954480-1-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230408123153.954480-1-chao@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, Jaegeuk, do you still suffer any issue w/ this version?
 Thanks, Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1poyhS-00Bzcl-Ng
Subject: Re: [f2fs-dev] [PATCH v8] f2fs: support
 errors=remount-ro|continue|panic mountoption
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ping,

Jaegeuk, do you still suffer any issue w/ this version?

Thanks,

On 2023/4/8 20:31, Chao Yu wrote:
> This patch supports errors=remount-ro|continue|panic mount option,
> by default it uses "remount-ro" mode.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v8:
> - record stop reason synchronously if it's from ioctl shutdown interface
> - fix typo in doc and commit message.
> - use f2fs_hw_is_readonly() instead of bdev_read_only()
>   Documentation/filesystems/f2fs.rst |   5 ++
>   fs/f2fs/checkpoint.c               |   7 +-
>   fs/f2fs/f2fs.h                     |  20 ++++-
>   fs/f2fs/file.c                     |   5 --
>   fs/f2fs/gc.c                       |   2 +-
>   fs/f2fs/super.c                    | 134 ++++++++++++++++++++++++++---
>   6 files changed, 149 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 2055e72871fe..ba4c02fad647 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -351,6 +351,11 @@ age_extent_cache	 Enable an age extent cache based on rb-tree. It records
>   			 data block update frequency of the extent per inode, in
>   			 order to provide better temperature hints for data block
>   			 allocation.
> +errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
> +			 "panic", "continue" and "remount-ro", respectively, trigger
> +			 panic immediately, continue without doing anything, and remount
> +			 the partition in read-only mode. By default it uses "remount-ro"
> +			 mode.
>   ======================== ============================================================
>   
>   Debugfs Entries
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 73ae4e85e70d..e6b266bb9ce0 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -30,12 +30,9 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
>   						unsigned char reason)
>   {
>   	f2fs_build_fault_attr(sbi, 0, 0);
> -	set_ckpt_flags(sbi, CP_ERROR_FLAG);
> -	if (!end_io) {
> +	if (!end_io)
>   		f2fs_flush_merged_writes(sbi);
> -
> -		f2fs_handle_stop(sbi, reason);
> -	}
> +	f2fs_handle_critical_error(sbi, reason, end_io);
>   }
>   
>   /*
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ac4942f8e83e..7d9c5a65f974 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -162,6 +162,7 @@ struct f2fs_mount_info {
>   	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
>   	int bggc_mode;			/* bggc mode: off, on or sync */
>   	int memory_mode;		/* memory mode */
> +	int errors;			/* errors parameter */
>   	int discard_unit;		/*
>   					 * discard command's offset/size should
>   					 * be aligned to this unit: block,
> @@ -1370,6 +1371,12 @@ enum {
>   	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
>   };
>   
> +enum errors_option {
> +	MOUNT_ERRORS_READONLY,	/* remount fs ro on errors */
> +	MOUNT_ERRORS_CONTINUE,	/* continue on errors */
> +	MOUNT_ERRORS_PANIC,	/* panic on errors */
> +};
> +
>   static inline int f2fs_test_bit(unsigned int nr, char *addr);
>   static inline void f2fs_set_bit(unsigned int nr, char *addr);
>   static inline void f2fs_clear_bit(unsigned int nr, char *addr);
> @@ -1786,8 +1793,14 @@ struct f2fs_sb_info {
>   
>   	struct workqueue_struct *post_read_wq;	/* post read workqueue */
>   
> -	unsigned char errors[MAX_F2FS_ERRORS];	/* error flags */
> -	spinlock_t error_lock;			/* protect errors array */
> +	/*
> +	 * If we are in irq context, let's update error information into
> +	 * on-disk superblock in the work.
> +	 */
> +	struct work_struct s_error_work;
> +	unsigned char errors[MAX_F2FS_ERRORS];		/* error flags */
> +	unsigned char stop_reason[MAX_STOP_REASON];	/* stop reason */
> +	spinlock_t error_lock;			/* protect errors/stop_reason array */
>   	bool error_dirty;			/* errors of sb is dirty */
>   
>   	struct kmem_cache *inline_xattr_slab;	/* inline xattr entry */
> @@ -3522,8 +3535,9 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
>   int f2fs_quota_sync(struct super_block *sb, int type);
>   loff_t max_file_blocks(struct inode *inode);
>   void f2fs_quota_off_umount(struct super_block *sb);
> -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
>   void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
> +void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
> +							bool irq_context);
>   void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
>   int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
>   int f2fs_sync_fs(struct super_block *sb, int sync);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 14e9a20e68df..10743e864d57 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2221,7 +2221,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>   				ret = 0;
>   				f2fs_stop_checkpoint(sbi, false,
>   						STOP_CP_REASON_SHUTDOWN);
> -				set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
>   				trace_f2fs_shutdown(sbi, in, ret);
>   			}
>   			return ret;
> @@ -2234,7 +2233,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>   		if (ret)
>   			goto out;
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
>   		thaw_bdev(sb->s_bdev);
>   		break;
>   	case F2FS_GOING_DOWN_METASYNC:
> @@ -2243,16 +2241,13 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>   		if (ret)
>   			goto out;
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
>   		break;
>   	case F2FS_GOING_DOWN_NOSYNC:
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
>   		break;
>   	case F2FS_GOING_DOWN_METAFLUSH:
>   		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
>   		break;
>   	case F2FS_GOING_DOWN_NEED_FSCK:
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index f1d0dd9c5a6c..6dc2bc710ba8 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -59,7 +59,7 @@ static int gc_thread_func(void *data)
>   		if (gc_th->gc_wake)
>   			gc_th->gc_wake = false;
>   
> -		if (try_to_freeze()) {
> +		if (try_to_freeze() || f2fs_readonly(sbi->sb)) {
>   			stat_other_skip_bggc_count(sbi);
>   			continue;
>   		}
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 23574894e170..1573bf123197 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -164,6 +164,7 @@ enum {
>   	Opt_discard_unit,
>   	Opt_memory_mode,
>   	Opt_age_extent_cache,
> +	Opt_errors,
>   	Opt_err,
>   };
>   
> @@ -243,6 +244,7 @@ static match_table_t f2fs_tokens = {
>   	{Opt_discard_unit, "discard_unit=%s"},
>   	{Opt_memory_mode, "memory=%s"},
>   	{Opt_age_extent_cache, "age_extent_cache"},
> +	{Opt_errors, "errors=%s"},
>   	{Opt_err, NULL},
>   };
>   
> @@ -1268,6 +1270,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		case Opt_age_extent_cache:
>   			set_opt(sbi, AGE_EXTENT_CACHE);
>   			break;
> +		case Opt_errors:
> +			name = match_strdup(&args[0]);
> +			if (!name)
> +				return -ENOMEM;
> +			if (!strcmp(name, "remount-ro")) {
> +				F2FS_OPTION(sbi).errors =
> +						MOUNT_ERRORS_READONLY;
> +			} else if (!strcmp(name, "continue")) {
> +				F2FS_OPTION(sbi).errors =
> +						MOUNT_ERRORS_CONTINUE;
> +			} else if (!strcmp(name, "panic")) {
> +				F2FS_OPTION(sbi).errors =
> +						MOUNT_ERRORS_PANIC;
> +			} else {
> +				kfree(name);
> +				return -EINVAL;
> +			}
> +			kfree(name);
> +			break;
>   		default:
>   			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>   				 p);
> @@ -1623,6 +1644,9 @@ static void f2fs_put_super(struct super_block *sb)
>   	f2fs_destroy_node_manager(sbi);
>   	f2fs_destroy_segment_manager(sbi);
>   
> +	/* flush s_error_work before sbi destroy */
> +	flush_work(&sbi->s_error_work);
> +
>   	f2fs_destroy_post_read_wq(sbi);
>   
>   	kvfree(sbi->ckpt);
> @@ -2053,6 +2077,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
>   		seq_printf(seq, ",memory=%s", "low");
>   
> +	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
> +		seq_printf(seq, ",errors=%s", "remount-ro");
> +	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE)
> +		seq_printf(seq, ",errors=%s", "continue");
> +	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC)
> +		seq_printf(seq, ",errors=%s", "panic");
> +
>   	return 0;
>   }
>   
> @@ -2081,6 +2112,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>   	}
>   	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>   	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
> +	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_READONLY;
>   
>   	sbi->sb->s_flags &= ~SB_INLINECRYPT;
>   
> @@ -2282,6 +2314,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	if (err)
>   		goto restore_opts;
>   
> +	/* flush outstanding errors before changing fs state */
> +	flush_work(&sbi->s_error_work);
> +
>   	/*
>   	 * Previous and new state of filesystem is RO,
>   	 * so skip checking GC and FLUSH_MERGE conditions.
> @@ -3931,45 +3966,60 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
>   	return err;
>   }
>   
> -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
> +static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&sbi->error_lock, flags);
> +	if (sbi->stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
> +		sbi->stop_reason[reason]++;
> +	spin_unlock_irqrestore(&sbi->error_lock, flags);
> +}
> +
> +static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
>   {
>   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> +	unsigned long flags;
>   	int err;
>   
>   	f2fs_down_write(&sbi->sb_lock);
>   
> -	if (raw_super->s_stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
> -		raw_super->s_stop_reason[reason]++;
> +	spin_lock_irqsave(&sbi->error_lock, flags);
> +	memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_STOP_REASON);
> +	spin_unlock_irqrestore(&sbi->error_lock, flags);
>   
>   	err = f2fs_commit_super(sbi, false);
> -	if (err)
> -		f2fs_err(sbi, "f2fs_commit_super fails to record reason:%u err:%d",
> -								reason, err);
> +
>   	f2fs_up_write(&sbi->sb_lock);
> +	if (err)
> +		f2fs_err(sbi, "f2fs_commit_super fails to record err:%d", err);
>   }
>   
>   void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
>   {
> -	spin_lock(&sbi->error_lock);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&sbi->error_lock, flags);
>   	if (!test_bit(flag, (unsigned long *)sbi->errors)) {
>   		set_bit(flag, (unsigned long *)sbi->errors);
>   		sbi->error_dirty = true;
>   	}
> -	spin_unlock(&sbi->error_lock);
> +	spin_unlock_irqrestore(&sbi->error_lock, flags);
>   }
>   
>   static bool f2fs_update_errors(struct f2fs_sb_info *sbi)
>   {
> +	unsigned long flags;
>   	bool need_update = false;
>   
> -	spin_lock(&sbi->error_lock);
> +	spin_lock_irqsave(&sbi->error_lock, flags);
>   	if (sbi->error_dirty) {
>   		memcpy(F2FS_RAW_SUPER(sbi)->s_errors, sbi->errors,
>   							MAX_F2FS_ERRORS);
>   		sbi->error_dirty = false;
>   		need_update = true;
>   	}
> -	spin_unlock(&sbi->error_lock);
> +	spin_unlock_irqrestore(&sbi->error_lock, flags);
>   
>   	return need_update;
>   }
> @@ -3993,6 +4043,66 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
>   	f2fs_up_write(&sbi->sb_lock);
>   }
>   
> +static bool system_going_down(void)
> +{
> +	return system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF
> +		|| system_state == SYSTEM_RESTART;
> +}
> +
> +void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
> +							bool irq_context)
> +{
> +	struct super_block *sb = sbi->sb;
> +	bool shutdown = reason == STOP_CP_REASON_SHUTDOWN;
> +	bool continue_fs = !shutdown &&
> +			F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE;
> +
> +	set_ckpt_flags(sbi, CP_ERROR_FLAG);
> +
> +	if (!f2fs_hw_is_readonly(sbi)) {
> +		save_stop_reason(sbi, reason);
> +
> +		if (irq_context && !shutdown)
> +			schedule_work(&sbi->s_error_work);
> +		else
> +			f2fs_record_stop_reason(sbi);
> +	}
> +
> +	/*
> +	 * We force ERRORS_RO behavior when system is rebooting. Otherwise we
> +	 * could panic during 'reboot -f' as the underlying device got already
> +	 * disabled.
> +	 */
> +	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC &&
> +				!shutdown && !system_going_down() &&
> +				!is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN))
> +		panic("F2FS-fs (device %s): panic forced after error\n",
> +							sb->s_id);
> +
> +	if (shutdown)
> +		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> +
> +	/* continue filesystem operators if errors=continue */
> +	if (continue_fs || f2fs_readonly(sb))
> +		return;
> +
> +	f2fs_warn(sbi, "Remounting filesystem read-only");
> +	/*
> +	 * Make sure updated value of ->s_mount_flags will be visible before
> +	 * ->s_flags update
> +	 */
> +	smp_wmb();
> +	sb->s_flags |= SB_RDONLY;
> +}
> +
> +static void f2fs_record_error_work(struct work_struct *work)
> +{
> +	struct f2fs_sb_info *sbi = container_of(work,
> +					struct f2fs_sb_info, s_error_work);
> +
> +	f2fs_record_stop_reason(sbi);
> +}
> +
>   static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>   {
>   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> @@ -4223,7 +4333,9 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	sb->s_fs_info = sbi;
>   	sbi->raw_super = raw_super;
>   
> +	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
>   	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
> +	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
>   
>   	/* precompute checksum seed for metadata */
>   	if (f2fs_sb_has_inode_chksum(sbi))
> @@ -4620,6 +4732,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   	f2fs_destroy_segment_manager(sbi);
>   stop_ckpt_thread:
>   	f2fs_stop_ckpt_thread(sbi);
> +	/* flush s_error_work before sbi destroy */
> +	flush_work(&sbi->s_error_work);
>   	f2fs_destroy_post_read_wq(sbi);
>   free_devices:
>   	destroy_device_list(sbi);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
