Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9CFA2B45E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Feb 2025 22:47:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tg9ip-0005fC-KI;
	Thu, 06 Feb 2025 21:47:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tg9io-0005f6-5A
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 21:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXedW7itRYrLhvzm+HloBbgSQp2k/PTXlmyKTD87SX8=; b=JMFOS7sdNTxIP4ycxhPC+hf7od
 TWpyPkloRZz6T+EZXjCQYS6a8LvZH3xLlLfwYIdBIgf2nokX6P2fPVt/MMjbbUnI6C1YqRXiqn6Vu
 NZsEmYCxYYunWZ0kzeq9QD/Es56TaCTQC8ilWG+3WbjfsNh4nw7EJJff8Z5qaXPeysSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXedW7itRYrLhvzm+HloBbgSQp2k/PTXlmyKTD87SX8=; b=YgrIFoWnXVCSF14lpVTa8AwNkq
 WR6JWrHDh1LaPHc66bc24fhqszRwUhx1VRhvO/1dzIDZ1Bj88OJ859WqQjIUjuAI2RyfNO8BbNrTp
 0oY7vSe1O84RbdX9SKCeZfet444S2peNp2O9bJVWHJLvOJ+K6Qllj+pOTIZCQZ6gcnIA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tg9in-0001aL-0s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 21:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0CCF5C54C9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Feb 2025 21:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A261C4CEDD;
 Thu,  6 Feb 2025 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738878455;
 bh=GE1DnEHlxBWpHOLwXbYJVVNLrRYgTNM0x+15R1Aw5Ww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=necEC6mywPR6mPl2ov+CpKpsvbf2OUlUtooQzKnEsGT5knK3ogM/PFPk/8k8S/7gy
 CDKbbU+xgXD8h9lNAF5j7E0Ot6hBtmuS/1r9tdU5euc1lTqxEAM7zCdDbRQDh/MSY4
 7jAzn0myV8U4CWSJRNX/8YFjYgIg3VOa4M1DOJol9K6JH0+eyfTOHg0aPKbfF2o24q
 c/thjYA2ocbGntwqvUduWx0V2YtnNUc4/6nLwN7EKMQc+1rHhBas39wUw3k+eV05vB
 NKbJEXdMCni7Crj0U9Nh1JDFNnIaeCI6lbeo4BALuQEyLj6Fdn2CbmBCe85WfrlaSv
 c3Z4OFSDEYUuw==
