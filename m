Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8935F3ECCA9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 04:33:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFSRj-0005Ia-8v; Mon, 16 Aug 2021 02:33:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mFSRf-0005I7-Mi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1RqD5v0/WR4I1yM7b0V3d1UZ5YwSS3UPiNnoEAwnlFU=; b=bsobGlsAjZE0uWmWfH5WEDrcpB
 7JFRnOz/TnVx6Ip+FTLLI0+PSKYEcjE23NijuWy6/EXD+0yR5EoPCaARDE9kmQiJXmi7itmS3C/pG
 FbCUShPzGbJMp/xowLHQsVQReKhP8INcNRjKMB6fBuPZB8i6RiY4GwT6Yq+RwdBz2D8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1RqD5v0/WR4I1yM7b0V3d1UZ5YwSS3UPiNnoEAwnlFU=; b=i+mdEH+NPaoCtiIS9L8/P4IN52
 KJcrBXYZM6lolBuew1s/K84Q9j8ZLVAmGPdOFD8j/dkx86O9IYhLzWgkw64o8rR4ew/0JDeKvVEYV
 zsgGo+VbAVHMpgwZ2/yGtKD9aIrYnFKpI/3JBKiHQ8frU5oPfJRIzOlBzwsG9yqWoX+0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFSRc-007mcU-6R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:33:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EA1A6142A;
 Mon, 16 Aug 2021 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629081213;
 bh=N/AcCFg/N4/jkXRGQdyuDY9wtTSkHkqC8mo4A2zi2TQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=S0Lw7E/3cHuOZ1e+pvkD2V2F9dKPh33P7LCYHD6HyYCu05hZhK7g890ymHSDSMIV7
 kAhkHl7WPKSKX8VnbDHDZhvDbOkVOv/6d0REZ2aK9HAyx/PuWRjCr2kdkp2DpZ5KGn
 xuUUWacGURA7z/3qhwLPBMks/sfMtcJAsiE7eUDratfvGbHGEPThYWdmHxbLrT2n3k
 lkxPlKWHjqrjg7dnUnAwLolLljbNAs/SNJZPww4Qy8n4M2MBVlkL2BQ8o6HN9SWOv7
 NBeINdj0euIw+R++HIxhmFqysH1q/ZouegulNzjD4IPQ+TQsm5kI8JE9RPVj0a2rIC
 KQxu64DrXbXvg==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210814090829.139145-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <7ed06541-b8af-6b90-944c-3c4859b44170@kernel.org>
Date: Mon, 16 Aug 2021 10:33:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210814090829.139145-1-changfengnan@vivo.com>
Content-Language: en-US
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 1.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFSRc-007mcU-6R
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: Don't create discard thread when
 device not support realtime discard
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
Cc: Yangtao Li <frank.li@vivo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/8/14 17:08, Fengnan Chang wrote:
> Don't create discard thread when device not support realtime discard.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/f2fs.h    |  1 +
>   fs/f2fs/segment.c | 36 ++++++++++++++++++++++++------------
>   fs/f2fs/super.c   | 31 ++++++++++++++++++++++++++++++-
>   3 files changed, 55 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0c978f934dcc..1e0d8d340546 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3590,6 +3590,7 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
>   void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
>   void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
>   bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
> +int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
>   void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
>   void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
>   bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index b4dd22134a73..b7de8ef5ccf1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2114,11 +2114,32 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
>   	wake_up_discard_thread(sbi, false);
>   }
>   
> -static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
> +int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
>   {
>   	dev_t dev = sbi->sb->s_bdev->bd_dev;
> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +	int err = 0;
> +
> +	if (!dcc)
> +		return -EINVAL;

Any case dcc will be NULL?

> +	if (!f2fs_realtime_discard_enable(sbi))
> +		return 0;
> +
> +	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
> +				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
> +	if (IS_ERR(dcc->f2fs_issue_discard)) {
> +		err = PTR_ERR(dcc->f2fs_issue_discard);
> +		kfree(dcc);
> +		SM_I(sbi)->dcc_info = NULL;

Please considering the case if we are in recovery flow of remount(), discard
mount option is tagged, but .dcc_info is NULL...

> +		return err;
> +	}
> +	return err;
> +}
> +
> +static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
> +{
>   	struct discard_cmd_control *dcc;
> -	int err = 0, i;
> +	int i;
>   
>   	if (SM_I(sbi)->dcc_info) {
>   		dcc = SM_I(sbi)->dcc_info;
> @@ -2154,16 +2175,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   	init_waitqueue_head(&dcc->discard_wait_queue);
>   	SM_I(sbi)->dcc_info = dcc;
>   init_thread:
> -	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
> -				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
> -	if (IS_ERR(dcc->f2fs_issue_discard)) {
> -		err = PTR_ERR(dcc->f2fs_issue_discard);
> -		kfree(dcc);
> -		SM_I(sbi)->dcc_info = NULL;
> -		return err;
> -	}
> -
> -	return err;
> +	return f2fs_start_discard_thread(sbi);
>   }
>   
>   static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index f92c582f8008..192af573b09c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2103,12 +2103,15 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	bool need_restart_gc = false, need_stop_gc = false;
>   	bool need_restart_ckpt = false, need_stop_ckpt = false;
>   	bool need_restart_flush = false, need_stop_flush = false;
> +	bool need_start_discard = false, need_stop_discard = false;

need_restart_discard

>   	bool no_extent_cache = !test_opt(sbi, EXTENT_CACHE);
>   	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
>   	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
>   	bool no_atgc = !test_opt(sbi, ATGC);
> +	bool no_discard = !test_opt(sbi, DISCARD);
>   	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
>   	bool block_unit_discard = f2fs_block_unit_discard(sbi);
> +	struct discard_cmd_control *dcc;
>   #ifdef CONFIG_QUOTA
>   	int i, j;
>   #endif
> @@ -2280,11 +2283,30 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   		need_stop_flush = true;
>   	}
>   
> +	if (no_discard == !!test_opt(sbi, DISCARD)) {
> +		if (test_opt(sbi, DISCARD)) {
> +			err = f2fs_start_discard_thread(sbi);
> +			if (err)
> +				goto restore_flush;
> +			need_stop_discard = true;
> +		} else {
> +			dcc = SM_I(sbi)->dcc_info;
> +			if (!dcc) {

Any case dcc will be NULL?

> +				err = -EINVAL;
> +				goto restore_flush;
> +			}
> +			f2fs_stop_discard_thread(sbi);
> +			if (atomic_read(&dcc->discard_cmd_cnt))
> +				f2fs_issue_discard_timeout(sbi);
> +			need_start_discard = true;
> +		}
> +	}
> +
>   	if (enable_checkpoint == !!test_opt(sbi, DISABLE_CHECKPOINT)) {
>   		if (test_opt(sbi, DISABLE_CHECKPOINT)) {
>   			err = f2fs_disable_checkpoint(sbi);
>   			if (err)
> -				goto restore_flush;
> +				goto restore_discard;
>   		} else {
>   			f2fs_enable_checkpoint(sbi);
>   		}
> @@ -2304,6 +2326,13 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	adjust_unusable_cap_perc(sbi);
>   	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
>   	return 0;
> +restore_discard:
> +	if (need_start_discard) {
> +		if (f2fs_start_discard_thread(sbi))
> +			f2fs_warn(sbi, "discard has been stopped");
> +	} else if (need_stop_discard) {
> +		f2fs_stop_discard_thread(sbi);
> +	}
>   restore_flush:
>   	if (need_restart_flush) {
>   		if (f2fs_create_flush_cmd_control(sbi))
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
