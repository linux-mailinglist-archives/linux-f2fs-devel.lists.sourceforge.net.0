Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C515F5DE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 19:42:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2fvE-0002zk-Uz; Fri, 14 Feb 2020 18:42:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j2fvE-0002zc-Dk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ltSNlVnHM3+AaS6faxrdZt9je7qYJlUWgvz3HC2gmqw=; b=QfTL6OvY++CFKarZACZD1nIkSS
 mi7SB6qVE+r7SRw3Is2a7oawwCp/GUmQBul+gnoK5YE20y6XZw8XhwznV72MXo8Qc+m3WH+WQ0jJ+
 uNcXCCYx2Hl4vjVqJ76D9t/vejul894t1seoCouwaLlSlrS/aQAvaPdndeAI0gp2Qf2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ltSNlVnHM3+AaS6faxrdZt9je7qYJlUWgvz3HC2gmqw=; b=aBTESOpdxRX1iZe2nE27mBQQHh
 0UkF/AKlG/brXuyO+tqvgkncUYtoX1AgkV2DY0SNAUp2Cqp8Z96DLnyK+ThsjjoqpBthq0sJjZRG5
 EQtI80rXsZdpdTocYk0ELiIndiziFoE0YOpNwd2wDAN5Df5txeTq38bs0j8E6RDv1VmY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2fvD-004DZA-4L
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:42:40 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82BDE20848;
 Fri, 14 Feb 2020 18:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581705744;
 bh=4AdnTNN0gHbVkCHLDFezKZQu0UT0RSGK1lGwpIXl1FQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zvSP+nP6pVGOtksO4HTfMpzHx2jURbY/d3sn6nQmYlGOScsZ70UfCB88EQha9t+Oc
 +94jznNpnxPEK8sgbjUJfb26Ti86MV+DftO4Y54qxZVLUHjuhcADLLD3cO6QWhEnu+
 hUOkPefGHIphY01rdfnm3eYMA9wmrCOyH10cwhIA=
Date: Fri, 14 Feb 2020 10:42:24 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200214184224.GC60913@google.com>
References: <20200214094413.12784-1-yuchao0@huawei.com>
 <20200214094413.12784-4-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214094413.12784-4-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1j2fvD-004DZA-4L
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: clean up bggc mount option
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

On 02/14, Chao Yu wrote:
> There are three status for background gc: on, off and sync, it's
> a little bit confused to use test_opt(BG_GC) and test_opt(FORCE_FG_GC)
> combinations to indicate status of background gc.
> 
> So let's remove F2FS_MOUNT_BG_GC and F2FS_MOUNT_FORCE_FG_GC mount

I don't think we can do as well.

