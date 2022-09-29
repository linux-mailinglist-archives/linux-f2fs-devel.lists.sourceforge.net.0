Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8D5EFD18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Sep 2022 20:32:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1odyK6-0006gR-Ty;
	Thu, 29 Sep 2022 18:32:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1odyK6-0006gH-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 18:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6E9svDLRvnySdO0iRaAAowas2zgHzA3GCu5g+ip1/fY=; b=aD6zHreePpNXlGkKyymd0tfeBd
 fKJlabbYOhBwjkyGRCQySET7WSgS0gAFkDZrInNG/icXrmaycZYQWZrgJPw7h0uEZGXGkC39AsSkm
 HHn4DvIGkwvdvMUgczmqty+732CaFexjNtXeo/MKOeFMefsL5zZ0qJEm9XfbbKkQ2LpI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6E9svDLRvnySdO0iRaAAowas2zgHzA3GCu5g+ip1/fY=; b=kEG3CTYxoZ+yD/SRWx1oUgADDc
 nmR3ttpWZ/0hMVD2pJStZt/52Wunvmq0xwCSYqolR+h2i9kX1oNbg99CiSjbp4EFrtdII3d9H9fOC
 3HBzpQmxLwcG8OPQuvx2CO2SMPWuKh8Kf/Z7IJ69TO9ea/543d5S5x8VE9ETTkwLmD5Q=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1odyKF-0007mq-0q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Sep 2022 18:32:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3566B825AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Sep 2022 18:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B40CC433C1;
 Thu, 29 Sep 2022 18:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664476306;
 bh=SV/kNmfJlc9NS3qaAYmKSi3mXpb2/BibEaufiP47PYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k7rCqq3LjwIBoaYYDs7FFVWatxp5B7GlfSGJLciwBO+1OWG4Zu2gSgOd3gmJD25MN
 cgQZQ7DERLhqHpcQAN5G4tzDLD4PfrjEE42PqTfJwGEGZfBWISQM4IDnOI7HFvjbZY
 B7juUeFHKH0Pixq5I9Ty+NxdH28SAnJM4IBc/ukB9K9aU8Z4m0Y/wPZeixvStkRLQH
 AJgV3vYEuo36SjPjc0qHxX8MaRFALkF4dlVNVpEv3bnRATo2E0ttSuqMRsqgwa1Qpo
 jAluPJ8pThYbavqNuLbrIJUxvFMpBzTvY3pM5z6rQ6eSV5ja/cbIpDs2ZNgoa1O89R
 D3uKkrCix8AbQ==
