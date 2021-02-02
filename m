Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9F30B715
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 06:34:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6oKL-0001Ks-L9; Tue, 02 Feb 2021 05:34:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l6oKK-0001Kc-8e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 05:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5lPpEyZLdzdrGu3PH7seVddSirEE7cHsR7MgCUnS2y8=; b=k/uXPM8DaJrSE3jNvv1b8CB/bP
 zQLvWw0QjYufE0QQXwTxnPyhkKKq03GTAQ3cIV33Cf5SHN3zqWJCEXldvw0LvZKa8bqc9aVcVq8G+
 g+mo1/QIIWjtmjwjYK2gYFroyvaepuB7jNjt1KWEaFppLqk0/q/W5x3bV+OuFbdIHjqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5lPpEyZLdzdrGu3PH7seVddSirEE7cHsR7MgCUnS2y8=; b=kLLBh6x3/icwa903ZkI+SlV/aS
 v3tIKPiRlIkkuPXWiQDKocFnBI+BYd1jS6mB6pNgYnhLTiEG2x0N/72JOC18jfmAVbbOhS5KSU0R5
 /jaFEfgePdHHVbp5q7qtkOHPPzsi6Czpj5NBY6pdBhSkVRXJSYv9uXOBjk1kWtl42XbQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l6oKC-00DX87-TY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 05:34:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2826864ED9;
 Tue,  2 Feb 2021 05:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612244034;
 bh=22yQx72jEhx+zDhE8nGIasOHVbmdEQ2q4aXtGLy/VdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AOAJRMXI1g4YJeZHC191tCSeoup/2SCffjPUvk3Nds1JZ6xus7GUVWS8GaN/j+bsu
 gaNmBd+4U3nXbJbZQ8XD48Ak92bzzxT8c8eCMNzhMoUVuxhMb+MpklKBxcKn9gCEiR
 zlGKqt30Zrs5AUP54OjN+ZEPNr9Q5ZwL30rrrMMg4vRh665GgvWe6BySEl5WZAGbmm
 aNnRn5uCyfSVd4vH9Q5AVsVbiCbeQoJXA0oKFjwIQgN0wSa722CA3MnLAVsT41LqWQ
 amMvUBR+oW+I3LqjVqc8AEOgceuq23uoEan/aBZDngOiRz4CiMD7JfOjTt4aSHxI0r
 F8KXrJNy5ec9Q==
Date: Mon, 1 Feb 2021 21:33:52 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YBjkQBdqwoAXDTDa@google.com>
References: <20210202051829.2127214-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202051829.2127214-1-daeho43@gmail.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l6oKC-00DX87-TY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: rename checkpoint=merge mount
 option to checkpoint_merge
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

On 02/02, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> As checkpoint=merge comes in, mount option setting related to checkpoint
> had been mixed up and it became hard to understand. So, I separated
> this option from "checkpoint=" and made another mount option
> "checkpoint_merge" for this.

Thanks, merged to the original patch.

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: renamed "checkpoint=merge" to "checkpoint_merge"
> ---
>  Documentation/filesystems/f2fs.rst |  6 +++---
>  fs/f2fs/super.c                    | 26 ++++++++++++++------------
>  2 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index d0ead45dc706..475994ed8b15 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -247,9 +247,9 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
>  			 hide up to all remaining free space. The actual space that
>  			 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>  			 This space is reclaimed once checkpoint=enable.
> -			 Here is another option "merge", which creates a kernel daemon
> -			 and makes it to merge concurrent checkpoint requests as much
> -			 as possible to eliminate redundant checkpoint issues. Plus,
> +checkpoint_merge	 When checkpoint is enabled, this can be used to create a kernel
> +			 daemon and make it to merge concurrent checkpoint requests as
> +			 much as possible to eliminate redundant checkpoint issues. Plus,
>  			 we can eliminate the sluggish issue caused by slow checkpoint
>  			 operation when the checkpoint is done in a process context in
>  			 a cgroup having low i/o budget and cpu shares. To make this
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 56696f6cfa86..d8603e6c4916 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -145,6 +145,7 @@ enum {
>  	Opt_checkpoint_disable_cap_perc,
>  	Opt_checkpoint_enable,
>  	Opt_checkpoint_merge,
> +	Opt_nocheckpoint_merge,
>  	Opt_compress_algorithm,
>  	Opt_compress_log_size,
>  	Opt_compress_extension,
> @@ -215,7 +216,8 @@ static match_table_t f2fs_tokens = {
>  	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
>  	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
>  	{Opt_checkpoint_enable, "checkpoint=enable"},
> -	{Opt_checkpoint_merge, "checkpoint=merge"},
> +	{Opt_checkpoint_merge, "checkpoint_merge"},
> +	{Opt_nocheckpoint_merge, "nocheckpoint_merge"},
>  	{Opt_compress_algorithm, "compress_algorithm=%s"},
>  	{Opt_compress_log_size, "compress_log_size=%u"},
>  	{Opt_compress_extension, "compress_extension=%s"},
> @@ -946,6 +948,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		case Opt_checkpoint_merge:
>  			set_opt(sbi, MERGE_CHECKPOINT);
>  			break;
> +		case Opt_nocheckpoint_merge:
> +			clear_opt(sbi, MERGE_CHECKPOINT);
> +			break;
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  		case Opt_compress_algorithm:
>  			if (!f2fs_sb_has_compression(sbi)) {
> @@ -1142,12 +1147,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		return -EINVAL;
>  	}
>  
> -	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
> -			test_opt(sbi, MERGE_CHECKPOINT)) {
> -		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
> -		return -EINVAL;
> -	}
> -
>  	/* Not pass down write hints if the number of active logs is lesser
>  	 * than NR_CURSEG_PERSIST_TYPE.
>  	 */
> @@ -1782,7 +1781,7 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  		seq_printf(seq, ",checkpoint=disable:%u",
>  				F2FS_OPTION(sbi).unusable_cap);
>  	if (test_opt(sbi, MERGE_CHECKPOINT))
> -		seq_puts(seq, ",checkpoint=merge");
> +		seq_puts(seq, ",checkpoint_merge");
>  	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
>  		seq_printf(seq, ",fsync_mode=%s", "posix");
>  	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
> @@ -1827,6 +1826,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	sbi->sb->s_flags |= SB_LAZYTIME;
>  	set_opt(sbi, FLUSH_MERGE);
>  	set_opt(sbi, DISCARD);
> +	clear_opt(sbi, MERGE_CHECKPOINT);
>  	if (f2fs_sb_has_blkzoned(sbi))
>  		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
>  	else
> @@ -2066,9 +2066,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  		}
>  	}
>  
> -	if (!test_opt(sbi, MERGE_CHECKPOINT)) {
> -		f2fs_stop_ckpt_thread(sbi);
> -	} else {
> +	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
>  		err = f2fs_start_ckpt_thread(sbi);
>  		if (err) {
>  			f2fs_err(sbi,
> @@ -2076,6 +2075,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  			    err);
>  			goto restore_gc;
>  		}
> +	} else {
> +		f2fs_stop_ckpt_thread(sbi);
>  	}
>  
>  	/*
> @@ -3831,7 +3832,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  
>  	/* setup checkpoint request control and start checkpoint issue thread */
>  	f2fs_init_ckpt_req_control(sbi);
> -	if (test_opt(sbi, MERGE_CHECKPOINT)) {
> +	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
>  		err = f2fs_start_ckpt_thread(sbi);
>  		if (err) {
>  			f2fs_err(sbi,
> -- 
> 2.30.0.365.g02bc693789-goog
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
