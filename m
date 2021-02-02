Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167E30BAE9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 10:28:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6rzD-00076z-Tk; Tue, 02 Feb 2021 09:28:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l6rzB-00076O-Bl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p+x52cla4b4ShfweqmxTQPMiOdcwoGypL8BE+MDP1V4=; b=U8Gc4bLa2Y2JYZkFXdHeRIXap6
 T/qzbNthLp0Z4YfESR571Vi55pMYb5t04CitDyGdPxPx5v546pbUSabi5MXQgT6D82CE0hz9YUNXW
 EheDlNOE/k6VYEy3+8SDamrsQEmfxAWI2zc9u+O3SSecGvC0gG1Cf2dF3rD7IigR8sFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=p+x52cla4b4ShfweqmxTQPMiOdcwoGypL8BE+MDP1V4=; b=kdo3hH/oy5oX8q2JOXYKu1sC85
 aOPzpjCJscq3THnMsH4xVyT/StDFVsKp5Jfl4/9TQzUWAnRVSlourmxclP6vSzMoNB3SAdH7thLuf
 yOza6SKOy1o00rUqM4vW+LoyiBRc5BsGu+/fJKwbnFUODSCSiFbLN2qAE1a7RJZqYEkY=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l6ryx-0008AQ-MC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:28:37 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVKFN6vB8zlDll;
 Tue,  2 Feb 2021 17:26:32 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 2 Feb 2021
 17:28:09 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210202092332.2562006-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a7adaf99-0df1-cf4a-a60a-d47a104f51aa@huawei.com>
Date: Tue, 2 Feb 2021 17:28:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210202092332.2562006-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1l6ryx-0008AQ-MC
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: rename checkpoint=merge mount
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/2/2 17:23, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> As checkpoint=merge comes in, mount option setting related to checkpoint
> had been mixed up and it became hard to understand. So, I separated
> this option from "checkpoint=" and made another mount option
> "checkpoint_merge" for this.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: renamed "checkpoint=merge" to "checkpoint_merge"
> v3: removed "nocheckpoint_merge" option
> ---
>   Documentation/filesystems/f2fs.rst |  6 +++---
>   fs/f2fs/super.c                    | 21 +++++++++------------
>   2 files changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index d0ead45dc706..475994ed8b15 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -247,9 +247,9 @@ checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enabl
>   			 hide up to all remaining free space. The actual space that
>   			 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
>   			 This space is reclaimed once checkpoint=enable.
> -			 Here is another option "merge", which creates a kernel daemon
> -			 and makes it to merge concurrent checkpoint requests as much
> -			 as possible to eliminate redundant checkpoint issues. Plus,
> +checkpoint_merge	 When checkpoint is enabled, this can be used to create a kernel
> +			 daemon and make it to merge concurrent checkpoint requests as
> +			 much as possible to eliminate redundant checkpoint issues. Plus,
>   			 we can eliminate the sluggish issue caused by slow checkpoint
>   			 operation when the checkpoint is done in a process context in
>   			 a cgroup having low i/o budget and cpu shares. To make this
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 56696f6cfa86..b60dcef7f9d0 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -215,7 +215,7 @@ static match_table_t f2fs_tokens = {
>   	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
>   	{Opt_checkpoint_disable_cap_perc, "checkpoint=disable:%u%%"},
>   	{Opt_checkpoint_enable, "checkpoint=enable"},
> -	{Opt_checkpoint_merge, "checkpoint=merge"},
> +	{Opt_checkpoint_merge, "checkpoint_merge"},
>   	{Opt_compress_algorithm, "compress_algorithm=%s"},
>   	{Opt_compress_log_size, "compress_log_size=%u"},
>   	{Opt_compress_extension, "compress_extension=%s"},
> @@ -1142,12 +1142,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>   		return -EINVAL;
>   	}
>   
> -	if (test_opt(sbi, DISABLE_CHECKPOINT) &&
> -			test_opt(sbi, MERGE_CHECKPOINT)) {
> -		f2fs_err(sbi, "checkpoint=merge cannot be used with checkpoint=disable\n");
> -		return -EINVAL;
> -	}
> -
>   	/* Not pass down write hints if the number of active logs is lesser
>   	 * than NR_CURSEG_PERSIST_TYPE.
>   	 */
> @@ -1782,7 +1776,7 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>   		seq_printf(seq, ",checkpoint=disable:%u",
>   				F2FS_OPTION(sbi).unusable_cap);
>   	if (test_opt(sbi, MERGE_CHECKPOINT))
> -		seq_puts(seq, ",checkpoint=merge");
> +		seq_puts(seq, ",checkpoint_merge");
>   	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_POSIX)
>   		seq_printf(seq, ",fsync_mode=%s", "posix");
>   	else if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT)
> @@ -1827,6 +1821,7 @@ static void default_options(struct f2fs_sb_info *sbi)
>   	sbi->sb->s_flags |= SB_LAZYTIME;
>   	set_opt(sbi, FLUSH_MERGE);
>   	set_opt(sbi, DISCARD);
> +	clear_opt(sbi, MERGE_CHECKPOINT);

It's not needed here?

Thanks,

>   	if (f2fs_sb_has_blkzoned(sbi))
>   		F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
>   	else
> @@ -2066,9 +2061,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   		}
>   	}
>   
> -	if (!test_opt(sbi, MERGE_CHECKPOINT)) {
> -		f2fs_stop_ckpt_thread(sbi);
> -	} else {
> +	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
>   		err = f2fs_start_ckpt_thread(sbi);
>   		if (err) {
>   			f2fs_err(sbi,
> @@ -2076,6 +2070,8 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   			    err);
>   			goto restore_gc;
>   		}
> +	} else {
> +		f2fs_stop_ckpt_thread(sbi);
>   	}
>   
>   	/*
> @@ -3831,7 +3827,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>   
>   	/* setup checkpoint request control and start checkpoint issue thread */
>   	f2fs_init_ckpt_req_control(sbi);
> -	if (test_opt(sbi, MERGE_CHECKPOINT)) {
> +	if (!test_opt(sbi, DISABLE_CHECKPOINT) &&
> +			test_opt(sbi, MERGE_CHECKPOINT)) {
>   		err = f2fs_start_ckpt_thread(sbi);
>   		if (err) {
>   			f2fs_err(sbi,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