Date: Thu, 29 Sep 2022 11:31:44 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YzXkkL4Tatr+Lngn@google.com>
References: <20220928160949.5105-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220928160949.5105-1-chao@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/29,
 Chao Yu wrote: > This patch supports errors=remount-ro|continue|panic
 mount option. > > Signed-off-by: Chao Yu <chao@kernel.org> > --- > v2: >
 - fix to load sb.s_stop_reason during fill_supe [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1odyKF-0007mq-0q
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: support
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/29, Chao Yu wrote:
> This patch supports errors=remount-ro|continue|panic mount option.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - fix to load sb.s_stop_reason during fill_super().
>  Documentation/filesystems/f2fs.rst |   4 +
>  fs/f2fs/checkpoint.c               |   7 +-
>  fs/f2fs/f2fs.h                     |  18 ++++-
>  fs/f2fs/super.c                    | 115 ++++++++++++++++++++++++++++-
>  4 files changed, 133 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index d0c09663dae8..6aa14e03f337 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -341,6 +341,10 @@ memory=%s		 Control memory mode. This supports "normal" and "low" modes.
>  			 Because of the nature of low memory devices, in this mode, f2fs
>  			 will try to save memory sometimes by sacrificing performance.
>  			 "normal" mode is the default mode and same as before.
> +errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
> +			 "panic", "continue" and "remount-ro", respectively, triggers
> +			 panic immediately, continue without doing anything, or remount
> +			 the partition in read-only mode (default behavior).
>  ======================== ============================================================
>  
>  Debugfs Entries
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 0c82dae082aa..109e96c15b84 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -30,12 +30,9 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
>  						unsigned char reason)
>  {
>  	f2fs_build_fault_attr(sbi, 0, 0);
> -	set_ckpt_flags(sbi, CP_ERROR_FLAG);
> -	if (!end_io) {
> +	if (!end_io)
>  		f2fs_flush_merged_writes(sbi);
> -
> -		f2fs_handle_stop(sbi, reason);
> -	}
> +	f2fs_handle_critical_error(sbi, reason, end_io);
>  }
>  
>  /*
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 2ed00111a399..254f7f153477 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -160,6 +160,7 @@ struct f2fs_mount_info {
>  	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
>  	int bggc_mode;			/* bggc mode: off, on or sync */
>  	int memory_mode;		/* memory mode */
> +	int errors;			/* errors parameter */
>  	int discard_unit;		/*
>  					 * discard command's offset/size should
>  					 * be aligned to this unit: block,
> @@ -1382,7 +1383,11 @@ enum {
>  	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
>  };
>  
> -
> +enum errors_option {
> +	MOUNT_ERRORS_READONLY,	/* remount fs ro on errors */
> +	MOUNT_ERRORS_CONTINUE,	/* continue on errors */
> +	MOUNT_ERRORS_PANIC,	/* panic on errors */
> +};
>  
>  static inline int f2fs_test_bit(unsigned int nr, char *addr);
>  static inline void f2fs_set_bit(unsigned int nr, char *addr);
> @@ -1818,7 +1823,13 @@ struct f2fs_sb_info {
>  
>  	struct workqueue_struct *post_read_wq;	/* post read workqueue */
>  
> -	unsigned char errors[MAX_F2FS_ERRORS];	/* error flags */
> +	/*
> +	 * If we are in irq context, let's update error information into
> +	 * on-disk superblock in the work.
> +	 */
> +	struct work_struct s_error_work;
> +	unsigned char errors[MAX_F2FS_ERRORS];		/* error flags */
> +	unsigned char stop_reason[MAX_STOP_REASON];	/* stop reason */
>  	spinlock_t error_lock;			/* protect errors array */
>  	bool error_dirty;			/* errors of sb is dirty */
>  
> @@ -3563,7 +3574,8 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
>  int f2fs_quota_sync(struct super_block *sb, int type);
>  loff_t max_file_blocks(struct inode *inode);
>  void f2fs_quota_off_umount(struct super_block *sb);
> -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
> +void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
> +							bool irq_context);
>  void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
>  int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
>  int f2fs_sync_fs(struct super_block *sb, int sync);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ee0a5a17ba39..60bd0344f573 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -161,6 +161,7 @@ enum {
>  	Opt_nogc_merge,
>  	Opt_discard_unit,
>  	Opt_memory_mode,
> +	Opt_errors,
>  	Opt_err,
>  };
>  
> @@ -238,6 +239,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_nogc_merge, "nogc_merge"},
>  	{Opt_discard_unit, "discard_unit=%s"},
>  	{Opt_memory_mode, "memory=%s"},
> +	{Opt_errors, "errors=%s"},
>  	{Opt_err, NULL},
>  };
>  
> @@ -1253,6 +1255,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			}
>  			kfree(name);
>  			break;
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
>  		default:
>  			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
>  				 p);
> @@ -2031,6 +2052,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
>  		seq_printf(seq, ",memory=%s", "low");
>  
> +	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
> +		seq_printf(seq, ",errors=%s", "remount-ro");
> +	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE)
> +		seq_printf(seq, ",errors=%s", "continue");
> +	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC)
> +		seq_printf(seq, ",errors=%s", "panic");
> +
>  	return 0;
>  }
>  
> @@ -2053,6 +2081,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
>  	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>  	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
> +	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_READONLY;
>  
>  	sbi->sb->s_flags &= ~SB_INLINECRYPT;
>  
> @@ -3846,7 +3875,16 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
>  	return err;
>  }
>  
> -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
> +static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
> +
> +{
> +	spin_lock(&sbi->error_lock);
> +	if (sbi->stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
> +		sbi->stop_reason[reason]++;
> +	spin_unlock(&sbi->error_lock);
> +}
> +
> +void f2fs_record_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
>  
>  {
>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> @@ -3854,8 +3892,9 @@ void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
>  
>  	f2fs_down_write(&sbi->sb_lock);
>  
> -	if (raw_super->s_stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
> -		raw_super->s_stop_reason[reason]++;
> +	spin_lock(&sbi->error_lock);
> +	memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_STOP_REASON);
> +	spin_unlock(&sbi->error_lock);
>  
>  	err = f2fs_commit_super(sbi, false);
>  	if (err)
> @@ -3909,6 +3948,74 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
>  	f2fs_up_write(&sbi->sb_lock);
>  }
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
> +	bool force_ro = reason == STOP_CP_REASON_SHUTDOWN;

Can we check f2fs stopped checkpoint intentionally and use it here?

> +	bool continue_fs = !force_ro &&
> +			F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE;
> +
> +	if (!continue_fs && !sb_rdonly(sb))
> +		set_ckpt_flags(sbi, CP_ERROR_FLAG);
> +
> +	if (!bdev_read_only(sb->s_bdev)) {
> +		save_stop_reason(sbi, reason);
> +
> +		if (irq_context)
> +			schedule_work(&sbi->s_error_work);
> +		else
> +			f2fs_record_stop_reason(sbi, reason);
> +	}
> +
> +	/*
> +	 * We force ERRORS_RO behavior when system is rebooting. Otherwise we
> +	 * could panic during 'reboot -f' as the underlying device got already
> +	 * disabled.
> +	 */
> +	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC &&
> +				!force_ro && !system_going_down())
> +		panic("F2FS-fs (device %s): panic forced after error\n",
> +							sb->s_id);
> +
> +	/* continue filesystem operators if errors=continue */
> +	if (continue_fs || sb_rdonly(sb))
> +		return;
> +
> +	f2fs_warn(sbi, "Remounting filesystem read-only");
> +	/*
> +	 * Make sure updated value of ->s_mount_flags will be visible before
> +	 * ->s_flags update
> +	 */
> +	smp_wmb();
> +	sb->s_flags |= SB_RDONLY;
> +
> +	f2fs_stop_gc_thread(sbi);
> +	f2fs_stop_discard_thread(sbi);
> +}
> +
> +static void flush_error_work(struct work_struct *work)
> +{
> +	struct f2fs_sb_info *sbi = container_of(work,
> +					struct f2fs_sb_info, s_error_work);
> +	int ret;
> +
> +	if (sb_rdonly(sbi->sb))
> +		return;
> +
> +	f2fs_down_write(&sbi->sb_lock);
> +	ret = f2fs_commit_super(sbi, false);
> +	f2fs_up_write(&sbi->sb_lock);
> +	if (ret)
> +		f2fs_err(sbi, "flush_error_work() fails to commit superblock ret:%d", ret);
> +}
> +
>  static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> @@ -4256,8 +4363,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto free_devices;
>  	}
>  
> +	INIT_WORK(&sbi->s_error_work, flush_error_work);
>  	spin_lock_init(&sbi->error_lock);
>  	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
> +	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
>  
>  	sbi->total_valid_node_count =
>  				le32_to_cpu(sbi->ckpt->valid_node_count);
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