Date: Thu, 6 Feb 2025 21:47:33 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z6Ut9S7ZpedBukp8@google.com>
References: <20250206064451.3088028-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250206064451.3088028-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/06, Chao Yu wrote: > F2FS-fs (dm-59): checkpoint=enable
 has some unwritten data. > > [ cut here ] > WARNING: CPU: 6 PID: 8013 at
 fs/quota/dquot.c:691 dquot_writeback_dquo [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tg9in-0001aL-0s
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix to avoid warning in
 dquot_writeback_dquots()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/06, Chao Yu wrote:
> F2FS-fs (dm-59): checkpoint=enable has some unwritten data.
> 
> ------------[ cut here ]------------
> WARNING: CPU: 6 PID: 8013 at fs/quota/dquot.c:691 dquot_writeback_dquots+0x2fc/0x308
> pc : dquot_writeback_dquots+0x2fc/0x308
> lr : f2fs_quota_sync+0xcc/0x1c4
> Call trace:
> dquot_writeback_dquots+0x2fc/0x308
> f2fs_quota_sync+0xcc/0x1c4
> f2fs_write_checkpoint+0x3d4/0x9b0
> f2fs_issue_checkpoint+0x1bc/0x2c0
> f2fs_sync_fs+0x54/0x150
> f2fs_do_sync_file+0x2f8/0x814
> __f2fs_ioctl+0x1960/0x3244
> f2fs_ioctl+0x54/0xe0
> __arm64_sys_ioctl+0xa8/0xe4
> invoke_syscall+0x58/0x114
> 
> checkpoint and f2fs_remount may race as below, resulting triggering warning
> in dquot_writeback_dquots().
> 
> atomic write                                    remount
>                                                 - do_remount
>                                                  - down_write(&sb->s_umount);
>                                                   - f2fs_remount
> - ioctl
>  - f2fs_do_sync_file
>   - f2fs_sync_fs
>    - f2fs_write_checkpoint
>     - block_operations
>      - locked = down_read_trylock(&sbi->sb->s_umount)
>        : fail to lock due to the write lock was held by remount
>                                                  - up_write(&sb->s_umount);
>      - f2fs_quota_sync
>       - dquot_writeback_dquots
>        - WARN_ON_ONCE(!rwsem_is_locked(&sb->s_umount))
>        : trigger warning because s_umount lock was unlocked by remount
> 
> If checkpoint comes from mount/umount/remount/freeze/quotactl, caller of
> checkpoint has already held s_umount lock, calling dquot_writeback_dquots()
> in the context should be safe.
> 
> So let's record task to sbi->umount_lock_holder, so that checkpoint can
> know whether the lock has held in the context or not by checking current
> w/ it.
> 
> In addition, in order to misrepresent caller of checkpoint, we should not
> allow to trigger async checkpoint for those callers: mount/umount/remount/
> freeze/quotactl.
> 
> Fixes: af033b2aa8a8 ("f2fs: guarantee journalled quota data by checkpoint")
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 17 ++++++++-----
>  fs/f2fs/f2fs.h       |  3 ++-
>  fs/f2fs/super.c      | 59 +++++++++++++++++++++++++++++++++++---------
>  3 files changed, 60 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index efda9a022981..baff639ac0c4 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1237,7 +1237,8 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  retry_flush_quotas:
>  	f2fs_lock_all(sbi);
>  	if (__need_flush_quota(sbi)) {
> -		int locked;
> +		bool need_lock = sbi->umount_lock_holder != current;
> +		bool locked = false;

I removed the above unnecessary locked.

>  
>  		if (++cnt > DEFAULT_RETRY_QUOTA_FLUSH_COUNT) {
>  			set_sbi_flag(sbi, SBI_QUOTA_SKIP_FLUSH);
> @@ -1246,10 +1247,13 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  		}
>  		f2fs_unlock_all(sbi);
>  
> -		/* only failed during mount/umount/freeze/quotactl */
> -		locked = down_read_trylock(&sbi->sb->s_umount);
> -		f2fs_quota_sync(sbi->sb, -1);
> -		if (locked)
> +		/* don't grab s_umount lock during mount/umount/remount/freeze/quotactl */
> +		if (need_lock && !down_read_trylock(&sbi->sb->s_umount)) {
> +			cond_resched();
> +			goto retry_flush_quotas;
> +		}
> +		f2fs_do_quota_sync(sbi->sb, -1);
> +		if (need_lock)
>  			up_read(&sbi->sb->s_umount);
>  		cond_resched();
>  		goto retry_flush_quotas;

Modified to:
		/* don't grab s_umount lock during mount/umount/remount/freeze/quotactl */
		if (!need_lock) {
			f2fs_do_quota_sync(sbi->sb, -1);
		} else if (down_read_trylock(&sbi->sb->s_umount)) {
			f2fs_do_quota_sync(sbi->sb, -1);
			up_read(&sbi->sb->s_umount);
		}
  		cond_resched();
  		goto retry_flush_quotas;

> @@ -1867,7 +1871,8 @@ int f2fs_issue_checkpoint(struct f2fs_sb_info *sbi)
>  	struct cp_control cpc;
>  
>  	cpc.reason = __get_cp_reason(sbi);
> -	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC) {
> +	if (!test_opt(sbi, MERGE_CHECKPOINT) || cpc.reason != CP_SYNC ||
> +		sbi->umount_lock_holder == current) {
>  		int ret;
>  
>  		f2fs_down_write(&sbi->gc_lock);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 62b7fed1514a..7174dea641e9 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1670,6 +1670,7 @@ struct f2fs_sb_info {
>  
>  	unsigned int nquota_files;		/* # of quota sysfile */
>  	struct f2fs_rwsem quota_sem;		/* blocking cp for flags */
> +	struct task_struct *umount_lock_holder;	/* s_umount lock holder */
>  
>  	/* # of pages, see count_type */
>  	atomic_t nr_pages[NR_COUNT_TYPE];
> @@ -3652,7 +3653,7 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync);
>  void f2fs_inode_synced(struct inode *inode);
>  int f2fs_dquot_initialize(struct inode *inode);
>  int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
> -int f2fs_quota_sync(struct super_block *sb, int type);
> +int f2fs_do_quota_sync(struct super_block *sb, int type);
>  loff_t max_file_blocks(struct inode *inode);
>  void f2fs_quota_off_umount(struct super_block *sb);
>  void f2fs_save_errors(struct f2fs_sb_info *sbi, unsigned char flag);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ef639a6d82e5..cb9d7b6fa3ad 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1740,22 +1740,28 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
>  
>  static int f2fs_freeze(struct super_block *sb)
>  {
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +
>  	if (f2fs_readonly(sb))
>  		return 0;
>  
>  	/* IO error happened before */
> -	if (unlikely(f2fs_cp_error(F2FS_SB(sb))))
> +	if (unlikely(f2fs_cp_error(sbi)))
>  		return -EIO;
>  
>  	/* must be clean, since sync_filesystem() was already called */
> -	if (is_sbi_flag_set(F2FS_SB(sb), SBI_IS_DIRTY))
> +	if (is_sbi_flag_set(sbi, SBI_IS_DIRTY))
>  		return -EINVAL;
>  
> +	sbi->umount_lock_holder = current;
> +
>  	/* Let's flush checkpoints and stop the thread. */
> -	f2fs_flush_ckpt_thread(F2FS_SB(sb));
> +	f2fs_flush_ckpt_thread(sbi);
> +
> +	sbi->umount_lock_holder = NULL;
>  
>  	/* to avoid deadlock on f2fs_evict_inode->SB_FREEZE_FS */
> -	set_sbi_flag(F2FS_SB(sb), SBI_IS_FREEZING);
> +	set_sbi_flag(sbi, SBI_IS_FREEZING);
>  	return 0;
>  }
>  
> @@ -2332,6 +2338,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	org_mount_opt = sbi->mount_opt;
>  	old_sb_flags = sb->s_flags;
>  
> +	sbi->umount_lock_holder = current;
> +
>  #ifdef CONFIG_QUOTA
>  	org_mount_opt.s_jquota_fmt = F2FS_OPTION(sbi).s_jquota_fmt;
>  	for (i = 0; i < MAXQUOTAS; i++) {
> @@ -2555,6 +2563,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  
>  	limit_reserve_root(sbi);
>  	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
> +
> +	sbi->umount_lock_holder = NULL;
>  	return 0;
>  restore_checkpoint:
>  	if (need_enable_checkpoint) {
> @@ -2595,6 +2605,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  #endif
>  	sbi->mount_opt = org_mount_opt;
>  	sb->s_flags = old_sb_flags;
> +
> +	sbi->umount_lock_holder = NULL;
>  	return err;
>  }
>  
> @@ -2911,7 +2923,7 @@ static int f2fs_quota_sync_file(struct f2fs_sb_info *sbi, int type)
>  	return ret;
>  }
>  
> -int f2fs_quota_sync(struct super_block *sb, int type)
> +int f2fs_do_quota_sync(struct super_block *sb, int type)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	struct quota_info *dqopt = sb_dqopt(sb);
> @@ -2959,6 +2971,16 @@ int f2fs_quota_sync(struct super_block *sb, int type)
>  	return ret;
>  }
>  
> +static int f2fs_quota_sync(struct super_block *sb, int type)
> +{
> +	int ret;
> +
> +	F2FS_SB(sb)->umount_lock_holder = current;
> +	ret = f2fs_do_quota_sync(sb, type);
> +	F2FS_SB(sb)->umount_lock_holder = NULL;
> +	return ret;
> +}
> +
>  static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
>  							const struct path *path)
>  {
> @@ -2974,30 +2996,33 @@ static int f2fs_quota_on(struct super_block *sb, int type, int format_id,
>  	if (path->dentry->d_sb != sb)
>  		return -EXDEV;
>  
> -	err = f2fs_quota_sync(sb, type);
> +	F2FS_SB(sb)->umount_lock_holder = current;
> +
> +	err = f2fs_do_quota_sync(sb, type);
>  	if (err)
> -		return err;
> +		goto out;
>  
>  	inode = d_inode(path->dentry);
>  
>  	err = filemap_fdatawrite(inode->i_mapping);
>  	if (err)
> -		return err;
> +		goto out;
>  
>  	err = filemap_fdatawait(inode->i_mapping);
>  	if (err)
> -		return err;
> +		goto out;
>  
>  	err = dquot_quota_on(sb, type, format_id, path);
>  	if (err)
> -		return err;
> +		goto out;
>  
>  	inode_lock(inode);
>  	F2FS_I(inode)->i_flags |= F2FS_QUOTA_DEFAULT_FL;
>  	f2fs_set_inode_flags(inode);
>  	inode_unlock(inode);
>  	f2fs_mark_inode_dirty_sync(inode, false);
> -
> +out:
> +	F2FS_SB(sb)->umount_lock_holder = NULL;
>  	return 0;
>  }
>  
> @@ -3009,7 +3034,7 @@ static int __f2fs_quota_off(struct super_block *sb, int type)
>  	if (!inode || !igrab(inode))
>  		return dquot_quota_off(sb, type);
>  
> -	err = f2fs_quota_sync(sb, type);
> +	err = f2fs_do_quota_sync(sb, type);
>  	if (err)
>  		goto out_put;
>  
> @@ -3032,6 +3057,8 @@ static int f2fs_quota_off(struct super_block *sb, int type)
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	int err;
>  
> +	F2FS_SB(sb)->umount_lock_holder = current;
> +
>  	err = __f2fs_quota_off(sb, type);
>  
>  	/*
> @@ -3041,6 +3068,9 @@ static int f2fs_quota_off(struct super_block *sb, int type)
>  	 */
>  	if (is_journalled_quota(sbi))
>  		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
> +
> +	F2FS_SB(sb)->umount_lock_holder = NULL;
> +
>  	return err;
>  }
>  
> @@ -4715,6 +4745,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	if (err)
>  		goto free_compress_inode;
>  
> +	sbi->umount_lock_holder = current;
>  #ifdef CONFIG_QUOTA
>  	/* Enable quota usage during mount */
>  	if (f2fs_sb_has_quota_ino(sbi) && !f2fs_readonly(sb)) {
> @@ -4841,6 +4872,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	f2fs_update_time(sbi, CP_TIME);
>  	f2fs_update_time(sbi, REQ_TIME);
>  	clear_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
> +
> +	sbi->umount_lock_holder = NULL;
>  	return 0;
>  
>  sync_free_meta:
> @@ -4945,6 +4978,8 @@ static void kill_f2fs_super(struct super_block *sb)
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  
>  	if (sb->s_root) {
> +		sbi->umount_lock_holder = current;
> +
>  		set_sbi_flag(sbi, SBI_IS_CLOSE);
>  		f2fs_stop_gc_thread(sbi);
>  		f2fs_stop_discard_thread(sbi);
> -- 
> 2.48.1.502.g6dc24dfdaf-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
