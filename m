Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A05F5C6E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 00:09:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogCZZ-0002BD-7y;
	Wed, 05 Oct 2022 22:09:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ogCZY-0002B7-6V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Oct 2022 22:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AejoH7jGwH9epUys2nb+0aisYeFuMe4qclHkTO+lpeQ=; b=ifUXczh+SusTzLBTn1uMhhzxiR
 UlcQHDIbE+F12UsLo90MaHUZQ8C3nQql5thPLImKhYxaAgCbR6o+eHZxlRt+GPkegAEcBRyGMiebU
 JN53AaY84ZJuaIaB2SuNkkjkRibjGYXJM7t9cFZWvzgunP/ReQ2P+w8Wzw9L8g+Lqe+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AejoH7jGwH9epUys2nb+0aisYeFuMe4qclHkTO+lpeQ=; b=hsGMiKO7TNYypG98iL/pmYMbvS
 VU9qamI2sU4XHocjJ+JB+VAu3MQdO6w3lwZZy4ftDz9eyoqri9FhkGSy/fmhonO8v5KtsM99oApsg
 RQ5csg/8zikDtJ0zDco3nxy1dpFmzUJe2SMlJWwVobfZX4IwbIryNuKaLUDnbEl8VyAs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogCZW-00Dypm-QE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Oct 2022 22:09:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6267FB81F69
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Oct 2022 22:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED53DC433C1;
 Wed,  5 Oct 2022 22:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665007731;
 bh=rDFEIxZs94MiJuba/vXK1xoluO3Tiu4z5kpbY8egmzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yf0moAvqZYwN+d7Ed0XubJe2k/uiTJ3lARhkjNequKRI1fz1IIRGfmS+UQ7cP4Ect
 wosy6iakZO2gd4Bvaw44KIlNuHLY7nbB+W95fyNmIEJblMt7ZS3b4+tY4Fmte1LyaR
 s9zWp8/CB6yc8BUweqtEawA2vqFg3nxmOsepKsPmZWEvNbN35zu4MQBqCxuprvCiyA
 qXuswvkJ0ED7c6rrdHw2ef//7RqwHHUtaK46OpUFSqMAor1U1Fxthyu5JtIZUv/BTW
 sxOPqKugI+30Z/46RIumZj4Pz2JQHQVA9GnoVirZ5Hn0vi2F5O7fwmKXBEFA2wHR64
 XKjIeduLxmd5g==