> options, and add F2FS_OPTION().bggc_mode with below three status
> to clean up codes and enhance bggc mode's scalability.
> 
> enum {
> 	BGGC_MODE_ON,		/* background gc is on */
> 	BGGC_MODE_OFF,		/* background gc is off */
> 	BGGC_MODE_SYNC,		/*
> 				 * background gc is on, migrating blocks
> 				 * like foreground gc
> 				 */
> };
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/f2fs.h  | 12 ++++++++++--
>  fs/f2fs/gc.c    |  6 +++++-
>  fs/f2fs/super.c | 29 +++++++++++++----------------
>  3 files changed, 28 insertions(+), 19 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d2d50827772c..9f65ba8057ad 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -74,7 +74,6 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  /*
>   * For mount options
>   */
> -#define F2FS_MOUNT_BG_GC		0x00000001
>  #define F2FS_MOUNT_DISABLE_ROLL_FORWARD	0x00000002
>  #define F2FS_MOUNT_DISCARD		0x00000004
>  #define F2FS_MOUNT_NOHEAP		0x00000008
> @@ -88,7 +87,6 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  #define F2FS_MOUNT_NOBARRIER		0x00000800
>  #define F2FS_MOUNT_FASTBOOT		0x00001000
>  #define F2FS_MOUNT_EXTENT_CACHE		0x00002000
> -#define F2FS_MOUNT_FORCE_FG_GC		0x00004000
>  #define F2FS_MOUNT_DATA_FLUSH		0x00008000
>  #define F2FS_MOUNT_FAULT_INJECTION	0x00010000
>  #define F2FS_MOUNT_USRQUOTA		0x00080000
> @@ -137,6 +135,7 @@ struct f2fs_mount_info {
>  	int alloc_mode;			/* segment allocation policy */
>  	int fsync_mode;			/* fsync policy */
>  	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
> +	int bggc_mode;			/* bggc mode: off, on or sync */
>  	bool test_dummy_encryption;	/* test dummy encryption */
>  	block_t unusable_cap;		/* Amount of space allowed to be
>  					 * unusable when disabling checkpoint
> @@ -1170,6 +1169,15 @@ enum {
>  	GC_URGENT,
>  };
>  
> +enum {
> +	BGGC_MODE_ON,		/* background gc is on */
> +	BGGC_MODE_OFF,		/* background gc is off */
> +	BGGC_MODE_SYNC,		/*
> +				 * background gc is on, migrating blocks
> +				 * like foreground gc
> +				 */
> +};
> +
>  enum {
>  	FS_MODE_ADAPTIVE,	/* use both lfs/ssr allocation */
>  	FS_MODE_LFS,		/* use lfs allocation only */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 8aebe2b9c655..897de003e423 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -31,6 +31,8 @@ static int gc_thread_func(void *data)
>  
>  	set_freezable();
>  	do {
> +		bool sync_mode;
> +
>  		wait_event_interruptible_timeout(*wq,
>  				kthread_should_stop() || freezing(current) ||
>  				gc_th->gc_wake,
> @@ -101,8 +103,10 @@ static int gc_thread_func(void *data)
>  do_gc:
>  		stat_inc_bggc_count(sbi->stat_info);
>  
> +		sync_mode = F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC;
> +
>  		/* if return value is not zero, no victim was selected */
> -		if (f2fs_gc(sbi, test_opt(sbi, FORCE_FG_GC), true, NULL_SEGNO))
> +		if (f2fs_gc(sbi, sync_mode, true, NULL_SEGNO))
>  			wait_ms = gc_th->no_gc_sleep_time;
>  
>  		trace_f2fs_background_gc(sbi->sb, wait_ms,
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 427409eff354..4ef7e6eb37da 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -427,14 +427,11 @@ static int parse_options(struct super_block *sb, char *options)
>  			if (!name)
>  				return -ENOMEM;
>  			if (strlen(name) == 2 && !strncmp(name, "on", 2)) {
> -				set_opt(sbi, BG_GC);
> -				clear_opt(sbi, FORCE_FG_GC);
> +				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>  			} else if (strlen(name) == 3 && !strncmp(name, "off", 3)) {
> -				clear_opt(sbi, BG_GC);
> -				clear_opt(sbi, FORCE_FG_GC);
> +				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_OFF;
>  			} else if (strlen(name) == 4 && !strncmp(name, "sync", 4)) {
> -				set_opt(sbi, BG_GC);
> -				set_opt(sbi, FORCE_FG_GC);
> +				F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_SYNC;
>  			} else {
>  				kvfree(name);
>  				return -EINVAL;
> @@ -1436,14 +1433,13 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(root->d_sb);
>  
> -	if (!f2fs_readonly(sbi->sb) && test_opt(sbi, BG_GC)) {
> -		if (test_opt(sbi, FORCE_FG_GC))
> -			seq_printf(seq, ",background_gc=%s", "sync");
> -		else
> -			seq_printf(seq, ",background_gc=%s", "on");
> -	} else {
> +	if (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC)
> +		seq_printf(seq, ",background_gc=%s", "sync");
> +	else if (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_ON)
> +		seq_printf(seq, ",background_gc=%s", "on");
> +	else if (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF)
>  		seq_printf(seq, ",background_gc=%s", "off");
> -	}
> +
>  	if (test_opt(sbi, DISABLE_ROLL_FORWARD))
>  		seq_puts(seq, ",disable_roll_forward");
>  	if (test_opt(sbi, DISCARD))
> @@ -1573,8 +1569,8 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZO;
>  	F2FS_OPTION(sbi).compress_log_size = MIN_COMPRESS_LOG_SIZE;
>  	F2FS_OPTION(sbi).compress_ext_cnt = 0;
> +	F2FS_OPTION(sbi).bggc_mode = BGGC_MODE_ON;
>  
> -	set_opt(sbi, BG_GC);
>  	set_opt(sbi, INLINE_XATTR);
>  	set_opt(sbi, INLINE_DATA);
>  	set_opt(sbi, INLINE_DENTRY);
> @@ -1780,7 +1776,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	 * or if background_gc = off is passed in mount
>  	 * option. Also sync the filesystem.
>  	 */
> -	if ((*flags & SB_RDONLY) || !test_opt(sbi, BG_GC)) {
> +	if ((*flags & SB_RDONLY) ||
> +			F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF) {
>  		if (sbi->gc_thread) {
>  			f2fs_stop_gc_thread(sbi);
>  			need_restart_gc = true;
> @@ -3664,7 +3661,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	 * If filesystem is not mounted as read-only then
>  	 * do start the gc_thread.
>  	 */
> -	if (test_opt(sbi, BG_GC) && !f2fs_readonly(sb)) {
> +	if (F2FS_OPTION(sbi).bggc_mode != BGGC_MODE_OFF && !f2fs_readonly(sb)) {
>  		/* After POR, we can run background GC thread.*/
>  		err = f2fs_start_gc_thread(sbi);
>  		if (err)
> -- 
> 2.18.0.rc1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