Date: Wed, 5 Oct 2022 15:08:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yz4AcbnEZ4VAqRnz@google.com>
References: <20221004135807.37082-1-chao@kernel.org>
 <YzyXaZx4SBIN8OTK@google.com>
 <3c1c5e89-efe0-679c-3f86-2fea09a17317@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c1c5e89-efe0-679c-3f86-2fea09a17317@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/05, Chao Yu wrote: > On 2022/10/5 4:28, Jaegeuk Kim
 wrote: > > On 10/04,
 Chao Yu wrote: > > > This patch supports errors=remount-ro|continue|panic
 mount option. > > > > > > Signed-off-by: Chao Y [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogCZW-00Dypm-QE
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: support
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

On 10/05, Chao Yu wrote:
> On 2022/10/5 4:28, Jaegeuk Kim wrote:
> > On 10/04, Chao Yu wrote:
> > > This patch supports errors=remount-ro|continue|panic mount option.
> > > 
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > > - clean up codes
> > > - stop gc/discard threads after remount fs as readonly
> > > - don't panic() after f2fs is shutdown
> > >   Documentation/filesystems/f2fs.rst |   4 +
> > >   fs/f2fs/checkpoint.c               |   7 +-
> > >   fs/f2fs/f2fs.h                     |  18 ++++-
> > >   fs/f2fs/file.c                     |   5 --
> > >   fs/f2fs/super.c                    | 116 +++++++++++++++++++++++++++--
> > >   5 files changed, 131 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> > > index d0c09663dae8..6f19e7f9e908 100644
> > > --- a/Documentation/filesystems/f2fs.rst
> > > +++ b/Documentation/filesystems/f2fs.rst
> > > @@ -341,6 +341,10 @@ memory=%s		 Control memory mode. This supports "normal" and "low" modes.
> > >   			 Because of the nature of low memory devices, in this mode, f2fs
> > >   			 will try to save memory sometimes by sacrificing performance.
> > >   			 "normal" mode is the default mode and same as before.
> > > +errors=%s		 Specify f2fs behavior on critical errors. This supports modes:
> > > +			 "panic", "continue" and "remount-ro", respectively, trigger
> > > +			 panic immediately, continue without doing anything, and remount
> > > +			 the partition in read-only mode (default behavior).
> > >   ======================== ============================================================
> > >   Debugfs Entries
> > > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > > index 0c82dae082aa..109e96c15b84 100644
> > > --- a/fs/f2fs/checkpoint.c
> > > +++ b/fs/f2fs/checkpoint.c
> > > @@ -30,12 +30,9 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
> > >   						unsigned char reason)
> > >   {
> > >   	f2fs_build_fault_attr(sbi, 0, 0);
> > > -	set_ckpt_flags(sbi, CP_ERROR_FLAG);
> > > -	if (!end_io) {
> > > +	if (!end_io)
> > >   		f2fs_flush_merged_writes(sbi);
> > > -
> > > -		f2fs_handle_stop(sbi, reason);
> > > -	}
> > > +	f2fs_handle_critical_error(sbi, reason, end_io);
> > >   }
> > >   /*
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index a0b2c8626a75..40c8e28f41ba 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -160,6 +160,7 @@ struct f2fs_mount_info {
> > >   	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
> > >   	int bggc_mode;			/* bggc mode: off, on or sync */
> > >   	int memory_mode;		/* memory mode */
> > > +	int errors;			/* errors parameter */
> > >   	int discard_unit;		/*
> > >   					 * discard command's offset/size should
> > >   					 * be aligned to this unit: block,
> > > @@ -1382,7 +1383,11 @@ enum {
> > >   	MEMORY_MODE_LOW,	/* memory mode for low memry devices */
> > >   };
> > > -
> > > +enum errors_option {
> > > +	MOUNT_ERRORS_READONLY,	/* remount fs ro on errors */
> > > +	MOUNT_ERRORS_CONTINUE,	/* continue on errors */
> > > +	MOUNT_ERRORS_PANIC,	/* panic on errors */
> > > +};
> > >   static inline int f2fs_test_bit(unsigned int nr, char *addr);
> > >   static inline void f2fs_set_bit(unsigned int nr, char *addr);
> > > @@ -1818,7 +1823,13 @@ struct f2fs_sb_info {
> > >   	struct workqueue_struct *post_read_wq;	/* post read workqueue */
> > > -	unsigned char errors[MAX_F2FS_ERRORS];	/* error flags */
> > > +	/*
> > > +	 * If we are in irq context, let's update error information into
> > > +	 * on-disk superblock in the work.
> > > +	 */
> > > +	struct work_struct s_error_work;
> > > +	unsigned char errors[MAX_F2FS_ERRORS];		/* error flags */
> > > +	unsigned char stop_reason[MAX_STOP_REASON];	/* stop reason */
> > >   	spinlock_t error_lock;			/* protect errors array */
> > >   	bool error_dirty;			/* errors of sb is dirty */
> > > @@ -3563,7 +3574,8 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
> > >   int f2fs_quota_sync(struct super_block *sb, int type);
> > >   loff_t max_file_blocks(struct inode *inode);
> > >   void f2fs_quota_off_umount(struct super_block *sb);
> > > -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason);
> > > +void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
> > > +							bool irq_context);
> > >   void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error);
> > >   int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
> > >   int f2fs_sync_fs(struct super_block *sb, int sync);
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index df5e7ad80096..acda670df676 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -2157,7 +2157,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
> > >   				ret = 0;
> > >   				f2fs_stop_checkpoint(sbi, false,
> > >   						STOP_CP_REASON_SHUTDOWN);
> > > -				set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > 
> > What about keeping this and bypassing panic if this is set?
> 
> Please check below code, it processes like you suggested:

Gotcha.

> 
> +	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC &&
> +				!shutdown && !system_going_down() &&
> +				!is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN))
> +		panic("F2FS-fs (device %s): panic forced after error\n",
> +							sb->s_id);
> +
> +	if (shutdown)
> +		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> 
> Thanks,
> 
> > 
> > >   				trace_f2fs_shutdown(sbi, in, ret);
> > >   			}
> > >   			return ret;
> > > @@ -2170,7 +2169,6 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
> > >   		if (ret)
> > >   			goto out;
> > >   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> > > -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > >   		thaw_bdev(sb->s_bdev);
> > >   		break;
> > >   	case F2FS_GOING_DOWN_METASYNC:
> > > @@ -2179,16 +2177,13 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
> > >   		if (ret)
> > >   			goto out;
> > >   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> > > -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > >   		break;
> > >   	case F2FS_GOING_DOWN_NOSYNC:
> > >   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> > > -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > >   		break;
> > >   	case F2FS_GOING_DOWN_METAFLUSH:
> > >   		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
> > >   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
> > > -		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > >   		break;
> > >   	case F2FS_GOING_DOWN_NEED_FSCK:
> > >   		set_sbi_flag(sbi, SBI_NEED_FSCK);
> > > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > > index 6cf72fbf2054..787010893a12 100644
> > > --- a/fs/f2fs/super.c
> > > +++ b/fs/f2fs/super.c
> > > @@ -161,6 +161,7 @@ enum {
> > >   	Opt_nogc_merge,
> > >   	Opt_discard_unit,
> > >   	Opt_memory_mode,
> > > +	Opt_errors,
> > >   	Opt_err,
> > >   };
> > > @@ -238,6 +239,7 @@ static match_table_t f2fs_tokens = {
> > >   	{Opt_nogc_merge, "nogc_merge"},
> > >   	{Opt_discard_unit, "discard_unit=%s"},
> > >   	{Opt_memory_mode, "memory=%s"},
> > > +	{Opt_errors, "errors=%s"},
> > >   	{Opt_err, NULL},
> > >   };
> > > @@ -1253,6 +1255,25 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
> > >   			}
> > >   			kfree(name);
> > >   			break;
> > > +		case Opt_errors:
> > > +			name = match_strdup(&args[0]);
> > > +			if (!name)
> > > +				return -ENOMEM;
> > > +			if (!strcmp(name, "remount-ro")) {
> > > +				F2FS_OPTION(sbi).errors =
> > > +						MOUNT_ERRORS_READONLY;
> > > +			} else if (!strcmp(name, "continue")) {
> > > +				F2FS_OPTION(sbi).errors =
> > > +						MOUNT_ERRORS_CONTINUE;
> > > +			} else if (!strcmp(name, "panic")) {
> > > +				F2FS_OPTION(sbi).errors =
> > > +						MOUNT_ERRORS_PANIC;
> > > +			} else {
> > > +				kfree(name);
> > > +				return -EINVAL;
> > > +			}
> > > +			kfree(name);
> > > +			break;
> > >   		default:
> > >   			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
> > >   				 p);
> > > @@ -2031,6 +2052,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
> > >   	else if (F2FS_OPTION(sbi).memory_mode == MEMORY_MODE_LOW)
> > >   		seq_printf(seq, ",memory=%s", "low");
> > > +	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_READONLY)
> > > +		seq_printf(seq, ",errors=%s", "remount-ro");
> > > +	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE)
> > > +		seq_printf(seq, ",errors=%s", "continue");
> > > +	else if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC)
> > > +		seq_printf(seq, ",errors=%s", "panic");
> > > +
> > >   	return 0;
> > >   }
> > > @@ -2053,6 +2081,7 @@ static void default_options(struct f2fs_sb_info *sbi)
> > >   	F2FS_OPTION(sbi).compress_mode = COMPR_MODE_FS;
> > >   	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
> > >   	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
> > > +	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_READONLY;
> > >   	sbi->sb->s_flags &= ~SB_INLINECRYPT;
> > > @@ -3846,21 +3875,30 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
> > >   	return err;
> > >   }
> > > -void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
> > > +static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
> > > +{
> > > +	spin_lock(&sbi->error_lock);
> > > +	if (sbi->stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
> > > +		sbi->stop_reason[reason]++;
> > > +	spin_unlock(&sbi->error_lock);
> > > +}
> > > +
> > > +void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
> > >   {
> > >   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> > >   	int err;
> > >   	f2fs_down_write(&sbi->sb_lock);
> > > -	if (raw_super->s_stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
> > > -		raw_super->s_stop_reason[reason]++;
> > > +	spin_lock(&sbi->error_lock);
> > > +	memcpy(raw_super->s_stop_reason, sbi->stop_reason, MAX_STOP_REASON);
> > > +	spin_unlock(&sbi->error_lock);
> > >   	err = f2fs_commit_super(sbi, false);
> > > -	if (err)
> > > -		f2fs_err(sbi, "f2fs_commit_super fails to record reason:%u err:%d",
> > > -								reason, err);
> > > +
> > >   	f2fs_up_write(&sbi->sb_lock);
> > > +	if (err)
> > > +		f2fs_err(sbi, "f2fs_commit_super fails to record err:%d", err);
> > >   }
> > >   static void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag)
> > > @@ -3908,6 +3946,70 @@ void f2fs_handle_error(struct f2fs_sb_info *sbi, unsigned char error)
> > >   	f2fs_up_write(&sbi->sb_lock);
> > >   }
> > > +static bool system_going_down(void)
> > > +{
> > > +	return system_state == SYSTEM_HALT || system_state == SYSTEM_POWER_OFF
> > > +		|| system_state == SYSTEM_RESTART;
> > > +}
> > > +
> > > +void f2fs_handle_critical_error(struct f2fs_sb_info *sbi, unsigned char reason,
> > > +							bool irq_context)
> > > +{
> > > +	struct super_block *sb = sbi->sb;
> > > +	bool shutdown = reason == STOP_CP_REASON_SHUTDOWN;
> > > +	bool continue_fs = !shutdown &&
> > > +			F2FS_OPTION(sbi).errors == MOUNT_ERRORS_CONTINUE;
> > > +
> > > +	if (!continue_fs && !f2fs_readonly(sb))
> > > +		set_ckpt_flags(sbi, CP_ERROR_FLAG);
> > > +
> > > +	if (!bdev_read_only(sb->s_bdev)) {
> > > +		save_stop_reason(sbi, reason);
> > > +
> > > +		if (irq_context)
> > > +			schedule_work(&sbi->s_error_work);
> > > +		else
> > > +			f2fs_record_stop_reason(sbi);
> > > +	}
> > > +
> > > +	/*
> > > +	 * We force ERRORS_RO behavior when system is rebooting. Otherwise we
> > > +	 * could panic during 'reboot -f' as the underlying device got already
> > > +	 * disabled.
> > > +	 */
> > > +	if (F2FS_OPTION(sbi).errors == MOUNT_ERRORS_PANIC &&
> > > +				!shutdown && !system_going_down() &&
> > > +				!is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN))
> > > +		panic("F2FS-fs (device %s): panic forced after error\n",
> > > +							sb->s_id);
> > > +
> > > +	if (shutdown)
> > > +		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> > > +
> > > +	/* continue filesystem operators if errors=continue */
> > > +	if (continue_fs || f2fs_readonly(sb))
> > > +		return;
> > > +
> > > +	f2fs_warn(sbi, "Remounting filesystem read-only");
> > > +	/*
> > > +	 * Make sure updated value of ->s_mount_flags will be visible before
> > > +	 * ->s_flags update
> > > +	 */
> > > +	smp_wmb();
> > > +	sb->s_flags |= SB_RDONLY;
> > > +
> > > +	f2fs_stop_gc_thread(sbi);
> > > +	f2fs_stop_discard_thread(sbi);
> > > +}
> > > +
> > > +static void flush_error_work(struct work_struct *work)
> > > +{
> > > +	struct f2fs_sb_info *sbi = container_of(work,
> > > +					struct f2fs_sb_info, s_error_work);
> > > +
> > > +	f2fs_record_stop_reason(sbi);
> > > +}
> > > +
> > >   static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
> > >   {
> > >   	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
> > > @@ -4255,8 +4357,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
> > >   		goto free_devices;
> > >   	}
> > > +	INIT_WORK(&sbi->s_error_work, flush_error_work);
> > >   	spin_lock_init(&sbi->error_lock);
> > >   	memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
> > > +	memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
> > >   	sbi->total_valid_node_count =
> > >   				le32_to_cpu(sbi->ckpt->valid_node_count);
> > > -- 
> > > 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
